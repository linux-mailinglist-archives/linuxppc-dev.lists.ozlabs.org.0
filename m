Return-Path: <linuxppc-dev+bounces-16352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPI/L8zqeWkF1AEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 11:54:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96B9FBE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 11:54:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1Jzp1X9Bz2xlK;
	Wed, 28 Jan 2026 21:53:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769597638;
	cv=none; b=jSc3WpQOBe0+Sdkzi6ESz6v3C6E4l+I2UXh8ZTaaEEgjyly+xoqZn90q0H01ZQ6hwHyKV8tD/qBhezRW+IFJTJoIVchzWtPKjD5k7JEb8Q2vPuFlzKU0VWTGsbtASdyzibi585tfN4lLY3UE9oO/oM4CqvWlnP+IigFDfODryw58qTQjFId2igm+2HcbV6yKv1JJCo7BY4CLrt7A3VTRysK2vTHOBaAxwGDZt0ZGCp1bTi6/1PHMMUruN/RKq81GpSBbCJSVDV75URYWpRxLIkpjt6m37VtgvEc0an4JEp18pKSAseAS2sgghxlzx948R/Rg6dNkaVagShnLLMT+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769597638; c=relaxed/relaxed;
	bh=QjuruMsy79rDA/QR90iR13JnwW87hPABPNs7gMSq1Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tyhqv4XcmTVVUS/uigk5FuCEqqFraoY+hJfYRuVsJLFzb7tdfWo/nZDfksNcW/RjPP5MCRA7skZeGxts/apo91VG7MBp1NrHmUGznEA++UFYSJGTjhcex6AdVCyXAScZHchXk8EQ3S7qvvVVqdTgjRaqiqYA8jYtqw1N/PEENY+gOzEIb2uf+6zbwZ8E3RAiYbaQl7nz92pCv54YD62s74q/jIajlONwtTD0rM3k+cEWfSj5CJgFyujM+MLvE++xq4stEu4LkIoF05w5JyPUZweNLUQjvNcLhrjKcs8mZ26uCFdc4JHxHb9C0UT6bxbwRtvDlkzPfSvyyqBrj59GPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieDlm7c7; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieDlm7c7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1Jzn1CQjz2xMY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 21:53:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DF3F60007;
	Wed, 28 Jan 2026 10:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB76C4CEF1;
	Wed, 28 Jan 2026 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597633;
	bh=IH7dlVvX0BrqfneedFEsGx+dBrFkBFmcPSu9v6mmRIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ieDlm7c7z1+wcL2GPnKAcTeCaOHZjTtVQyew0L7UsQLDiKu9YfUIsog1Xt6mlUWsa
	 IUipjRuz6mYReMZbQp8s8+8tTeVlFB0ZYE4uVyFG1vr+V54ea2kcwdxZteFCb/4pki
	 FVlL5hyG5B9SR/ziVllFR31zNRRj7cRsHo/nBEcyrrN19UHorgySlMtEoxzFNC8OxX
	 Ao36nyBXh6XdvIBiIb1fPFBXUH+VZr2X8rq7ctTECa3uyieIV/VtNyn72AMpra3UKh
	 E8BHqaq+T5V/+xiROTO2b/T8gbmYBC5dVuggJ26IwT8decyHqyRfdE1jFcnsMiCmL4
	 Lfwav9PHcD+Ng==
Message-ID: <974a95d4-0ae5-400a-992f-9e468a0666d6@kernel.org>
Date: Wed, 28 Jan 2026 11:53:48 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, npiggin@gmail.com,
 alex@shazbot.org, joerg.roedel@amd.com, kevin.tian@intel.com,
 gbatra@linux.ibm.com, jgg@nvidia.com, clg@kaod.org, vaibhav@linux.ibm.com,
 brking@linux.vnet.ibm.com, nnmlinux@linux.ibm.com, amachhiw@linux.ibm.com,
 tpearson@raptorengineering.com
References: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16352-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sbhat@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:iommu@lists.linux.dev,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:alex@shazbot.org,m:joerg.roedel@amd.com,m:kevin.tian@intel.com,m:gbatra@linux.ibm.com,m:jgg@nvidia.com,m:clg@kaod.org,m:vaibhav@linux.ibm.com,m:brking@linux.vnet.ibm.com,m:nnmlinux@linux.ibm.com,m:amachhiw@linux.ibm.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ellerman.id.au,linux.ibm.com,gmail.com,shazbot.org,amd.com,intel.com,nvidia.com,kaod.org,linux.vnet.ibm.com,raptorengineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7A96B9FBE7
X-Rspamd-Action: no action



