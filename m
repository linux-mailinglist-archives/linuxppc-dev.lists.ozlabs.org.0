Return-Path: <linuxppc-dev+bounces-10781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 063EFB1F8DE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 09:32:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c08cJ5nfFz3cYj;
	Sun, 10 Aug 2025 17:32:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754811152;
	cv=none; b=BF9vk7UxrXz18u9XRWbcvjDuKTipkRj7KbxVkje+UBV7gehgIk+Xinfo4WyIwS2jWeqQ30PvBQEy/4B4lQCwtjczay6KmaGs4pdfoZYeYCwIsWMIbu8Uo124cncYcMy+SlhJtf3W+MYDVwXESi/euerAMZbw1hSQMe3CPjgJKhIu4mMqBvJEAOz4MMKGwWXOTb4R/l9kMFWDeRlmUDNMKAyIrF4E+nEaPivVfZ/kzkmJ46pHZeSq4QLzdG30M4I0HVKI5ur7uXal1lIJcGbvGpe02MbU8RVe9cG7s3rucTV4PEzK7FqwyXRxgPaEhkFCO/o15VIRLd1P1WDBBagevg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754811152; c=relaxed/relaxed;
	bh=to3a2j5jgrrDRsoCDy9JGxvNqhRLdP/C+mURmWO4ysI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/sZWXgrDpBN63m8/2+TaLMrnscamVbdIJ3l315f7xx+SSFPmQtZ+2jRcCh1Vv7pcU3WmzA+1Y0YcIfGilGi4xDPLfXT4Y/CglFm2xbmjor4iLT0U2b9BfugbpRDjHAX7D3EWJ73lUI4nVNsCJjwBB+FNvuHishGjfVyWHKQ27GIdXiNNHu6xpUOJOrgH/aOKXdIjHyvfq0PRqUQMWfEaxTI1knfjqPb2cQqyRVlUpbvCxfDMlydnTnETxyqkMTpkX9CV5YbALdAHfvUt8rKzO9RIVgLtNTlm7jMRhI1luI8LPJr/T2dg/92cl1H1swBCEpwJh5C0OOtIwgjsbp5iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fy3gJccF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fy3gJccF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c08cH38ntz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 17:32:30 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55cbf9a78dbso2311581e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 00:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754811147; x=1755415947; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to3a2j5jgrrDRsoCDy9JGxvNqhRLdP/C+mURmWO4ysI=;
        b=fy3gJccF/9oyfdOgbyA8NowPr3cdkgrsTSbpk64kTRMiBI3bzkbDJOvcndhm0gUb5a
         0CtyrsiiTW5DUE8GcV8wOz/uV3+bClLcp5zic4WFrSIkoir5mIBOf8IeNuh6istVZsf6
         V7UcuyhOH7+ZyqQBpF8yBdJqmddZL/Hnk3q1qMsq1IG0L0+m3kWwhgsBk98+3xMoCwKJ
         ivrpb2/sT0Mf1UQ8ihzpVUWIqzZA/MwZUH2EnZJc0lfrWoi07MQHc5jKoZTxX5lCfZR1
         8ypDRatET2PwrPVjpZQ0gSyEyzmiWyvoVSUI3mcABOE3caGxRyyAC1+lAX2FkxqYU/hw
         Q9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754811147; x=1755415947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to3a2j5jgrrDRsoCDy9JGxvNqhRLdP/C+mURmWO4ysI=;
        b=N4KyC0z6b5CkQMy7kr05IVBd8W+E91V7zYTv9X23khxe0ZlzUsvy8d+7qUDouZPltm
         b8svb4u1M+8+AOUuX8bd2FjtNrW9Ed/kVsXKLTzbjJue++a2dL+Swy4Vj1G6EmScMJLy
         AJeWk3etTcNQdGADnCiZd3QbERBDtjZsEpCMRqxffbuZWlfr7zf1rFcYu1mZc7Gi4ige
         avF+/oU5/Bb6VdXH99BewWrasNwn3wz+FelL/jTZwEizHbQATbeNuCaSprTbbFKeL3o5
         pv6zs9p41ZGag3ilOlq7UFFPw6HfasdZxhjpdZXwcJcoOBn9XzTYBVHSVV1DtFoweAL6
         bfiA==
X-Forwarded-Encrypted: i=1; AJvYcCW4qJk1zCP+GuIrQcJtspByrrkgB6wODGJuZAVuHtWrTl4LPQJQxp93plJLxF3nuYeBH8qKq9twW7PqEqs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+gaDGFW9fnbkKopXd3fpQW5Idh2GmQ3AU/V/QR0F0GKxYD14L
	0LmU//2JDJFEU+/WO7PFBKOcomja1ZOBF+1FZ6aWvZdIeUs4AJBCyITrFE5mtXp6OSHCiUQ32hJ
	0cSh3MLgBD+1P8eRIujkpicXndyni6po=
