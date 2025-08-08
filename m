Return-Path: <linuxppc-dev+bounces-10765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137BB1EC1E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 17:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz7P50R8tz2xcC;
	Sat,  9 Aug 2025 01:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754667257;
	cv=none; b=T8OpJSFglk8bUuhq8vOVLMalPPVSTmEg9ayov9QP4EbtKTDhP9zmwWCtD9yQweaV4vfrxGa22PRTEhrFwZtsrDPlU9VKKxZGClAmracClfOASAsgArIgDSQXjJucisSF7+KjNFz1+87167cje1bJckFmiFq7p8LVf36LXCHF241roi7HZaXRD4cV4zdI+DXcdNDApPrtM+aaCRb29cZw2dKSXkAXO8cqhr7aQUjdc6EjHlQXjYk//rd3ivuQJN7c2NTlzyNWo0ryXGx88fIt6tshbf1oihRVhm7gkosC1eSkDgDJD0y6wJlr8LvnV7nD8WUb89q/6RV4+FY+64t8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754667257; c=relaxed/relaxed;
	bh=jIkSpS2neoMs6Sk5TSCkknSPW0nclSsovDAjQoryBXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkp6zh+z9EzKk1mZfYxRG8DGF6VMkENBThCemhmk2S8RbnkhegP3vqEV/Nb7ZQAplbhGagWlCkxnT3Fc1A+wHvPG3dxZG2pUXQCtfTA4mGxAYt4ep43iJddRsFVI5CM5duANgyIqPBw4hRjS+H+rHEUQ1npMVfU9JcTwE1hhYjhtezhqzhRoTW9WUu/gXEKtXqZFoBFpL8viSygCUNroLr4CVST7nV8GpDU6zISnWP3bwYwUAiJBNKBxPfLoLuirblR+NSAJnEyW2tSR2/7Xje8I/J3PvtmZ9b2FvkHKk+vpvf5RIDGU3VWaWmOC/NAlZ/dfzBQxtQoK6MuXY+AiCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HG9Yojha; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HG9Yojha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz7P3241lz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 01:34:14 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3325cb38a78so20105681fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Aug 2025 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754667244; x=1755272044; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIkSpS2neoMs6Sk5TSCkknSPW0nclSsovDAjQoryBXI=;
        b=HG9YojhaikhIxU8dt5+aJlSFtjeuQ2vBKvtkDw/iM+n237jy7WW36tEB1Vk+NsUfhU
         67vZc1/ojWlBGETp3W0PJN4FUtixVxcdznl0SFVb0I3ijXS+XjvZD8uz28urM/pdHbJI
         PKKYLtCOmVazp+UoR/jaOJ1ROuQ8psCAnVDA2im+iV7qTmb5XcC1P1y+baSl+XGL8soR
         LpgEgBNectiuLF+rn94dFUwRc05f/fM/n4CmIBoJ1nQVIKrpGN83kUGTrILgnJ6vimxS
         lRCkjzMUA/Nb8p2gc0Cx4jtY+D0blCRG1X+YoslSkrbfH81cGwokniyqzzrZ8G5UxV9o
         6OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754667244; x=1755272044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIkSpS2neoMs6Sk5TSCkknSPW0nclSsovDAjQoryBXI=;
        b=SimTvMI1A9hZ9IBro1kEgJgR2PgmQay4Zz0ReQhb6kifCwmvFkw1skTi5DaSBkX4zg
         DoGVu+pydGNxL2b86IwT2IP4e4Foria7btHdlOsGjvk15P/d8qFRRxSpd4PYCFmCSBM7
         TNGOm7DcSMJYMZz/O39KJigl59BrdEXKXVnk5uzhtyVAxoThiNeJqIXkyYNXhsU2vieb
         rnbsw7evI9+CNDzyFGFo50oIKz6RI84vUQV6EaL0tWnhKjCFO/laH2P7GUg21Hx3TZCR
         3izIaGojvZpoDgf7xFspKALqulHmheoqaTzWUW8EiWG3g7hEpkX2tn2wPFF/AerZ7ndd
         hgog==
