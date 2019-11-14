Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB1FC1E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 09:51:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DFZc6VP3zDrFd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 19:51:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFWj3Vd2zF71G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 19:48:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="h8xc1Vk4"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47DFWh1KCJz9sNT;
 Thu, 14 Nov 2019 19:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573721328;
 bh=bDF+Yyy88Fi18Ty7c9txdLpa+ezncf6v+l29k9UorgE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=h8xc1Vk45YLl9MzdGeCdPvVM/gZgFW8kGJAtTantRRnTOlPRUk++Y13aiXGqk/x0i
 +uYEKQ6YmW092dWaZrlWweY0cIjcwmDub4jkR/wcrMJYEUmFGPzEJ2z6Ihh2l9l84s
 VWu2apAPX2+lF206X5eZXVLXEk+Z4OjWoh3rvv3tb1AO83VqhnrRpa/I0Gcb49rzlo
 KnNUrtMjeae+4ZLyJp+BqjmUzhV2MqmSlAxK7/LELcl2os+oGvZOJwGpAm8mUJEh5W
 erpXofYK/ZCFPUo11Pk1SoU/EupeIr+q89BxoSTnukj3aY8zV7vWldzixXShJN/wTN
 wKlQaaHzA3RhQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 3/3] powerpc: remove support for NULL dev in __phys_to_dma
 / __dma_to_phys
In-Reply-To: <20191113073539.9660-4-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
 <20191113073539.9660-4-hch@lst.de>
Date: Thu, 14 Nov 2019 19:48:47 +1100
Message-ID: <8736eq268g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> Support for calling the DMA API functions without a valid device pointer
> was removed a while ago, so remove the stale support for that from the
> powerpc __phys_to_dma / __dma_to_phys helpers.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/dma-direct.h | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
> index e29e8a236b8d..abc154d784b0 100644
> --- a/arch/powerpc/include/asm/dma-direct.h
> +++ b/arch/powerpc/include/asm/dma-direct.h
> @@ -4,15 +4,11 @@
>  
>  static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
> -	if (!dev)
> -		return paddr + PCI_DRAM_OFFSET;
>  	return paddr + dev->archdata.dma_offset;
>  }
>  
>  static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
>  {
> -	if (!dev)
> -		return daddr - PCI_DRAM_OFFSET;
>  	return daddr - dev->archdata.dma_offset;
>  }
>  #endif /* ASM_POWERPC_DMA_DIRECT_H */
> -- 
> 2.20.1
