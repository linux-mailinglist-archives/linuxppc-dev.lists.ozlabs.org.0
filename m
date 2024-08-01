Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32F944D65
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 15:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZVb311Llz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 23:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZVZg2JtQz3cVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 23:44:59 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4F21868D0A; Thu,  1 Aug 2024 15:44:54 +0200 (CEST)
Date: Thu, 1 Aug 2024 15:44:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <20240801134454.GB2245@lst.de>
References: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il> <202407300338.oaUo6jtB-lkp@intel.com> <20240730021208.GA8272@thelio-3990X> <20240730153450.GA30021@lst.de> <20240801012424.GA1640480@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801012424.GA1640480@thelio-3990X>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linuxppc-dev@lists.ozlabs.org, Ramon Fried <ramon@neureality.ai>, kernel test robot <lkp@intel.com>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 06:24:24PM -0700, Nathan Chancellor wrote:
> Unfortunately, I am not sure either... I do not see anything obviously,
> so perhaps it could just be avoided with the __diag() infrastructure?
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 3dbc0b89d6fb..b58e7eb9c8f1 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -20,7 +20,12 @@
>   * it for entirely different regions. In that case the arch code needs to
>   * override the variable below for dma-direct to work properly.
>   */
> +__diag_push();
> +__diag_ignore(clang, 13, "-Wconstant-conversion",
> +	      "Clang incorrectly thinks the n == 64 case in DMA_BIT_MASK() can happen here,"
> +	      "which would truncate with a 32-bit phys_addr_t");
>  phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);

So..  The code above is clearly wrong, as DMA_BIT_MASK always returns a
u64, and phys_addr_t can be smaller than that.  So at least in this case
the warning seems perfectly valid and the code has issues because it is
mixing different concepts.

Where do you see warnings like this upstream?

