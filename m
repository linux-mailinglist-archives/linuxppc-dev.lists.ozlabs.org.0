Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAFB21ECA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 11:21:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Zlm12tdzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 19:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xjeLoDFw; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Zdn0gf0zDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:16:44 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id gc9so1292176pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R7/LQ5ufUwsDIeY3ti9I3mIhKCd0BHLvPk7FDhjifv8=;
 b=xjeLoDFwakOtN5rLurOh95k9dsj7IRdBaExQIFVR7Um9mvwdIxLIZxckgNsWtpFH84
 0ei82w/hXLsaqNW4Y+5MaQbI/rkyX49pj61yL1vpyPiFJHyzZOqWRtfMY7x+SL33VIzP
 d7dHM4X7CA6A3oaizLP8ju7CfspFSv1IdSk3Z9owpWMct4rWU4SeJdPU8tdbxRh2905J
 A5eMHOW1AQhISOWYGZzRAhDk1ACIJfOqw1oR5R5QifU18WSz8+CWCmjM9dq3HJ6T90NX
 FOrwfP65X56Dfzg5aw/b++FMRicazTCAJoEIJf2RijNr6pkpNZdd7quH2CcIbNUkucDh
 JVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R7/LQ5ufUwsDIeY3ti9I3mIhKCd0BHLvPk7FDhjifv8=;
 b=qocEvfh5bzkMQ9QIRjX4ez3ocqOI+RIa4Bhr2aeR62J6rsk/DfmCy/+P5VAZPUk6Js
 kDqQmUwybRBhcT8nwfakyfNuO7kfpu95Bg2TdsDfXKfkUq7+jNgA80QUCLIaQZ9YNyi6
 +Im1w3LRy0KFiCWTHtR+sgzZrbDFDpozUyATcuJqY1aqD26/lvQj8L83YgVNFlwMWRZh
 RL0v9JSVKC20qu7+UlRiMsdBNIQmyI1YCJGm/NQQ7ZLcxFcxMzulTMcr2Sai8Z47e9tC
 d84kNjPm3hMpWJRDxNI3AnOD1xDCSY2df4b66A+6k1EkFTXxB3CPOPYHKYr/9kqb4ePa
 +bOg==
X-Gm-Message-State: AOAM531JQ85JNndJ9sR8XGMwynboevKSdHgAHAbPBwexd/yeVczs5t+r
 rDt6PXdJdfKuCJWNgut+2wLxBbRzsNsatQ==
X-Google-Smtp-Source: ABdhPJyC5m+eE4Z+F40aK10zuDSE+Fc3vl3ylq/6kVwU54xLWi1H3O7l1LnRR/9PY+UJ9cIDkPhhfg==
X-Received: by 2002:a17:90a:3523:: with SMTP id
 q32mr3343249pjb.185.1594718199723; 
 Tue, 14 Jul 2020 02:16:39 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id np5sm2235487pjb.43.2020.07.14.02.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 02:16:38 -0700 (PDT)
Subject: Re: [PATCH 05/15] powerpc/powernv/sriov: Move SR-IOV into a seperate
 file
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-6-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <42897409-5788-dfdb-f2dc-76e99a81b662@ozlabs.ru>
Date: Tue, 14 Jul 2020 19:16:35 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-6-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 10/07/2020 15:23, Oliver O'Halloran wrote:
> pci-ioda.c is getting a bit unwieldly due to the amount of stuff jammed in
> there. The SR-IOV support can be extracted easily enough and is mostly
> standalone, so move it into a seperate file.
> 
> This patch also moves the PowerNV SR-IOV specific fields from pci_dn and moves them
> into a platform specific structure. I'm not sure how they ended up in there
> in the first place, but leaking platform specifics into common code has
> proven to be a terrible idea so far so lets stop doing that.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> The pci_dn change and the pci-sriov.c changes originally separate patches.
> I accidently squashed them together while rebasing and fixing that seemed
> like more pain that it was worth. I kind of like it this way though since
> they did cause a lot of churn on the same set of functions.
> 
> I'll split them up again if you really want (please don't want this).


Nah, not worth it splitting it this way. However it would be nice to not
to have a (small?) functional change in the same patch, there is a small
new piece (below).


