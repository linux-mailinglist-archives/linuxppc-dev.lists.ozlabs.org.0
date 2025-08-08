Return-Path: <linuxppc-dev+bounces-10749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBDB1E26D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 08:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byvfL0R5Hz30WY;
	Fri,  8 Aug 2025 16:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754635498;
	cv=none; b=R3OFrZZo4hWNsyFonGvhH4tY+EGUDoh+bahvs+TS0WiFCaJGlk5VYQIGjHCc5nBEgDZGA/fVBl0DnmrdcJDgr2HehgT0iwJ7nUU64gEchjKF2gUSw4wgquUTOlQoXRe51K6hhfMK0rVi3ICTAno10QrE/iPUdiknVRvQldcieDyi3x9b1Xq/46a29GyKoIO1JdAoO1XeahhpU100gKpVZyhp/qn2t+WL6d6vm1lrM6PKUJE4TKM2VaZ6kmTOvuoI+m6A3DJNVqZ7HM29E2+wg4/ivLIAT3oDBBoGKRGacUa99ZmnN83q0ShbVIGpfUBZDrR6dMWBxScouG113bD+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754635498; c=relaxed/relaxed;
	bh=/bygktD0fqAfBcULD1cv//efBpJOrdPBFdY6zXSYR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oc57gBqWvEXQvW7EmiScCzZ7bNIdKnvR5aH9fj1W9uorBkmZRZ4Hsum/0UOUjN7kxIIkDvm0P+49LfmOIyTbCTWmwt0gLsWrn0fE0/2HPWaGWR5KUCA0J6alY3JiuDaGNkr3m3kAjhPG+xapPTqe+GeRaTkcW1oBVhqmKvK74j5fXOpgn0AVjemC2D9VpgPBkab0wiZr4ngnoibgpd9PfcYtLA54XsmHaXK8sFwcctiB0Zd2ZC6B3qcyMHpJaAmjzyGv8+7+qqi7/7BMkVd/pkAbljyBynYrOSiutp6RqYfbIXw+VxwbMcEv6WV35JqNopVF991XT9RCRNOR8k00Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ebPYU/3Y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ebPYU/3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byvfF5QXxz2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 16:44:53 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-33211f7f06eso18991261fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Aug 2025 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754635488; x=1755240288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bygktD0fqAfBcULD1cv//efBpJOrdPBFdY6zXSYR1E=;
        b=ebPYU/3Y3m1u/23ULU3IZUUm/nQ5y+vmdzL8A2YQusu2kzQGW3mHFeXxPB+jAOGSdh
         LHdiFdMcTjGBzgUBlMSxPISqCqOWNS6fuA/BP8fjGAhxW0Iys9Qz3sdd9u7TxbdjVM0c
         TmjYP4h0fj4HUtVVSo5UtUct8Yv8NXkArSDX462+HqhRGFX/DtN4A3oJ11yIdvqYu+F8
         SSzNYwMDWfQ1gvS/T+QGOXd36bEiBFyxwdKLV7LVM0u70lVfPd0zt/n/hG3Lacc6/6vH
         kOBP3qxMsQU0JR5chnpe8KF551X0v4s8wiKWVaVDC9fodO0z4JMD9Hc0Fbk3UsJk7A2j
         3nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754635488; x=1755240288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bygktD0fqAfBcULD1cv//efBpJOrdPBFdY6zXSYR1E=;
        b=NwBq5ic/ORK+gv0xWq6sWJEFBZsTWHKx+nsmsgfsC+VFfLJS9QjvBRrGGGUJ3vcLsT
         u3P1CVngop3Wc07I4MygD28Uw9Y5jNDbF5xUfHh5218+9IYbkeurqs4cLz6Sgowjvccl
         hDUZBKxMuJc0/n57zD8kdjstJpCvIIW11VaKeEXU1fksUPrT80T62vE6x4y2ppfBjZ2j
         3X5m01+G2pYZmGAVT3GUFE9xOXVuJiqR+BXGTKJ7NVknJ1Jfz8GGMJ0u8rVQ0RwY+un7
         TcyXg9ojkswnAB0PhxsK/YQBPRMDUN0gLTQlW02PTfZ2EuoDvsHgkMTEfWnrLOsypssp
         iVGw==
X-Forwarded-Encrypted: i=1; AJvYcCWYUhm+z9EHPTEUfVT5cob7TD8WeTDq1XvinRw6R/PGsLKx0JomPxfEmwkYOFegsCh6+y0JegyyUHZMiuA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxHgX2o0o0f2URHCBaf6mqeVbVGteqSG4KNOMwJ9K2MjZx2FQlE
	ZcKOWKdz6TQJvbTajewjb003CDCQVTQykFW7ATeqHxvUJ4oACieKVOPbT2QxWZe4f3QuOm+GnY0
	A8FbMt3VX2DMNQhf8xy5d7U8pkw7vnfA=
X-Gm-Gg: ASbGncvDaXHSfZtHWN3SXVVAAA0HW9dQhMPKsVJ1tTYjamZWyRo9Dak8MZRedMewGZu
	6Y2DhayzumXRFIktzUEtuxiKr3B4xIVXi8UfrOFrSq8zxDZthwRZjixwsm9A+71FVYdtQcrjhef
	rcg/yM59bi4GnMBnLLiaOQxzHFubmRegCEOcxxHRB3csE5eyXjO/Vuo0VvPvLRYviTckyz51ldv
	XoX9o4XQx6gKQ==
