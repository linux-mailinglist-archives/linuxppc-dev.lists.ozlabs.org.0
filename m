Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0DF220455
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 07:26:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B65Tb4JvkzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 15:26:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=duYG8lOU; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B65Rr6CQKzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 15:24:54 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id mn17so2467046pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 22:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WHz11CIl1lfzeXmWisJzAk5j7wWfllyZmHJa/n47DhE=;
 b=duYG8lOURxZdBBn5k2be2Gj14ZNaGyxy+4i0DRfMh8ODXD/vjrgscTw06627AW0UY+
 Po1wlmLaWfg7jqbUINt7M57DlxjtbLlApk1zi9ssbgcv77PivzaxYPih2fUF3H5l1Lvd
 +TFs/AsZwAmauUouqBWV1ipXp6AfR2uGwhnSTPXpzT0lyug3dN1jUUgyo9tK/LkWBVvT
 RHcypejm4pOVWfSbW4qkengPIekscAT0TR1zS38eFVCG1OdoMSGAd7DlmISgsujuoLS1
 yeVqkET/RJCG7LXqnykb1UlrYTV5h30JRkGIiGayzonk62RZemRWhmBHlGDE0d4YmQK8
 Ys5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WHz11CIl1lfzeXmWisJzAk5j7wWfllyZmHJa/n47DhE=;
 b=kb9kmVB/iXcrOQt5OAqO9ICmCUyJCrKvQO3Q+trGZM6Q9kDsY9fSP5ZpT7NeU6VijC
 nwEgUPyirK6K2uz97er8253sU0ss2Cx22oIrtbmrEErXLvdnjCaMnLBaZhShyRUwDHic
 2t4AXJ9CVJWPHVsqKMapHpXz1TJwVsIyqL9GlpoyxlWTegLuaNZm95UUtFwn3B9mJt9E
 iFOqfp98ttkEEZvh+UO5gm51qTc2t1p9vM/7MeMNg+VACJX/T6CLUBH5VaHfimed/QbY
 Xv3xyOMjBUBJl6kT9Io+53m/QbnhJbjIe1IcHfnPWTvDuVklOHCtGyV4vXP+BwNwkT23
 kgsA==
X-Gm-Message-State: AOAM531ZkPvqitJFudaLAiYvzNYSB1CywdwEm9dhXCgSU8hV8FCn4voQ
 I+AqMFJnk9JpgKw7SA6epaXZ/FfP6kNbXA==
X-Google-Smtp-Source: ABdhPJzRU1/mSnt9z49svlqhifKR/k8DxtiDgUQHxw8ZhfJiPaj5b/03LPsxCTIXo8wI19KGG2EK9A==
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr7084228plo.57.1594790692399; 
 Tue, 14 Jul 2020 22:24:52 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id k23sm811446pgb.92.2020.07.14.22.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 22:24:51 -0700 (PDT)
