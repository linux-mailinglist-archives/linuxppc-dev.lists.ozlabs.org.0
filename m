Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23416364758
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 17:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPB3F15nhz30Gx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 01:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WNizhiRq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WNizhiRq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPB2m0Bzkz2xZf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 01:44:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 163EE61284
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618847085;
 bh=1hglvV4GjA2advCM06OW1Eit/4/3I8x0HflbVk4wpuY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WNizhiRqZajO+MiOARISqtKtGpPmaO3wBUEXBYaZcF6e7reYd0/YMFWwxNeUTgfe5
 N0tLt+LESGZ0BdkDW3AuEDpdlHVeG7V2YZc2pw1QfKfGNHfgkp27nLA+HX2gYT/PlF
 jjwDuzd486c9+/Ek2R9WiHAh1F83drMgZjVy6M5HwtRkmYgbUgIZFHsKtDfO6a2rfA
 +4bBRNSkFbnMxtKkhdWLWX/zAHKy0j8hPIOlI2tARuJQBD9r8jCYQv7fwWP70ews22
 4xF7qVIGlwcnhnZhLcuSOudwPys6pA43cQdtZi4ARk833UdG1HnVntK56j4MBHe2Os
 Gkj2cUSl0uVVQ==
Received: by mail-ej1-f41.google.com with SMTP id r9so53652495ejj.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 08:44:45 -0700 (PDT)
X-Gm-Message-State: AOAM530F9pTrB0ChB2OkPNTI2gHOoXEjwPhZ7mYCYZRbVsAwckrJ3p6v
 JGWnw3/MJ6AyyHPCKYjOZgbYfnb+RNsZnevOCw==
X-Google-Smtp-Source: ABdhPJzBXwETiXa9YzZ6qf4GsLL82HMp0uZcY/aPM/9WWzio+BYfi1hv5Mfge2u58qRhymWTxr7qLgFRkOJydeQPCks=
X-Received: by 2002:a17:906:9ac5:: with SMTP id
 ah5mr22189976ejc.360.1618847083667; 
 Mon, 19 Apr 2021 08:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210415180050.373791-1-leobras.c@gmail.com>
 <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
 <7b089cd48b90f2445c7cb80da1ce8638607c46fc.camel@gmail.com>
In-Reply-To: <7b089cd48b90f2445c7cb80da1ce8638607c46fc.camel@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 19 Apr 2021 10:44:31 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+m6CkGj_NYGvwxoKwoQ4PkEu6hfGdMTT3i4APoHSkNeg@mail.gmail.com>
Message-ID: <CAL_Jsq+m6CkGj_NYGvwxoKwoQ4PkEu6hfGdMTT3i4APoHSkNeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
To: Leonardo Bras <leobras.c@gmail.com>
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
Cc: devicetree@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 3:58 PM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> Hello Rob, thanks for this feedback!
>
> On Thu, 2021-04-15 at 13:59 -0500, Rob Herring wrote:
> > +PPC and PCI lists
> >
> > On Thu, Apr 15, 2021 at 1:01 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > >
> > > Many other resource flag parsers already add this flag when the input
> > > has bits 24 & 25 set, so update this one to do the same.
> >
> > Many others? Looks like sparc and powerpc to me.
> >
>
> s390 also does that, but it look like it comes from a device-tree.

I'm only looking at DT based platforms, and s390 doesn't use DT.

> > Those would be the
> > ones I worry about breaking. Sparc doesn't use of/address.c so it's
> > fine. Powerpc version of the flags code was only fixed in 2019, so I
> > don't think powerpc will care either.
>
> In powerpc I reach this function with this stack, while configuring a
> virtio-net device for a qemu/KVM pseries guest:
>
> pci_process_bridge_OF_ranges+0xac/0x2d4
> pSeries_discover_phbs+0xc4/0x158
> discover_phbs+0x40/0x60
> do_one_initcall+0x60/0x2d0
> kernel_init_freeable+0x308/0x3a8
> kernel_init+0x2c/0x168
> ret_from_kernel_thread+0x5c/0x70
>
> For this, both MMIO32 and MMIO64 resources will have flags 0x200.

Oh good, powerpc has 2 possible flags parsing functions. So in the
above path, do we need to set PCI_BASE_ADDRESS_MEM_TYPE_64?

Does pci_parse_of_flags() get called in your case?

> > I noticed both sparc and powerpc set PCI_BASE_ADDRESS_MEM_TYPE_64 in
> > the flags. AFAICT, that's not set anywhere outside of arch code. So
> > never for riscv, arm and arm64 at least. That leads me to
> > pci_std_update_resource() which is where the PCI code sets BARs and
> > just copies the flags in PCI_BASE_ADDRESS_MEM_MASK ignoring
> > IORESOURCE_* flags. So it seems like 64-bit is still not handled and
> > neither is prefetch.
> >
>
> I am not sure if you mean here:
> a) it's ok to add IORESOURCE_MEM_64 here, because it does not affect
> anything else, or
> b) it should be using PCI_BASE_ADDRESS_MEM_TYPE_64
> (or IORESOURCE_MEM_64 | PCI_BASE_ADDRESS_MEM_TYPE_64) instead, since
> it's how it's added in powerpc/sparc, and else there is no point.

I'm wondering if a) is incomplete and PCI_BASE_ADDRESS_MEM_TYPE_64
also needs to be set. The question is ultimately are BARs getting set
correctly for 64-bit? It looks to me like they aren't.

Rob
