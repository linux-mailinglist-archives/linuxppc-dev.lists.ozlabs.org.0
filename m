Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C037114F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 07:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYWyQ5NMYz30BM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OS7tmO1r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OS7tmO1r; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYWxx1Jzjz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 15:39:30 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id l7so6044845ybf.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 22:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zooXzjYkdIrStgjWvqRltfH6CyU8MbP6tdE/8Pct3RU=;
 b=OS7tmO1rY05fz0cpTvZvcVCct3Jaz+qjgmW6/A5eua4V9nB/+ME1NctoApGBwVkA0y
 jMM97wE6eQNqBYDYE4t+dj3ZjXaRnLbIpJPE+P/bHScZ6278AwtdK54L7JKGYYB6uc8+
 QQIw5Wu/rjvGKd+1WovHA3GLQch6NSfS1PkY+XWRRWQnJM9oxurWi6pfTMfpq4Sur2i3
 RxRxDo5TKVWLidROYgyC/iOiYtwbrt2uAmo2mLR/Aat4WmrmNHMzrNDEYalDoPQByjKf
 YzNUd0MN7vbStGoo24C4ST4vn1nXjpGV2wlWBuCn2EfgeU/TMntBNDS/OssHj7/muwOZ
 TzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zooXzjYkdIrStgjWvqRltfH6CyU8MbP6tdE/8Pct3RU=;
 b=mIMw1IQgoMZae16f5Nf/2cwDLWCRYr7cetV+dlMgjcAMchrSjgFwGwRLvA8862CpWz
 PfdbjQaVT6B6zDRAU+JG8Ar0ixFo2vfwkE2Ev//VZAq+mEZ2KmE04jUXICtI+dxUsdL7
 5p1yMCguDDZxszfOGP33YJMk3eJhtlURBra8+vGAuNs009xvI+LsF5B5HD3nOgJt5oVd
 Tmz1rUEVPk4VB0n6Fnoj1j8CZgRObmB9UfinFdCwj9oMB2MMIJHqH/+ubQAoUbLA5M1m
 Ob+JAFdUpU8ZWGvRfVQFomkad8yWwIJBLqj6xBcge1Eu2jiXICQ+ivYEyyEJl7q8seRy
 3PnA==
X-Gm-Message-State: AOAM531NeAPj3rp1S1IlZk2yfgLVGz6fRV+Ivp3zSWNeKGgWsTGa1oEM
 a6T4yf/x9XZY3VcbYiXd6oZ5lpzgZ2KUjzIDgfM=
X-Google-Smtp-Source: ABdhPJyDlXjXEAftR/xLPXcGZzT2UVLg4mdFydq7ZfppKDM0yFl3u1AmwYWBdKZiBq3MKue0pqBsvbSRkqaDK2Ux+G4=
X-Received: by 2002:a25:18c6:: with SMTP id 189mr25141530yby.342.1620020366938; 
 Sun, 02 May 2021 22:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-4-jniethe5@gmail.com>
 <111c8736-fff9-ba0a-4749-f9388b32c9bf@csgroup.eu>
In-Reply-To: <111c8736-fff9-ba0a-4749-f9388b32c9bf@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 3 May 2021 15:39:15 +1000
Message-ID: <CACzsE9q1QoSMVZD7yoE=3pHaRc-i14X2++ewFbBxSeZn-2u78A@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] powerpc: Always define MODULES_{VADDR,END}
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 29, 2021 at 3:04 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 29/04/2021 =C3=A0 05:15, Jordan Niethe a =C3=A9crit :
> > If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
> > VMALLOC_END respectively. This reduces the need for special cases. For
> > example, powerpc's module_alloc() was previously predicated on
> > MODULES_VADDR being defined but now is unconditionally defined.
> >
> > This will be useful reducing conditional code in other places that need
> > to allocate from the module region (i.e., kprobes).
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: New to series
> > v11: - Consider more places MODULES_VADDR was being used
> > ---
> >   arch/powerpc/include/asm/pgtable.h    | 11 +++++++++++
> >   arch/powerpc/kernel/module.c          |  5 +----
> >   arch/powerpc/mm/kasan/kasan_init_32.c | 10 +++++-----
> >   arch/powerpc/mm/ptdump/ptdump.c       |  4 ++--
> >   4 files changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/=
asm/pgtable.h
> > index c6a676714f04..882fda779648 100644
> > --- a/arch/powerpc/include/asm/pgtable.h
> > +++ b/arch/powerpc/include/asm/pgtable.h
> > @@ -39,6 +39,17 @@ struct mm_struct;
> >   #define __S110      PAGE_SHARED_X
> >   #define __S111      PAGE_SHARED_X
> >
> > +#ifndef MODULES_VADDR
> > +#define MODULES_VADDR VMALLOC_START
> > +#define MODULES_END VMALLOC_END
> > +#endif
> > +
> > +#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_STRICT_KERNEL_RWX)
>
> No no.
>
> TASK_SIZE > MODULES_VADDR is ALWAYS wrong, for any target, in any configu=
ration.
>
> Why is it a problem to leave the test as a BUILD_BUG_ON() in module_alloc=
() ?
On ppc64s, MODULES_VADDR is __vmalloc_start (a variable)  and
TASK_SIZE depends on current.
Also for nohash like 44x, MODULES_VADDR is defined based on high_memory.
If I put it back in module_alloc() and wrap it with #ifdef
CONFIG_PPC_BOOK3S_32 will that be fine?

