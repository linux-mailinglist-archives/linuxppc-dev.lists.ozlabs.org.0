Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA061637739
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 12:09:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHwHQ3wZmz3dvT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 22:09:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Wq7AFyfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHwGX2gqbz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 22:08:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Wq7AFyfb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NHwGW5Ccxz4x1T;
	Thu, 24 Nov 2022 22:08:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669288115;
	bh=fhT4MSgBEL1c6hEt774mjplPx76VUxF3VAKK6D3mVT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wq7AFyfb4dYv8+MNzUhq2Wa7+bXcdRTslkBius6+WJUAptHBv3snIoJIwm8t2IUx/
	 a7Vy4CGVLdpsIhpV/mDFDtqZce4qJ5qCy/nW6OsoNpRYqBrT4ri7lUQx3HPa5GhyTM
	 YMzg96ZXRn2OAahAjRDF46rbPb5JyyM2PTJ+uVEzEx5/dcrD8X4VdQIgi5XMbWlbTl
	 mCiU6w+0WY93CRMSNzrGD3HGDWDuxTKu4hqLtv9EovQmDlSmE+xp0DncCySccNySD6
	 CdIvX4M9IfTIk63qP44gwLoBOPRkh5Qe8YSAQZgz8+828q5CdNOxVFy7DnuP/+PGAA
	 U+iKeqsYP+xig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Deming Wang <wangdeming@inspur.com>
Subject: Re: [PATCH] powerpc/pseries: Add a null judgment after
 iommu_pseries_alloc_group
In-Reply-To: <20220701091735.1584-1-wangdeming@inspur.com>
References: <20220701091735.1584-1-wangdeming@inspur.com>
Date: Thu, 24 Nov 2022 22:08:34 +1100
Message-ID: <87zgcgboel.fsf@mpe.ellerman.id.au>
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
Cc: Deming Wang <wangdeming@inspur.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Deming Wang <wangdeming@inspur.com> writes:
> We should avoid use the return value directly after  call
> iommu_pseries_alloc_group. Because it_may return a null.

We should probably at least print a warning in that case though?

Otherwise someone's PCI device will not work with no indication why, or
more likely the kernel will crash elsewhere with no indication that the
group allocation is the original cause.

cheers

> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index fba64304e859..801eb9d4bdca 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -649,6 +649,9 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
>  	pci->phb->dma_window_base_cur = 0x8000000ul;
>  
>  	pci->table_group = iommu_pseries_alloc_group(pci->phb->node);
> +	if (!pci->table_group)
> +		return;
> +
>  	tbl = pci->table_group->tables[0];
>  
>  	iommu_table_setparms(pci->phb, dn, tbl);
> @@ -734,6 +737,9 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>  
>  	if (!ppci->table_group) {
>  		ppci->table_group = iommu_pseries_alloc_group(ppci->phb->node);
> +		if (!ppci->table_group)
> +			return;
> +
>  		tbl = ppci->table_group->tables[0];
>  		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
>  				ppci->table_group, dma_window);
> @@ -765,6 +771,9 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
>  
>  		pr_debug(" --> first child, no bridge. Allocating iommu table.\n");
>  		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
> +		if (!PCI_DN(dn)->table_group)
> +			return;
> +
>  		tbl = PCI_DN(dn)->table_group->tables[0];
>  		iommu_table_setparms(phb, dn, tbl);
>  
> @@ -1521,6 +1530,9 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
>  	pci = PCI_DN(pdn);
>  	if (!pci->table_group) {
>  		pci->table_group = iommu_pseries_alloc_group(pci->phb->node);
> +		if (!pci->table_group)
> +			return;
> +
>  		tbl = pci->table_group->tables[0];
>  		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
>  				pci->table_group, dma_window);
> -- 
> 2.27.0
