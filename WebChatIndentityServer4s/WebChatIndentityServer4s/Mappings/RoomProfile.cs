using AutoMapper;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Mappings
{
    public class RoomProfile : Profile
    {
        public RoomProfile()
        {
            CreateMap<Room, RoomViewModel>();
            CreateMap<RoomViewModel, Room>();

        }
    }
}
