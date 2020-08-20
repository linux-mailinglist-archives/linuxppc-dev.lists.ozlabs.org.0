Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B99524ADA5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 06:19:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXBJ513w4zDr1r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 14:19:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXBG46DzdzDqy6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 14:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JHrknrW6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BXBG44CDDz9sR4;
 Thu, 20 Aug 2020 14:18:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597897084;
 bh=UqOYuJJ2y2YnIHyZ4o2hplhujlUSAD9uuBaLRMx5Xk8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=JHrknrW6v1jO6aS3unFzJrCoSxtjL7f/YbLrxigpJcMc2rD3Bptzzfc9xqE1b4E8/
 2Dhaq282ND5h8RYqZJrlqWBsuORUbc/PNoQ0VvMdjsFhg9R0Edc73kjO732QVsGRaN
 46RuiMQZEKMO2B52va94SEuNpO8UIwBAt/GyfeQmQL061Y5Mf4XjefKkOt0hkKTy3F
 1+qKqilrwh8Qi+EaL75piIv3o8Yuuks7ktw4kktMSvBFGYTy5Eetse1rtmCNdkmpMh
 nEoPpz5wAqK1V0W6vU0yowDfeM8GQIhAqowM5GViQBLUXkG92651AtyupzmRLCf7ak
 Edz0z6PVW3dSw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 oohall@gmail.com
Subject: Re: [PATCH] powerpc/powernv/pci: Fix typo when releasing DMA resources
In-Reply-To: <20200819130741.16769-1-fbarrat@linux.ibm.com>
References: <20200819130741.16769-1-fbarrat@linux.ibm.com>
Date: Thu, 20 Aug 2020 14:18:01 +1000
Message-ID: <874koyhrwm.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Frederic Barrat <fbarrat@linux.ibm.com> writes:
> Fix typo introduced during recent code cleanup, which could lead to
> silently not freeing resources or oops message (on PCI hotplug or CAPI
> reset).
> Only impacts ioda2, the code path for ioda1 is correct.
>
> Fixes: 01e12629af4e ("powerpc/powernv/pci: Add explicit tracking of the DMA setup state")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

I changed the subject to:

    powerpc/powernv/pci: Fix possible crash when releasing DMA resources


To hopefully better convey that it's a moderately serious bug, even if
the root cause is just a typo. Otherwise folks scanning the commit log
might think it's just a harmless typo.

cheers

> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index c9c25fb0783c..023a4f987bb2 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -2705,7 +2705,7 @@ void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
>  	struct iommu_table *tbl = pe->table_group.tables[0];
>  	int64_t rc;
>  
> -	if (pe->dma_setup_done)
> +	if (!pe->dma_setup_done)
>  		return;
>  
>  	rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
> -- 
> 2.26.2
