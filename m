Return-Path: <linuxppc-dev+bounces-10780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02CB1F8C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 09:21:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c08Ly1QxJz3cYJ;
	Sun, 10 Aug 2025 17:20:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754810458;
	cv=none; b=keoxUQ2CXHYGObnil4dhyUiq1Sgl9vyiZLzjGAzzVLCvpdhuHe4FSCoYlrBce9OPhDSsMrHnnEBJAJBONR7HuiP4yWQe8QndB24rA9h9jFghulwVZpdkB43zfZMhp75Xh0uSQ67xzxxBeVCn7PHLQIGfleqqvDNLnwJjYe59imIbo49CBO1PELlPmkfodnAfvsQq7C15rogIfk/O4G7UIKu2tVnVQ3DYztmneXWnnyPqZQvE5Jw15unogyK3EBwxioTmHdCOVULTkoxIbrHprlGA2rVlDRvCUHqwPxXaTX4Cr6J0U1F6MRN5JH/0hfePub7OVHtaEKGSiLUByj8iNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754810458; c=relaxed/relaxed;
	bh=EpwULXc7N4PVrAxnhzJUCLFsDhMEPa8K20pRMtf9QU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1Ll5FFnzr4NK5MU+XlSRCKRvFCICYSQBAe1Gbdi3XZlL4EEXaI57zRfEqzDiHjkY8n2E4sUkKddxB966jHv4hQEoW2AmvBzJOIl3CnxgYPwqHRO74fbqt38wEeeqarWL+tYdaUpZPnW9YQtHnRTZpT6UKzTEYfmzgo/bLZStCnHUhR8rXKP7VrbMAk/1xQHQXxEhxZkmodcoRLslqBX9inTxeUNNB2zu3ycQlcn2MZcS9r7mCwKKqXpmV56ZpMn/H+qhEhzecf3+5iZyyliu4DOq3Dv+C9/fLvgExewfrMcnqAGzU34XJM8wMpMNBuEA28Zb67gSi+dcuHwb2qlkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BmOdX1Ue; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BmOdX1Ue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c08Lw2vZRz3cYF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 17:20:55 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3322bb2ac6eso26310351fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754810449; x=1755415249; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpwULXc7N4PVrAxnhzJUCLFsDhMEPa8K20pRMtf9QU4=;
        b=BmOdX1Uej5NlQOYtcQ2/rxVIJBCYkGTidzmGIyMmbb13hqfwlbjMwAtaObYMsvg4SE
         TMF0QMA1Ff3+itRFJzXgCOJLX79MILfJGKefrEkyrhFcknYp4hp7e95vfmlH+cUKO0lv
         dA8XVd9tGygyQ7MbNggPD3kugLtjEOGq533viHuyxdT+A17Dz3OkrShTvSaMneVeQNkN
         UZ7iWYO9hoJiX6IZu6hLLn3ob6MlaFxTSyehfYGvZrgC+zS2BCTzsQhYTSlzVBwMWgnd
         5H8QwuvAsFZWxOWDByIV/y//b59bQwov3iOQDfyfmi7uuTsKeE1aHISvepXhW6ej/h+X
         XiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754810449; x=1755415249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpwULXc7N4PVrAxnhzJUCLFsDhMEPa8K20pRMtf9QU4=;
        b=sSJQA9BliTQ+PYwwYDkXinwL++Ecxjq+n6nIwCP0D4cU8NVls79gZQv4aa7x1/7Y1V
         Hvq4ISYZ0vfMQOCCpKbNKQcghq4i4nYMqW4PMf++27kh1qOacbiE5tOqcOGurAKXyL8K
         GShF1HprMwcXcLJTPexw8NuHRjNL8AK2nU+lexPvaZrKFb5uTsbjKN+hb6iLoJKjVj4z
         CYPSG9+Ff6sEAn0hxGtJS2Vmj49ywS7rJ4MKQH9i/O+8wcoXXY5bHhHLfRlZ83KoOF0N
         LHTcdl4aMaEnLFM4XetWVjiH4jw1ANjybYAQGCp7vcob818Byp6+mQfNYJAKOKfYBp2I
         brGA==
X-Forwarded-Encrypted: i=1; AJvYcCWUg5vMzswftudRc4TCY/qDiRNVb7UQ7ohPotSPZBdZ4/f/jKvYBCt6UpRKPtTrO4CESMtiWpD2M9tQVT8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+KDKqZXar2zRH8uBt0HDB1muym5zpTrKbDkVSuMZuUSoYKtPQ
	dAtKZSyvVt75eCemt7TLHNDoCq8VI9S5y/9Il8wV5jhBW7tQwopw7xxGQcChcy77hvuvoIbJ5Nq
	nEvsnHXxCgJ51x0DHPQUUu73QfYaQxfI=
