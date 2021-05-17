Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CF3824BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:49:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk8rH3K58z301L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:49:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HOgvh0BA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HOgvh0BA; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8ql598Kz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:49:06 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id l7so7096341ybf.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ogQ8WjRN51W9F7PuMScLroVo7O4X1QWJYlJVrAAeOc=;
 b=HOgvh0BAjre9OobXeXr6GCiRJDAnguUTOB2qQs8ITamZcsMRGhsnS7AtM2QYOZlgra
 lu/d0bk1y2HaTdXh2epcjxxNG9byQp320D2GUiTn9b+yaCyXghnpo+4U1bZU9sFN14N2
 ffuxCBr+lBEDBK4X3iN7c+xoj4mSTEMw6rKiE2oh2Iijx4RQeAdWh4LFgsh6qlQBdDcn
 kUQwVNXJJjKcFdziJJTRd9d13DcBD49e+oSRzrVT1ZdBN8kjH8Xds8Wl90SjwRfvG5zI
 Rd2ER3ValJ56VCyQ/MxHrqRUo9S4jsxZ0OVPD0IZt5Mr65F+B0MQG0lMNGSNFoSJEkDc
 pQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ogQ8WjRN51W9F7PuMScLroVo7O4X1QWJYlJVrAAeOc=;
 b=MxPG5WMGnFq1FZzCkmNOe49N3qFuqoVC3tx1yrD0ueHrdgmfeT4rAhXYJAPVnEpIdb
 +F8PId16Aw/rxUKHyg0cFyK5EIVIyT4Z8H2h9/TZJ9ko+wQzPSAhFePAxy+o1dzHvbuf
 pLbTcYP5PmayF7WT0bHWodMLguS+mM3dV/OX2cL++SvnAYqfGUDdWoCB7r6RaslcGSBD
 F1O30rQD1giyjenDDZD3OtQ3ZeIinUKYMLzkj5Pn9cgpgjp0gTR+Qyt2RfPvnXQNyQyh
 4DdzxKkQp4+ne2a7c0Eoy2/Vmm7XnMjhIeizR+9TNX1eljHVnmkV/wevF1jJOUqp5XQv
 07gw==
X-Gm-Message-State: AOAM531cKcB1e/UI33MWz6F5sr3YCeNwaVGYPFemhqOoIfsN8epPjh/X
 SK8cNaPJmByXEF4ydO0CoBgLVgINTwpYwfk+eTU=
X-Google-Smtp-Source: ABdhPJx75UdGKLd7FvOeW+XWunqJxGnnh15skllansu0JhIm5XAQvsi7PzQ6aVMA7x4yIjHoowhJmvReYFFH/3rtkyo=
X-Received: by 2002:a25:aad4:: with SMTP id t78mr64976233ybi.343.1621234141921; 
 Sun, 16 May 2021 23:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-4-jniethe5@gmail.com>
 <04311ba7-8b91-6837-2bc5-1f55f49da253@csgroup.eu>
In-Reply-To: <04311ba7-8b91-6837-2bc5-1f55f49da253@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 17 May 2021 16:48:50 +1000
Message-ID: <CACzsE9rk7D_ocSsf74C1vX=oXgLa_pQTSusncXRPeGBVe+48Nw@mail.gmail.com>
Subject: Re: [PATCH v14 3/9] powerpc/modules: Make module_alloc() Strict
 Module RWX aware
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

On Mon, May 17, 2021 at 4:37 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 17/05/2021 =C3=A0 05:28, Jordan Niethe a =C3=A9crit :
> > Make module_alloc() use PAGE_KERNEL protections instead of
> > PAGE_KERNEL_EXEX if Strict Module RWX is enabled.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v14: - Split out from powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
> >       - Add and use strict_module_rwx_enabled() helper
> > ---
> >   arch/powerpc/include/asm/mmu.h | 5 +++++
> >   arch/powerpc/kernel/module.c   | 4 +++-
> >   2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/=
mmu.h
> > index 607168b1aef4..7710bf0cbf8a 100644
> > --- a/arch/powerpc/include/asm/mmu.h
> > +++ b/arch/powerpc/include/asm/mmu.h
> > @@ -357,6 +357,11 @@ static inline bool strict_kernel_rwx_enabled(void)
> >       return false;
> >   }
> >   #endif
> > +
> > +static inline bool strict_module_rwx_enabled(void)
> > +{
> > +     return IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && strict_kernel_rwx_=
enabled();
> > +}
>
> Looking at arch/Kconfig, I have the feeling that it is possible to select=
 CONFIG_STRICT_MODULE_RWX
> without selecting CONFIG_STRICT_KERNEL_RWX.
>
> In that case, strict_kernel_rwx_enabled() will return false.
Ok, if someone did that currently it would break things, e.g. code
patching. I think it should it be made impossible to
CONFIG_STRICT_MODULE_RWX without CONFIG_STRICT_KERNEL_RWX?
>
> >   #endif /* !__ASSEMBLY__ */
> >
> >   /* The kernel use the constants below to index in the page sizes arra=
y.
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.=
c
> > index 3f35c8d20be7..ed04a3ba66fe 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
> >   static __always_inline void *
> >   __module_alloc(unsigned long size, unsigned long start, unsigned long=
 end)
> >   {
> > +     pgprot_t prot =3D strict_module_rwx_enabled() ? PAGE_KERNEL : PAG=
E_KERNEL_EXEC;
> > +
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