X-Google-Smtp-Source: AGHT+IFs71M36/AELdEQHAnmGYL1flS4Z16XX46ZSXB/yJtln5z+7ajdXBk68gahFV3tPaDyZV4i3858ZjCNgBJDsz4=
X-Received: by 2002:a05:651c:4010:b0:332:2df3:f8ac with SMTP id
 38308e7fff4ca-333a222c31amr3330341fa.32.1754635487960; Thu, 07 Aug 2025
 23:44:47 -0700 (PDT)
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
References: <20250807194012.631367-1-snovitoll@gmail.com> <20250807194012.631367-3-snovitoll@gmail.com>
 <07ffb27c-3416-43c9-a50a-164a76e5ab60@csgroup.eu>
In-Reply-To: <07ffb27c-3416-43c9-a50a-164a76e5ab60@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Fri, 8 Aug 2025 11:44:30 +0500
X-Gm-Features: Ac12FXy3j3jcHWv5quQse7L5XRgGZZuU0Dnwj-G3jWlUZ0ijDblLaDUsIz_V-Q8
Message-ID: <CACzwLxhahYWfRc5xKshayniV6SuFFnMT0NfHttippcASzZgtRw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] kasan: call kasan_init_generic in kasan_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>, alex@ghiti.fr
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com, 
	andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.co, glider@google.com, 
	dvyukov@google.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, 
	elver@google.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 8, 2025 at 10:07=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 07/08/2025 =C3=A0 21:40, Sabyrzhan Tasbolatov a =C3=A9crit :
> > Call kasan_init_generic() which handles Generic KASAN initialization.
> > For architectures that do not select ARCH_DEFER_KASAN,
> > this will be a no-op for the runtime flag but will
> > print the initialization banner.
> >
> > For SW_TAGS and HW_TAGS modes, their respective init functions will
> > handle the flag enabling, if they are enabled/implemented.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
> > Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
> > ---
> > Changes in v5:
> > - Unified arch patches into a single one, where we just call
> >       kasan_init_generic()
> > - Added Tested-by tag for riscv (tested the same change in v4)
> > - Added Acked-by tag for s390 (tested the same change in v4)
> > ---
> >   arch/arm/mm/kasan_init.c    | 2 +-
> >   arch/arm64/mm/kasan_init.c  | 4 +---
> >   arch/riscv/mm/kasan_init.c  | 1 +
> >   arch/s390/kernel/early.c    | 3 ++-
> >   arch/x86/mm/kasan_init_64.c | 2 +-
> >   arch/xtensa/mm/kasan_init.c | 2 +-
> >   6 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
> > index 111d4f70313..c6625e808bf 100644
> > --- a/arch/arm/mm/kasan_init.c
> > +++ b/arch/arm/mm/kasan_init.c
> > @@ -300,6 +300,6 @@ void __init kasan_init(void)
> >       local_flush_tlb_all();
> >
> >       memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> > -     pr_info("Kernel address sanitizer initialized\n");
> >       init_task.kasan_depth =3D 0;
> > +     kasan_init_generic();
> >   }
> > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > index d541ce45dae..abeb81bf6eb 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -399,14 +399,12 @@ void __init kasan_init(void)
> >   {
> >       kasan_init_shadow();
> >       kasan_init_depth();
> > -#if defined(CONFIG_KASAN_GENERIC)
> > +     kasan_init_generic();
> >       /*
> >        * Generic KASAN is now fully initialized.
> >        * Software and Hardware Tag-Based modes still require
> >        * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
> >        */
> > -     pr_info("KernelAddressSanitizer initialized (generic)\n");
> > -#endif
> >   }
> >
> >   #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> > index 41c635d6aca..ba2709b1eec 100644
> > --- a/arch/riscv/mm/kasan_init.c
> > +++ b/arch/riscv/mm/kasan_init.c
> > @@ -530,6 +530,7 @@ void __init kasan_init(void)
> >
> >       memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
> >       init_task.kasan_depth =3D 0;
> > +     kasan_init_generic();
>
> I understood KASAN is really ready to function only once the csr_write()
> and local_flush_tlb_all() below are done. Shouldn't kasan_init_generic()
> be called after it ?

I will try to test this in v6:

        csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
        local_flush_tlb_all();
        kasan_init_generic();

Alexandre Ghiti said [1] it was not a problem, but I will check.

[1] https://lore.kernel.org/all/20c1e656-512e-4424-9d4e-176af18bb7d6@ghiti.=
fr/

>
> >
> >       csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
> >       local_flush_tlb_all();
> > diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
> > index 9adfbdd377d..544e5403dd9 100644
> > --- a/arch/s390/kernel/early.c
> > +++ b/arch/s390/kernel/early.c
> > @@ -21,6 +21,7 @@
> >   #include <linux/kernel.h>
> >   #include <asm/asm-extable.h>
> >   #include <linux/memblock.h>
> > +#include <linux/kasan.h>
> >   #include <asm/access-regs.h>
> >   #include <asm/asm-offsets.h>
> >   #include <asm/machine.h>
> > @@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
> >   {
> >   #ifdef CONFIG_KASAN
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized\n");
> > +     kasan_init_generic();
> >   #endif
> >   }
> >
> > diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> > index 0539efd0d21..998b6010d6d 100644
> > --- a/arch/x86/mm/kasan_init_64.c
> > +++ b/arch/x86/mm/kasan_init_64.c
> > @@ -451,5 +451,5 @@ void __init kasan_init(void)
> >       __flush_tlb_all();
> >
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized\n");
> > +     kasan_init_generic();
> >   }
> > diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
> > index f39c4d83173..0524b9ed5e6 100644
> > --- a/arch/xtensa/mm/kasan_init.c
> > +++ b/arch/xtensa/mm/kasan_init.c
> > @@ -94,5 +94,5 @@ void __init kasan_init(void)
> >
> >       /* At this point kasan is fully initialized. Enable error message=
s. */
> >       current->kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized\n");
> > +     kasan_init_generic();
> >   }
>