Le 27/01/2026 à 19:35, Shivaprasad G Bhat a écrit :
> The RFC attempts to implement the IOMMUFD support on PPC64 by
> adding new iommu_ops for paging domain. The existing platform
> domain continues to be the default domain for in-kernel use.
> The domain ownership transfer ensures the reset of iommu states
> for the new paging domain and in-kernel usage.
> 
> On PPC64, IOVA ranges are based on the type of the DMA window
> and their properties. Currently, there is no way to expose the
> attributes of the non-default 64-bit DMA window, which the platform
> supports. The platform allows the operating system to select the
> starting offset(at 4GiB or 512PiB default offset), pagesize and
> window size for the non-default 64-bit DMA window. For example,
> with VFIO, this is handled via VFIO_IOMMU_SPAPR_TCE_GET_INFO
> and VFIO_IOMMU_SPAPR_TCE_CREATE|REMOVE ioctls. While I am exploring
> the ways to expose and configure these DMA window attributes as
> per user input, any suggestions in this regard will be very helpful.
> 
> Currently existing vfio type1 specific vfio-compat driver even
> with this patch will not work for PPC64. I believe we need to have
> a separate "vfio-spapr-compat" driver to make it work.
> 
> So brief list of current open problems and ongoing reworks:
>   - Second DMA window support as mentioned above.
>   - KVM support.
>   - EEH support.
>   - The vfio compat driver for the spapr tce iommu.
>   - Multiple devices (multifunction, same/different iommu group checks,
>     SRIOV VF assignment) support.
>   - Race conditions, device plug/unplug.
>   - self|tests.
> 
> The patch currently works for single device and exposes only the
> default DMA window of 1GB to the user. It has been tested for
> both PowerNV and pSeries machine tce iommu backends. The testing
> was done using a Qemu[1] and TCG guest having a NVME device
> passthrough. One can use the command like below to try:
> 
> qemu-system-ppc64 -machine pseries -accel tcg \
> -device spapr-pci-host-bridge,index=1,id=pci.1,ddw=off \
> -device vfio-pci,host=<hostdev>,id=hostdev0,\
> bus=pci.1.0,addr=0x1,iommufd=iommufd0 \
> -object iommufd,id=iommufd0 <...>
> ...
> root:localhost# mount /dev/nvme0n1 /mnt
> root:localhost# ls /mnt
> ...
> 
> The current patch is based on linux kernel 6.19-rc6 tree.

Getting the following build failure on linuxppc-dev patchwork with 
g5_defconfig or ppc64_defconfig:

Error: /linux/arch/powerpc/sysdev/dart_iommu.c:325:9: error: 
initialization of 'int (*)(struct iommu_table *, long int,  long int, 
long unsigned int,  enum dma_data_direction,  long unsigned int,  bool)' 
{aka 'int (*)(struct iommu_table *, long int,  long int,  long unsigned 
int,  enum dma_data_direction,  long unsigned int,  _Bool)'} from 
incompatible pointer type 'int (*)(struct iommu_table *, long int,  long 
int,  long unsigned int,  enum dma_data_direction,  long unsigned int)' 
[-Werror=incompatible-pointer-types]
   .set = dart_build,
          ^~~~~~~~~~
/linux/arch/powerpc/sysdev/dart_iommu.c:325:9: note: (near 
initialization for 'iommu_dart_ops.set')
cc1: all warnings being treated as errors
make[5]: *** [/linux/scripts/Makefile.build:287: 
arch/powerpc/sysdev/dart_iommu.o] Error 1
make[4]: *** [/linux/scripts/Makefile.build:544: arch/powerpc/sysdev] 
Error 2

Christophe

> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> 
> References:
> 1 : https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fshivaprasadbhat%2Fqemu%2Ftree%2Fiommufd-wip&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b6054524dcf4d42f24308de5dd2fc27%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639051357920885715%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=NBGzjiMaEskySEDGCZHhPwQ5VzADQXPCpH45d5p4Cuk%3D&reserved=0
> ---
>   arch/powerpc/include/asm/iommu.h              |    2
>   arch/powerpc/kernel/iommu.c                   |  181 +++++++++++++++++++++++++
>   arch/powerpc/platforms/powernv/pci-ioda-tce.c |    4 -
>   arch/powerpc/platforms/powernv/pci-ioda.c     |    4 -
>   arch/powerpc/platforms/powernv/pci.h          |    2
>   arch/powerpc/platforms/pseries/iommu.c        |    6 -
>   drivers/vfio/Kconfig                          |    4 -
>   7 files changed, 190 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index eafdd63cd6c4..1dc72fbb89e7 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -46,7 +46,7 @@ struct iommu_table_ops {
>   			long index, long npages,
>   			unsigned long uaddr,
>   			enum dma_data_direction direction,
> -			unsigned long attrs);
> +			unsigned long attrs, bool is_phys);
>   #ifdef CONFIG_IOMMU_API
>   	/*
>   	 * Exchanges existing TCE with new TCE plus direction bits;
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 0ce71310b7d9..e6543480c461 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -365,7 +365,7 @@ static dma_addr_t iommu_alloc(struct device *dev, struct iommu_table *tbl,
>   	/* Put the TCEs in the HW table */
>   	build_fail = tbl->it_ops->set(tbl, entry, npages,
>   				      (unsigned long)page &
> -				      IOMMU_PAGE_MASK(tbl), direction, attrs);
> +				      IOMMU_PAGE_MASK(tbl), direction, attrs, false);
>   
>   	/* tbl->it_ops->set() only returns non-zero for transient errors.
>   	 * Clean up the table bitmap in this case and return
> @@ -539,7 +539,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
>   		/* Insert into HW table */
>   		build_fail = tbl->it_ops->set(tbl, entry, npages,
>   					      vaddr & IOMMU_PAGE_MASK(tbl),
> -					      direction, attrs);
> +					      direction, attrs, false);
>   		if(unlikely(build_fail))
>   			goto failure;
>   
> @@ -1201,7 +1201,15 @@ spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
>   	 * also sets the dma_api ops
>   	 */
>   	table_group = iommu_group_get_iommudata(grp);
> +
> +	if (old && old->type == IOMMU_DOMAIN_DMA) {
> +		ret = table_group->ops->unset_window(table_group, 0);
> +		if (ret)
> +			goto exit;
> +	}
> +
>   	ret = table_group->ops->take_ownership(table_group, dev);
> +exit:
>   	iommu_group_put(grp);
>   
>   	return ret;
> @@ -1260,6 +1268,167 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
>   	return hose->controller_ops.device_group(hose, pdev);
>   }
>   
> +struct ppc64_domain {
> +	struct iommu_domain  domain;
> +	struct device        *device; /* Make it a list */
> +	struct iommu_table   *table;
> +	spinlock_t           list_lock;
> +	struct rcu_head      rcu;
> +};
> +
> +static struct ppc64_domain *to_ppc64_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct ppc64_domain, domain);
> +}
> +
> +static void spapr_tce_domain_free(struct iommu_domain *domain)
> +{
> +	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
> +
> +	kfree(ppc64_domain);
> +}
> +
> +static const struct iommu_ops spapr_tce_iommu_ops;
> +static struct iommu_domain *spapr_tce_domain_alloc_paging(struct device *dev)
> +{
> +	struct iommu_group *grp = iommu_group_get(dev);
> +	struct iommu_table_group *table_group;
> +	struct ppc64_domain *ppc64_domain;
> +	struct iommu_table *ptbl;
> +	int ret = -1;
> +
> +	table_group = iommu_group_get_iommudata(grp);
> +	ppc64_domain = kzalloc(sizeof(*ppc64_domain), GFP_KERNEL);
> +	if (!ppc64_domain)
> +		return NULL;
> +
> +	/* Just the default window hardcode for now */
> +	ret = table_group->ops->create_table(table_group, 0, 0xc, 0x40000000, 1, &ptbl);
> +	iommu_tce_table_get(ptbl);
> +	ppc64_domain->table = ptbl; /* REVISIT: Single device for now */
> +	if (!ppc64_domain->table) {
> +		kfree(ppc64_domain);
> +		iommu_tce_table_put(ptbl);
> +		iommu_group_put(grp);
> +		return NULL;
> +	}
> +
> +	table_group->ops->set_window(table_group, 0, ptbl);
> +	iommu_group_put(grp);
> +
> +	ppc64_domain->domain.pgsize_bitmap = SZ_4K;
> +	ppc64_domain->domain.geometry.force_aperture = true;
> +	ppc64_domain->domain.geometry.aperture_start = 0;
> +	ppc64_domain->domain.geometry.aperture_end = 0x40000000; /*default window */
> +	ppc64_domain->domain.ops = spapr_tce_iommu_ops.default_domain_ops;
> +
> +	spin_lock_init(&ppc64_domain->list_lock);
> +
> +	return &ppc64_domain->domain;
> +}
> +
> +static size_t spapr_tce_iommu_unmap_pages(struct iommu_domain *domain,
> +				unsigned long iova,
> +				size_t pgsize, size_t pgcount,
> +				struct iommu_iotlb_gather *gather)
> +{
> +	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
> +	struct iommu_table *tbl = ppc64_domain->table;
> +	unsigned long pgshift = __ffs(pgsize);
> +	size_t size = pgcount << pgshift;
> +	size_t mapped = 0;
> +	unsigned int tcenum;
> +	int  mask;
> +
> +	if (pgsize != SZ_4K)
> +		return -EINVAL;
> +
> +	size = PAGE_ALIGN(size);
> +
> +	mask = IOMMU_PAGE_MASK(tbl);
> +	tcenum = iova >> tbl->it_page_shift;
> +
> +	tbl->it_ops->clear(tbl, tcenum, pgcount);
> +
> +	mapped = pgsize * pgcount;
> +
> +	return mapped;
> +}
> +
> +static phys_addr_t spapr_tce_iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
> +{
> +	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
> +	struct iommu_table *tbl = ppc64_domain->table;
> +	phys_addr_t paddr, rpn, tceval;
> +	unsigned int tcenum;
> +
> +	tcenum = iova >> tbl->it_page_shift;
> +	tceval = tbl->it_ops->get(tbl, tcenum);
> +
> +	/* Ignore the direction bits */
> +	rpn = tceval >> tbl->it_page_shift;
> +	paddr = rpn << tbl->it_page_shift;
> +
> +	return paddr;
> +}
> +
> +static int spapr_tce_iommu_map_pages(struct iommu_domain *domain,
> +				unsigned long iova, phys_addr_t paddr,
> +				size_t pgsize, size_t pgcount,
> +				int prot, gfp_t gfp, size_t *mapped)
> +{
> +	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
> +	enum dma_data_direction direction = DMA_BIDIRECTIONAL;
> +	struct iommu_table *tbl = ppc64_domain->table;
> +	unsigned long pgshift = __ffs(pgsize);
> +	size_t size = pgcount << pgshift;
> +	unsigned int tcenum;
> +	int ret;
> +
> +	if (pgsize != SZ_4K)
> +		return -EINVAL;
> +
> +	if (iova < ppc64_domain->domain.geometry.aperture_start ||
> +	    (iova + size - 1) > ppc64_domain->domain.geometry.aperture_end)
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(iova | paddr, pgsize))
> +		return -EINVAL;
> +
> +	if (!(prot & IOMMU_WRITE))
> +		direction = DMA_FROM_DEVICE;
> +
> +	if (!(prot & IOMMU_READ))
> +		direction = DMA_TO_DEVICE;
> +
> +	size = PAGE_ALIGN(size);
> +	tcenum = iova >> tbl->it_page_shift;
> +
> +	/* Put the TCEs in the HW table */
> +	ret = tbl->it_ops->set(tbl, tcenum, pgcount,
> +				paddr, direction, 0, true);
> +	if (!ret && mapped)
> +		*mapped = pgsize;
> +
> +	return 0;
> +}
> +
> +static int spapr_tce_iommu_attach_device(struct iommu_domain *domain,
> +				    struct device *dev, struct iommu_domain *old)
> +{
> +	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
> +
> +	/* REVISIT */
> +	if (!domain)
> +		return 0;
> +
> +	/* REVISIT: Check table group, list handling */
> +	ppc64_domain->device = dev;
> +
> +	return 0;
> +}
> +
> +
>   static const struct iommu_ops spapr_tce_iommu_ops = {
>   	.default_domain = &spapr_tce_platform_domain,
>   	.blocked_domain = &spapr_tce_blocked_domain,
> @@ -1267,6 +1436,14 @@ static const struct iommu_ops spapr_tce_iommu_ops = {
>   	.probe_device = spapr_tce_iommu_probe_device,
>   	.release_device = spapr_tce_iommu_release_device,
>   	.device_group = spapr_tce_iommu_device_group,
> +	.domain_alloc_paging = spapr_tce_domain_alloc_paging,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev     = spapr_tce_iommu_attach_device,
> +		.map_pages      = spapr_tce_iommu_map_pages,
> +		.unmap_pages    = spapr_tce_iommu_unmap_pages,
> +		.iova_to_phys   = spapr_tce_iommu_iova_to_phys,
> +		.free           = spapr_tce_domain_free,
> +	}
>   };
>   
>   static struct attribute *spapr_tce_iommu_attrs[] = {
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> index e96324502db0..8800bf86d17a 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> @@ -123,10 +123,10 @@ static __be64 *pnv_tce(struct iommu_table *tbl, bool user, long idx, bool alloc)
>   
>   int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
>   		unsigned long uaddr, enum dma_data_direction direction,
> -		unsigned long attrs)
> +		unsigned long attrs, bool is_phys)
>   {
>   	u64 proto_tce = iommu_direction_to_tce_perm(direction);
> -	u64 rpn = __pa(uaddr) >> tbl->it_page_shift;
> +	u64 rpn = !is_phys ? __pa(uaddr) >> tbl->it_page_shift : uaddr >> tbl->it_page_shift;
>   	long i;
>   
>   	if (proto_tce & TCE_PCI_WRITE)
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index b0c1d9d16fb5..610146a63e3b 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1241,10 +1241,10 @@ static void pnv_pci_ioda2_tce_invalidate(struct iommu_table *tbl,
>   static int pnv_ioda2_tce_build(struct iommu_table *tbl, long index,
>   		long npages, unsigned long uaddr,
>   		enum dma_data_direction direction,
> -		unsigned long attrs)
> +		unsigned long attrs, bool is_phys)
>   {
>   	int ret = pnv_tce_build(tbl, index, npages, uaddr, direction,
> -			attrs);
> +			attrs, is_phys);
>   
>   	if (!ret)
>   		pnv_pci_ioda2_tce_invalidate(tbl, index, npages);
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 42075501663b..3579ecd55d00 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -300,7 +300,7 @@ extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>   
>   extern int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
>   		unsigned long uaddr, enum dma_data_direction direction,
> -		unsigned long attrs);
> +		unsigned long attrs, bool is_phys);
>   extern void pnv_tce_free(struct iommu_table *tbl, long index, long npages);
>   extern int pnv_tce_xchg(struct iommu_table *tbl, long index,
>   		unsigned long *hpa, enum dma_data_direction *direction);
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index eec333dd2e59..8c6f9f18e462 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -122,7 +122,7 @@ static void iommu_pseries_free_group(struct iommu_table_group *table_group,
>   static int tce_build_pSeries(struct iommu_table *tbl, long index,
>   			      long npages, unsigned long uaddr,
>   			      enum dma_data_direction direction,
> -			      unsigned long attrs)
> +			      unsigned long attrs, bool false)
>   {
>   	u64 proto_tce;
>   	__be64 *tcep;
> @@ -250,7 +250,7 @@ static DEFINE_PER_CPU(__be64 *, tce_page);
>   static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   				     long npages, unsigned long uaddr,
>   				     enum dma_data_direction direction,
> -				     unsigned long attrs)
> +				     unsigned long attrs, bool is_phys)
>   {
>   	u64 rc = 0;
>   	u64 proto_tce;
> @@ -287,7 +287,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   		__this_cpu_write(tce_page, tcep);
>   	}
>   
> -	rpn = __pa(uaddr) >> tceshift;
> +	rpn = !is_phys ? __pa(uaddr) >> tceshift : uaddr >> tceshift;
>   	proto_tce = TCE_PCI_READ;
>   	if (direction != DMA_TO_DEVICE)
>   		proto_tce |= TCE_PCI_WRITE;
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index ceae52fd7586..9929aa78a5da 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -4,7 +4,7 @@ menuconfig VFIO
>   	select IOMMU_API
>   	depends on IOMMUFD || !IOMMUFD
>   	select INTERVAL_TREE
> -	select VFIO_GROUP if SPAPR_TCE_IOMMU || IOMMUFD=n
> +	select VFIO_GROUP if IOMMUFD=n
>   	select VFIO_DEVICE_CDEV if !VFIO_GROUP
>   	select VFIO_CONTAINER if IOMMUFD=n
>   	help
> @@ -16,7 +16,7 @@ menuconfig VFIO
>   if VFIO
>   config VFIO_DEVICE_CDEV
>   	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
> -	depends on IOMMUFD && !SPAPR_TCE_IOMMU
> +	depends on IOMMUFD
>   	default !VFIO_GROUP
>   	help
>   	  The VFIO device cdev is another way for userspace to get device
> 
> 


