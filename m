Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96811E1E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:24:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z6H61VVKzDrFl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 21:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z6BS2kk7zDrCP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 21:20:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="PiEcT286"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Z6BK1R6Hz9sPc;
 Fri, 13 Dec 2019 21:20:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576232441;
 bh=Ypcl+ICBinTZEpBKKJzx2m7ZdyJ3T7k/hC8ux4i5AD0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PiEcT286n4Tq4Sqq3gPFKnuR36mkJco+IzdfvrIEe7RUB1frkF4PZNzvCPyJTUc9U
 +2MUyWJJCUB8NX9GRp4ALlDphq7nWtn1L7zArxrq48W4qHOnf/X4oqymzEIAoyNxgT
 uFJvHZncGnGUsM6Tm3XlSh+vIphhUIrIzD3/hyv5tN3n4KoJCOzre+vlx9AxMJclhv
 RUkqTx/cWBG/uZWUJXvJrQdj3SLr9Sza2OGD2XnceEf4ZTGqYdX28of8o1lNZtO3Pm
 55D7VQtdl8kUprNLLtTuz1EYLAALAaMDEqv6uNha+Mh7st/YGqTeTWwiDV2/DplX3f
 LLxhjjtxNqRWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel 1/3] powerpc/pseries/iommu: Use dma_iommu_ops for
 Secure VM.
In-Reply-To: <20191213084537.27306-2-aik@ozlabs.ru>
References: <20191213084537.27306-1-aik@ozlabs.ru>
 <20191213084537.27306-2-aik@ozlabs.ru>
Date: Fri, 13 Dec 2019 21:20:38 +1100
Message-ID: <87sgloo7bd.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Ram Pai <linuxram@us.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> From: Ram Pai <linuxram@us.ibm.com>
>
> Commit edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on
> 		secure guests")
> disabled dma_iommu_ops path, for secure VMs. Disabling dma_iommu_ops
> path for secure VMs, helped enable dma_direct path.  This enabled
> support for bounce-buffering through SWIOTLB.  However it fails to
> operate when IOMMU is enabled, since I/O pages are not TCE mapped.
>
> Reenable dma_iommu_ops path for pseries Secure VMs.  It handles all
> cases including, TCE mapping I/O pages, in the presence of a
> IOMMU.
>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

This seems like it should have a Fixes tag?

cheers

> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 6ba081dd61c9..df7db33ca93b 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -36,7 +36,6 @@
>  #include <asm/udbg.h>
>  #include <asm/mmzone.h>
>  #include <asm/plpar_wrappers.h>
> -#include <asm/svm.h>
>  
>  #include "pseries.h"
>  
> @@ -1320,15 +1319,7 @@ void iommu_init_early_pSeries(void)
>  	of_reconfig_notifier_register(&iommu_reconfig_nb);
>  	register_memory_notifier(&iommu_mem_nb);
>  
> -	/*
> -	 * Secure guest memory is inacessible to devices so regular DMA isn't
> -	 * possible.
> -	 *
> -	 * In that case keep devices' dma_map_ops as NULL so that the generic
> -	 * DMA code path will use SWIOTLB to bounce buffers for DMA.
> -	 */
> -	if (!is_secure_guest())
> -		set_pci_dma_ops(&dma_iommu_ops);
> +	set_pci_dma_ops(&dma_iommu_ops);
>  }
>  
>  static int __init disable_multitce(char *str)
> -- 
> 2.17.1