> ---
>  arch/powerpc/include/asm/device.h          |   3 +
>  arch/powerpc/platforms/powernv/Makefile    |   1 +
>  arch/powerpc/platforms/powernv/pci-ioda.c  | 673 +--------------------
>  arch/powerpc/platforms/powernv/pci-sriov.c | 642 ++++++++++++++++++++
>  arch/powerpc/platforms/powernv/pci.h       |  74 +++
>  5 files changed, 738 insertions(+), 655 deletions(-)
>  create mode 100644 arch/powerpc/platforms/powernv/pci-sriov.c
> 
> diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
> index 266542769e4b..4d8934db7ef5 100644
> --- a/arch/powerpc/include/asm/device.h
> +++ b/arch/powerpc/include/asm/device.h
> @@ -49,6 +49,9 @@ struct dev_archdata {
>  #ifdef CONFIG_CXL_BASE
>  	struct cxl_context	*cxl_ctx;
>  #endif
> +#ifdef CONFIG_PCI_IOV
> +	void *iov_data;
> +#endif
>  };
>  
>  struct pdev_archdata {
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index fe3f0fb5aeca..2eb6ae150d1f 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
>  obj-$(CONFIG_PRESERVE_FA_DUMP)	+= opal-fadump.o
>  obj-$(CONFIG_OPAL_CORE)	+= opal-core.o
>  obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
> +obj-$(CONFIG_PCI_IOV)   += pci-sriov.o
>  obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
>  obj-$(CONFIG_EEH)	+= eeh-powernv.o
>  obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 8fb17676d914..2d36a9ebf0e9 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -115,26 +115,6 @@ static int __init pci_reset_phbs_setup(char *str)
>  
>  early_param("ppc_pci_reset_phbs", pci_reset_phbs_setup);
>  
> -static inline bool pnv_pci_is_m64(struct pnv_phb *phb, struct resource *r)
> -{
> -	/*
> -	 * WARNING: We cannot rely on the resource flags. The Linux PCI
> -	 * allocation code sometimes decides to put a 64-bit prefetchable
> -	 * BAR in the 32-bit window, so we have to compare the addresses.
> -	 *
> -	 * For simplicity we only test resource start.
> -	 */
> -	return (r->start >= phb->ioda.m64_base &&
> -		r->start < (phb->ioda.m64_base + phb->ioda.m64_size));
> -}
> -
> -static inline bool pnv_pci_is_m64_flags(unsigned long resource_flags)
> -{
> -	unsigned long flags = (IORESOURCE_MEM_64 | IORESOURCE_PREFETCH);
> -
> -	return (resource_flags & flags) == flags;
> -}
> -
>  static struct pnv_ioda_pe *pnv_ioda_init_pe(struct pnv_phb *phb, int pe_no)
>  {
>  	s64 rc;
> @@ -172,7 +152,7 @@ static void pnv_ioda_reserve_pe(struct pnv_phb *phb, int pe_no)
>  	pnv_ioda_init_pe(phb, pe_no);
>  }
>  
> -static struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
> +struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
>  {
>  	long pe;
>  
> @@ -184,7 +164,7 @@ static struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
>  	return NULL;
>  }
>  
> -static void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
> +void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
>  {
>  	struct pnv_phb *phb = pe->phb;
>  	unsigned int pe_num = pe->pe_number;
> @@ -816,7 +796,7 @@ static void pnv_ioda_unset_peltv(struct pnv_phb *phb,
>  		pe_warn(pe, "OPAL error %lld remove self from PELTV\n", rc);
>  }
>  
> -static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
> +int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>  {
>  	struct pci_dev *parent;
>  	uint8_t bcomp, dcomp, fcomp;
> @@ -887,7 +867,7 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>  	return 0;
>  }
>  
> -static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
> +int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>  {
>  	struct pci_dev *parent;
>  	uint8_t bcomp, dcomp, fcomp;
> @@ -982,91 +962,6 @@ static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PCI_IOV
> -static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
> -{
> -	struct pci_dn *pdn = pci_get_pdn(dev);
> -	int i;
> -	struct resource *res, res2;
> -	resource_size_t size;
> -	u16 num_vfs;
> -
> -	if (!dev->is_physfn)
> -		return -EINVAL;
> -
> -	/*
> -	 * "offset" is in VFs.  The M64 windows are sized so that when they
> -	 * are segmented, each segment is the same size as the IOV BAR.
> -	 * Each segment is in a separate PE, and the high order bits of the
> -	 * address are the PE number.  Therefore, each VF's BAR is in a
> -	 * separate PE, and changing the IOV BAR start address changes the
> -	 * range of PEs the VFs are in.
> -	 */
> -	num_vfs = pdn->num_vfs;
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> -		if (!res->flags || !res->parent)
> -			continue;
> -
> -		/*
> -		 * The actual IOV BAR range is determined by the start address
> -		 * and the actual size for num_vfs VFs BAR.  This check is to
> -		 * make sure that after shifting, the range will not overlap
> -		 * with another device.
> -		 */
> -		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
> -		res2.flags = res->flags;
> -		res2.start = res->start + (size * offset);
> -		res2.end = res2.start + (size * num_vfs) - 1;
> -
> -		if (res2.end > res->end) {
> -			dev_err(&dev->dev, "VF BAR%d: %pR would extend past %pR (trying to enable %d VFs shifted by %d)\n",
> -				i, &res2, res, num_vfs, offset);
> -			return -EBUSY;
> -		}
> -	}
> -
> -	/*
> -	 * Since M64 BAR shares segments among all possible 256 PEs,
> -	 * we have to shift the beginning of PF IOV BAR to make it start from
> -	 * the segment which belongs to the PE number assigned to the first VF.
> -	 * This creates a "hole" in the /proc/iomem which could be used for
> -	 * allocating other resources so we reserve this area below and
> -	 * release when IOV is released.
> -	 */
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> -		if (!res->flags || !res->parent)
> -			continue;
> -
> -		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
> -		res2 = *res;
> -		res->start += size * offset;
> -
> -		dev_info(&dev->dev, "VF BAR%d: %pR shifted to %pR (%sabling %d VFs shifted by %d)\n",
> -			 i, &res2, res, (offset > 0) ? "En" : "Dis",
> -			 num_vfs, offset);
> -
> -		if (offset < 0) {
> -			devm_release_resource(&dev->dev, &pdn->holes[i]);
> -			memset(&pdn->holes[i], 0, sizeof(pdn->holes[i]));
> -		}
> -
> -		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
> -
> -		if (offset > 0) {
> -			pdn->holes[i].start = res2.start;
> -			pdn->holes[i].end = res2.start + size * offset - 1;
> -			pdn->holes[i].flags = IORESOURCE_BUS;
> -			pdn->holes[i].name = "pnv_iov_reserved";
> -			devm_request_resource(&dev->dev, res->parent,
> -					&pdn->holes[i]);
> -		}
> -	}
> -	return 0;
> -}
> -#endif /* CONFIG_PCI_IOV */
> -
>  static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  {
>  	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
> @@ -1294,406 +1189,9 @@ static void pnv_pci_ioda_setup_nvlink(void)
>  #endif
>  }
>  
> -#ifdef CONFIG_PCI_IOV
> -static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
> -{
> -	struct pnv_phb        *phb;
> -	struct pci_dn         *pdn;
> -	int                    i, j;
> -	int                    m64_bars;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -
> -	if (pdn->m64_single_mode)
> -		m64_bars = num_vfs;
> -	else
> -		m64_bars = 1;
> -
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> -		for (j = 0; j < m64_bars; j++) {
> -			if (pdn->m64_map[j][i] == IODA_INVALID_M64)
> -				continue;
> -			opal_pci_phb_mmio_enable(phb->opal_id,
> -				OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 0);
> -			clear_bit(pdn->m64_map[j][i], &phb->ioda.m64_bar_alloc);
> -			pdn->m64_map[j][i] = IODA_INVALID_M64;
> -		}
> -
> -	kfree(pdn->m64_map);
> -	return 0;
> -}
> -
> -static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
> -{
> -	struct pnv_phb        *phb;
> -	struct pci_dn         *pdn;
> -	unsigned int           win;
> -	struct resource       *res;
> -	int                    i, j;
> -	int64_t                rc;
> -	int                    total_vfs;
> -	resource_size_t        size, start;
> -	int                    pe_num;
> -	int                    m64_bars;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -	total_vfs = pci_sriov_get_totalvfs(pdev);
> -
> -	if (pdn->m64_single_mode)
> -		m64_bars = num_vfs;
> -	else
> -		m64_bars = 1;
> -
> -	pdn->m64_map = kmalloc_array(m64_bars,
> -				     sizeof(*pdn->m64_map),
> -				     GFP_KERNEL);
> -	if (!pdn->m64_map)
> -		return -ENOMEM;
> -	/* Initialize the m64_map to IODA_INVALID_M64 */
> -	for (i = 0; i < m64_bars ; i++)
> -		for (j = 0; j < PCI_SRIOV_NUM_BARS; j++)
> -			pdn->m64_map[i][j] = IODA_INVALID_M64;
> -
> -
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> -		if (!res->flags || !res->parent)
> -			continue;
> -
> -		for (j = 0; j < m64_bars; j++) {
> -			do {
> -				win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
> -						phb->ioda.m64_bar_idx + 1, 0);
> -
> -				if (win >= phb->ioda.m64_bar_idx + 1)
> -					goto m64_failed;
> -			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
> -
> -			pdn->m64_map[j][i] = win;
> -
> -			if (pdn->m64_single_mode) {
> -				size = pci_iov_resource_size(pdev,
> -							PCI_IOV_RESOURCES + i);
> -				start = res->start + size * j;
> -			} else {
> -				size = resource_size(res);
> -				start = res->start;
> -			}
> -
> -			/* Map the M64 here */
> -			if (pdn->m64_single_mode) {
> -				pe_num = pdn->pe_num_map[j];
> -				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> -						pe_num, OPAL_M64_WINDOW_TYPE,
> -						pdn->m64_map[j][i], 0);
> -			}
> -
> -			rc = opal_pci_set_phb_mem_window(phb->opal_id,
> -						 OPAL_M64_WINDOW_TYPE,
> -						 pdn->m64_map[j][i],
> -						 start,
> -						 0, /* unused */
> -						 size);
> -
> -
> -			if (rc != OPAL_SUCCESS) {
> -				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
> -					win, rc);
> -				goto m64_failed;
> -			}
> -
> -			if (pdn->m64_single_mode)
> -				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 2);
> -			else
> -				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 1);
> -
> -			if (rc != OPAL_SUCCESS) {
> -				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
> -					win, rc);
> -				goto m64_failed;
> -			}
> -		}
> -	}
> -	return 0;
> -
> -m64_failed:
> -	pnv_pci_vf_release_m64(pdev, num_vfs);
> -	return -EBUSY;
> -}
> -
> -static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
> -
> -static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
> -{
> -	struct pnv_phb        *phb;
> -	struct pnv_ioda_pe    *pe, *pe_n;
> -	struct pci_dn         *pdn;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -
> -	if (!pdev->is_physfn)
> -		return;
> -
> -	/* FIXME: Use pnv_ioda_release_pe()? */
> -	list_for_each_entry_safe(pe, pe_n, &phb->ioda.pe_list, list) {
> -		if (pe->parent_dev != pdev)
> -			continue;
> -
> -		pnv_pci_ioda2_release_pe_dma(pe);
> -
> -		/* Remove from list */
> -		mutex_lock(&phb->ioda.pe_list_mutex);
> -		list_del(&pe->list);
> -		mutex_unlock(&phb->ioda.pe_list_mutex);
> -
> -		pnv_ioda_deconfigure_pe(phb, pe);
> -
> -		pnv_ioda_free_pe(pe);
> -	}
> -}
> -
> -static void pnv_pci_sriov_disable(struct pci_dev *pdev)
> -{
> -	struct pnv_phb        *phb;
> -	struct pnv_ioda_pe    *pe;
> -	struct pci_dn         *pdn;
> -	u16                    num_vfs, i;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -	num_vfs = pdn->num_vfs;
> -
> -	/* Release VF PEs */
> -	pnv_ioda_release_vf_PE(pdev);
> -
> -	if (phb->type == PNV_PHB_IODA2) {
> -		if (!pdn->m64_single_mode)
> -			pnv_pci_vf_resource_shift(pdev, -*pdn->pe_num_map);
> -
> -		/* Release M64 windows */
> -		pnv_pci_vf_release_m64(pdev, num_vfs);
> -
> -		/* Release PE numbers */
> -		if (pdn->m64_single_mode) {
> -			for (i = 0; i < num_vfs; i++) {
> -				if (pdn->pe_num_map[i] == IODA_INVALID_PE)
> -					continue;
> -
> -				pe = &phb->ioda.pe_array[pdn->pe_num_map[i]];
> -				pnv_ioda_free_pe(pe);
> -			}
> -		} else
> -			bitmap_clear(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
> -		/* Releasing pe_num_map */
> -		kfree(pdn->pe_num_map);
> -	}
> -}
> -
> -static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
> -				       struct pnv_ioda_pe *pe);
> -static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
> -{
> -	struct pnv_phb        *phb;
> -	struct pnv_ioda_pe    *pe;
> -	int                    pe_num;
> -	u16                    vf_index;
> -	struct pci_dn         *pdn;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -
> -	if (!pdev->is_physfn)
> -		return;
> -
> -	/* Reserve PE for each VF */
> -	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
> -		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
> -		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
> -		struct pci_dn *vf_pdn;
> -
> -		if (pdn->m64_single_mode)
> -			pe_num = pdn->pe_num_map[vf_index];
> -		else
> -			pe_num = *pdn->pe_num_map + vf_index;
> -
> -		pe = &phb->ioda.pe_array[pe_num];
> -		pe->pe_number = pe_num;
> -		pe->phb = phb;
> -		pe->flags = PNV_IODA_PE_VF;
> -		pe->pbus = NULL;
> -		pe->parent_dev = pdev;
> -		pe->mve_number = -1;
> -		pe->rid = (vf_bus << 8) | vf_devfn;
> -
> -		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
> -			pci_domain_nr(pdev->bus), pdev->bus->number,
> -			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
> -
> -		if (pnv_ioda_configure_pe(phb, pe)) {
> -			/* XXX What do we do here ? */
> -			pnv_ioda_free_pe(pe);
> -			pe->pdev = NULL;
> -			continue;
> -		}
> -
> -		/* Put PE to the list */
> -		mutex_lock(&phb->ioda.pe_list_mutex);
> -		list_add_tail(&pe->list, &phb->ioda.pe_list);
> -		mutex_unlock(&phb->ioda.pe_list_mutex);
> -
> -		/* associate this pe to it's pdn */
> -		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
> -			if (vf_pdn->busno == vf_bus &&
> -			    vf_pdn->devfn == vf_devfn) {
> -				vf_pdn->pe_number = pe_num;
> -				break;
> -			}
> -		}
> -
> -		pnv_pci_ioda2_setup_dma_pe(phb, pe);
> -	}
> -}
> -
> -static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
> -{
> -	struct pnv_phb        *phb;
> -	struct pnv_ioda_pe    *pe;
> -	struct pci_dn         *pdn;
> -	int                    ret;
> -	u16                    i;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -
> -	if (phb->type == PNV_PHB_IODA2) {
> -		if (!pdn->vfs_expanded) {
> -			dev_info(&pdev->dev, "don't support this SRIOV device"
> -				" with non 64bit-prefetchable IOV BAR\n");
> -			return -ENOSPC;
> -		}
> -
> -		/*
> -		 * When M64 BARs functions in Single PE mode, the number of VFs
> -		 * could be enabled must be less than the number of M64 BARs.
> -		 */
> -		if (pdn->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
> -			dev_info(&pdev->dev, "Not enough M64 BAR for VFs\n");
> -			return -EBUSY;
> -		}
> -
> -		/* Allocating pe_num_map */
> -		if (pdn->m64_single_mode)
> -			pdn->pe_num_map = kmalloc_array(num_vfs,
> -							sizeof(*pdn->pe_num_map),
> -							GFP_KERNEL);
> -		else
> -			pdn->pe_num_map = kmalloc(sizeof(*pdn->pe_num_map), GFP_KERNEL);
> -
> -		if (!pdn->pe_num_map)
> -			return -ENOMEM;
> -
> -		if (pdn->m64_single_mode)
> -			for (i = 0; i < num_vfs; i++)
> -				pdn->pe_num_map[i] = IODA_INVALID_PE;
> -
> -		/* Calculate available PE for required VFs */
> -		if (pdn->m64_single_mode) {
> -			for (i = 0; i < num_vfs; i++) {
> -				pe = pnv_ioda_alloc_pe(phb);
> -				if (!pe) {
> -					ret = -EBUSY;
> -					goto m64_failed;
> -				}
> -
> -				pdn->pe_num_map[i] = pe->pe_number;
> -			}
> -		} else {
> -			mutex_lock(&phb->ioda.pe_alloc_mutex);
> -			*pdn->pe_num_map = bitmap_find_next_zero_area(
> -				phb->ioda.pe_alloc, phb->ioda.total_pe_num,
> -				0, num_vfs, 0);
> -			if (*pdn->pe_num_map >= phb->ioda.total_pe_num) {
> -				mutex_unlock(&phb->ioda.pe_alloc_mutex);
> -				dev_info(&pdev->dev, "Failed to enable VF%d\n", num_vfs);
> -				kfree(pdn->pe_num_map);
> -				return -EBUSY;
> -			}
> -			bitmap_set(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
> -			mutex_unlock(&phb->ioda.pe_alloc_mutex);
> -		}
> -		pdn->num_vfs = num_vfs;
> -
> -		/* Assign M64 window accordingly */
> -		ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
> -		if (ret) {
> -			dev_info(&pdev->dev, "Not enough M64 window resources\n");
> -			goto m64_failed;
> -		}
> -
> -		/*
> -		 * When using one M64 BAR to map one IOV BAR, we need to shift
> -		 * the IOV BAR according to the PE# allocated to the VFs.
> -		 * Otherwise, the PE# for the VF will conflict with others.
> -		 */
> -		if (!pdn->m64_single_mode) {
> -			ret = pnv_pci_vf_resource_shift(pdev, *pdn->pe_num_map);
> -			if (ret)
> -				goto m64_failed;
> -		}
> -	}
> -
> -	/* Setup VF PEs */
> -	pnv_ioda_setup_vf_PE(pdev, num_vfs);
> -
> -	return 0;
> -
> -m64_failed:
> -	if (pdn->m64_single_mode) {
> -		for (i = 0; i < num_vfs; i++) {
> -			if (pdn->pe_num_map[i] == IODA_INVALID_PE)
> -				continue;
> -
> -			pe = &phb->ioda.pe_array[pdn->pe_num_map[i]];
> -			pnv_ioda_free_pe(pe);
> -		}
> -	} else
> -		bitmap_clear(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
> -
> -	/* Releasing pe_num_map */
> -	kfree(pdn->pe_num_map);
> -
> -	return ret;
> -}
> -
> -static int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
> -{
> -	pnv_pci_sriov_disable(pdev);
> -
> -	/* Release PCI data */
> -	remove_sriov_vf_pdns(pdev);
> -	return 0;
> -}
> -
> -static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
> -{
> -	/* Allocate PCI data */
> -	add_sriov_vf_pdns(pdev);
> -
> -	return pnv_pci_sriov_enable(pdev, num_vfs);
> -}
> -#endif /* CONFIG_PCI_IOV */
> -
>  static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
>  				       struct pnv_ioda_pe *pe);
>  
> -static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
> -				       struct pnv_ioda_pe *pe);
> -
>  static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
>  {
>  	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> @@ -2559,8 +2057,8 @@ static struct iommu_table_group_ops pnv_pci_ioda2_ops = {
>  };
>  #endif
>  
> -static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
> -				       struct pnv_ioda_pe *pe)
> +void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
> +				struct pnv_ioda_pe *pe)
>  {
>  	int64_t rc;
>  
> @@ -2737,117 +2235,6 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
>  		count, phb->msi_base);
>  }
>  
> -#ifdef CONFIG_PCI_IOV
> -static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
> -{
> -	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> -	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
> -	struct resource *res;
> -	int i;
> -	resource_size_t size, total_vf_bar_sz;
> -	struct pci_dn *pdn;
> -	int mul, total_vfs;
> -
> -	pdn = pci_get_pdn(pdev);
> -	pdn->vfs_expanded = 0;
> -	pdn->m64_single_mode = false;
> -
> -	total_vfs = pci_sriov_get_totalvfs(pdev);
> -	mul = phb->ioda.total_pe_num;
> -	total_vf_bar_sz = 0;
> -
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> -		if (!res->flags || res->parent)
> -			continue;
> -		if (!pnv_pci_is_m64_flags(res->flags)) {
> -			dev_warn(&pdev->dev, "Don't support SR-IOV with"
> -					" non M64 VF BAR%d: %pR. \n",
> -				 i, res);
> -			goto truncate_iov;
> -		}
> -
> -		total_vf_bar_sz += pci_iov_resource_size(pdev,
> -				i + PCI_IOV_RESOURCES);
> -
> -		/*
> -		 * If bigger than quarter of M64 segment size, just round up
> -		 * power of two.
> -		 *
> -		 * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
> -		 * with other devices, IOV BAR size is expanded to be
> -		 * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
> -		 * segment size , the expanded size would equal to half of the
> -		 * whole M64 space size, which will exhaust the M64 Space and
> -		 * limit the system flexibility.  This is a design decision to
> -		 * set the boundary to quarter of the M64 segment size.
> -		 */
> -		if (total_vf_bar_sz > gate) {
> -			mul = roundup_pow_of_two(total_vfs);
> -			dev_info(&pdev->dev,
> -				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
> -				total_vf_bar_sz, gate, mul);
> -			pdn->m64_single_mode = true;
> -			break;
> -		}
> -	}
> -
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> -		if (!res->flags || res->parent)
> -			continue;
> -
> -		size = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
> -		/*
> -		 * On PHB3, the minimum size alignment of M64 BAR in single
> -		 * mode is 32MB.
> -		 */
> -		if (pdn->m64_single_mode && (size < SZ_32M))
> -			goto truncate_iov;
> -		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
> -		res->end = res->start + size * mul - 1;
> -		dev_dbg(&pdev->dev, "                       %pR\n", res);
> -		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
> -			 i, res, mul);
> -	}
> -	pdn->vfs_expanded = mul;
> -
> -	return;
> -
> -truncate_iov:
> -	/* To save MMIO space, IOV BAR is truncated. */
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> -		res->flags = 0;
> -		res->end = res->start - 1;
> -	}
> -}
> -
> -static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
> -{
> -	if (WARN_ON(pci_dev_is_added(pdev)))
> -		return;
> -
> -	if (pdev->is_virtfn) {
> -		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
> -
> -		/*
> -		 * VF PEs are single-device PEs so their pdev pointer needs to
> -		 * be set. The pdev doesn't exist when the PE is allocated (in
> -		 * (pcibios_sriov_enable()) so we fix it up here.
> -		 */
> -		pe->pdev = pdev;
> -		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
> -	} else if (pdev->is_physfn) {
> -		/*
> -		 * For PFs adjust their allocated IOV resources to match what
> -		 * the PHB can support using it's M64 BAR table.
> -		 */
> -		pnv_pci_ioda_fixup_iov_resources(pdev);
> -	}
> -}
> -#endif /* CONFIG_PCI_IOV */
> -
>  static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
>  				  struct resource *res)
>  {
> @@ -3192,41 +2579,6 @@ static resource_size_t pnv_pci_default_alignment(void)
>  	return PAGE_SIZE;
>  }
>  
> -#ifdef CONFIG_PCI_IOV
> -static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
> -						      int resno)
> -{
> -	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> -	struct pci_dn *pdn = pci_get_pdn(pdev);
> -	resource_size_t align;
> -
> -	/*
> -	 * On PowerNV platform, IOV BAR is mapped by M64 BAR to enable the
> -	 * SR-IOV. While from hardware perspective, the range mapped by M64
> -	 * BAR should be size aligned.
> -	 *
> -	 * When IOV BAR is mapped with M64 BAR in Single PE mode, the extra
> -	 * powernv-specific hardware restriction is gone. But if just use the
> -	 * VF BAR size as the alignment, PF BAR / VF BAR may be allocated with
> -	 * in one segment of M64 #15, which introduces the PE conflict between
> -	 * PF and VF. Based on this, the minimum alignment of an IOV BAR is
> -	 * m64_segsize.
> -	 *
> -	 * This function returns the total IOV BAR size if M64 BAR is in
> -	 * Shared PE mode or just VF BAR size if not.
> -	 * If the M64 BAR is in Single PE mode, return the VF BAR size or
> -	 * M64 segment size if IOV BAR size is less.
> -	 */
> -	align = pci_iov_resource_size(pdev, resno);
> -	if (!pdn->vfs_expanded)
> -		return align;
> -	if (pdn->m64_single_mode)
> -		return max(align, (resource_size_t)phb->ioda.m64_segsize);
> -
> -	return pdn->vfs_expanded * align;
> -}
> -#endif /* CONFIG_PCI_IOV */
> -
>  /* Prevent enabling devices for which we couldn't properly
>   * assign a PE
>   */
> @@ -3323,7 +2675,7 @@ static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
>  	iommu_tce_table_put(tbl);
>  }
>  
> -static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
> +void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
>  {
>  	struct iommu_table *tbl = pe->table_group.tables[0];
>  	int64_t rc;
> @@ -3436,12 +2788,23 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> +	/* The VF PE state is torn down when sriov_disable() is called */
>  	if (pdev->is_virtfn)
>  		return;
>  
>  	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
>  		return;
>  
> +#ifdef CONFIG_PCI_IOV
> +	/*
> +	 * FIXME: Try move this to sriov_disable(). It's here since we allocate
> +	 * the iov state at probe time since we need to fiddle with the IOV
> +	 * resources.
> +	 */
> +	if (pdev->is_physfn)
> +		kfree(pdev->dev.archdata.iov_data);
> +#endif
> +
>  	/*
>  	 * PCI hotplug can happen as part of EEH error recovery. The @pdn
>  	 * isn't removed and added afterwards in this scenario. We should
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> new file mode 100644
> index 000000000000..080ea39f5a83
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -0,0 +1,642 @@
> +// SPDX-License-Identifier: GPL-2.0

Not SPDX-License-Identifier: GPL-2.0-or-later ?


> +
> +#include <linux/kernel.h>
> +#include <linux/ioport.h>
> +#include <linux/bitmap.h>
> +#include <linux/pci.h>
> +
> +#include <asm/opal.h>
> +
> +#include "pci.h"
> +
> +/* for pci_dev_is_added() */
> +#include "../../../../drivers/pci/pci.h"
> +
> +
> +static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
> +{
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> +	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
> +	struct resource *res;
> +	int i;
> +	resource_size_t size, total_vf_bar_sz;
> +	struct pnv_iov_data *iov;
> +	int mul, total_vfs;
> +
> +	iov = kzalloc(sizeof(*iov), GFP_KERNEL);
> +	if (!iov)
> +		goto truncate_iov;
> +	pdev->dev.archdata.iov_data = iov;
> +
> +	total_vfs = pci_sriov_get_totalvfs(pdev);
> +	mul = phb->ioda.total_pe_num;
> +	total_vf_bar_sz = 0;
> +
> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> +		if (!res->flags || res->parent)
> +			continue;
> +		if (!pnv_pci_is_m64_flags(res->flags)) {
> +			dev_warn(&pdev->dev, "Don't support SR-IOV with"
> +					" non M64 VF BAR%d: %pR. \n",
> +				 i, res);
> +			goto truncate_iov;
> +		}
> +
> +		total_vf_bar_sz += pci_iov_resource_size(pdev,
> +				i + PCI_IOV_RESOURCES);
> +
> +		/*
> +		 * If bigger than quarter of M64 segment size, just round up
> +		 * power of two.
> +		 *
> +		 * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
> +		 * with other devices, IOV BAR size is expanded to be
> +		 * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
> +		 * segment size , the expanded size would equal to half of the
> +		 * whole M64 space size, which will exhaust the M64 Space and
> +		 * limit the system flexibility.  This is a design decision to
> +		 * set the boundary to quarter of the M64 segment size.
> +		 */
> +		if (total_vf_bar_sz > gate) {
> +			mul = roundup_pow_of_two(total_vfs);
> +			dev_info(&pdev->dev,
> +				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
> +				total_vf_bar_sz, gate, mul);
> +			iov->m64_single_mode = true;
> +			break;
> +		}
> +	}
> +
> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> +		if (!res->flags || res->parent)
> +			continue;
> +
> +		size = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
> +		/*
> +		 * On PHB3, the minimum size alignment of M64 BAR in single
> +		 * mode is 32MB.
> +		 */
> +		if (iov->m64_single_mode && (size < SZ_32M))
> +			goto truncate_iov;
> +		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
> +		res->end = res->start + size * mul - 1;
> +		dev_dbg(&pdev->dev, "                       %pR\n", res);
> +		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
> +			 i, res, mul);
> +	}
> +	iov->vfs_expanded = mul;
> +
> +	return;
> +
> +truncate_iov:
> +	/* To save MMIO space, IOV BAR is truncated. */
> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> +		res->flags = 0;
> +		res->end = res->start - 1;
> +	}
> +
> +	pdev->dev.archdata.iov_data = NULL;
> +	kfree(iov);
> +}
> +
> +void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
> +{
> +	if (WARN_ON(pci_dev_is_added(pdev)))
> +		return;
> +
> +	if (pdev->is_virtfn) {
> +		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
> +
> +		/*
> +		 * VF PEs are single-device PEs so their pdev pointer needs to
> +		 * be set. The pdev doesn't exist when the PE is allocated (in
> +		 * (pcibios_sriov_enable()) so we fix it up here.
> +		 */
> +		pe->pdev = pdev;
> +		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
> +	} else if (pdev->is_physfn) {
> +		/*
> +		 * For PFs adjust their allocated IOV resources to match what
> +		 * the PHB can support using it's M64 BAR table.
> +		 */
> +		pnv_pci_ioda_fixup_iov_resources(pdev);
> +	}
> +}
> +
> +resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
> +						      int resno)
> +{
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> +	struct pnv_iov_data *iov = pnv_iov_get(pdev);
> +	resource_size_t align;
> +
> +	/*
> +	 * On PowerNV platform, IOV BAR is mapped by M64 BAR to enable the
> +	 * SR-IOV. While from hardware perspective, the range mapped by M64
> +	 * BAR should be size aligned.
> +	 *
> +	 * When IOV BAR is mapped with M64 BAR in Single PE mode, the extra
> +	 * powernv-specific hardware restriction is gone. But if just use the
> +	 * VF BAR size as the alignment, PF BAR / VF BAR may be allocated with
> +	 * in one segment of M64 #15, which introduces the PE conflict between
> +	 * PF and VF. Based on this, the minimum alignment of an IOV BAR is
> +	 * m64_segsize.
> +	 *
> +	 * This function returns the total IOV BAR size if M64 BAR is in
> +	 * Shared PE mode or just VF BAR size if not.
> +	 * If the M64 BAR is in Single PE mode, return the VF BAR size or
> +	 * M64 segment size if IOV BAR size is less.
> +	 */
> +	align = pci_iov_resource_size(pdev, resno);
> +
> +	/*
> +	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
> +	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
> +	 * In that case we don't allow VFs to be enabled so just return the
> +	 * default alignment.
> +	 */
> +	if (!iov)
> +		return align;


This is the new chunk. What would happen before? Non-prefetch BAR would
still go to m64 space?

The rest is accurate.




-- 
Alexey