X-Gm-Gg: ASbGncsjfeiiF5lDuC3lIHOi0pIyHUOChcGCzfjIf0/ie4wsjGQlVGUo3tFkqyRHS+u
	RzcPFxrIF5Wbk2yJj5pPQ6jXBLAVaXLU8UdlWOg/W00Hqi4rYqybwtOdlf5w/ULLCJJq22OWjZd
	mmJdKel4YZ7B0bHDDNN25PZqnqcg1nzRMzeVCY2HkGuIHO0Cu90n0+bhw7Uu9sObZBlsTvdlYtl
	zdE+OeFSOBvc298ZGeRpV3twc2bJbs4/BZtVqM=
X-Google-Smtp-Source: AGHT+IEATVB+zShs5UtXixRak2GiQ/zc6xtl1NlPiWHkLLcdmonSWNJDigg98acT6MlYwLuyv4giEoaQ9ZJ5gULbnFg=
X-Received: by 2002:a2e:96cc:0:b0:32f:425b:3278 with SMTP id
 38308e7fff4ca-333a22ede04mr18232851fa.25.1754810448509; Sun, 10 Aug 2025
 00:20:48 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250807194012.631367-1-snovitoll@gmail.com> <20250807194012.631367-2-snovitoll@gmail.com>
 <22872a3f-85dc-4740-b605-ba80b5a3b1bc@csgroup.eu> <CACzwLxjnofD0EsxrtgbG3svXHL+TpYcio4B67SCY9Mi3C-jdsQ@mail.gmail.com>
 <af677847-e625-43d7-8750-b2ce4ba9626c@csgroup.eu>
In-Reply-To: <af677847-e625-43d7-8750-b2ce4ba9626c@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sun, 10 Aug 2025 12:20:31 +0500
X-Gm-Features: Ac12FXxZS7GKPiKLVRILyIcM2smc0R0yETsf0Ytt07yeIUtr59o1Bn8VVZobpbU
Message-ID: <CACzwLxjr+Z+xUj-936rcWDSqEwfUP7bRB1xcqZQKGE7ux-gEXQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com, 
	andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.co, glider@google.com, 
	dvyukov@google.com, alex@ghiti.fr, agordeev@linux.ibm.com, 
	vincenzo.frascino@arm.com, elver@google.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 8, 2025 at 10:03=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/08/2025 =C3=A0 17:33, Sabyrzhan Tasbolatov a =C3=A9crit :