X-Forwarded-Encrypted: i=1; AJvYcCVPk75zcYuzrtOEhf5IbCJ6R6FDb7aGbWlKzLvz0DujXZ4ELzt4qxcRiYfdqBI0StSL5DHqIOK23mOE++k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyS/z1rKp8UDfzoa5mAfDt4Hk2pzuP9Ul9gRgFhDFXciF/0Ki7q
	dDOMDWQ6f8Hg0qGOHzZ2MPmbK8nH2iZ9qgncHULAQwQzhkhVPiqSELEG+QLZ0FiNLXz1Favrn/e
	xa+PBSC1Hc3A4eJh19f4J36T8zE6JRQk=
X-Gm-Gg: ASbGncvyACcdTUFCOS86sDE+mlUwsDGxIX25tuJNq1dTfgwgjaDzlpyjUiffv/4Ha3y
	Q4xHkU315yNtYL/OpvphtnXZgbhBvwCgFTbsAlO4qwPT0D7VfIeqcJzEpv7O96jidIArl8nKOui
	aBekViHCqKAc7oQhJjxNvL3Sti6YVgkDqVQw8KuX01tVondlFpxUFSmeQ2XVpNOtf2sFhAMet1/
	cVuRsJbyzTbhVHaancIWCy+LMLChk4/Tf9d5w==
X-Google-Smtp-Source: AGHT+IHWGPxcXslaHqjkBx0Znaoushwh2t14/ASqOe1Acy2v+LPY+EjKd7E9pEakRUFLmg3OzMlCprEnQL6pWrlTsc0=
X-Received: by 2002:a05:651c:20db:10b0:333:ad65:c524 with SMTP id
 38308e7fff4ca-333ad65ce82mr891001fa.1.1754667243533; Fri, 08 Aug 2025
 08:34:03 -0700 (PDT)
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
 <22872a3f-85dc-4740-b605-ba80b5a3b1bc@csgroup.eu>
In-Reply-To: <22872a3f-85dc-4740-b605-ba80b5a3b1bc@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Fri, 8 Aug 2025 20:33:46 +0500
X-Gm-Features: Ac12FXxqMWhvapXmLjpvxSaO-kchANwQ_UAKoPV0eAM--qRQt82T8zuwyBWy1Js
Message-ID: <CACzwLxjnofD0EsxrtgbG3svXHL+TpYcio4B67SCY9Mi3C-jdsQ@mail.gmail.com>
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