>
> > +#if TASK_SIZE > MODULES_VADDR
> > +#error TASK_SIZE > MODULES_VADDR
> > +#endif
> > +#endif
> > +
> >   #ifndef __ASSEMBLY__
> >
> >   /* Keep these as a macros to avoid include dependency mess */
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.=
c
> > index fab84024650c..c60c7457ff47 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/sort.h>
> >   #include <asm/setup.h>
> >   #include <asm/sections.h>
> > +#include <linux/mm.h>
> >
> >   static LIST_HEAD(module_bug_list);
> >
> > @@ -88,7 +89,6 @@ int module_finalize(const Elf_Ehdr *hdr,
> >       return 0;
> >   }
> >
> > -#ifdef MODULES_VADDR
> >   static __always_inline void *
> >   __module_alloc(unsigned long size, unsigned long start, unsigned long=
 end)
> >   {
> > @@ -102,8 +102,6 @@ void *module_alloc(unsigned long size)
> >       unsigned long limit =3D (unsigned long)_etext - SZ_32M;
> >       void *ptr =3D NULL;
> >
> > -     BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> > -
> >       /* First try within 32M limit from _etext to avoid branch trampol=
ines */
> >       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> >               ptr =3D __module_alloc(size, limit, MODULES_END);
> > @@ -113,4 +111,3 @@ void *module_alloc(unsigned long size)
> >
> >       return ptr;
> >   }
> > -#endif
> > diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/ka=
san/kasan_init_32.c
> > index cf8770b1a692..42c057366ac7 100644
> > --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> > +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> > @@ -116,11 +116,11 @@ static void __init kasan_unmap_early_shadow_vmall=
oc(void)
> >
> >       kasan_update_early_region(k_start, k_end, __pte(0));
> >
> > -#ifdef MODULES_VADDR
> > -     k_start =3D (unsigned long)kasan_mem_to_shadow((void *)MODULES_VA=
DDR);
> > -     k_end =3D (unsigned long)kasan_mem_to_shadow((void *)MODULES_END)=
;
> > -     kasan_update_early_region(k_start, k_end, __pte(0));
> > -#endif
> > +     if (MODULES_VADDR !=3D VMALLOC_START && MODULES_END !=3D VMALLOC_=
END) {
>
> Shouldn't it be an || ?
Yeah
>
> As soon as either MODULES_VADDR or MODULES_END differs from the vmalloc b=
oundaries, it needs to be
> done I think.
>
> > +             k_start =3D (unsigned long)kasan_mem_to_shadow((void *)MO=
DULES_VADDR);
> > +             k_end =3D (unsigned long)kasan_mem_to_shadow((void *)MODU=
LES_END);
> > +             kasan_update_early_region(k_start, k_end, __pte(0));
> > +     }
> >   }
> >
> >   void __init kasan_mmu_init(void)
> > diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/p=
tdump.c
> > index aca354fb670b..0431457f668f 100644
> > --- a/arch/powerpc/mm/ptdump/ptdump.c
> > +++ b/arch/powerpc/mm/ptdump/ptdump.c
> > @@ -73,7 +73,7 @@ struct addr_marker {
> >
> >   static struct addr_marker address_markers[] =3D {
> >       { 0,    "Start of kernel VM" },
> > -#ifdef MODULES_VADDR
> > +#if defined(CONFIG_BOOK32_32) && defined(CONFIG_STRICT_KERNEL_RWX)
>
> Not valid anymore, see https://github.com/linuxppc/linux/commit/80edc68e0=
479 and
> https://github.com/linuxppc/linux/commit/9132a2e82adc
>
> The best would be to be able to do something like:
>
> #if MODULES_VADDR !=3D VMALLOC_START
I tried to do it like that originally but with stuff like
#define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) &
~(VMALLOC_OFFSET-1)))
it doesn't work.
>
> If it doesn't work, then it has to be
>
> #if defined(CONFIG_BOOK32_32) || defined(CONFIG_PPC_8xx)
Ok, thanks.
>
> >       { 0,    "modules start" },
> >       { 0,    "modules end" },
> >   #endif
> > @@ -359,7 +359,7 @@ static void populate_markers(void)
> >   #else
> >       address_markers[i++].start_address =3D TASK_SIZE;
> >   #endif
> > -#ifdef MODULES_VADDR
> > +#if defined(CONFIG_BOOK32_32) && defined(CONFIG_STRICT_KERNEL_RWX)
>
> Same.
>
> >       address_markers[i++].start_address =3D MODULES_VADDR;
> >       address_markers[i++].start_address =3D MODULES_END;
> >   #endif
> >