> > On Fri, Aug 8, 2025 at 10:03=E2=80=AFAM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 07/08/2025 =C3=A0 21:40, Sabyrzhan Tasbolatov a =C3=A9crit :
> >>> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures [1] that =
need
> >>> to defer KASAN initialization until shadow memory is properly set up,
> >>> and unify the static key infrastructure across all KASAN modes.
> >>
> >> That probably desserves more details, maybe copy in informations from
> >> the top of cover letter.
> >>
> >> I think there should also be some exeplanations about
> >> kasan_arch_is_ready() becoming kasan_enabled(), and also why
> >> kasan_arch_is_ready() completely disappear from mm/kasan/common.c
> >> without being replaced by kasan_enabled().
> >>
> >>>
> >>> [1] PowerPC, UML, LoongArch selects ARCH_DEFER_KASAN.
> >>>
> >>> Closes: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D217049&data=3D05%7C02%7Cch=
ristophe.leroy%40csgroup.eu%7Cfe4f5a759ad6452b047408ddd691024a%7C8b87af7d86=
474dc78df45f69a2011bb5%7C0%7C0%7C638902640503259176%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbC=
IsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DUM4uvQihJdeWwcC6DIiJXbn4wGsrijjRcHc=
55uCMErI%3D&reserved=3D0
> >>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> >>> ---
> >>> Changes in v5:
> >>> - Unified patches where arch (powerpc, UML, loongarch) selects
> >>>     ARCH_DEFER_KASAN in the first patch not to break
> >>>     bisectability
> >>> - Removed kasan_arch_is_ready completely as there is no user
> >>> - Removed __wrappers in v4, left only those where it's necessary
> >>>     due to different implementations
> >>>
> >>> Changes in v4:
> >>> - Fixed HW_TAGS static key functionality (was broken in v3)
> >>> - Merged configuration and implementation for atomicity
> >>> ---
> >>>    arch/loongarch/Kconfig                 |  1 +
> >>>    arch/loongarch/include/asm/kasan.h     |  7 ------
> >>>    arch/loongarch/mm/kasan_init.c         |  8 +++----
> >>>    arch/powerpc/Kconfig                   |  1 +
> >>>    arch/powerpc/include/asm/kasan.h       | 12 ----------
> >>>    arch/powerpc/mm/kasan/init_32.c        |  2 +-
> >>>    arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
> >>>    arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
> >>>    arch/um/Kconfig                        |  1 +
> >>>    arch/um/include/asm/kasan.h            |  5 ++--
> >>>    arch/um/kernel/mem.c                   | 10 ++++++--
> >>>    include/linux/kasan-enabled.h          | 32 ++++++++++++++++++----=
----
> >>>    include/linux/kasan.h                  |  6 +++++
> >>>    lib/Kconfig.kasan                      |  8 +++++++
> >>>    mm/kasan/common.c                      | 17 ++++++++++----
> >>>    mm/kasan/generic.c                     | 19 +++++++++++----
> >>>    mm/kasan/hw_tags.c                     |  9 +-------
> >>>    mm/kasan/kasan.h                       |  8 ++++++-
> >>>    mm/kasan/shadow.c                      | 12 +++++-----
> >>>    mm/kasan/sw_tags.c                     |  1 +
> >>>    mm/kasan/tags.c                        |  2 +-
> >>>    21 files changed, 100 insertions(+), 69 deletions(-)
> >>>
> >>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >>> index f0abc38c40a..cd64b2bc12d 100644
> >>> --- a/arch/loongarch/Kconfig
> >>> +++ b/arch/loongarch/Kconfig
> >>> @@ -9,6 +9,7 @@ config LOONGARCH
> >>>        select ACPI_PPTT if ACPI
> >>>        select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
> >>>        select ARCH_BINFMT_ELF_STATE
> >>> +     select ARCH_DEFER_KASAN if KASAN
> >>
> >> Instead of adding 'if KASAN' in all users, you could do in two steps:
> >>
> >> Add a symbol ARCH_NEEDS_DEFER_KASAN.
> >>
> >> +config ARCH_NEEDS_DEFER_KASAN
> >> +       bool
> >>
> >> And then:
> >>
> >> +config ARCH_DEFER_KASAN
> >> +       def_bool
> >> +       depends on KASAN
> >> +       depends on ARCH_DEFER_KASAN
> >> +       help
> >> +         Architectures should select this if they need to defer KASAN
> >> +         initialization until shadow memory is properly set up. This
> >> +         enables runtime control via static keys. Otherwise, KASAN us=
es
> >> +         compile-time constants for better performance.
> >>
> >
> > Actually, I don't see the benefits from this option. Sorry, have just
> > revisited this again.
> > With the new symbol, arch (PowerPC, UML, LoongArch) still needs select
> > 2 options:
> >
> > select ARCH_NEEDS_DEFER_KASAN
> > select ARCH_DEFER_KASAN
>
> Sorry, my mistake, ARCH_DEFER_KASAN has to be 'def_bool y'. Missing the
> 'y'. That way it is automatically set to 'y' as long as KASAN and
> ARCH_NEEDS_DEFER_KASAN are selected. Should be:
>
> config ARCH_DEFER_KASAN
>         def_bool y
>         depends on KASAN
>         depends on ARCH_NEEDS_DEFER_KASAN
>
>
> >
> > and the oneline with `if` condition is cleaner.
> > select ARCH_DEFER_KASAN if KASAN

Hello,

Have just had a chance to test this.

lib/Kconfig.kasan:
        config ARCH_NEEDS_DEFER_KASAN
                bool

        config ARCH_DEFER_KASAN
                def_bool y
                depends on KASAN
                depends on ARCH_NEEDS_DEFER_KASAN

It works for UML defconfig where arch/um/Kconfig is:

config UML
        bool
        default y
        select ARCH_NEEDS_DEFER_KASAN
        select ARCH_DEFER_KASAN if STATIC_LINK

But it prints warnings for PowerPC, LoongArch:

config LOONGARCH
        bool
        ...
        select ARCH_NEEDS_DEFER_KASAN
        select ARCH_DEFER_KASAN

$ make defconfig ARCH=3Dloongarch
*** Default configuration is based on 'loongson3_defconfig'

WARNING: unmet direct dependencies detected for ARCH_DEFER_KASAN
  Depends on [n]: KASAN [=3Dn] && ARCH_NEEDS_DEFER_KASAN [=3Dy]
  Selected by [y]:
  - LOONGARCH [=3Dy]


config PPC
        bool
        default y
        select ARCH_DEFER_KASAN if PPC_RADIX_MMU
        select ARCH_NEEDS_DEFER_KASAN

$ make ppc64_defconfig

WARNING: unmet direct dependencies detected for ARCH_DEFER_KASAN
  Depends on [n]: KASAN [=3Dn] && ARCH_NEEDS_DEFER_KASAN [=3Dy]
  Selected by [y]:
  - PPC [=3Dy] && PPC_RADIX_MMU [=3Dy]


> >
>
> I don't think so because it requires all architectures to add 'if KASAN'
> which is not convenient.
>
> Christophe

