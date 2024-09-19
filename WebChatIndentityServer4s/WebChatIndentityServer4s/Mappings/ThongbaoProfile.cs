using AutoMapper;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Mappings
{
    public class ThongbaoProfile : Profile
    {
        public ThongbaoProfile()
        {
            CreateMap<ThongbaoDTO, ThongBao>()
                .ForMember(x => x.message, xto => xto.MapFrom(dto => dto.message))
                .ForMember(x => x.Active, xto => xto.MapFrom(dto => dto.Active))
                .ForMember(x => x.Timestamp, xto => xto.MapFrom(dto => dto.Timestamp));

            CreateMap<ThongBao, ThongbaoDTO>()
                .ForMember(x => x.message, xto => xto.MapFrom(dto => dto.message))
                .ForMember(x => x.account, xto => xto.MapFrom(dto => dto.User.Id))
                .ForMember(x => x.room, xto => xto.MapFrom(dto => dto.Rooms.Id))
                .ForMember(x => x.Active, xto => xto.MapFrom(dto => dto.Active))
                .ForMember(x => x.Timestamp, xto => xto.MapFrom(dto => dto.Timestamp));
        }
    }
}
