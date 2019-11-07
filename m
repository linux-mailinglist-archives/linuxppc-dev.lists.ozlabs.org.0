Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B860F2C20
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 11:28:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47803c73nszF3lW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 21:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47801g5G74zF68m
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 21:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="gb5wc+hW"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47801f5SWCz9sPT;
 Thu,  7 Nov 2019 21:26:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573122391;
 bh=ubT6PqHfq+AeskgzniFZvOikXlHxhlqZ5cQjsrS0lnQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gb5wc+hWL6b3Ya0OtGZix/sJtUue+204GeoQas8US15HICstxZ6MRb2umgOieCFtU
 tWQs99Bxp0Yj0OgxFyw4ItXJq4B85MoXu32FHmXJJtfQiAdj9aPEQuBwaVDllUDxP9
 MlFZLvd+TSUoWnRv7YTnrRClNDLH+hhP9lW0oGcog0c7uzG6s7VUjNqKW16QFJzZz4
 Un9NpYnNSvlucUMGeg00xE+Az8F/e3URCB2Vmrgw9mC+/DpXJ4g6RLVQUSmjbstMi8
 Q1ima+wUoaMn0mwroazcEZk4jB2LBbwIrH7yCZRdQn4SD1BvK3hc26dAmxSnzbKCP8
 xJKrpXUcxgaIg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ram Pai <linuxram@us.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC v1 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for Secure
 VMs aswell.
In-Reply-To: <1572902923-8096-3-git-send-email-linuxram@us.ibm.com>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <1572902923-8096-2-git-send-email-linuxram@us.ibm.com>
 <1572902923-8096-3-git-send-email-linuxram@us.ibm.com>
Date: Thu, 07 Nov 2019 21:26:28 +1100
Message-ID: <87k18c56ej.fsf@mpe.ellerman.id.au>
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru, linuxram@us.ibm.com,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ram Pai <linuxram@us.ibm.com> writes:
> This enables IOMMU support for pseries Secure VMs.

Can you give us some more explanation please?

This is basically a revert of commit:
  edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests")

But neglects to remove the now unnecessary include of svm.h.

> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 07f0847..189717b 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1333,15 +1333,7 @@ void iommu_init_early_pSeries(void)
>  	of_reconfig_notifier_register(&iommu_reconfig_nb);
>  	register_memory_notifier(&iommu_mem_nb);
>  
> -	/*
> -	 * Secure guest memory is inacessible to devices so regular DMA isn't
> -	 * possible.
> -	 *
> -	 * In that case keep devices' dma_map_ops as NULL so that the generic
> -	 * DMA code path will use SWIOTLB to bounce buffers for DMA.

Please explain what has changed to make this no longer necessary.

cheers

> -	 */
> -	if (!is_secure_guest())
> -		set_pci_dma_ops(&dma_iommu_ops);
> +	set_pci_dma_ops(&dma_iommu_ops);
>  }
>  
>  static int __init disable_multitce(char *str)
> -- 
> 1.8.3.1
