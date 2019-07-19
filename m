Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DEF6E4FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 13:20:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qpT64jQdzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 21:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qpQz2tHtzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 21:18:32 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id h21so30457333qtn.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 04:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2B+t9Du6bZ6pjf/o/7cZ7fBgZqUf+CJ3sJsc3PT+Rn4=;
 b=ZaAu5RqydFf3lupu3G/W5kzwBxF0P2ERdzKyP6IrahAwqziM1R7vxp2f3mco5/GF2a
 bmLlMnJmzuRljuiUzZFEe/I/s2uqBhQZ17fpLi6TwfEodge1U4XaSLcPNd+EVFMgOAh3
 v5uEjVr//cFpliJHIDlFWQhepA46ioqchKjAVGLy02o6YxGBH4I6fP4CTNvA8kbaZcJ4
 FPYS+dkVjVDdVlAQuk7XFq84RPDdiq/mtHlBgVleR8dkRuKhj59COs+QxW5lcws8gkSD
 dLIzEajNg394nrhogp41ytSOna4xAN4O/+AKIAZu8l2+D1kwCM2up3iHV5Bjmz1q0zaJ
 D0tA==
X-Gm-Message-State: APjAAAXQdVNdbVj9zNOiK14RWC7A/i5I8kkgyzL40S2yc5WgnUZMQ6G5
 K/82Viw0IO7S0ll+I+xdYlnukRvHRY8e0tu4xK0=
X-Google-Smtp-Source: APXvYqwfkpnSwaLRsVtMOFQ3R0t+wuNrZgphPLU45AyPY4Qm7NMCw69oh8nC6qrA5DHGPi2afPEC52HQNLDHnhXXzqA=
X-Received: by 2002:aed:3e7c:: with SMTP id m57mr36665658qtf.204.1563535110171; 
 Fri, 19 Jul 2019 04:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
In-Reply-To: <20190718095200.GA25744@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 19 Jul 2019 13:18:13 +0200
Message-ID: <CAK8P3a1ChtE10D=enp_a+isBCGgRW1nX6-0jChuAvTcUAWECBg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Christoph Hellwig <hch@lst.de>
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
Cc: Shawn Anastasio <shawn@anastas.io>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 11:52 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jul 18, 2019 at 10:49:34AM +0200, Christoph Hellwig wrote:
> > On Thu, Jul 18, 2019 at 01:45:16PM +1000, Oliver O'Halloran wrote:
> > > > Other than m68k, mips, and arm64, everybody else that doesn't have
> > > > ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
> > > > I assume this behavior is acceptable on those architectures.
> > >
> > > It might be acceptable, but there's no reason to use pgport_noncached
> > > if the platform supports cache-coherent DMA.
> > >
> > > Christoph (+cc) made the change so maybe he saw something we're missing.
> >
> > I always found the forcing of noncached access even for coherent
> > devices a little odd, but this was inherited from the previous
> > implementation, which surprised me a bit as the different attributes
> > are usually problematic even on x86.  Let me dig into the history a
> > bit more, but I suspect the righ fix is to default to cached mappings
> > for coherent devices.
>
> Ok, some history:
>
> The generic dma mmap implementation, which we are effectively still
> using today was added by:
>
> commit 64ccc9c033c6089b2d426dad3c56477ab066c999
> Author: Marek Szyprowski <m.szyprowski@samsung.com>
> Date:   Thu Jun 14 13:03:04 2012 +0200
>
>     common: dma-mapping: add support for generic dma_mmap_* calls
>
> and unconditionally uses pgprot_noncached in dma_common_mmap, which is
> then used as the fallback by dma_mmap_attrs if no ->mmap method is
> present.  At that point we already had the powerpc implementation
> that only uses pgprot_noncached for non-coherent mappings, and
> the arm one, which uses pgprot_writecombine if DMA_ATTR_WRITE_COMBINE
> is set and otherwise pgprot_dmacoherent, which seems to be uncached.
> Arm did support coherent platforms at that time, but they might have
> been an afterthought and not handled properly.

Cache-coherent devices are still very rare on 32-bit ARM.

Among the callers of dma_mmap_coherent(), almost all are in platform
specific device drivers that only ever run on noncoherent ARM SoCs,
which explains why nobody would have noticed problems.

There is also a difference in behavior between ARM and PowerPC
when dealing with mismatched cacheability attributes: If the same
page is mapped as both cached and uncached to, this may
cause silent undefined behavior on ARM, while PowerPC should
enter a checkstop as soon as it notices.

      Arnd
