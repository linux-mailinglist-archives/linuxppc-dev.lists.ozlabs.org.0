Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80B7587D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 21:59:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vjjm4L5TzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 05:59:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="kTg+uBtB";
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vjgx14jPzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 05:58:16 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c3so139913pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q1zzi7FPBij/o2TB0V49FOYnUapYVtCOQBftk4jb7sM=;
 b=kTg+uBtB6pkMq/6M/tQANEdWidFy2aefELMOif8PvLwgECwcyrC2zXjcwjgLlAi8Fz
 s7pTNL5y8A2nYSHbXn/N8xMd6pyNrmK2VwGLW6cdqGMbpN2zbbLXlPV1LkaBp1LNk1dh
 O+h3f82uEi68q0ambxJr76CBOQDpdvSbTowFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q1zzi7FPBij/o2TB0V49FOYnUapYVtCOQBftk4jb7sM=;
 b=TDrFV0iMyW5qRlkPxBFcDLq5yYMv/Lutmd/8A595Z3wKo8BvILxYrrhZEe8TbFmuS4
 pWanQfds+kjLBVBd1vdfGK0VQlP2J2961uqyP3AeMYcJUVCb6i0r9hGoHW+KHqIoQoUt
 fMBjGFBiD5rN8xojcWt2c7hsuD7Nk1XuwMUKqf2TUepH87t1Cvk/hEeS0ECrpP2RuZsU
 MXLarXFCCH7bh8CLAxpcfby+CpsIjTjYvHQI1EER01JiJuZZcsynkWW0b1E+ALYSEa9D
 JFfmzzTLly6sifz9wEtipbHHzSCFXVkYScdwciDPuYS8W96aWlD2QHEA8b6EYbkP+Zmu
 S4dw==
X-Gm-Message-State: APjAAAXgP3gsIiv1+eYgW70z/LpnUNHmKVI/V2xBrhDKtqhz94UlFKst
 X3FuAzaORGY/VuQ9XjUIpCOOTQ==
X-Google-Smtp-Source: APXvYqwWG4tnTtE/YPrDLHwEnE9csORMu/zIiO8Sy+jOPLxKiii0cWDG8jMtv435J0IMQF5f3NraUQ==
X-Received: by 2002:a17:90a:270f:: with SMTP id
 o15mr94434828pje.56.1564084694036; 
 Thu, 25 Jul 2019 12:58:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f197sm49936596pfa.161.2019.07.25.12.58.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 12:58:13 -0700 (PDT)
Date: Thu, 25 Jul 2019 12:58:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
Message-ID: <201907251252.0C58037@keescook>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <e6ad41bc-5d5a-cf3f-b308-e1863b4fef99@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6ad41bc-5d5a-cf3f-b308-e1863b4fef99@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, kernel-hardening@lists.openwall.com,
 thunder.leizhen@huawei.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 jingxiangfeng@huawei.com, diana.craciun@nxp.com, paulus@samba.org,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 03:16:28PM +0800, Jason Yan wrote:
> Hi all, any comments?

I'm a fan of it, but I don't know ppc internals well enough to sanely
review the code. :) Some comments below on design...

> 
> 
> On 2019/7/17 16:06, Jason Yan wrote:
> > This series implements KASLR for powerpc/fsl_booke/32, as a security
> > feature that deters exploit attempts relying on knowledge of the location
> > of kernel internals.
> > 
> > Since CONFIG_RELOCATABLE has already supported, what we need to do is
> > map or copy kernel to a proper place and relocate. Freescale Book-E
> > parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
> > entries are not suitable to map the kernel directly in a randomized
> > region, so we chose to copy the kernel to a proper place and restart to
> > relocate.
> > 
> > Entropy is derived from the banner and timer base, which will change every
> > build and boot. This not so much safe so additionally the bootloader may
> > pass entropy via the /chosen/kaslr-seed node in device tree.

Good: adding kaslr-seed is a good step here. Are there any x86-like
RDRAND or RDTSC to use? (Or maybe timer base here is similar to x86
RDTSC here?)

> > 
> > We will use the first 512M of the low memory to randomize the kernel
> > image. The memory will be split in 64M zones. We will use the lower 8
> > bit of the entropy to decide the index of the 64M zone. Then we chose a
> > 16K aligned offset inside the 64M zone to put the kernel in.

Does this 16K granularity have any page table performance impact? My
understanding was that x86 needed to have 2M granularity due to its page
table layouts.

Why the 64M zones instead of just 16K granularity across the entire low
512M?

> > 
> >      KERNELBASE
> > 
> >          |-->   64M   <--|
> >          |               |
> >          +---------------+    +----------------+---------------+
> >          |               |....|    |kernel|    |               |
> >          +---------------+    +----------------+---------------+
> >          |                         |
> >          |----->   offset    <-----|
> > 
> >                                kimage_vaddr
> > 
> > We also check if we will overlap with some areas like the dtb area, the
> > initrd area or the crashkernel area. If we cannot find a proper area,
> > kaslr will be disabled and boot from the original kernel.
> > 
> > Jason Yan (10):
> >    powerpc: unify definition of M_IF_NEEDED
> >    powerpc: move memstart_addr and kernstart_addr to init-common.c
> >    powerpc: introduce kimage_vaddr to store the kernel base
> >    powerpc/fsl_booke/32: introduce create_tlb_entry() helper
> >    powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
> >    powerpc/fsl_booke/32: implement KASLR infrastructure
> >    powerpc/fsl_booke/32: randomize the kernel image offset
> >    powerpc/fsl_booke/kaslr: clear the original kernel if randomized
> >    powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
> >    powerpc/fsl_booke/kaslr: dump out kernel offset information on panic

Is there anything planned for other fixed-location things, like x86's
CONFIG_RANDOMIZE_MEMORY?

-- 
Kees Cook