X-Gm-Gg: ASbGncssdNcUOA0+OwcgAxBSjgaxXahL6zdSulc/OC4HDmsugRq0lscuLa5UpRCW0XT
	tU05l6ic7VzSzOoS3iExpDdv8XnIg9bECfnGmMrGhS8BbU4cVDTPt5G7UxCY/vA9p40I0L99OTa
	P5gBB42021GPLR6mY8kO6FVLWJ+bTCXFjuS3S7Pp4gPLSf4P4MNHyQ9HJKfN4+qqoFOxwGNCDnw
	wYBcPTyze1I+FGgi/2UF2m3VsY+8iQMJLgfMPJUOQ4s9WzfSg==
X-Google-Smtp-Source: AGHT+IHSiW6flEmK0NWVDywJ0JDvDzDflYl3FPZq6Arom7yJiee4WZtdkHowtUkS6j3k/g3AhngqPPQBa36CQfXo8jE=
X-Received: by 2002:a05:6512:1052:b0:553:2480:2308 with SMTP id
 2adb3069b0e04-55cc00eb7eemr2065404e87.21.1754811146600; Sun, 10 Aug 2025
 00:32:26 -0700 (PDT)
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
 <af677847-e625-43d7-8750-b2ce4ba9626c@csgroup.eu> <CACzwLxjr+Z+xUj-936rcWDSqEwfUP7bRB1xcqZQKGE7ux-gEXQ@mail.gmail.com>
In-Reply-To: <CACzwLxjr+Z+xUj-936rcWDSqEwfUP7bRB1xcqZQKGE7ux-gEXQ@mail.gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sun, 10 Aug 2025 12:32:08 +0500
X-Gm-Features: Ac12FXzPCnTCatZw8a7ccc080L84VXsdNPtKeE-8RXfhfS3owZfq0geCNjkMt-Q
Message-ID: <CACzwLxi5AKT_81ej4AZ1ztsncBDY4jDJCyWboF0X9-kiH_=NMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com, 
	andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, glider@google.com, dvyukov@google.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	davidgow@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 10, 2025 at 12:20=E2=80=AFPM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> On Fri, Aug 8, 2025 at 10:03=E2=80=AFPM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >
