Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C47EA683DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 09:04:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nDzl6pwSzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 17:04:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eyDaA6O8"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nDxk4TrgzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 17:02:50 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id e20so2108642iob.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 00:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpoaOxGfNMV1uUxQQh5QntULfOBecgOiJBIXLSXdHB0=;
 b=eyDaA6O8qdMDP464A/UrDozJRid/hMgeGOKKhxC6blrPxvq2YvWfY0MHrhncdpA5Wh
 hMm4Pwi4t9FO/WttA4o1Grk33gdprdYCz5IRHc/NxkUiltA+NSE0FxNXUX4attutHOnS
 iADtb1q/8QCnSM8TBdF7877NYvUVGpc64wUnhsFRieiT4gCtHTWRbhkmMFGcP8rEie/D
 Qq37Nz6o1PgHIQK2Wg3W0DifDP4QKKnGo0Ngqc5vtyXmjF1FLouyK9GoQQbx3o7LhklB
 S2DhX6repo0k9Nk8wDEEgjdYkQscp3LFG4b/n/6ojL7Wi4ClqzEFFaZwqPN419cxkNRy
 n0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpoaOxGfNMV1uUxQQh5QntULfOBecgOiJBIXLSXdHB0=;
 b=qHzTXOsk+DbwoqMwrKIl2KLBj/SjlJOg0Ot6/8bKeHMTGwbV+Nwx6NaWFvum8JaftL
 mpb/gEfNK0MGCqiGTpIx09i0eSazXIw+87Ja81Z1n4cKhisnKaITzjTJW3f4mEtffB06
 mT5efjEVuSpCyyXBRMSLAqk6hNUNXk9Pxk9yv8bRGLpj+qmGCJQk9OiYUG8nzo05kGo9
 FE21+Mk++XPh6xRFKAT0X4E+EM4YaU6M/tfTLxN1uk1ehT2vUPZmMwMIWngstDNZ/PFr
 Yv+CUsPiFtoHQTtR2X4v/opCmBsaoJxNV0K+26Jk6mYXeafbTpNgEE4hGc/ujUZBkX7Y
 aESA==
X-Gm-Message-State: APjAAAVK0RPKDop5xuvXnIBFmy5iy+AdK1ud9GfIp9MFK2u5PEW1G4hZ
 5gfs0escmUlNq8sAqqIx35Wr8KwprN4sasvQcWc=
X-Google-Smtp-Source: APXvYqxtnasiTMyw0hV+yn8WYNlN6QA7cPFjX+XfXquyUtlzHBKVUop1Sxshn9HafcgOaycIi4fbD+6sk9S5r4g3Zs0=
X-Received: by 2002:a5d:8404:: with SMTP id i4mr19926458ion.146.1563174167458; 
 Mon, 15 Jul 2019 00:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
 <0e779b35cf66fd4aa5ec0ec09fb7820f6c518cb3.1557824379.git.christophe.leroy@c-s.fr>
 <87y30z94hp.fsf@concordia.ellerman.id.au>
In-Reply-To: <87y30z94hp.fsf@concordia.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 15 Jul 2019 17:02:36 +1000
Message-ID: <CAOSf1CGB0k6qTN_uFtSoNBTs5Vt89n0_vLoRFLytq8OSfy7w6A@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/32: activate ARCH_HAS_PMEM_API and
 ARCH_HAS_UACCESS_FLUSHCACHE
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 4:49 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> > PPC32 also have flush_dcache_range() so it can also support
> > ARCH_HAS_PMEM_API and ARCH_HAS_UACCESS_FLUSHCACHE without changes.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >  arch/powerpc/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index d7996cfaceca..cf6e30f637be 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -127,13 +127,13 @@ config PPC
> >       select ARCH_HAS_KCOV
> >       select ARCH_HAS_MMIOWB                  if PPC64
> >       select ARCH_HAS_PHYS_TO_DMA
> > -     select ARCH_HAS_PMEM_API                if PPC64
> > +     select ARCH_HAS_PMEM_API
> >       select ARCH_HAS_PTE_SPECIAL
> >       select ARCH_HAS_MEMBARRIER_CALLBACKS
> >       select ARCH_HAS_SCALED_CPUTIME          if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
> >       select ARCH_HAS_STRICT_KERNEL_RWX       if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
> >       select ARCH_HAS_TICK_BROADCAST          if GENERIC_CLOCKEVENTS_BROADCAST
> > -     select ARCH_HAS_UACCESS_FLUSHCACHE      if PPC64
> > +     select ARCH_HAS_UACCESS_FLUSHCACHE
> >       select ARCH_HAS_UBSAN_SANITIZE_ALL
> >       select ARCH_HAS_ZONE_DEVICE             if PPC_BOOK3S_64
> >       select ARCH_HAVE_NMI_SAFE_CMPXCHG
>
> This didn't build for me, probably due to something that's changed in
> the long period between you posting it and me applying it?
>
> corenet32_smp_defconfig:
>
>   powerpc64-unknown-linux-gnu-ld: lib/iov_iter.o: in function `_copy_from_iter_flushcache':
>   powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `memcpy_page_flushcache'
>   powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `memcpy_flushcache'
>   powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `__copy_from_user_flushcache'
>   powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `memcpy_flushcache'

I think lib/pmem.c just needs to be moved out of obj64-y.

>
> cheers