Subject: Re: [PATCH 15/15] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-16-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <c89dfd04-afc2-4d69-00ab-2e743d5bb844@ozlabs.ru>
Date: Wed, 15 Jul 2020 15:24:48 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-16-oohall@gmail.com>
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
> Using single PE BARs to map an SR-IOV BAR is really a choice about what
> strategy to use when mapping a BAR. It doesn't make much sense for this to
> be a global setting since a device might have one large BAR which needs to
> be mapped with single PE windows and another smaller BAR that can be mapped
> with a regular segmented window. Make the segmented vs single decision a
> per-BAR setting and clean up the logic that decides which mode to use.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-sriov.c | 131 +++++++++++----------
>  arch/powerpc/platforms/powernv/pci.h       |  10 +-
>  2 files changed, 75 insertions(+), 66 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index 8de03636888a..87377d95d648 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -146,10 +146,9 @@
>  static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  {
>  	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> -	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
>  	struct resource *res;
>  	int i;
> -	resource_size_t size, total_vf_bar_sz;
> +	resource_size_t vf_bar_sz;
>  	struct pnv_iov_data *iov;
>  	int mul, total_vfs;
>  
> @@ -158,9 +157,9 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  		goto disable_iov;
>  	pdev->dev.archdata.iov_data = iov;
>  
> +	/* FIXME: totalvfs > phb->ioda.total_pe_num is going to be a problem */


WARN_ON_ONCE() then?


>  	total_vfs = pci_sriov_get_totalvfs(pdev);
>  	mul = phb->ioda.total_pe_num;
> -	total_vf_bar_sz = 0;
>  
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
>  		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> @@ -173,50 +172,51 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  			goto disable_iov;
>  		}
>  
> -		total_vf_bar_sz += pci_iov_resource_size(pdev,
> -				i + PCI_IOV_RESOURCES);
> +		vf_bar_sz = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
>  
>  		/*
> -		 * If bigger than quarter of M64 segment size, just round up
> -		 * power of two.
> +		 * Generally, one segmented M64 BAR maps one IOV BAR. However,
> +		 * if a VF BAR is too large we end up wasting a lot of space.
> +		 * If we've got a BAR that's bigger than greater than 1/4 of the


bigger, greater, huger? :)

Also, a nit: s/got a BAR/got a VF BAR/


> +		 * default window's segment size then switch to using single PE
> +		 * windows. This limits the total number of VFs we can support.

Just to get idea about absolute numbers here.

On my P9:

./pciex@600c3c0300000/ibm,opal-m64-window
                 00060200 00000000 00060200 00000000 00000040 00000000

so that default window's segment size is 0x40.0000.0000/512 = 512MB?


>  		 *
> -		 * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
> -		 * with other devices, IOV BAR size is expanded to be
> -		 * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
> -		 * segment size , the expanded size would equal to half of the
> -		 * whole M64 space size, which will exhaust the M64 Space and
> -		 * limit the system flexibility.  This is a design decision to
> -		 * set the boundary to quarter of the M64 segment size.
> +		 * The 1/4 limit is arbitrary and can be tweaked.
>  		 */
> -		if (total_vf_bar_sz > gate) {
> -			mul = roundup_pow_of_two(total_vfs);
> -			dev_info(&pdev->dev,
> -				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
> -				total_vf_bar_sz, gate, mul);
> -			iov->m64_single_mode = true;
> -			break;
> -		}
> -	}
> +		if (vf_bar_sz > (phb->ioda.m64_segsize >> 2)) {
> +			/*
> +			 * On PHB3, the minimum size alignment of M64 BAR in
> +			 * single mode is 32MB. If this VF BAR is smaller than
> +			 * 32MB, but still too large for a segmented window
> +			 * then we can't map it and need to disable SR-IOV for
> +			 * this device.


Why not use single PE mode for such BAR? Better than nothing.


> +			 */
> +			if (vf_bar_sz < SZ_32M) {
> +				pci_err(pdev, "VF BAR%d: %pR can't be mapped in single PE mode\n",
> +					i, res);
> +				goto disable_iov;
> +			}
>  
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &pdev->resource[i + PCI_IOV_RESOURCES];
> -		if (!res->flags || res->parent)
> +			iov->m64_single_mode[i] = true;
>  			continue;
> +		}
> +
>  
> -		size = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
>  		/*
> -		 * On PHB3, the minimum size alignment of M64 BAR in single
> -		 * mode is 32MB.
> +		 * This BAR can be mapped with one segmented window, so adjust
> +		 * te resource size to accommodate.
>  		 */
> -		if (iov->m64_single_mode && (size < SZ_32M))
> -			goto disable_iov;
> +		pci_dbg(pdev, " Fixing VF BAR%d: %pR to\n", i, res);
> +		res->end = res->start + vf_bar_sz * mul - 1;
> +		pci_dbg(pdev, "                       %pR\n", res);
>  
> -		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
> -		res->end = res->start + size * mul - 1;
> -		dev_dbg(&pdev->dev, "                       %pR\n", res);
> -		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
> +		pci_info(pdev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
>  			 i, res, mul);
> +
> +		iov->need_shift = true;
>  	}
> +
> +	// what should this be?
>  	iov->vfs_expanded = mul;
>  
>  	return;
> @@ -260,42 +260,42 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
>  resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>  						      int resno)
>  {
> -	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pnv_iov_data *iov = pnv_iov_get(pdev);
>  	resource_size_t align;
>  
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
> +	int bar_no = resno - PCI_IOV_RESOURCES;
>  
>  	/*
>  	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
>  	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
> -	 * In that case we don't allow VFs to be enabled so just return the
> -	 * default alignment.
> +	 * In that case we don't allow VFs to be enabled since one of their
> +	 * BARs would not be placed in the correct PE.
>  	 */
>  	if (!iov)
>  		return align;
>  	if (!iov->vfs_expanded)
>  		return align;
> -	if (iov->m64_single_mode)
> -		return max(align, (resource_size_t)phb->ioda.m64_segsize);
>  
> +	align = pci_iov_resource_size(pdev, resno);
> +
> +	/*
> +	 * If we're using single mode then we can just use the native VF BAR
> +	 * alignment. We validated that it's possible to use a single PE
> +	 * window above when we did the fixup.
> +	 */
> +	if (iov->m64_single_mode[bar_no])
> +		return align;
> +
> +	/*
> +	 * On PowerNV platform, IOV BAR is mapped by M64 BAR to enable the
> +	 * SR-IOV. While from hardware perspective, the range mapped by M64
> +	 * BAR should be size aligned.
> +	 *
> +	 * This function returns the total IOV BAR size if M64 BAR is in
> +	 * Shared PE mode or just VF BAR size if not.
> +	 * If the M64 BAR is in Single PE mode, return the VF BAR size or
> +	 * M64 segment size if IOV BAR size is less.
> +	 */
>  	return iov->vfs_expanded * align;
>  }
>  
> @@ -453,7 +453,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  			continue;
>  
>  		/* don't need single mode? map everything in one go! */
> -		if (!iov->m64_single_mode) {
> +		if (!iov->m64_single_mode[i]) {
>  			win = pnv_pci_alloc_m64_bar(phb, iov);
>  			if (win < 0)
>  				goto m64_failed;
> @@ -546,6 +546,8 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  		res = &dev->resource[i + PCI_IOV_RESOURCES];
>  		if (!res->flags || !res->parent)
>  			continue;
> +		if (iov->m64_single_mode[i])
> +			continue;
>  
>  		/*
>  		 * The actual IOV BAR range is determined by the start address
> @@ -577,6 +579,8 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  		res = &dev->resource[i + PCI_IOV_RESOURCES];
>  		if (!res->flags || !res->parent)
>  			continue;
> +		if (iov->m64_single_mode[i])
> +			continue;
>  
>  		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
>  		res2 = *res;
> @@ -622,8 +626,8 @@ static void pnv_pci_sriov_disable(struct pci_dev *pdev)
>  	/* Release VF PEs */
>  	pnv_ioda_release_vf_PE(pdev);
>  
> -	/* Un-shift the IOV BAR resources */
> -	if (!iov->m64_single_mode)
> +	/* Un-shift the IOV BARs if we need to */
> +	if (iov->need_shift)
>  		pnv_pci_vf_resource_shift(pdev, -base_pe);
>  
>  	/* Release M64 windows */
> @@ -741,9 +745,8 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  	 * the IOV BAR according to the PE# allocated to the VFs.
>  	 * Otherwise, the PE# for the VF will conflict with others.
>  	 */
> -	if (!iov->m64_single_mode) {
> -		ret = pnv_pci_vf_resource_shift(pdev,
> -						base_pe->pe_number);
> +	if (iov->need_shift) {
> +		ret = pnv_pci_vf_resource_shift(pdev, base_pe->pe_number);
>  		if (ret)
>  			goto shift_failed;
>  	}
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 13555bc549f4..a78d1feb8fb8 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -236,14 +236,20 @@ struct pnv_iov_data {
>  	/* number of VFs IOV BAR expanded. FIXME: rename this to something less bad */
>  	u16     vfs_expanded;
>  
> +	/*
> +	 * indicates if we need to move our IOV BAR to account for our
> +	 * allocated PE number when enabling VFs.
> +	 */
> +	bool    need_shift;
> +
>  	/* number of VFs enabled */
>  	u16     num_vfs;
>  
>  	/* pointer to the array of VF PEs. num_vfs long*/
>  	struct pnv_ioda_pe *vf_pe_arr;
>  
> -	/* Did we map the VF BARs with single-PE IODA BARs? */
> -	bool    m64_single_mode;
> +	/* Did we map the VF BAR with single-PE IODA BARs? */
> +	bool    m64_single_mode[PCI_SRIOV_NUM_BARS];
>  
>  	/*
>  	 * Bit mask used to track which m64 windows that we used to map the
> 

-- 
Alexey