> > Le 08/08/2025 =C3=A0 17:33, Sabyrzhan Tasbolatov a =C3=A9crit :
> > > On Fri, Aug 8, 2025 at 10:03=E2=80=AFAM Christophe Leroy
> > > <christophe.leroy@csgroup.eu> wrote:
> > >>
> > >>
> > >>
> > >> Le 07/08/2025 =C3=A0 21:40, Sabyrzhan Tasbolatov a =C3=A9crit :
> > >>> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures [1] tha=
t need
> > >>> to defer KASAN initialization until shadow memory is properly set u=
p,
> > >>> and unify the static key infrastructure across all KASAN modes.
> > >>
> > >> That probably desserves more details, maybe copy in informations fro=
m
> > >> the top of cover letter.
> > >>
> > >> I think there should also be some exeplanations about
> > >> kasan_arch_is_ready() becoming kasan_enabled(), and also why
> > >> kasan_arch_is_ready() completely disappear from mm/kasan/common.c
> > >> without being replaced by kasan_enabled().
> > >>
> > >>>
> > >>> [1] PowerPC, UML, LoongArch selects ARCH_DEFER_KASAN.
> > >>>
> > >>> Closes: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D217049&data=3D05%7C02%7C=
christophe.leroy%40csgroup.eu%7Cfe4f5a759ad6452b047408ddd691024a%7C8b87af7d=
86474dc78df45f69a2011bb5%7C0%7C0%7C638902640503259176%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp=
bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DUM4uvQihJdeWwcC6DIiJXbn4wGsrijjRc=
Hc55uCMErI%3D&reserved=3D0
> > >>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > >>> ---
> > >>> Changes in v5:
> > >>> - Unified patches where arch (powerpc, UML, loongarch) selects
> > >>>     ARCH_DEFER_KASAN in the first patch not to break
> > >>>     bisectability
> > >>> - Removed kasan_arch_is_ready completely as there is no user
> > >>> - Removed __wrappers in v4, left only those where it's necessary
> > >>>     due to different implementations
> > >>>
> > >>> Changes in v4:
> > >>> - Fixed HW_TAGS static key functionality (was broken in v3)
> > >>> - Merged configuration and implementation for atomicity
> > >>> ---
> > >>>    arch/loongarch/Kconfig                 |  1 +
> > >>>    arch/loongarch/include/asm/kasan.h     |  7 ------
> > >>>    arch/loongarch/mm/kasan_init.c         |  8 +++----
> > >>>    arch/powerpc/Kconfig                   |  1 +
> > >>>    arch/powerpc/include/asm/kasan.h       | 12 ----------
> > >>>    arch/powerpc/mm/kasan/init_32.c        |  2 +-
> > >>>    arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
> > >>>    arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
> > >>>    arch/um/Kconfig                        |  1 +
> > >>>    arch/um/include/asm/kasan.h            |  5 ++--
> > >>>    arch/um/kernel/mem.c                   | 10 ++++++--
> > >>>    include/linux/kasan-enabled.h          | 32 ++++++++++++++++++--=
------
> > >>>    include/linux/kasan.h                  |  6 +++++
> > >>>    lib/Kconfig.kasan                      |  8 +++++++
> > >>>    mm/kasan/common.c                      | 17 ++++++++++----
> > >>>    mm/kasan/generic.c                     | 19 +++++++++++----
> > >>>    mm/kasan/hw_tags.c                     |  9 +-------
> > >>>    mm/kasan/kasan.h                       |  8 ++++++-
> > >>>    mm/kasan/shadow.c                      | 12 +++++-----
> > >>>    mm/kasan/sw_tags.c                     |  1 +
> > >>>    mm/kasan/tags.c                        |  2 +-
> > >>>    21 files changed, 100 insertions(+), 69 deletions(-)
> > >>>
> > >>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > >>> index f0abc38c40a..cd64b2bc12d 100644
> > >>> --- a/arch/loongarch/Kconfig
> > >>> +++ b/arch/loongarch/Kconfig
> > >>> @@ -9,6 +9,7 @@ config LOONGARCH
> > >>>        select ACPI_PPTT if ACPI
> > >>>        select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
> > >>>        select ARCH_BINFMT_ELF_STATE
> > >>> +     select ARCH_DEFER_KASAN if KASAN
> > >>
> > >> Instead of adding 'if KASAN' in all users, you could do in two steps=
:
> > >>
> > >> Add a symbol ARCH_NEEDS_DEFER_KASAN.
> > >>
> > >> +config ARCH_NEEDS_DEFER_KASAN
> > >> +       bool
> > >>
> > >> And then:
> > >>
> > >> +config ARCH_DEFER_KASAN
> > >> +       def_bool
> > >> +       depends on KASAN
> > >> +       depends on ARCH_DEFER_KASAN
> > >> +       help
> > >> +         Architectures should select this if they need to defer KAS=
AN
> > >> +         initialization until shadow memory is properly set up. Thi=
s
> > >> +         enables runtime control via static keys. Otherwise, KASAN =
uses
> > >> +         compile-time constants for better performance.
> > >>
> > >
> > > Actually, I don't see the benefits from this option. Sorry, have just
> > > revisited this again.
> > > With the new symbol, arch (PowerPC, UML, LoongArch) still needs selec=
t
> > > 2 options:
> > >
> > > select ARCH_NEEDS_DEFER_KASAN
> > > select ARCH_DEFER_KASAN
> >
> > Sorry, my mistake, ARCH_DEFER_KASAN has to be 'def_bool y'. Missing the
> > 'y'. That way it is automatically set to 'y' as long as KASAN and
> > ARCH_NEEDS_DEFER_KASAN are selected. Should be:
> >
> > config ARCH_DEFER_KASAN
> >         def_bool y
> >         depends on KASAN
> >         depends on ARCH_NEEDS_DEFER_KASAN
> >
> >
> > >
> > > and the oneline with `if` condition is cleaner.
> > > select ARCH_DEFER_KASAN if KASAN
>
> Hello,
>
> Have just had a chance to test this.
>
> lib/Kconfig.kasan:
>         config ARCH_NEEDS_DEFER_KASAN
>                 bool
>
>         config ARCH_DEFER_KASAN
>                 def_bool y
>                 depends on KASAN
>                 depends on ARCH_NEEDS_DEFER_KASAN

Setting Kconfig.kasan without KASAN works fine for 3 arch that selects
ARCH_DEFER_KASAN:

config ARCH_DEFER_KASAN
       def_bool y
       depends on ARCH_NEEDS_DEFER_KASAN

Going to send v6 soon.

P.S.: Fixed email of David Gow.

>
> It works for UML defconfig where arch/um/Kconfig is:
>
> config UML
>         bool
>         default y
>         select ARCH_NEEDS_DEFER_KASAN
>         select ARCH_DEFER_KASAN if STATIC_LINK
>
> But it prints warnings for PowerPC, LoongArch:
>
> config LOONGARCH
>         bool
>         ...
>         select ARCH_NEEDS_DEFER_KASAN
>         select ARCH_DEFER_KASAN
>
> $ make defconfig ARCH=3Dloongarch
> *** Default configuration is based on 'loongson3_defconfig'
>
> WARNING: unmet direct dependencies detected for ARCH_DEFER_KASAN
>   Depends on [n]: KASAN [=3Dn] && ARCH_NEEDS_DEFER_KASAN [=3Dy]
>   Selected by [y]:
>   - LOONGARCH [=3Dy]
>
>
> config PPC
>         bool
>         default y
>         select ARCH_DEFER_KASAN if PPC_RADIX_MMU
>         select ARCH_NEEDS_DEFER_KASAN
>
> $ make ppc64_defconfig
>
> WARNING: unmet direct dependencies detected for ARCH_DEFER_KASAN
>   Depends on [n]: KASAN [=3Dn] && ARCH_NEEDS_DEFER_KASAN [=3Dy]
>   Selected by [y]:
>   - PPC [=3Dy] && PPC_RADIX_MMU [=3Dy]
>
>
> > >
> >
> > I don't think so because it requires all architectures to add 'if KASAN=
'
> > which is not convenient.
> >
> > Christophe

