Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D36C823
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 05:49:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q0Wg5M3GzDqNP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 13:49:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DiG4PHre"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q0Qd2ZDXzDqCH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 13:45:29 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id q22so49247527iog.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 20:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGdfw85thz+lwBPUuzzYY0HL9eZJ5pxBvBS13Dv+V9c=;
 b=DiG4PHreoM1GL4Pwdj/fB3T7cl5+30l5uD3buBG6DAm1PQ/zQg51ZbdUd+NODc5nDD
 MpSJbUErI8ujTENrWOG9kAJF2CP9kkxw3aAicnOhfcXffCoq38cs073Ps6mvEO+LdEv7
 M3bAuBWwivMYDkzb4GlXQ4UENx2yKQ4iocYlmKdloBnHTJKmfoQNsd/Z/0DGVT5Y90CW
 ititzwC4LUuAuhEOIs2Sj84nezF/tLEPlUMN697VQuUHdgKoCSypH2x+fPbphXQR9n7j
 Nc/JimlsmhqJmHP+AswhwdBLr2YfnXkIC7A5j9u29vS1vqR6EOFBv+Q76VMDCkZcmjar
 w3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGdfw85thz+lwBPUuzzYY0HL9eZJ5pxBvBS13Dv+V9c=;
 b=e8qnNorXdPNHQWXBYTIvGaq5xMebA39Xe4LClVQ6kzwQa3GxO2IAGFCKe4IfMqT9Qi
 jqDR0kbELWQBLqzFPlZEaGZrr+eIhcGfIKi/lq5CKn2siPYaOr2LLGalVSp/P707bfoU
 w5ZApEfwvgzv3kr9wBzJRUhHRLbyqZ6Y6JFu/Zcp/KYs91eb6nVzDVnSu6Oyv/twnAnM
 w/BO8IcUcq0A2Bls7UMmCliNykn7CXh+0pU1R7UscrQtCF40b6U5i+Bossgt1DE3fOkg
 BY+0yELqhN9z6fvx6Q04cm7Z3Oloqp0GXb8Miip7A2fcfLzvjV7l8qn8/njw/gBsPszz
 5P5A==
X-Gm-Message-State: APjAAAXJxMd33gU5pFWcJGgyGvo1a8ea+MUkQDD1N/q5WrsiTroIih1R
 KzCw5kRt+xDa0SGs4J+0Lj3cMrNygaArYip6uwbrowA5R94=
X-Google-Smtp-Source: APXvYqz3LxdwZu5kdyX0GTycgmyknCtcdsFo7vHaY/8slf3nvmxDYBaN2DGhSvlpvd1X5e5AFOQ8kzoxVK3ro1wyR4M=
X-Received: by 2002:a5d:9047:: with SMTP id v7mr17730526ioq.18.1563421527141; 
 Wed, 17 Jul 2019 20:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
In-Reply-To: <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 18 Jul 2019 13:45:16 +1000
Message-ID: <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Shawn Anastasio <shawn@anastas.io>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 1:16 PM Shawn Anastasio <shawn@anastas.io> wrote:
>
> On 7/17/19 9:59 PM, Alexey Kardashevskiy wrote:
> >
> > On 18/07/2019 09:54, Shawn Anastasio wrote:
> >> The refactor of powerpc DMA functions in commit 6666cc17d780
> >> ("powerpc/dma: remove dma_nommu_mmap_coherent") incorrectly
> >> changes the way DMA mappings are handled on powerpc.
> >> Since this change, all mapped pages are marked as cache-inhibited
> >> through the default implementation of arch_dma_mmap_pgprot.
> >> This differs from the previous behavior of only marking pages
> >> in noncoherent mappings as cache-inhibited and has resulted in
> >> sporadic system crashes in certain hardware configurations and
> >> workloads (see Bugzilla).
> >>
> >> This commit restores the previous correct behavior by providing
> >> an implementation of arch_dma_mmap_pgprot that only marks
> >> pages in noncoherent mappings as cache-inhibited. As this behavior
> >> should be universal for all powerpc platforms a new file,
> >> dma-generic.c, was created to store it.
> >>
> >> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204145
> >> Fixes: 6666cc17d780 ("powerpc/dma: remove dma_nommu_mmap_coherent")
> >> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> >
> > Is this the default one?
> >
> > include/linux/dma-noncoherent.h
> > # define arch_dma_mmap_pgprot(dev, prot, attrs) pgprot_noncached(prot)
>
> Yep, that's the one.
>
> > Out of curiosity - do not we want to fix this one for everyone?
>
> Other than m68k, mips, and arm64, everybody else that doesn't have
> ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
> I assume this behavior is acceptable on those architectures.

It might be acceptable, but there's no reason to use pgport_noncached
if the platform supports cache-coherent DMA.

Christoph (+cc) made the change so maybe he saw something we're missing.

> >> ---
> >>   arch/powerpc/Kconfig             |  1 +
> >>   arch/powerpc/kernel/Makefile     |  3 ++-
> >>   arch/powerpc/kernel/dma-common.c | 17 +++++++++++++++++
> >>   3 files changed, 20 insertions(+), 1 deletion(-)
> >>   create mode 100644 arch/powerpc/kernel/dma-common.c
> >>
> >> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> >> index d8dcd8820369..77f6ebf97113 100644
> >> --- a/arch/powerpc/Kconfig
> >> +++ b/arch/powerpc/Kconfig
> >> @@ -121,6 +121,7 @@ config PPC
> >>       select ARCH_32BIT_OFF_T if PPC32
> >>       select ARCH_HAS_DEBUG_VIRTUAL
> >>       select ARCH_HAS_DEVMEM_IS_ALLOWED
> >> +    select ARCH_HAS_DMA_MMAP_PGPROT
> >>       select ARCH_HAS_ELF_RANDOMIZE
> >>       select ARCH_HAS_FORTIFY_SOURCE
> >>       select ARCH_HAS_GCOV_PROFILE_ALL
> >> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> >> index 56dfa7a2a6f2..ea0c69236789 100644
> >> --- a/arch/powerpc/kernel/Makefile
> >> +++ b/arch/powerpc/kernel/Makefile
> >> @@ -49,7 +49,8 @@ obj-y                := cputable.o ptrace.o
> >> syscalls.o \
> >>                      signal.o sysfs.o cacheinfo.o time.o \
> >>                      prom.o traps.o setup-common.o \
> >>                      udbg.o misc.o io.o misc_$(BITS).o \
> >> -                   of_platform.o prom_parse.o
> >> +                   of_platform.o prom_parse.o \
> >> +                   dma-common.o
> >>   obj-$(CONFIG_PPC64)        += setup_64.o sys_ppc32.o \
> >>                      signal_64.o ptrace32.o \
> >>                      paca.o nvram_64.o firmware.o
> >> diff --git a/arch/powerpc/kernel/dma-common.c
> >> b/arch/powerpc/kernel/dma-common.c
> >> new file mode 100644
> >> index 000000000000..5a15f99f4199
> >> --- /dev/null
> >> +++ b/arch/powerpc/kernel/dma-common.c
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Contains common dma routines for all powerpc platforms.
> >> + *
> >> + * Copyright (C) 2019 Shawn Anastasio (shawn@anastas.io)
> >> + */
> >> +
> >> +#include <linux/mm.h>
> >> +#include <linux/dma-noncoherent.h>
> >> +
> >> +pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> >> +        unsigned long attrs)
> >> +{
> >> +    if (!dev_is_dma_coherent(dev))
> >> +        return pgprot_noncached(prot);
> >> +    return prot;
> >> +}
> >>
> >
