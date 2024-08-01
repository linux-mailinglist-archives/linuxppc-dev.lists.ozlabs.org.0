Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD8944F17
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 17:23:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Knkt0BM+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZXmP24Qyz3dSZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 01:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Knkt0BM+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZXlj6knMz3d2m
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 01:22:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19563628F9;
	Thu,  1 Aug 2024 15:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E072FC32786;
	Thu,  1 Aug 2024 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722525775;
	bh=MCfSDdIjcHZQ9l663dFR3qY6umGQeR97WyGmOHY9GQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Knkt0BM+MQksHfY/hnZ5m9c3nrY9foJmh8e9BoyHVve6RRLlCuddPDzrCGNCt/ftL
	 mJF1PBOEm4zuxZ3M4vi/Iql7r+0kclcoSgV9S9lPeNHT6ZcMEgXBv/31FWDFXpO9Qb
	 LgXolyyLaYGMKNhDuoXGyMRYwXifC+krPUjWBUsvb83wmz1H14Vz5okPqc/h8Ia081
	 +3ol8UNGML6OUyf9IM8ssrnducmo4Qp4OTOssdyBMF37pqAa9Wv7R9XPFa7QB9+a9l
	 4HzHa7PCR4h177R7pzQ5I1b5muNgo5WbJxJ4fv7jpaXCsxPzGrcizXKCx38obDNCND
	 nUpMq3yjdLwOw==
Date: Thu, 1 Aug 2024 08:22:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <20240801152253.GA122261@thelio-3990X>
References: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il>
 <202407300338.oaUo6jtB-lkp@intel.com>
 <20240730021208.GA8272@thelio-3990X>
 <20240730153450.GA30021@lst.de>
 <20240801012424.GA1640480@thelio-3990X>
 <20240801134454.GB2245@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801134454.GB2245@lst.de>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linuxppc-dev@lists.ozlabs.org, Ramon Fried <ramon@neureality.ai>, kernel test robot <lkp@intel.com>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2024 at 03:44:54PM +0200, Christoph Hellwig wrote:
> On Wed, Jul 31, 2024 at 06:24:24PM -0700, Nathan Chancellor wrote:
> > Unfortunately, I am not sure either... I do not see anything obviously,
> > so perhaps it could just be avoided with the __diag() infrastructure?
> > 
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 3dbc0b89d6fb..b58e7eb9c8f1 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -20,7 +20,12 @@
> >   * it for entirely different regions. In that case the arch code needs to
> >   * override the variable below for dma-direct to work properly.
> >   */
> > +__diag_push();
> > +__diag_ignore(clang, 13, "-Wconstant-conversion",
> > +	      "Clang incorrectly thinks the n == 64 case in DMA_BIT_MASK() can happen here,"
> > +	      "which would truncate with a 32-bit phys_addr_t");
> >  phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
> 
> So..  The code above is clearly wrong, as DMA_BIT_MASK always returns a
> u64, and phys_addr_t can be smaller than that.  So at least in this case
> the warning seems perfectly valid and the code has issues because it is
> mixing different concepts.

Sure, that seems like a reasonable way to look at things even if the
warning itself is a false positive.

> Where do you see warnings like this upstream?

I don't see this upstream, this is from patch 2 of this series:

https://lore.kernel.org/053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il/

Cheers,
Nathan
