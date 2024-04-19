Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4C88AA84D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 08:13:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S//gX3Yq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLPTf6g9lz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 16:13:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S//gX3Yq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLPSw05byz3btk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 16:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713507167;
	bh=28LiJObCRsU6GViV/Bj9akKQJkVR+xENo0B+46RgtHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S//gX3YqzEwZZjv/7rInnY9ZscXsZbyBb+mqdzLVv+xnXAuflznACD7mo6oMO51LE
	 R/QoAblQ8/aK79PXNiHS3wxM0qQksx3qg5btED5dOVJfuOxujjF+RoX2B1ySQqk3I4
	 Y0pdCO90aYGl9Yck9QH/usfefZPV+feN0nrE+qOIXZyt5GyM8ZjzaeEIPjJkq8ADzq
	 jtZK1JkTdGy/0nBNymbnURl+v9T0ydWJxivdKOZKt1b/wPmpl1ubzzsXR5N1YhBl6R
	 T2opLhnI/UOfsTnqTSTzyz75q8bwPGbXCUtPWWnVPyUvyak+4rFwXW5vzSxSDS8afe
	 CnMLy8RH1MnWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLPSv0gM2z4wyw;
	Fri, 19 Apr 2024 16:12:47 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: LPAR panics when rebooted with a
 frozen PE
In-Reply-To: <20240416205810.28754-1-gbatra@linux.ibm.com>
References: <20240416205810.28754-1-gbatra@linux.ibm.com>
Date: Fri, 19 Apr 2024 16:12:46 +1000
Message-ID: <87ttjxanj5.fsf@mail.lhotse>
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
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.ibm.com> writes:
> At the time of LPAR reboot, partition firmware provides Open Firmware
> property ibm,dma-window for the PE. This property is provided on the PCI
> bus the PE is attached to.

AFAICS you're actually describing a bug that happens during boot *up*?

Describing it as "reboot" makes me think you're talking about the
shutdown path. I think that will confuse people, me at least :)

cheers

> There are execptions where the partition firmware might not provide this
> property for the PE at the time of LPAR reboot. One of the scenario is
> where the firmware has frozen the PE due to some error conditions. This
> PE is frozen for 24 hours or unless the whole system is reinitialized.
>
> Within this time frame, if the LPAR is rebooted, the frozen PE will be
> presented to the LPAR but ibm,dma-window property could be missing.
>
> Today, under these circumstances, the LPAR oopses with NULL pointer
> dereference, when configuring the PCI bus the PE is attached to.
>
> BUG: Kernel NULL pointer dereference on read at 0x000000c8
> Faulting instruction address: 0xc0000000001024c0
> Oops: Kernel access of bad area, sig: 7 [#1]
> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> Supported: Yes
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.4.0-150600.9-default #1
> Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NM1060_023) hv:phyp pSeries
> NIP:  c0000000001024c0 LR: c0000000001024b0 CTR: c000000000102450
> REGS: c0000000037db5c0 TRAP: 0300   Not tainted  (6.4.0-150600.9-default)
> MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000822  XER: 00000000
> CFAR: c00000000010254c DAR: 00000000000000c8 DSISR: 00080000 IRQMASK: 0
> ...
> NIP [c0000000001024c0] pci_dma_bus_setup_pSeriesLP+0x70/0x2a0
> LR [c0000000001024b0] pci_dma_bus_setup_pSeriesLP+0x60/0x2a0
> Call Trace:
> 	pci_dma_bus_setup_pSeriesLP+0x60/0x2a0 (unreliable)
> 	pcibios_setup_bus_self+0x1c0/0x370
> 	__of_scan_bus+0x2f8/0x330
> 	pcibios_scan_phb+0x280/0x3d0
> 	pcibios_init+0x88/0x12c
> 	do_one_initcall+0x60/0x320
> 	kernel_init_freeable+0x344/0x3e4
> 	kernel_init+0x34/0x1d0
> 	ret_from_kernel_user_thread+0x14/0x1c
>
> Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index e8c4129697b1..e808d5b1fa49 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -786,8 +786,16 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>  	 * parent bus. During reboot, there will be ibm,dma-window property to
>  	 * define DMA window. For kdump, there will at least be default window or DDW
>  	 * or both.
> +	 * There is an exception to the above. In case the PE goes into frozen
> +	 * state, firmware may not provide ibm,dma-window property at the time
> +	 * of LPAR reboot.
>  	 */
>  
> +	if (!pdn) {
> +		pr_debug("  no ibm,dma-window property !\n");
> +		return;
> +	}
> +
>  	ppci = PCI_DN(pdn);
>  
>  	pr_debug("  parent is %pOF, iommu_table: 0x%p\n",
>
> base-commit: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
> -- 
> 2.39.3 (Apple Git-146)
