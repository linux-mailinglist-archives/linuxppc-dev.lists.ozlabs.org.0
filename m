Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BF943510
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 19:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYzjw70Q8z3dWl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 03:34:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYzjX1G2Pz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 03:34:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 07178CE16CA;
	Wed, 31 Jul 2024 17:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79E6C116B1;
	Wed, 31 Jul 2024 17:34:00 +0000 (UTC)
Date: Wed, 31 Jul 2024 18:33:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v3 3/3] dma-direct: use RAM start to offset zone_dma_limit
Message-ID: <Zqp1hvYSmM58IITx@arm.com>
References: <cover.1722249878.git.baruch@tkos.co.il>
 <629b184354fa22cb32a90bd1fa0e1dc258251f81.1722249878.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <629b184354fa22cb32a90bd1fa0e1dc258251f81.1722249878.git.baruch@tkos.co.il>
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
Cc: linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2024 at 01:51:26PM +0300, Baruch Siach wrote:
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 410a7b40e496..ded3d841c88c 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -12,6 +12,7 @@
>  #include <linux/set_memory.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> +#include <linux/memblock.h>
>  
>  static struct gen_pool *atomic_pool_dma __ro_after_init;
>  static unsigned long pool_size_dma;
> @@ -70,7 +71,7 @@ static bool cma_in_zone(gfp_t gfp)
>  	/* CMA can't cross zone boundaries, see cma_activate_area() */
>  	end = cma_get_base(cma) + size - 1;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> -		return end <= zone_dma_limit;
> +		return end <= memblock_start_of_DRAM() + zone_dma_limit;

I think this patch is entirely wrong. After the previous patch,
zone_dma_limit is already a physical/CPU address, not some offset or
range - of_dma_get_max_cpu_address() returns the absolute physical
address. Adding memblock_start_of_DRAM() to it does not make any sense.
It made sense when we had zone_dma_bits but since we are trying to move
away from bitmasks to absolute CPU addresses, zone_dma_limit already
includes the start of DRAM.

What problems do you see without this patch? Is it because
DMA_BIT_MASK(32) can be lower than zone_dma_limit as I mentioned on the
previous patch?

-- 
Catalin
