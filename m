Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3E382284
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 03:29:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk1kz36Fwz309F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 11:29:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XheeJ2of;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XheeJ2of; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk1kV00Pqz2xvR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 11:29:03 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 191so487192ybn.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 18:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k++L+iZcXJVNggqUS6GDOSSyhtGVVhL3PvV52rmx1N4=;
 b=XheeJ2of6+8R1OKzJSpj7McWJ13F4WLrf3GuTicLOtKusrT6ZwDW7rIghkCP3Qhi+r
 Ev9TSZXi8QX1s1u8Fa2/POtwE9j5cLQrc23FKN1cgP7t50LBj+CNfGmNCEDw2Hwfb1Zk
 XYoNwG1sMuxx3qnG2UtTKWuQp78qF+A30xjZi5mPTBS+BcGNH6A9AulFyEyveroXpAg8
 YXNBXeXdpWAADft4Y/eX/jxtXyOtWSGMxXmKMHzjB4R0KgQbdslGeEQ+BElscJhJDFDV
 KkIq0sbpFTKMcM7mfXXLdXuzSuQuGAn6mA05R/I7cZv6LV+ioTzn5jW0LsQXPvOD1uUm
 3zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k++L+iZcXJVNggqUS6GDOSSyhtGVVhL3PvV52rmx1N4=;
 b=N+e/MP0dG8K2bn5YVAXuHrNHLksqcRUrsQdzacw28zF3fghSU1iBMkv7A/lPOrEAv5
 PX/jF50VSbwKNlkRVvI1uEeYSNxa/90/xKRRDJG34dnRIgXLtAPVrcQQIEGpO3yqV03U
 paEBhajgRHq9PxYegDzspILfmUhWkWtvgOXdmIg8XYHHWeUyT5nB+Mp0YSxyQfgC7qY0
 3kARaeqZEp7RkFyfq4fbik+L2EWDJYYEM5MKGmHwZUkIMigYcMOVzVViHHGwRBqj5GpD
 /Z3IYmYJULihy1oHUTjYzK28t6FMNvN3DyLfRjfDK547JYlI6eXGWnzm4qJ4JpTkfrsG
 KD4g==
X-Gm-Message-State: AOAM5325S+dwRNsea1Wgf9nRGz9VbGxS6fbvk3smz3UaflnG+QgY07TI
 dFtcXGBimmREWa1FQBgaXwVj5C54BXhpiZ8OIKY=
X-Google-Smtp-Source: ABdhPJwtjteSvR8PK8jA7k4TyEFe2GDgluWj0K/UHm+tQOw7ThEVHIvSUDeUbwRtYwu2xRylGGlaYMtxW3NpgGNlssQ=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46301308ybu.332.1621214939849; 
 Sun, 16 May 2021 18:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210510011828.4006623-1-jniethe5@gmail.com>
 <20210510011828.4006623-7-jniethe5@gmail.com>
 <3678a605-d2bb-5417-ff2d-9155c95835e0@csgroup.eu>
In-Reply-To: <3678a605-d2bb-5417-ff2d-9155c95835e0@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 17 May 2021 11:28:48 +1000
Message-ID: <CACzsE9pkGOMGvKRWE8gMcv-+mFAkCD=OiKV7t7n7KPpFcO_3jA@mail.gmail.com>
Subject: Re: [PATCH v13 6/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
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

On Fri, May 14, 2021 at 3:50 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 10/05/2021 =C3=A0 03:18, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > To enable strict module RWX on powerpc, set:
> >
> >      CONFIG_STRICT_MODULE_RWX=3Dy
> >
> > You should also have CONFIG_STRICT_KERNEL_RWX=3Dy set to have any real
> > security benefit.
> >
> > ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX=
.
> > This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
> > makes STRICT_MODULE_RWX *on by default* in configurations where
> > STRICT_KERNEL_RWX is *unavailable*.
> >
> > Since this doesn't make much sense, and module RWX without kernel RWX
> > doesn't make much sense, having the same dependencies as kernel RWX
> > works around this problem.
> >
> > With STRICT_MODULE_RWX, now make module_alloc() allocate pages with
> > KERNEL_PAGE protection rather than KERNEL_PAGE_EXEC.
> >
> > Book32s/32 processors with a hash mmu (i.e. 604 core) can not set memor=
y
> > protection on a page by page basis so do not enable.
> >
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > [jpn: - predicate on !PPC_BOOK3S_604
> >        - make module_alloc() use PAGE_KERNEL protection]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: - Predicate on !PPC_BOOK3S_604
> >       - Make module_alloc() use PAGE_KERNEL protection
> > v11: - Neaten up
> > v13: Use strict_kernel_rwx_enabled()
> > ---
> >   arch/powerpc/Kconfig         | 1 +
> >   arch/powerpc/kernel/module.c | 4 +++-
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index cce0a137b046..cb5d9d862c35 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -140,6 +140,7 @@ config PPC
> >       select ARCH_HAS_SCALED_CPUTIME          if VIRT_CPU_ACCOUNTING_NA=
TIVE && PPC_BOOK3S_64
> >       select ARCH_HAS_SET_MEMORY
> >       select ARCH_HAS_STRICT_KERNEL_RWX       if ((PPC_BOOK3S_64 || PPC=
32) && !HIBERNATION)
> > +     select ARCH_HAS_STRICT_MODULE_RWX       if ARCH_HAS_STRICT_KERNEL=
_RWX && !PPC_BOOK3S_604
> >       select ARCH_HAS_TICK_BROADCAST          if GENERIC_CLOCKEVENTS_BR=
OADCAST
> >       select ARCH_HAS_UACCESS_FLUSHCACHE
> >       select ARCH_HAS_COPY_MC                 if PPC64
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.=
c
> > index 3f35c8d20be7..f24004635ed5 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
> >   static __always_inline void *
> >   __module_alloc(unsigned long size, unsigned long start, unsigned long=
 end)
> >   {
> > +     pgprot_t prot =3D strict_kernel_rwx_enabled() ? PAGE_KERNEL : PAG=
E_KERNEL_EXEC;
> > +
>
> I'm not sure this is OK.
>
> I think we need to make a new helper strict_module_rwx_enabled() because =
I don't think we want
> PAGE_KERNEL here when CONFIG_STRICT_MODULE_RWX is not selected.
Yeah that seems like the right thing to do. I'll send a new version.
>
>
> >       /*
> >        * Don't do huge page allocations for modules yet until more test=
ing
> >        * is done. STRICT_MODULE_RWX may require extra work to support t=
his
> >        * too.
> >        */
> > -     return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE=
_KERNEL_EXEC,
> > +     return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, prot=
,
> >                                   VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMA=
P,
> >                                   NUMA_NO_NODE, __builtin_return_addres=
s(0));
> >   }
> >
