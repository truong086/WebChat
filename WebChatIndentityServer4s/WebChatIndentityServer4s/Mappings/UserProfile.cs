using AutoMapper;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Mappings
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<ManageUser, UserViewModel>()
                .ForMember(dst => dst.Username, otp => otp.MapFrom(x => x.UserName))
                .ForMember(dst => dst.Id, otp => otp.MapFrom(x => x.Id));

            CreateMap<UserViewModel, ManageUser>();
        }
    }
}
