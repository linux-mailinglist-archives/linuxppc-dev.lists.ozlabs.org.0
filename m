Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5698B2B6E2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:12:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbFv04Zp1zDqWG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:12:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UPQ2JMB7; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbFry5PkGzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:10:40 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id f18so16649088pgi.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FS4LCcEm+1/2p3uCVe9l66MRLYTVjvSxcv4TWKIJaWY=;
 b=UPQ2JMB7WxrONuInwUcc7ZmCAxRKQTA2tTzMQqhPCjAEJA+PNm/4FUN6fX6IHCdo4R
 as+g64U64NOvM4u/kevNVbqY+USw485eE3540Q+ZSqif2VKLrV2yOnosgKRgdjHAVi2+
 VFMxGfUAQ5zggrwDua0EsHUiEhW/QHRTLB/6NKga+1+riiLq1Icjlc1BFMM1sg0Et9tt
 husewdlh62s79DB6gsMmjxkBRjnzQKD8gl0mJlrJcHSbMyg5zyUWOpJ4uddnaAnH9TWd
 UbRc05E1EyXJY3XuMTbu/Br4VY27Osu+yZcehjdG/EaN26vMJx9OjtNRboXJQR7U9VuC
 sQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FS4LCcEm+1/2p3uCVe9l66MRLYTVjvSxcv4TWKIJaWY=;
 b=lXkeimKfl2lEidmFJ/9D5PDorsFvEgUlp8XIw8uLG9xgazdKj2DWP4E+idmn8PkVCd
 a+L1+6rPrByytd0DFovwpbQkY0cJtsM784rwBNURs5Z01JLotvmOoZTyO+vCGFDoZQ/x
 VhsNcIer1MaqDI6+j/Fauj87U1fR+0JHfZeCf6Z6/ABWdqXhjjUf/vHbzpK9uBogNHcN
 r8pRexMChudQ8q6Swmomi1Jmj2ounDN6NdWaYu1JGqsHwAjfy6QbO8fJ6VcmOLvtm2T/
 xTKiUGBkA8ZIgd3flh5vvDBtXsQ46C7LzswhjonF6Q5v9NDH0RzWQg1RVHUYHkdj+48n
 qnsQ==
X-Gm-Message-State: AOAM531td8deyUgRrqHd2Wx/viiDygmMsObKaAELYRLCRBpaf1PIrHIQ
 DHN0/6h3Rdx9X+lZh5o4FHDe+vx4h2MA3v7+p+717w==
X-Google-Smtp-Source: ABdhPJwGve00MOK6zyaDJw6LNhU7NnSLQSMRDDJyCMou9kSNvTL6C9MJjseyIpQAddb+5D79SSqKQ5aUUmRrKyx4suk=
X-Received: by 2002:a62:1896:0:b029:197:491c:be38 with SMTP id
 144-20020a6218960000b0290197491cbe38mr755929pfy.15.1605640237430; Tue, 17 Nov
 2020 11:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-3-ndesaulniers@google.com>
 <20201117030214.GB1340689@ubuntu-m3-large-x86>
