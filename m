Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9E94B1A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:55:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=EhwlHvbT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfMrl6mB1z3bVG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=EhwlHvbT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tesarici.cz (client-ip=2a03:3b40:fe:2d4::1; helo=bee.tesarici.cz; envelope-from=petr@tesarici.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 587 seconds by postgrey-1.37 at boromir; Thu, 08 Aug 2024 00:22:48 AEST
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfC7X40Hdz3bVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 00:22:48 +1000 (AEST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 1BDDE1D28CB;
	Wed,  7 Aug 2024 16:12:54 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1723039974; bh=2S1kScCclltNXckE/Lkx2qPVy9xVi/sU3tCNDVWrwmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EhwlHvbTz35VhAI2Qpj0xb9g7XfyNlUdLT2PhofPUJObSVEfk1Rz+kAynf4vRyIUu
	 ZSmLQQDu+kYFQY76651Xk1pzwK49hhn0qV9lrrdrvfzk44MTygPvccjXpYKlYgqZ6P
	 fKSG+xtWjx1PGAmqW+Ru9Jxrm8kTocZVHIf7Ct5F5dwAfJVorHfTti2Yn2AG1RZl+T
	 QfwOcSNtu+xhAwEW6hotsHWoZOw4ky06J8J7F0GfieIZRu2xjf2bq8Qg8MdyK+vrq0
	 HFqN+Nk021WWKDV+ToPaSKGAIAOKhQgKGN14gbNUSk1Zi/5ISVMtunOHWaVwbBfnX8
	 tCEJa3xWKB5yg==
Date: Wed, 7 Aug 2024 16:12:48 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v5 1/3] dma: improve DMA zone selection
Message-ID: <20240807161248.37a618f2@mordecai.tesarici.cz>
In-Reply-To: <ZrN9mRoQj2lTo6L5@arm.com>
References: <cover.1722578375.git.baruch@tkos.co.il>
	<5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
	<8230985e-1581-411f-895c-b49065234520@arm.com>
	<ZrN9mRoQj2lTo6L5@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 08 Aug 2024 06:54:21 +1000
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, Robin Murphy <robin.murphy@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2024 14:58:49 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> Thanks Robin for having a look.
> 
> On Wed, Aug 07, 2024 at 02:13:06PM +0100, Robin Murphy wrote:
> > On 2024-08-02 7:03 am, Baruch Siach wrote:  
> > > When device DMA limit does not fit in DMA32 zone it should use DMA zone,
> > > even when DMA zone is stricter than needed.
> > > 
> > > Same goes for devices that can't allocate from the entire normal zone.
> > > Limit to DMA32 in that case.  
> > 
> > Per the bot report this only works for CONFIG_ARCH_KEEP_MEMBLOCK,  
> 
> Yeah, I just noticed.
> 
> > however
> > the whole concept looks wrong anyway. The logic here is that we're only
> > forcing a particular zone if there's *no* chance of the higher zone being
> > usable. For example, ignoring offsets for simplicity, if we have a 40-bit
> > DMA mask then we *do* want to initially try allocating from ZONE_NORMAL even
> > if max_pfn is above 40 bits, since we still might get a usable allocation
> > from between 32 and 40 bits, and if we don't, then we'll fall back to
> > retrying from the DMA zone(s) anyway.  
> 
> Ah, I did not read the code further down in __dma_direct_alloc_pages(),
> it does fall back to a GFP_DMA allocation if !dma_coherent_ok().
> Similarly with swiotlb_alloc_tlb(), it keeps retrying until the
> allocation fails.

Er, you certainly mean it keeps retrying as long as the allocation
fails.

Yes, that's true. The initial GFP zone flags are a best-effort guess,
and a stricter zone can be chosen in the end. This whole logic tries to
select the highest zone that satisfies the limit, because allocating
some pages and freeing them immediately is wasteful, especially for
high-order allocations.

> So yes, this patch can be dropped.

+1

Petr T
