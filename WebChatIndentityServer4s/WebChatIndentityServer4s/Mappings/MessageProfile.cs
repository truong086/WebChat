﻿using AutoMapper;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Helpers;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Mappings
{
    public class MessageProfile : Profile
    {
        public MessageProfile()
        {
            CreateMap<Message, MessageViewModel>()
                .ForMember(dst => dst.From, opt => opt.MapFrom(x => x.FromUser.FullName))
                .ForMember(dst => dst.Room, opt => opt.MapFrom(x => x.ToRoom.Name))
                .ForMember(dst => dst.Avatar, opt => opt.MapFrom(x => x.FromUser.Avatar))
                .ForMember(dst => dst.Room, opt => opt.MapFrom(x => x.ToRoom.Name))
                .ForMember(dst => dst.Content, opt => opt.MapFrom(x => BasicEmojis.ParseEmojis(x.Content)))
                .ForMember(dst => dst.Timestamp, opt => opt.MapFrom(x => x.Timestamp));

            CreateMap<MessageViewModel, Message>();
        }
    }
}