In-Reply-To: <20201117030214.GB1340689@ubuntu-m3-large-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2020 11:10:26 -0800
Message-ID: <CAKwvOdk_sphJGQarEWJLzGZWkdzO9dqmcRmys3Retw3vn2Fwag@mail.gmail.com>
Subject: Re: [PATCH 2/3] Revert "lib: Revert use of fallthrough pseudo-keyword
 in lib/"
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 7:02 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Sun, Nov 15, 2020 at 08:35:31PM -0800, Nick Desaulniers wrote:
> > This reverts commit 6a9dc5fd6170 ("lib: Revert use of fallthrough
> > pseudo-keyword in lib/")

Gustavo, whose tree did 6a9dc5fd6170 and df561f6688fe go up to
mainline in?  I'm not sure whether you or MPE (ppc) or someone else
should pick it this series?

> >
> > Now that we can build arch/powerpc/boot/ free of -Wimplicit-fallthrough,
> > re-enable these fixes for lib/.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/236
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>
> > ---
> >  lib/asn1_decoder.c      |  4 ++--
> >  lib/assoc_array.c       |  2 +-
> >  lib/bootconfig.c        |  4 ++--
> >  lib/cmdline.c           | 10 +++++-----
> >  lib/dim/net_dim.c       |  2 +-
> >  lib/dim/rdma_dim.c      |  4 ++--
> >  lib/glob.c              |  2 +-
> >  lib/siphash.c           | 36 ++++++++++++++++++------------------
> >  lib/ts_fsm.c            |  2 +-
> >  lib/vsprintf.c          | 14 +++++++-------
> >  lib/xz/xz_dec_lzma2.c   |  4 ++--
> >  lib/xz/xz_dec_stream.c  | 16 ++++++++--------
> >  lib/zstd/bitstream.h    | 10 +++++-----
> >  lib/zstd/compress.c     |  2 +-
> >  lib/zstd/decompress.c   | 12 ++++++------
> >  lib/zstd/huf_compress.c |  4 ++--
> >  16 files changed, 64 insertions(+), 64 deletions(-)
> >
> > diff --git a/lib/asn1_decoder.c b/lib/asn1_decoder.c
> > index 58f72b25f8e9..13da529e2e72 100644
> > --- a/lib/asn1_decoder.c
> > +++ b/lib/asn1_decoder.c
> > @@ -381,7 +381,7 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
> >       case ASN1_OP_END_SET_ACT:
> >               if (unlikely(!(flags & FLAG_MATCHED)))
> >                       goto tag_mismatch;
> > -             /* fall through */
> > +             fallthrough;
> >
> >       case ASN1_OP_END_SEQ:
> >       case ASN1_OP_END_SET_OF:
> > @@ -448,7 +448,7 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
> >                       pc += asn1_op_lengths[op];
> >                       goto next_op;
> >               }
> > -             /* fall through */
> > +             fallthrough;
> >
> >       case ASN1_OP_ACT:
> >               ret = actions[machine[pc + 1]](context, hdr, tag, data + tdp, len);
> > diff --git a/lib/assoc_array.c b/lib/assoc_array.c
> > index 6f4bcf524554..04c98799c3ba 100644
> > --- a/lib/assoc_array.c
> > +++ b/lib/assoc_array.c
> > @@ -1113,7 +1113,7 @@ struct assoc_array_edit *assoc_array_delete(struct assoc_array *array,
> >                                               index_key))
> >                               goto found_leaf;
> >               }
> > -             /* fall through */
> > +             fallthrough;
> >       case assoc_array_walk_tree_empty:
> >       case assoc_array_walk_found_wrong_shortcut:
> >       default:
> > diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> > index 649ed44f199c..9f8c70a98fcf 100644
> > --- a/lib/bootconfig.c
> > +++ b/lib/bootconfig.c
> > @@ -827,7 +827,7 @@ int __init xbc_init(char *buf, const char **emsg, int *epos)
> >                                                       q - 2);
> >                               break;
> >                       }
> > -                     /* fall through */
> > +                     fallthrough;
> >               case '=':
> >                       ret = xbc_parse_kv(&p, q, c);
> >                       break;
> > @@ -836,7 +836,7 @@ int __init xbc_init(char *buf, const char **emsg, int *epos)
> >                       break;
> >               case '#':
> >                       q = skip_comment(q);
> > -                     /* fall through */
> > +                     fallthrough;
> >               case ';':
> >               case '\n':
> >                       ret = xbc_parse_key(&p, q);
> > diff --git a/lib/cmdline.c b/lib/cmdline.c
> > index 9e186234edc0..46f2cb4ce6d1 100644
> > --- a/lib/cmdline.c
> > +++ b/lib/cmdline.c
> > @@ -144,23 +144,23 @@ unsigned long long memparse(const char *ptr, char **retptr)
> >       case 'E':
> >       case 'e':
> >               ret <<= 10;
> > -             /* fall through */
> > +             fallthrough;
> >       case 'P':
> >       case 'p':
> >               ret <<= 10;
> > -             /* fall through */
> > +             fallthrough;
> >       case 'T':
> >       case 't':
> >               ret <<= 10;
> > -             /* fall through */
> > +             fallthrough;
> >       case 'G':
> >       case 'g':
> >               ret <<= 10;
> > -             /* fall through */
> > +             fallthrough;
> >       case 'M':
> >       case 'm':
> >               ret <<= 10;
> > -             /* fall through */
> > +             fallthrough;
> >       case 'K':
> >       case 'k':
> >               ret <<= 10;
> > diff --git a/lib/dim/net_dim.c b/lib/dim/net_dim.c
> > index a4db51c21266..06811d866775 100644
> > --- a/lib/dim/net_dim.c
> > +++ b/lib/dim/net_dim.c
> > @@ -233,7 +233,7 @@ void net_dim(struct dim *dim, struct dim_sample end_sample)
> >                       schedule_work(&dim->work);
> >                       break;
> >               }
> > -             /* fall through */
> > +             fallthrough;
> >       case DIM_START_MEASURE:
> >               dim_update_sample(end_sample.event_ctr, end_sample.pkt_ctr,
> >                                 end_sample.byte_ctr, &dim->start_sample);
> > diff --git a/lib/dim/rdma_dim.c b/lib/dim/rdma_dim.c
> > index f7e26c7b4749..15462d54758d 100644
> > --- a/lib/dim/rdma_dim.c
> > +++ b/lib/dim/rdma_dim.c
> > @@ -59,7 +59,7 @@ static bool rdma_dim_decision(struct dim_stats *curr_stats, struct dim *dim)
> >                       break;
> >               case DIM_STATS_WORSE:
> >                       dim_turn(dim);
> > -                     /* fall through */
> > +                     fallthrough;
> >               case DIM_STATS_BETTER:
> >                       step_res = rdma_dim_step(dim);
> >                       if (step_res == DIM_ON_EDGE)
> > @@ -94,7 +94,7 @@ void rdma_dim(struct dim *dim, u64 completions)
> >                       schedule_work(&dim->work);
> >                       break;
> >               }
> > -             /* fall through */
> > +             fallthrough;
> >       case DIM_START_MEASURE:
> >               dim->state = DIM_MEASURE_IN_PROGRESS;
> >               dim_update_sample_with_comps(curr_sample->event_ctr, 0, 0,
> > diff --git a/lib/glob.c b/lib/glob.c
> > index 52e3ed7e4a9b..85ecbda45cd8 100644
> > --- a/lib/glob.c
> > +++ b/lib/glob.c
> > @@ -102,7 +102,7 @@ bool __pure glob_match(char const *pat, char const *str)
> >                       break;
> >               case '\\':
> >                       d = *pat++;
> > -                     /* fall through */
> > +                     fallthrough;
> >               default:        /* Literal character */
> >  literal:
> >                       if (c == d) {
> > diff --git a/lib/siphash.c b/lib/siphash.c
> > index c47bb6ff2149..a90112ee72a1 100644
> > --- a/lib/siphash.c
> > +++ b/lib/siphash.c
> > @@ -68,11 +68,11 @@ u64 __siphash_aligned(const void *data, size_t len, const siphash_key_t *key)
> >                                                 bytemask_from_count(left)));
> >  #else
> >       switch (left) {
> > -     case 7: b |= ((u64)end[6]) << 48; /* fall through */
> > -     case 6: b |= ((u64)end[5]) << 40; /* fall through */
> > -     case 5: b |= ((u64)end[4]) << 32; /* fall through */
> > +     case 7: b |= ((u64)end[6]) << 48; fallthrough;
> > +     case 6: b |= ((u64)end[5]) << 40; fallthrough;
> > +     case 5: b |= ((u64)end[4]) << 32; fallthrough;
> >       case 4: b |= le32_to_cpup(data); break;
> > -     case 3: b |= ((u64)end[2]) << 16; /* fall through */
> > +     case 3: b |= ((u64)end[2]) << 16; fallthrough;
> >       case 2: b |= le16_to_cpup(data); break;
> >       case 1: b |= end[0];
> >       }
> > @@ -101,11 +101,11 @@ u64 __siphash_unaligned(const void *data, size_t len, const siphash_key_t *key)
> >                                                 bytemask_from_count(left)));
> >  #else
> >       switch (left) {
> > -     case 7: b |= ((u64)end[6]) << 48; /* fall through */
> > -     case 6: b |= ((u64)end[5]) << 40; /* fall through */
> > -     case 5: b |= ((u64)end[4]) << 32; /* fall through */
> > +     case 7: b |= ((u64)end[6]) << 48; fallthrough;
> > +     case 6: b |= ((u64)end[5]) << 40; fallthrough;
> > +     case 5: b |= ((u64)end[4]) << 32; fallthrough;
> >       case 4: b |= get_unaligned_le32(end); break;
> > -     case 3: b |= ((u64)end[2]) << 16; /* fall through */
> > +     case 3: b |= ((u64)end[2]) << 16; fallthrough;
> >       case 2: b |= get_unaligned_le16(end); break;
> >       case 1: b |= end[0];
> >       }
> > @@ -268,11 +268,11 @@ u32 __hsiphash_aligned(const void *data, size_t len, const hsiphash_key_t *key)
> >                                                 bytemask_from_count(left)));
> >  #else
> >       switch (left) {
> > -     case 7: b |= ((u64)end[6]) << 48; /* fall through */
> > -     case 6: b |= ((u64)end[5]) << 40; /* fall through */
> > -     case 5: b |= ((u64)end[4]) << 32; /* fall through */
> > +     case 7: b |= ((u64)end[6]) << 48; fallthrough;
> > +     case 6: b |= ((u64)end[5]) << 40; fallthrough;
> > +     case 5: b |= ((u64)end[4]) << 32; fallthrough;
> >       case 4: b |= le32_to_cpup(data); break;
> > -     case 3: b |= ((u64)end[2]) << 16; /* fall through */
> > +     case 3: b |= ((u64)end[2]) << 16; fallthrough;
> >       case 2: b |= le16_to_cpup(data); break;
> >       case 1: b |= end[0];
> >       }
> > @@ -301,11 +301,11 @@ u32 __hsiphash_unaligned(const void *data, size_t len,
> >                                                 bytemask_from_count(left)));
> >  #else
> >       switch (left) {
> > -     case 7: b |= ((u64)end[6]) << 48; /* fall through */
> > -     case 6: b |= ((u64)end[5]) << 40; /* fall through */
> > -     case 5: b |= ((u64)end[4]) << 32; /* fall through */
> > +     case 7: b |= ((u64)end[6]) << 48; fallthrough;
> > +     case 6: b |= ((u64)end[5]) << 40; fallthrough;
> > +     case 5: b |= ((u64)end[4]) << 32; fallthrough;
> >       case 4: b |= get_unaligned_le32(end); break;
> > -     case 3: b |= ((u64)end[2]) << 16; /* fall through */
> > +     case 3: b |= ((u64)end[2]) << 16; fallthrough;
> >       case 2: b |= get_unaligned_le16(end); break;
> >       case 1: b |= end[0];
> >       }
> > @@ -431,7 +431,7 @@ u32 __hsiphash_aligned(const void *data, size_t len, const hsiphash_key_t *key)
> >               v0 ^= m;
> >       }
> >       switch (left) {
> > -     case 3: b |= ((u32)end[2]) << 16; /* fall through */
> > +     case 3: b |= ((u32)end[2]) << 16; fallthrough;
> >       case 2: b |= le16_to_cpup(data); break;
> >       case 1: b |= end[0];
> >       }
> > @@ -454,7 +454,7 @@ u32 __hsiphash_unaligned(const void *data, size_t len,
> >               v0 ^= m;
> >       }
> >       switch (left) {
> > -     case 3: b |= ((u32)end[2]) << 16; /* fall through */
> > +     case 3: b |= ((u32)end[2]) << 16; fallthrough;
> >       case 2: b |= get_unaligned_le16(end); break;
> >       case 1: b |= end[0];
> >       }
> > diff --git a/lib/ts_fsm.c b/lib/ts_fsm.c
> > index ab749ec10ab5..64fd9015ad80 100644
> > --- a/lib/ts_fsm.c
> > +++ b/lib/ts_fsm.c
> > @@ -193,7 +193,7 @@ static unsigned int fsm_find(struct ts_config *conf, struct ts_state *state)
> >                               TOKEN_MISMATCH();
> >
> >                       block_idx++;
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case TS_FSM_ANY:
> >                       if (next == NULL)
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 14c9a6af1b23..d3c5c16f391c 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1265,7 +1265,7 @@ char *mac_address_string(char *buf, char *end, u8 *addr,
> >
> >       case 'R':
> >               reversed = true;
> > -             /* fall through */
> > +             fallthrough;
> >
> >       default:
> >               separator = ':';
> > @@ -1682,7 +1682,7 @@ char *uuid_string(char *buf, char *end, const u8 *addr,
> >       switch (*(++fmt)) {
> >       case 'L':
> >               uc = true;
> > -             /* fall through */
> > +             fallthrough;
> >       case 'l':
> >               index = guid_index;
> >               break;
> > @@ -2219,7 +2219,7 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
> >       case 'S':
> >       case 's':
> >               ptr = dereference_symbol_descriptor(ptr);
> > -             /* fall through */
> > +             fallthrough;
> >       case 'B':
> >               return symbol_string(buf, end, ptr, spec, fmt);
> >       case 'R':
> > @@ -2450,7 +2450,7 @@ int format_decode(const char *fmt, struct printf_spec *spec)
> >
> >       case 'x':
> >               spec->flags |= SMALL;
> > -             /* fall through */
> > +             fallthrough;
> >
> >       case 'X':
> >               spec->base = 16;
> > @@ -2468,7 +2468,7 @@ int format_decode(const char *fmt, struct printf_spec *spec)
> >                * utility, treat it as any other invalid or
> >                * unsupported format specifier.
> >                */
> > -             /* fall through */
> > +             fallthrough;
> >
> >       default:
> >               WARN_ONCE(1, "Please remove unsupported %%%c in format string\n", *fmt);
> > @@ -3411,10 +3411,10 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
> >                       break;
> >               case 'i':
> >                       base = 0;
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 'd':
> >                       is_sign = true;
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 'u':
> >                       break;
> >               case '%':
> > diff --git a/lib/xz/xz_dec_lzma2.c b/lib/xz/xz_dec_lzma2.c
> > index 65a1aad8c223..ca2603abee08 100644
> > --- a/lib/xz/xz_dec_lzma2.c
> > +++ b/lib/xz/xz_dec_lzma2.c
> > @@ -1043,7 +1043,7 @@ XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
> >
> >                       s->lzma2.sequence = SEQ_LZMA_PREPARE;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_LZMA_PREPARE:
> >                       if (s->lzma2.compressed < RC_INIT_BYTES)
> > @@ -1055,7 +1055,7 @@ XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
> >                       s->lzma2.compressed -= RC_INIT_BYTES;
> >                       s->lzma2.sequence = SEQ_LZMA_RUN;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_LZMA_RUN:
> >                       /*
> > diff --git a/lib/xz/xz_dec_stream.c b/lib/xz/xz_dec_stream.c
> > index 32ab2a08b7cb..fea86deaaa01 100644
> > --- a/lib/xz/xz_dec_stream.c
> > +++ b/lib/xz/xz_dec_stream.c
> > @@ -583,7 +583,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >                       if (ret != XZ_OK)
> >                               return ret;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_BLOCK_START:
> >                       /* We need one byte of input to continue. */
> > @@ -608,7 +608,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >                       s->temp.pos = 0;
> >                       s->sequence = SEQ_BLOCK_HEADER;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_BLOCK_HEADER:
> >                       if (!fill_temp(s, b))
> > @@ -620,7 +620,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >
> >                       s->sequence = SEQ_BLOCK_UNCOMPRESS;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_BLOCK_UNCOMPRESS:
> >                       ret = dec_block(s, b);
> > @@ -629,7 +629,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >
> >                       s->sequence = SEQ_BLOCK_PADDING;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_BLOCK_PADDING:
> >                       /*
> > @@ -651,7 +651,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >
> >                       s->sequence = SEQ_BLOCK_CHECK;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_BLOCK_CHECK:
> >                       if (s->check_type == XZ_CHECK_CRC32) {
> > @@ -675,7 +675,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >
> >                       s->sequence = SEQ_INDEX_PADDING;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_INDEX_PADDING:
> >                       while ((s->index.size + (b->in_pos - s->in_start))
> > @@ -699,7 +699,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >
> >                       s->sequence = SEQ_INDEX_CRC32;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_INDEX_CRC32:
> >                       ret = crc32_validate(s, b);
> > @@ -709,7 +709,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
> >                       s->temp.size = STREAM_HEADER_SIZE;
> >                       s->sequence = SEQ_STREAM_FOOTER;
> >
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case SEQ_STREAM_FOOTER:
> >                       if (!fill_temp(s, b))
> > diff --git a/lib/zstd/bitstream.h b/lib/zstd/bitstream.h
> > index 3a49784d5c61..7c65c66e41fd 100644
> > --- a/lib/zstd/bitstream.h
> > +++ b/lib/zstd/bitstream.h
> > @@ -259,15 +259,15 @@ ZSTD_STATIC size_t BIT_initDStream(BIT_DStream_t *bitD, const void *srcBuffer, s
> >               bitD->bitContainer = *(const BYTE *)(bitD->start);
> >               switch (srcSize) {
> >               case 7: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[6]) << (sizeof(bitD->bitContainer) * 8 - 16);
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 6: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[5]) << (sizeof(bitD->bitContainer) * 8 - 24);
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 5: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[4]) << (sizeof(bitD->bitContainer) * 8 - 32);
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 4: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[3]) << 24;
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 3: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[2]) << 16;
> > -                     /* fall through */
> > +                     fallthrough;
> >               case 2: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[1]) << 8;
> >               default:;
> >               }
> > diff --git a/lib/zstd/compress.c b/lib/zstd/compress.c
> > index 5e0b67003e55..b080264ed3ad 100644
> > --- a/lib/zstd/compress.c
> > +++ b/lib/zstd/compress.c
> > @@ -3182,7 +3182,7 @@ static size_t ZSTD_compressStream_generic(ZSTD_CStream *zcs, void *dst, size_t *
> >                               zcs->outBuffFlushedSize = 0;
> >                               zcs->stage = zcss_flush; /* pass-through to flush stage */
> >                       }
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case zcss_flush: {
> >                       size_t const toFlush = zcs->outBuffContentSize - zcs->outBuffFlushedSize;
> > diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
> > index db6761ea4deb..66cd487a326a 100644
> > --- a/lib/zstd/decompress.c
> > +++ b/lib/zstd/decompress.c
> > @@ -442,7 +442,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize
> >               case set_repeat:
> >                       if (dctx->litEntropy == 0)
> >                               return ERROR(dictionary_corrupted);
> > -                     /* fall through */
> > +                     fallthrough;
> >               case set_compressed:
> >                       if (srcSize < 5)
> >                               return ERROR(corruption_detected); /* srcSize >= MIN_CBLOCK_SIZE == 3; here we need up to 5 for case 3 */
> > @@ -1768,7 +1768,7 @@ size_t ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, c
> >                       return 0;
> >               }
> >               dctx->expected = 0; /* not necessary to copy more */
> > -             /* fall through */
> > +             fallthrough;
> >
> >       case ZSTDds_decodeFrameHeader:
> >               memcpy(dctx->headerBuffer + ZSTD_frameHeaderSize_prefix, src, dctx->expected);
> > @@ -2309,7 +2309,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
> >               switch (zds->stage) {
> >               case zdss_init:
> >                       ZSTD_resetDStream(zds); /* transparent reset on starting decoding a new frame */
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case zdss_loadHeader: {
> >                       size_t const hSize = ZSTD_getFrameParams(&zds->fParams, zds->headerBuffer, zds->lhSize);
> > @@ -2376,7 +2376,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
> >                       }
> >                       zds->stage = zdss_read;
> >               }
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case zdss_read: {
> >                       size_t const neededInSize = ZSTD_nextSrcSizeToDecompress(zds->dctx);
> > @@ -2405,7 +2405,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
> >                       zds->stage = zdss_load;
> >                       /* pass-through */
> >               }
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case zdss_load: {
> >                       size_t const neededInSize = ZSTD_nextSrcSizeToDecompress(zds->dctx);
> > @@ -2438,7 +2438,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
> >                               /* pass-through */
> >                       }
> >               }
> > -                     /* fall through */
> > +                     fallthrough;
> >
> >               case zdss_flush: {
> >                       size_t const toFlushSize = zds->outEnd - zds->outStart;
> > diff --git a/lib/zstd/huf_compress.c b/lib/zstd/huf_compress.c
> > index e727812d12aa..08b4ae80aed4 100644
> > --- a/lib/zstd/huf_compress.c
> > +++ b/lib/zstd/huf_compress.c
> > @@ -556,9 +556,9 @@ size_t HUF_compress1X_usingCTable(void *dst, size_t dstSize, const void *src, si
> >       n = srcSize & ~3; /* join to mod 4 */
> >       switch (srcSize & 3) {
> >       case 3: HUF_encodeSymbol(&bitC, ip[n + 2], CTable); HUF_FLUSHBITS_2(&bitC);
> > -             /* fall through */
> > +             fallthrough;
> >       case 2: HUF_encodeSymbol(&bitC, ip[n + 1], CTable); HUF_FLUSHBITS_1(&bitC);
> > -             /* fall through */
> > +             fallthrough;
> >       case 1: HUF_encodeSymbol(&bitC, ip[n + 0], CTable); HUF_FLUSHBITS(&bitC);
> >       case 0:
> >       default:;
> > --
> > 2.29.2.299.gdc1121823c-goog
> >



-- 
Thanks,
~Nick Desaulniers
