Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31B389C17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flwl84pLfz30JY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:51:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ollmoKsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ollmoKsk; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flwkh2tb5z2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:50:52 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id f9so20939435ybo.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DVPlJYgquiO6gTtF0WBILOF3eY3iLToXf/va1ntN5so=;
 b=ollmoKskijFcUHpApgfzj32rR2LEk0i9Ky3j0PPhFjdfzNS+5rFVVBlZyQh9e0Qp1C
 EtAm1Zo5ZUM5ePw2X6JRW27EjU1ER9WwjuAFnjDT8LyPTG/C93L0kNj2e1TOzbcTyIjO
 qMO6gHNva47Fdz8WBVgN9w1OTNFav+g3fSo5VYUdD1dApdTM/ryzTFwQ4vOxhQzWzMiR
 68eE4SyBMcLk8LngZFUhSQF5FePMn+rOkdaMhbgj3o9L2j++KrlYLNgWAexfdxacUzai
 9vUlyq9JzccQHRAGmdXp07H/KTQy+NnloKrsmcKZHMA5R+BMEynuw3oxY/hq/MuobMKP
 F6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DVPlJYgquiO6gTtF0WBILOF3eY3iLToXf/va1ntN5so=;
 b=Aa4Vi4Wq+e3NnbWIChITRmsPyAutz098igjNdRMm8292yJS0797BJ+UMfrtLH5+4ZB
 BsRGhl1sFPU6T0IPCb5FP7mb12TQv3g4a9oAKg9FDfFUkmmoi3R/8AC6hqE7QC7ZU68Z
 U3vZNXDm/gkWbqah3XRTdAFtoFiDDYdnBKTg0g/kl6bcYe9waODSqWVTumAWEgXZnUBB
 NeljgPJ/iy5kAW5ckGF/fcWOTQ4QpLiPUqi0WAhdLPl7Jy+eXeVVHLd5w7/9QwwvfB6O
 fNw6XBGbOq0OUjygLntTppCIVA1OKxmUvjGRSGoZLAUic9lelPBEjUil8ByK/dAwiXZS
 3NDA==
X-Gm-Message-State: AOAM530XQa8CwdiVmSuZwS/ygXHbEBzQB9bntNLmIgESWMBLEVmKVbPv
 41LqKOAo8BRLX0c/D2wSXPCnHAKYxEXk8P6yBQp95xn6
X-Google-Smtp-Source: ABdhPJyhobWk7isEqg91+FFhvAOjzRYgVpKUXwbmq2cHDpVmL7HKgIxQD4V3C0j1EFjb3B+KHvY80dKEmWMmcL7Z/Os=
X-Received: by 2002:a5b:b92:: with SMTP id l18mr4296604ybq.414.1621482650184; 
 Wed, 19 May 2021 20:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-8-jniethe5@gmail.com>
 <5c592104-2018-a36d-61a3-e2039b1563eb@csgroup.eu>
In-Reply-To: <5c592104-2018-a36d-61a3-e2039b1563eb@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 20 May 2021 13:50:39 +1000
Message-ID: <CACzsE9pxFwpLss_cPGWUf8K=UPEjvdHXbnX7HdZYmXejVOL_RA@mail.gmail.com>
Subject: Re: [PATCH v14 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
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

On Mon, May 17, 2021 at 4:49 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 17/05/2021 =C3=A0 05:28, Jordan Niethe a =C3=A9crit :
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
> > Book32s/32 processors with a hash mmu (i.e. 604 core) can not set memor=
y
>    ^^^^^^
>
> Book32s =3D=3D> Book3s
Thanks.
>
> > protection on a page by page basis so do not enable.
>
> It is not exactly that. The problem on 604 is for _exec_ protection.
Right.
>
> Note that on book3s/32, on both 603 and 604 core, it is not possible to w=
rite protect kernel pages.
> So maybe it would make sense to disable ARCH_HAS_STRICT_MODULE_RWX on CON=
FIG_PPC_BOOK3S_32
> completely, I'm not sure.
Yeah, that does seem like it would make sense to disable it.
>
>
> >
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > [jpn: - predicate on !PPC_BOOK3S_604
> >        - make module_alloc() use PAGE_KERNEL protection]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> > ---
> > v10: - Predicate on !PPC_BOOK3S_604
> >       - Make module_alloc() use PAGE_KERNEL protection
> > v11: - Neaten up
> > v13: Use strict_kernel_rwx_enabled()
> > v14: Make changes to module_alloc() its own commit
> > ---
> >   arch/powerpc/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
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
> >
