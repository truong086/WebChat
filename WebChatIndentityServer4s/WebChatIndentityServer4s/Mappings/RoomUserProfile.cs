using AutoMapper;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Mappings
{
    public class RoomUserProfile : Profile
    {
        public RoomUserProfile()
        {
            CreateMap<RoomUser, RoomUserDTO>()
                .ForMember(x => x.Id_User, xto => xto.MapFrom(dto => dto.User.Id))
                .ForMember(x => x.Id_Room, xto => xto.MapFrom(dto => dto.Rooms.Id))
                .ForMember(x => x.UserName, xto => xto.MapFrom(dto => dto.User.UserName))
                .ForMember(x => x.RoomName, xto => xto.MapFrom(dto => dto.Rooms.Name));
                
        }
    }
}