On Fri, Aug 8, 2025 at 10:03=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 07/08/2025 =C3=A0 21:40, Sabyrzhan Tasbolatov a =C3=A9crit :
> > Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures [1] that ne=
ed
> > to defer KASAN initialization until shadow memory is properly set up,
> > and unify the static key infrastructure across all KASAN modes.
>
> That probably desserves more details, maybe copy in informations from
> the top of cover letter.
>
> I think there should also be some exeplanations about
> kasan_arch_is_ready() becoming kasan_enabled(), and also why
> kasan_arch_is_ready() completely disappear from mm/kasan/common.c
> without being replaced by kasan_enabled().
>
> >
> > [1] PowerPC, UML, LoongArch selects ARCH_DEFER_KASAN.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> > Changes in v5:
> > - Unified patches where arch (powerpc, UML, loongarch) selects
> >    ARCH_DEFER_KASAN in the first patch not to break
> >    bisectability
> > - Removed kasan_arch_is_ready completely as there is no user
> > - Removed __wrappers in v4, left only those where it's necessary
> >    due to different implementations
> >
> > Changes in v4:
> > - Fixed HW_TAGS static key functionality (was broken in v3)
> > - Merged configuration and implementation for atomicity
> > ---
> >   arch/loongarch/Kconfig                 |  1 +
> >   arch/loongarch/include/asm/kasan.h     |  7 ------
> >   arch/loongarch/mm/kasan_init.c         |  8 +++----
> >   arch/powerpc/Kconfig                   |  1 +
> >   arch/powerpc/include/asm/kasan.h       | 12 ----------
> >   arch/powerpc/mm/kasan/init_32.c        |  2 +-
> >   arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
> >   arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
> >   arch/um/Kconfig                        |  1 +
> >   arch/um/include/asm/kasan.h            |  5 ++--
> >   arch/um/kernel/mem.c                   | 10 ++++++--
> >   include/linux/kasan-enabled.h          | 32 ++++++++++++++++++-------=
-
> >   include/linux/kasan.h                  |  6 +++++
> >   lib/Kconfig.kasan                      |  8 +++++++
> >   mm/kasan/common.c                      | 17 ++++++++++----
> >   mm/kasan/generic.c                     | 19 +++++++++++----
> >   mm/kasan/hw_tags.c                     |  9 +-------
> >   mm/kasan/kasan.h                       |  8 ++++++-
> >   mm/kasan/shadow.c                      | 12 +++++-----
> >   mm/kasan/sw_tags.c                     |  1 +
> >   mm/kasan/tags.c                        |  2 +-
> >   21 files changed, 100 insertions(+), 69 deletions(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index f0abc38c40a..cd64b2bc12d 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -9,6 +9,7 @@ config LOONGARCH
> >       select ACPI_PPTT if ACPI
> >       select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
> >       select ARCH_BINFMT_ELF_STATE
> > +     select ARCH_DEFER_KASAN if KASAN
>
> Instead of adding 'if KASAN' in all users, you could do in two steps:
>
> Add a symbol ARCH_NEEDS_DEFER_KASAN.
>
> +config ARCH_NEEDS_DEFER_KASAN
> +       bool
>
> And then:
>
> +config ARCH_DEFER_KASAN
> +       def_bool
> +       depends on KASAN
> +       depends on ARCH_DEFER_KASAN
> +       help
> +         Architectures should select this if they need to defer KASAN
> +         initialization until shadow memory is properly set up. This
> +         enables runtime control via static keys. Otherwise, KASAN uses
> +         compile-time constants for better performance.
>

Actually, I don't see the benefits from this option. Sorry, have just
revisited this again.
With the new symbol, arch (PowerPC, UML, LoongArch) still needs select
2 options:

select ARCH_NEEDS_DEFER_KASAN
select ARCH_DEFER_KASAN

and the oneline with `if` condition is cleaner.
select ARCH_DEFER_KASAN if KASAN

>
>
> >       select ARCH_DISABLE_KASAN_INLINE
> >       select ARCH_ENABLE_MEMORY_HOTPLUG
> >       select ARCH_ENABLE_MEMORY_HOTREMOVE
> > diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/includ=
e/asm/kasan.h
> > index 62f139a9c87..0e50e5b5e05 100644
> > --- a/arch/loongarch/include/asm/kasan.h
> > +++ b/arch/loongarch/include/asm/kasan.h
> > @@ -66,7 +66,6 @@
> >   #define XKPRANGE_WC_SHADOW_OFFSET   (KASAN_SHADOW_START + XKPRANGE_WC=
_KASAN_OFFSET)
> >   #define XKVRANGE_VC_SHADOW_OFFSET   (KASAN_SHADOW_START + XKVRANGE_VC=
_KASAN_OFFSET)
> >
> > -extern bool kasan_early_stage;
> >   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
> >
> >   #define kasan_mem_to_shadow kasan_mem_to_shadow
> > @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
> >   #define kasan_shadow_to_mem kasan_shadow_to_mem
> >   const void *kasan_shadow_to_mem(const void *shadow_addr);
> >
> > -#define kasan_arch_is_ready kasan_arch_is_ready
> > -static __always_inline bool kasan_arch_is_ready(void)
> > -{
> > -     return !kasan_early_stage;
> > -}
> > -
> >   #define addr_has_metadata addr_has_metadata
> >   static __always_inline bool addr_has_metadata(const void *addr)
> >   {
> > diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_i=
nit.c
> > index d2681272d8f..170da98ad4f 100644
> > --- a/arch/loongarch/mm/kasan_init.c
> > +++ b/arch/loongarch/mm/kasan_init.c
> > @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata _=
_aligned(PAGE_SIZE);
> >   #define __pte_none(early, pte) (early ? pte_none(pte) : \
> >   ((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_sh=
adow_page)))
> >
> > -bool kasan_early_stage =3D true;
> > -
> >   void *kasan_mem_to_shadow(const void *addr)
> >   {
> > -     if (!kasan_arch_is_ready()) {
> > +     if (!kasan_enabled()) {
> >               return (void *)(kasan_early_shadow_page);
> >       } else {
> >               unsigned long maddr =3D (unsigned long)addr;
> > @@ -298,7 +296,8 @@ void __init kasan_init(void)
> >       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_S=
TART),
> >                                       kasan_mem_to_shadow((void *)KFENC=
E_AREA_END));
> >
> > -     kasan_early_stage =3D false;
> > +     /* Enable KASAN here before kasan_mem_to_shadow(). */
> > +     kasan_init_generic();
> >
> >       /* Populate the linear mapping */
> >       for_each_mem_range(i, &pa_start, &pa_end) {
> > @@ -329,5 +328,4 @@ void __init kasan_init(void)
> >
> >       /* At this point kasan is fully initialized. Enable error message=
s */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized.\n");
> >   }
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 93402a1d9c9..a324dcdb8eb 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -122,6 +122,7 @@ config PPC
> >       # Please keep this list sorted alphabetically.
> >       #
> >       select ARCH_32BIT_OFF_T if PPC32
> > +     select ARCH_DEFER_KASAN                 if KASAN && PPC_RADIX_MMU
> >       select ARCH_DISABLE_KASAN_INLINE        if PPC_RADIX_MMU
> >       select ARCH_DMA_DEFAULT_COHERENT        if !NOT_COHERENT_CACHE
> >       select ARCH_ENABLE_MEMORY_HOTPLUG
> > diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/as=
m/kasan.h
> > index b5bbb94c51f..957a57c1db5 100644
> > --- a/arch/powerpc/include/asm/kasan.h
> > +++ b/arch/powerpc/include/asm/kasan.h
> > @@ -53,18 +53,6 @@
> >   #endif
> >
> >   #ifdef CONFIG_KASAN
> > -#ifdef CONFIG_PPC_BOOK3S_64
> > -DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> > -
> > -static __always_inline bool kasan_arch_is_ready(void)
> > -{
> > -     if (static_branch_likely(&powerpc_kasan_enabled_key))
> > -             return true;
> > -     return false;
> > -}
> > -
> > -#define kasan_arch_is_ready kasan_arch_is_ready
> > -#endif
> >
> >   void kasan_early_init(void);
> >   void kasan_mmu_init(void);
> > diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/in=
it_32.c
> > index 03666d790a5..1d083597464 100644
> > --- a/arch/powerpc/mm/kasan/init_32.c
> > +++ b/arch/powerpc/mm/kasan/init_32.c
> > @@ -165,7 +165,7 @@ void __init kasan_init(void)
> >
> >       /* At this point kasan is fully initialized. Enable error message=
s */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KASAN init done\n");
> > +     kasan_init_generic();
> >   }
> >
> >   void __init kasan_late_init(void)
> > diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/k=
asan/init_book3e_64.c
> > index 60c78aac0f6..0d3a73d6d4b 100644
> > --- a/arch/powerpc/mm/kasan/init_book3e_64.c
> > +++ b/arch/powerpc/mm/kasan/init_book3e_64.c
> > @@ -127,7 +127,7 @@ void __init kasan_init(void)
> >
> >       /* Enable error messages */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KASAN init done\n");
> > +     kasan_init_generic();
> >   }
> >
> >   void __init kasan_late_init(void) { }
> > diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/k=
asan/init_book3s_64.c
> > index 7d959544c07..dcafa641804 100644
> > --- a/arch/powerpc/mm/kasan/init_book3s_64.c
> > +++ b/arch/powerpc/mm/kasan/init_book3s_64.c
> > @@ -19,8 +19,6 @@
> >   #include <linux/memblock.h>
> >   #include <asm/pgalloc.h>
> >
> > -DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> > -
> >   static void __init kasan_init_phys_region(void *start, void *end)
> >   {
> >       unsigned long k_start, k_end, k_cur;
> > @@ -92,11 +90,9 @@ void __init kasan_init(void)
> >        */
> >       memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> >
> > -     static_branch_inc(&powerpc_kasan_enabled_key);
> > -
> >       /* Enable error messages */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KASAN init done\n");
> > +     kasan_init_generic();
> >   }
> >
> >   void __init kasan_early_init(void) { }
> > diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> > index 9083bfdb773..a12cc072ab1 100644
> > --- a/arch/um/Kconfig
> > +++ b/arch/um/Kconfig
> > @@ -5,6 +5,7 @@ menu "UML-specific options"
> >   config UML
> >       bool
> >       default y
> > +     select ARCH_DEFER_KASAN if STATIC_LINK
>
> No need to also verify KASAN here like powerpc and loongarch ?
>
> >       select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> >       select ARCH_HAS_CACHE_LINE_SIZE
> >       select ARCH_HAS_CPU_FINALIZE_INIT
> > diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> > index f97bb1f7b85..b54a4e937fd 100644
> > --- a/arch/um/include/asm/kasan.h
> > +++ b/arch/um/include/asm/kasan.h
> > @@ -24,10 +24,9 @@
> >
> >   #ifdef CONFIG_KASAN
> >   void kasan_init(void);
> > -extern int kasan_um_is_ready;
> >
> > -#ifdef CONFIG_STATIC_LINK
> > -#define kasan_arch_is_ready() (kasan_um_is_ready)
> > +#if defined(CONFIG_STATIC_LINK) && defined(CONFIG_KASAN_INLINE)
> > +#error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled=
!
> >   #endif
> >   #else
> >   static inline void kasan_init(void) { }
> > diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> > index 76bec7de81b..261fdcd21be 100644
> > --- a/arch/um/kernel/mem.c
> > +++ b/arch/um/kernel/mem.c
> > @@ -21,9 +21,9 @@
> >   #include <os.h>
> >   #include <um_malloc.h>
> >   #include <linux/sched/task.h>
> > +#include <linux/kasan.h>
> >
> >   #ifdef CONFIG_KASAN
> > -int kasan_um_is_ready;
> >   void kasan_init(void)
> >   {
> >       /*
> > @@ -32,7 +32,10 @@ void kasan_init(void)
> >        */
> >       kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
> >       init_task.kasan_depth =3D 0;
> > -     kasan_um_is_ready =3D true;
> > +     /* Since kasan_init() is called before main(),
> > +      * KASAN is initialized but the enablement is deferred after
> > +      * jump_label_init(). See arch_mm_preinit().
> > +      */
>
> Format standard is different outside network, see:
> https://docs.kernel.org/process/coding-style.html#commenting
>
> >   }
> >
> >   static void (*kasan_init_ptr)(void)
> > @@ -58,6 +61,9 @@ static unsigned long brk_end;
> >
> >   void __init arch_mm_preinit(void)
> >   {
> > +     /* Safe to call after jump_label_init(). Enables KASAN. */
> > +     kasan_init_generic();
> > +
> >       /* clear the zero-page */
> >       memset(empty_zero_page, 0, PAGE_SIZE);
> >
> > diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enable=
d.h
> > index 6f612d69ea0..9eca967d852 100644
> > --- a/include/linux/kasan-enabled.h
> > +++ b/include/linux/kasan-enabled.h
> > @@ -4,32 +4,46 @@
> >
> >   #include <linux/static_key.h>
> >
> > -#ifdef CONFIG_KASAN_HW_TAGS
> > -
> > +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> > +/*
> > + * Global runtime flag for KASAN modes that need runtime control.
> > + * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
> > + */
> >   DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
> >
> > +/*
> > + * Runtime control for shadow memory initialization or HW_TAGS mode.
> > + * Uses static key for architectures that need deferred KASAN or HW_TA=
GS.
> > + */
> >   static __always_inline bool kasan_enabled(void)
> >   {
> >       return static_branch_likely(&kasan_flag_enabled);
> >   }
> >
> > -static inline bool kasan_hw_tags_enabled(void)
> > +static inline void kasan_enable(void)
> >   {
> > -     return kasan_enabled();
> > +     static_branch_enable(&kasan_flag_enabled);
> >   }
> > -
> > -#else /* CONFIG_KASAN_HW_TAGS */
> > -
> > -static inline bool kasan_enabled(void)
> > +#else
> > +/* For architectures that can enable KASAN early, use compile-time che=
ck. */
> > +static __always_inline bool kasan_enabled(void)
> >   {
> >       return IS_ENABLED(CONFIG_KASAN);
> >   }
> >
> > +static inline void kasan_enable(void) {}
> > +#endif /* CONFIG_ARCH_DEFER_KASAN || CONFIG_KASAN_HW_TAGS */
> > +
> > +#ifdef CONFIG_KASAN_HW_TAGS
> > +static inline bool kasan_hw_tags_enabled(void)
> > +{
> > +     return kasan_enabled();
> > +}
> > +#else
> >   static inline bool kasan_hw_tags_enabled(void)
> >   {
> >       return false;
> >   }
> > -
> >   #endif /* CONFIG_KASAN_HW_TAGS */
> >
> >   #endif /* LINUX_KASAN_ENABLED_H */
> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index 890011071f2..51a8293d1af 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -543,6 +543,12 @@ void kasan_report_async(void);
> >
> >   #endif /* CONFIG_KASAN_HW_TAGS */
> >
> > +#ifdef CONFIG_KASAN_GENERIC
> > +void __init kasan_init_generic(void);
> > +#else
> > +static inline void kasan_init_generic(void) { }
> > +#endif
> > +
> >   #ifdef CONFIG_KASAN_SW_TAGS
> >   void __init kasan_init_sw_tags(void);
> >   #else
> > diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> > index f82889a830f..38456560c85 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -19,6 +19,14 @@ config ARCH_DISABLE_KASAN_INLINE
> >         Disables both inline and stack instrumentation. Selected by
> >         architectures that do not support these instrumentation types.
> >
> > +config ARCH_DEFER_KASAN
> > +     bool
> > +     help
> > +       Architectures should select this if they need to defer KASAN
> > +       initialization until shadow memory is properly set up. This
> > +       enables runtime control via static keys. Otherwise, KASAN uses
> > +       compile-time constants for better performance.
> > +
> >   config CC_HAS_KASAN_GENERIC
> >       def_bool $(cc-option, -fsanitize=3Dkernel-address)
> >
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 9142964ab9c..d9d389870a2 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -32,6 +32,15 @@
> >   #include "kasan.h"
> >   #include "../slab.h"
> >
> > +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> > +/*
> > + * Definition of the unified static key declared in kasan-enabled.h.
> > + * This provides consistent runtime enable/disable across KASAN modes.
> > + */
> > +DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> > +EXPORT_SYMBOL(kasan_flag_enabled);
>
> Shouldn't new exports be GPL ?
>
> > +#endif
> > +
> >   struct slab *kasan_addr_to_slab(const void *addr)
> >   {
> >       if (virt_addr_valid(addr))
> > @@ -246,7 +255,7 @@ static inline void poison_slab_object(struct kmem_c=
ache *cache, void *object,
> >   bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
> >                               unsigned long ip)
> >   {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
>
> Here and below, no need to replace kasan_arch_is_ready() by
> kasan_enabled() ?
>
> >               return false;
> >       return check_slab_allocation(cache, object, ip);
> >   }
> > @@ -254,7 +263,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache=
, void *object,
> >   bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool i=
nit,
> >                      bool still_accessible)
> >   {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
> >               return false;
> >
> >       /*
> > @@ -293,7 +302,7 @@ bool __kasan_slab_free(struct kmem_cache *cache, vo=
id *object, bool init,
> >
> >   static inline bool check_page_allocation(void *ptr, unsigned long ip)
> >   {
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return false;
> >
> >       if (ptr !=3D page_address(virt_to_head_page(ptr))) {
> > @@ -522,7 +531,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsig=
ned long ip)
> >               return true;
> >       }
> >
> > -     if (is_kfence_address(ptr) || !kasan_arch_is_ready())
> > +     if (is_kfence_address(ptr))
> >               return true;
> >
> >       slab =3D folio_slab(folio);
> > diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> > index d54e89f8c3e..b413c46b3e0 100644
> > --- a/mm/kasan/generic.c
> > +++ b/mm/kasan/generic.c
> > @@ -36,6 +36,17 @@
> >   #include "kasan.h"
> >   #include "../slab.h"
> >
> > +/*
> > + * Initialize Generic KASAN and enable runtime checks.
> > + * This should be called from arch kasan_init() once shadow memory is =
ready.
> > + */
> > +void __init kasan_init_generic(void)
> > +{
> > +     kasan_enable();
> > +
> > +     pr_info("KernelAddressSanitizer initialized (generic)\n");
> > +}
> > +
> >   /*
> >    * All functions below always inlined so compiler could
> >    * perform better optimizations in each of __asan_loadX/__assn_storeX
> > @@ -165,7 +176,7 @@ static __always_inline bool check_region_inline(con=
st void *addr,
> >                                               size_t size, bool write,
> >                                               unsigned long ret_ip)
> >   {
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return true;
> >
> >       if (unlikely(size =3D=3D 0))
> > @@ -193,7 +204,7 @@ bool kasan_byte_accessible(const void *addr)
> >   {
> >       s8 shadow_byte;
> >
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return true;
> >
> >       shadow_byte =3D READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
> > @@ -495,7 +506,7 @@ static void release_alloc_meta(struct kasan_alloc_m=
eta *meta)
> >
> >   static void release_free_meta(const void *object, struct kasan_free_m=
eta *meta)
> >   {
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return;
> >
> >       /* Check if free meta is valid. */
> > @@ -562,7 +573,7 @@ void kasan_save_alloc_info(struct kmem_cache *cache=
, void *object, gfp_t flags)
> >       kasan_save_track(&alloc_meta->alloc_track, flags);
> >   }
> >
> > -void kasan_save_free_info(struct kmem_cache *cache, void *object)
> > +void __kasan_save_free_info(struct kmem_cache *cache, void *object)
> >   {
> >       struct kasan_free_meta *free_meta;
> >
> > diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> > index 9a6927394b5..c8289a3feab 100644
> > --- a/mm/kasan/hw_tags.c
> > +++ b/mm/kasan/hw_tags.c
> > @@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
> >   static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
> >   static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
> >
> > -/*
> > - * Whether KASAN is enabled at all.
> > - * The value remains false until KASAN is initialized by kasan_init_hw=
_tags().
> > - */
> > -DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> > -EXPORT_SYMBOL(kasan_flag_enabled);
> > -
> >   /*
> >    * Whether the selected mode is synchronous, asynchronous, or asymmet=
ric.
> >    * Defaults to KASAN_MODE_SYNC.
> > @@ -260,7 +253,7 @@ void __init kasan_init_hw_tags(void)
> >       kasan_init_tags();
> >
> >       /* KASAN is now initialized, enable it. */
> > -     static_branch_enable(&kasan_flag_enabled);
> > +     kasan_enable();
> >
> >       pr_info("KernelAddressSanitizer initialized (hw-tags, mode=3D%s, =
vmalloc=3D%s, stacktrace=3D%s)\n",
> >               kasan_mode_info(),
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index 129178be5e6..8a9d8a6ea71 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -398,7 +398,13 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags,=
 depot_flags_t depot_flags);
> >   void kasan_set_track(struct kasan_track *track, depot_stack_handle_t =
stack);
> >   void kasan_save_track(struct kasan_track *track, gfp_t flags);
> >   void kasan_save_alloc_info(struct kmem_cache *cache, void *object, gf=
p_t flags);
> > -void kasan_save_free_info(struct kmem_cache *cache, void *object);
> > +
> > +void __kasan_save_free_info(struct kmem_cache *cache, void *object);
> > +static inline void kasan_save_free_info(struct kmem_cache *cache, void=
 *object)
> > +{
> > +     if (kasan_enabled())
> > +             __kasan_save_free_info(cache, object);
> > +}
> >
> >   #ifdef CONFIG_KASAN_GENERIC
> >   bool kasan_quarantine_put(struct kmem_cache *cache, void *object);
> > diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> > index d2c70cd2afb..2e126cb21b6 100644
> > --- a/mm/kasan/shadow.c
> > +++ b/mm/kasan/shadow.c
> > @@ -125,7 +125,7 @@ void kasan_poison(const void *addr, size_t size, u8=
 value, bool init)
> >   {
> >       void *shadow_start, *shadow_end;
> >
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return;
> >
> >       /*
> > @@ -150,7 +150,7 @@ EXPORT_SYMBOL_GPL(kasan_poison);
> >   #ifdef CONFIG_KASAN_GENERIC
> >   void kasan_poison_last_granule(const void *addr, size_t size)
> >   {
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return;
> >
> >       if (size & KASAN_GRANULE_MASK) {
> > @@ -390,7 +390,7 @@ int kasan_populate_vmalloc(unsigned long addr, unsi=
gned long size)
> >       unsigned long shadow_start, shadow_end;
> >       int ret;
> >
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return 0;
> >
> >       if (!is_vmalloc_or_module_addr((void *)addr))
> > @@ -560,7 +560,7 @@ void kasan_release_vmalloc(unsigned long start, uns=
igned long end,
> >       unsigned long region_start, region_end;
> >       unsigned long size;
> >
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return;
> >
> >       region_start =3D ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
> > @@ -611,7 +611,7 @@ void *__kasan_unpoison_vmalloc(const void *start, u=
nsigned long size,
> >        * with setting memory tags, so the KASAN_VMALLOC_INIT flag is ig=
nored.
> >        */
> >
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return (void *)start;
> >
> >       if (!is_vmalloc_or_module_addr(start))
> > @@ -636,7 +636,7 @@ void *__kasan_unpoison_vmalloc(const void *start, u=
nsigned long size,
> >    */
> >   void __kasan_poison_vmalloc(const void *start, unsigned long size)
> >   {
> > -     if (!kasan_arch_is_ready())
> > +     if (!kasan_enabled())
> >               return;
> >
> >       if (!is_vmalloc_or_module_addr(start))
> > diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> > index b9382b5b6a3..c75741a7460 100644
> > --- a/mm/kasan/sw_tags.c
> > +++ b/mm/kasan/sw_tags.c
> > @@ -44,6 +44,7 @@ void __init kasan_init_sw_tags(void)
> >               per_cpu(prng_state, cpu) =3D (u32)get_cycles();
> >
> >       kasan_init_tags();
> > +     kasan_enable();
> >
> >       pr_info("KernelAddressSanitizer initialized (sw-tags, stacktrace=
=3D%s)\n",
> >               str_on_off(kasan_stack_collection_enabled()));
> > diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> > index d65d48b85f9..b9f31293622 100644
> > --- a/mm/kasan/tags.c
> > +++ b/mm/kasan/tags.c
> > @@ -142,7 +142,7 @@ void kasan_save_alloc_info(struct kmem_cache *cache=
, void *object, gfp_t flags)
> >       save_stack_info(cache, object, flags, false);
> >   }
> >
> > -void kasan_save_free_info(struct kmem_cache *cache, void *object)
> > +void __kasan_save_free_info(struct kmem_cache *cache, void *object)
> >   {
> >       save_stack_info(cache, object, 0, true);
> >   }
>

