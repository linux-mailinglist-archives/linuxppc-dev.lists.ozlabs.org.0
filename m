Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C876C41ABA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 05:34:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nstk4fZ8zDqsC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 13:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nsrw63ZLzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 13:33:03 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5C3WnMD029931;
 Tue, 11 Jun 2019 22:32:50 -0500
Message-ID: <9fc8153bf08d1a5fd166d0cb38585094bffa060b.camel@kernel.crashing.org>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Larry Finger <Larry.Finger@lwfinger.net>, Christoph Hellwig <hch@lst.de>
Date: Wed, 12 Jun 2019 13:32:49 +1000
In-Reply-To: <7dcf54a9-a7aa-3a4c-8e2d-556be633d6e0@lwfinger.net>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
 <20190611060521.GA19512@lst.de>
 <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
 <0b257651bb7ac4a6f0a8dce5470120b7701720b9.camel@kernel.crashing.org>
 <7dcf54a9-a7aa-3a4c-8e2d-556be633d6e0@lwfinger.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-11 at 20:52 -0500, Larry Finger wrote:
> On 6/11/19 5:46 PM, Benjamin Herrenschmidt wrote:
> > On Tue, 2019-06-11 at 17:20 -0500, Larry Finger wrote:
> > > b43-pci-bridge 0001:11:00.0: dma_direct_supported: failed (mask =
> > > 0x3fffffff,
> > > min_mask = 0x5ffff000/0x5ffff000, dma bits = 0x1f
> > 
> > Ugh ? A mask with holes in it ? That's very wrong... That min_mask is
> > bogus.
> 
> I agree, but that is not likely serious as most systems will have enough memory 
> that the max_pfn term will be much larger than the initial min_mask, and 
> min_mask will be unchanged by the min function. 

Well no... it's too much memory that is the problem. If min_mask is
bogus though it will cause problem later too, so one should look into
it.

> In addition, min_mask is not 
> used beyond this routine, and then only to decide if direct dma is supported. 
> The following patch generates masks with no holes, but I cannot see that it is 
> needed.

The right fix is to round up max_pfn to a power of 2, something like

min_mask = min_t(u64, min_mask, (roundup_pow_of_two(max_pfn - 1)) <<
		PAGE_SHIFT) 

> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..e3edd4f29e80 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -384,7 +384,8 @@ int dma_direct_supported(struct device *dev, u64 mask)
>          else
>                  min_mask = DMA_BIT_MASK(32);
> 
> -       min_mask = min_t(u64, min_mask, (max_pfn - 1) << PAGE_SHIFT);
> +       min_mask = min_t(u64, min_mask, ((max_pfn - 1) << PAGE_SHIFT) |
> +                                        DMA_BIT_MASK(PAGE_SHIFT));
> 
>          /*
>           * This check needs to be against the actual bit mask value, so
> 
> 
> Larry

