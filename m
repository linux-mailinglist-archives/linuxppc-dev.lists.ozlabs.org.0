Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AB37798F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 02:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdjFy4jfWz308k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 10:52:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=T5Iu/IJ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T5Iu/IJ7; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdjFQ5ZKrz2yWF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 10:52:24 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id g38so19430431ybi.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 17:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sLEkmJof5EdacSHbmVgVRjOV0khSkiUhWJSJqR0UdxY=;
 b=T5Iu/IJ7ztpcO+qNPS5Dqr9AC5Cv8C2tX/a0lNKQ4fSwGRNPUpDkVnI6VLMPWkLwBJ
 dwoqzO+e66IJjlcfLB0teVHiqC0oH/AAhIOx+Hrq3MB3/vmyXH1Oghf3cxl/IQKFBCyJ
 93NxO2xBdb8EEhU6kKKHVg7+D1XO9wPZwWjtgpsze6xBg8mo345QLHbXc02FlAoGxPz9
 qPJ4iYlyn0o5OH6IytlbkNy3f88rOSAoXO6QbvrS9qaTKfU48lnDvNBMMckVgfkP1kBr
 ZJwIBmtPpDKORPy94atN5eMdTVOgHwYUhBLHTJEsf46JLF5pfs8nG4iC4+ZBFjH0y4vA
 tCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sLEkmJof5EdacSHbmVgVRjOV0khSkiUhWJSJqR0UdxY=;
 b=Nx9mqKul6wmlM8bx23k86fENzrZ6sYRsny4FnduAa4tcPw3JY5QO9JR6gkg9is+9WV
 EOBjRB7SJ0vzlXD/cellEO5zCiJOvO6DFn7IEJQLVkvtxK1vODwGo/PwqDdl87FzQ34C
 kTBo20P3jSdfEZdmT6/0D/IDyVFUoQJE+FSOK+PB+sx2ExF2dUK/hjnRLZDLGHHMThdc
 xolbd53x2MNTXH4Ul6UKG2oo9IzqJgYLJXkavEfwSAM3wmyhGn9XDZziHgZRzZrmhRcN
 iKKHQuMh8LsRDpFyac9tOGOEcIBIFsuMUxLWm8H+BDjyKrVOy0tB1bIdTQtokZFu8xPt
 Xlag==
X-Gm-Message-State: AOAM530Sye72VZG4F6UNwV69lcmzHyNVOTnICt25E3CH9rqm9T7sd4Xu
 j7yK99KAK+3zN9awRgmfm+0deMlCSrvMTQKv0/E=
X-Google-Smtp-Source: ABdhPJzL6q4js6UfNNlUuDgQ/2uao5FLHWXiESxTqrzaR1oZPI/5pcAt+W5dqlBkd2b4iEFOAq7WLD+cd6fkrYMT1A0=
X-Received: by 2002:a25:1009:: with SMTP id 9mr3567080ybq.386.1620607939354;
 Sun, 09 May 2021 17:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210506023449.3568630-1-jniethe5@gmail.com>
 <20210506023449.3568630-7-jniethe5@gmail.com>
 <3a1eef8c-a982-5321-bb1a-7a4ebe73f1d2@csgroup.eu>
In-Reply-To: <3a1eef8c-a982-5321-bb1a-7a4ebe73f1d2@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 10 May 2021 10:52:07 +1000
Message-ID: <CACzsE9pw2Sxp7mLz=SjuW-RMLrFtTU7HhPeNZ9c5GzC7NbxMzg@mail.gmail.com>
Subject: Re: [PATCH v12 6/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
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

On Fri, May 7, 2021 at 3:35 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 06/05/2021 =C3=A0 04:34, Jordan Niethe a =C3=A9crit :
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
> > index 3f35c8d20be7..33e4011228b0 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
> >   static __always_inline void *
> >   __module_alloc(unsigned long size, unsigned long start, unsigned long=
 end)
> >   {
> > +     pgprot_t prot =3D IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ? PAGE_KER=
NEL :
> > +                                                            PAGE_KERNE=
L_EXEC;
>
> I'm not sure this test is OK, because strict kernel/module rwx can be dis=
abled at boottime.
> There is a global variable 'rodata_enabled' to reflect that.
>
> We have a helper in powerpc asm/mmu.h called strict_kernel_rwx_enabled() =
to check it.
Thanks, I will change to that.
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
