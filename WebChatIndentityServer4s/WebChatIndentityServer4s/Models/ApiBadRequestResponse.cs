using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace WebChatIndentityServer4s.Models
{
    public class ApiBadRequestResponse : ApiResponse
    {
        public IEnumerable<string> Errors { get;  }
        

        public ApiBadRequestResponse(ModelStateDictionary modelState) // Chuyền vào modelState, thông thường lỗi from thì chả về
            : base(400) // Mặc định chuyền vào mã lỗi của thằng cha là 400
        {
            if (modelState.IsValid)
            {
                throw new ArgumentException("ModelState must be invalid", nameof(modelState));
            }

            Errors = modelState.SelectMany(x => x.Value.Errors) // Từa modelState chúng ta lấy ra được cái Error
                .Select(x => x.ErrorMessage).ToArray();
        }

        public ApiBadRequestResponse(IdentityResult identityResult) 
            :base(400)
        {
            Errors = identityResult.Errors.Select(x => x.Code + " - " + x.Description).ToArray();
        }

        public ApiBadRequestResponse(string message) : base(400, message) // Hoặc chuyền thẳng vào Message
        {
        }
    }
}
