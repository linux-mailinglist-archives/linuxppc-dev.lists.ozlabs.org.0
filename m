Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C536C6C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 08:41:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KGKX3wpGzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 16:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KGJD5gh8zDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 16:40:44 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id CEE9668B05; Thu,  6 Jun 2019 08:40:15 +0200 (CEST)
Date: Thu, 6 Jun 2019 08:40:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190606064015.GC27033@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <35b3f09b-b371-e2cc-4436-120c67e2f1fb@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35b3f09b-b371-e2cc-4436-120c67e2f1fb@lwfinger.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2019 at 10:06:18PM -0500, Larry Finger wrote:
> First of all, you have my sympathy for the laborious bisection on a 
> PowerBook G4. I have done several myself. Thank you.
>
> I confirm your results.
>
> The ppc code has a maximum DMA size of 31 bits, thus a 32-bit request will 
> fail. Why the 30-bit fallback fails in b43legacy fails while it works in 
> b43 is a mystery.
>
> Although dma_nommu_dma_supported() may be "largely identical" to 
> dma_direct_supported(), they obviously differ. Routine 
> dma_nommu_dma_supported() returns 1 for 32-bit systems, but I do not know 
> what dma_direct_supported() returns.
>
> I am trying to find a patch.

	if (IS_ENABLED(CONFIG_ZONE_DMA))
		min_mask = DMA_BIT_MASK(ARCH_ZONE_DMA_BITS);
	else
		min_mask = DMA_BIT_MASK(32);

	min_mask = min_t(u64, min_mask, (max_pfn - 1) << PAGE_SHIFT);
	return mask >= __phys_to_dma(dev, min_mask);

So the smaller or:

 (1) 32-bit
 (2) ARCH_ZONE_DMA_BITS
 (3) the actual amount of memory in the system

modolo any DMA offsets that come into play.

No offsets should exists on pmac, and ARCH_ZONE_DMA_BITS is 31 on
powerpc.  So unless the system has 1GB or less memory it will probably
return false for b43, because it can't actually guarantee reliable
allocation.  It will work fine on x86 with the smaller ZONE_DMA.
