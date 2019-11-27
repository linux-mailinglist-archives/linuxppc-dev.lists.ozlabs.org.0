Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25F10A94B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 05:11:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N6m975ZPzDql5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 15:11:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="ZPAAfeJ9"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N6jt5WRzzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 15:09:53 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so4961200plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 20:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z5QykGyiyriLpQdPZcR58CFcH6MX/OJ9qh+EiT5+bmg=;
 b=ZPAAfeJ9ok4v5o9+LiubN34yY1zxszqtLx+7uE4rmANW+U5VRgzG1S3rwJT8ebkEV0
 ExpXqaBP7LTftJCT8O3F5HJvNG9+ICbMeU/VJqpd4wV+tAH0UhsFLAD5Y+hzjxzO5CGt
 Bw5Q6T2F1Ng59L5SgeqMQDw6GHa+6CZVVOvmNe5mn7KtlgA7bnB+BSS0rW4UqSK5vqCa
 yW47stEKw23M5lKTSfa7QSK3UGBpmGwzeuSMq35oNQt86EGflCJEXjZOGgDtgV8IHgxV
 x/1OM1t85ZI5gg+WW2QSy0fV/uwRNy+y0Xmf9ZluqJw38Kdakm21e1EAff++nmWxew49
 avgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z5QykGyiyriLpQdPZcR58CFcH6MX/OJ9qh+EiT5+bmg=;
 b=Z4dvoowFWcHWBbGRr9u43GFdUKi1zZpFoupc1pVF/Q5cACy+chG7BDHOZtwFVLl3er
 tkYR/NZemB3zMahdLajO8hUTfX9jGRs44X4DOtseeHzFkCh0pWrvdlQxxzMNWlvNSQFD
 Itf/xPf18TNIAJFU2qrFaksyD/AQqJK5kZr2BczASgOdSGV/swiJB72jH76nxY9wbKWf
 qqdXMHvJ+dqb75RBsjf7lCMPahoZptIaCN1bFWP7gExyPBoZEPuStuI4DFU0t/seajbT
 NElBQHISkL4Bl8qYUuV9356QY11pvmPbF7c68BhoM5ZI9papv2sciWUMI5qYB6yZEJda
 v+Fg==
X-Gm-Message-State: APjAAAVKGsKD34Zhupr57ijtcJ/dU87Q7JOLeiHKvyulsXhn2U/bfpU3
 lACXwEXKeSPXUFkEeRTzhWFNYg==
X-Google-Smtp-Source: APXvYqw2gh3gbryemQfN5M/7Ija5xA9fxZfdUcCsf7ALnxUYN39wD0mBxDnOY2oeyFVOxQgb2D8Irw==
X-Received: by 2002:a17:90b:908:: with SMTP id bo8mr3346558pjb.1.1574827789746; 
 Tue, 26 Nov 2019 20:09:49 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x186sm14101704pfx.105.2019.11.26.20.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 20:09:49 -0800 (PST)
Subject: Re: [Very RFC 28/46] powernv/iov: Move SR-IOV PF state out of pci_dn
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-29-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <195c9cf8-75b9-2d30-f53f-234a7c9eb604@ozlabs.ru>
Date: Wed, 27 Nov 2019 15:09:45 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-29-oohall@gmail.com>
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
Cc: alistair@popple.id.au, s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/11/2019 12:28, Oliver O'Halloran wrote:
> Move the SR-IOV into a platform specific structure. I'm sure stashing all the
> SR-IOV state in pci_dn seemed like a good idea at the time, but it results in a
> lot of powernv specifics being leaked out of the platform directory.
> 
> Moving all the PHB3/4 specific M64 BAR wrangling into a PowerNV specific
> structure helps to clarify the role of pci_dn and ensures that the platform
> specifics stay that way.
> 
> This will make the code easier to understand and modify since we don't need
> to so much aboute PowerNV changes breaking pseries and EEH, and vis-a-vis.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> TODO: Remove all the sriov stuff from pci_dn. We can't do that yet because
> the pseries SRIOV support was a giant hack that re-used some of the
> previously powernv specific fields.
> ---
>  arch/powerpc/include/asm/device.h         |   3 +
>  arch/powerpc/platforms/powernv/pci-ioda.c | 199 ++++++++++++----------
>  arch/powerpc/platforms/powernv/pci.h      |  36 ++++
>  3 files changed, 148 insertions(+), 90 deletions(-)
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
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index a1c9315f3208..1c90feed233d 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -966,14 +966,15 @@ static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>  #ifdef CONFIG_PCI_IOV
>  static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  {
> -	struct pci_dn *pdn = pci_get_pdn(dev);
> -	int i;
>  	struct resource *res, res2;
> +	struct pnv_iov_data *iov;
>  	resource_size_t size;
>  	u16 num_vfs;
> +	int i;
>  
>  	if (!dev->is_physfn)
>  		return -EINVAL;
> +	iov = pnv_iov_get(dev);
>  
>  	/*
>  	 * "offset" is in VFs.  The M64 windows are sized so that when they
> @@ -983,7 +984,7 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  	 * separate PE, and changing the IOV BAR start address changes the
>  	 * range of PEs the VFs are in.
>  	 */
> -	num_vfs = pdn->num_vfs;
> +	num_vfs = iov->num_vfs;
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
>  		res = &dev->resource[i + PCI_IOV_RESOURCES];
>  		if (!res->flags || !res->parent)
> @@ -1029,19 +1030,19 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  			 num_vfs, offset);
>  
>  		if (offset < 0) {
> -			devm_release_resource(&dev->dev, &pdn->holes[i]);
> -			memset(&pdn->holes[i], 0, sizeof(pdn->holes[i]));
> +			devm_release_resource(&dev->dev, &iov->holes[i]);
> +			memset(&iov->holes[i], 0, sizeof(iov->holes[i]));
>  		}
>  
>  		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
>  
>  		if (offset > 0) {
> -			pdn->holes[i].start = res2.start;
> -			pdn->holes[i].end = res2.start + size * offset - 1;
> -			pdn->holes[i].flags = IORESOURCE_BUS;
> -			pdn->holes[i].name = "pnv_iov_reserved";
> +			iov->holes[i].start = res2.start;
> +			iov->holes[i].end = res2.start + size * offset - 1;
> +			iov->holes[i].flags = IORESOURCE_BUS;
> +			iov->holes[i].name = "pnv_iov_reserved";
>  			devm_request_resource(&dev->dev, res->parent,
> -					&pdn->holes[i]);
> +					&iov->holes[i]);
>  		}
>  	}
>  	return 0;
> @@ -1273,37 +1274,37 @@ static void pnv_pci_ioda_setup_PEs(void)
>  #ifdef CONFIG_PCI_IOV
>  static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
> +	struct pnv_iov_data   *iov;
>  	struct pnv_phb        *phb;
> -	struct pci_dn         *pdn;
>  	int                    i, j;
>  	int                    m64_bars;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> +	iov = pnv_iov_get(pdev);
>  
> -	if (pdn->m64_single_mode)
> +	if (iov->m64_single_mode)
>  		m64_bars = num_vfs;
>  	else
>  		m64_bars = 1;
>  
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
>  		for (j = 0; j < m64_bars; j++) {
> -			if (pdn->m64_map[j][i] == IODA_INVALID_M64)
> +			if (iov->m64_map[j][i] == IODA_INVALID_M64)
>  				continue;
>  			opal_pci_phb_mmio_enable(phb->opal_id,
> -				OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 0);
> -			clear_bit(pdn->m64_map[j][i], &phb->ioda.m64_bar_alloc);
> -			pdn->m64_map[j][i] = IODA_INVALID_M64;
> +				OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 0);
> +			clear_bit(iov->m64_map[j][i], &phb->ioda.m64_bar_alloc);
> +			iov->m64_map[j][i] = IODA_INVALID_M64;
>  		}
>  
> -	kfree(pdn->m64_map);
> +	kfree(iov->m64_map);
>  	return 0;
>  }
>  
>  static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
> +	struct pnv_iov_data   *iov;
>  	struct pnv_phb        *phb;
> -	struct pci_dn         *pdn;
>  	unsigned int           win;
>  	struct resource       *res;
>  	int                    i, j;
> @@ -1314,23 +1315,23 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  	int                    m64_bars;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> +	iov = pnv_iov_get(pdev);
>  	total_vfs = pci_sriov_get_totalvfs(pdev);
>  
> -	if (pdn->m64_single_mode)
> +	if (iov->m64_single_mode)
>  		m64_bars = num_vfs;
>  	else
>  		m64_bars = 1;
>  
> -	pdn->m64_map = kmalloc_array(m64_bars,
> -				     sizeof(*pdn->m64_map),
> +	iov->m64_map = kmalloc_array(m64_bars,
> +				     sizeof(*iov->m64_map),
>  				     GFP_KERNEL);
> -	if (!pdn->m64_map)
> +	if (!iov->m64_map)
>  		return -ENOMEM;
>  	/* Initialize the m64_map to IODA_INVALID_M64 */
>  	for (i = 0; i < m64_bars ; i++)
>  		for (j = 0; j < PCI_SRIOV_NUM_BARS; j++)
> -			pdn->m64_map[i][j] = IODA_INVALID_M64;
> +			iov->m64_map[i][j] = IODA_INVALID_M64;
>  
>  
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> @@ -1347,9 +1348,9 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  					goto m64_failed;
>  			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
>  
> -			pdn->m64_map[j][i] = win;
> +			iov->m64_map[j][i] = win;
>  
> -			if (pdn->m64_single_mode) {
> +			if (iov->m64_single_mode) {
>  				size = pci_iov_resource_size(pdev,
>  							PCI_IOV_RESOURCES + i);
>  				start = res->start + size * j;
> @@ -1359,16 +1360,16 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  			}
>  
>  			/* Map the M64 here */
> -			if (pdn->m64_single_mode) {
> -				pe_num = pdn->pe_num_map[j];
> +			if (iov->m64_single_mode) {
> +				pe_num = iov->pe_num_map[j];
>  				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
>  						pe_num, OPAL_M64_WINDOW_TYPE,
> -						pdn->m64_map[j][i], 0);
> +						iov->m64_map[j][i], 0);
>  			}
>  
>  			rc = opal_pci_set_phb_mem_window(phb->opal_id,
>  						 OPAL_M64_WINDOW_TYPE,
> -						 pdn->m64_map[j][i],
> +						 iov->m64_map[j][i],
>  						 start,
>  						 0, /* unused */
>  						 size);
> @@ -1380,12 +1381,12 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  				goto m64_failed;
>  			}
>  
> -			if (pdn->m64_single_mode)
> +			if (iov->m64_single_mode)
>  				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 2);
> +				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 2);
>  			else
>  				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 1);
> +				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 1);
>  
>  			if (rc != OPAL_SUCCESS) {
>  				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
> @@ -1426,10 +1427,8 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
>  {
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe, *pe_n;
> -	struct pci_dn         *pdn;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);


Looks like an unrelated cleanup.


>  
>  	if (!pdev->is_physfn)
>  		return;
> @@ -1455,36 +1454,36 @@ void pnv_pci_sriov_disable(struct pci_dev *pdev)
>  {
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe;
> -	struct pci_dn         *pdn;
> +	struct pnv_iov_data   *iov;
>  	u16                    num_vfs, i;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> -	num_vfs = pdn->num_vfs;
> +	iov = pnv_iov_get(pdev);
> +	num_vfs = iov->num_vfs;
>  
>  	/* Release VF PEs */
>  	pnv_ioda_release_vf_PE(pdev);
>  
>  	if (phb->type == PNV_PHB_IODA2) {
> -		if (!pdn->m64_single_mode)
> -			pnv_pci_vf_resource_shift(pdev, -*pdn->pe_num_map);
> +		if (!iov->m64_single_mode)
> +			pnv_pci_vf_resource_shift(pdev, -*iov->pe_num_map);
>  
>  		/* Release M64 windows */
>  		pnv_pci_vf_release_m64(pdev, num_vfs);
>  
>  		/* Release PE numbers */
> -		if (pdn->m64_single_mode) {
> +		if (iov->m64_single_mode) {
>  			for (i = 0; i < num_vfs; i++) {
> -				if (pdn->pe_num_map[i] == IODA_INVALID_PE)
> +				if (iov->pe_num_map[i] == IODA_INVALID_PE)
>  					continue;
>  
> -				pe = &phb->ioda.pe_array[pdn->pe_num_map[i]];
> +				pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
>  				pnv_ioda_free_pe(pe);
>  			}
>  		} else
> -			bitmap_clear(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
> +			bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
>  		/* Releasing pe_num_map */
> -		kfree(pdn->pe_num_map);
> +		kfree(iov->pe_num_map);
>  	}
>  }
>  
> @@ -1501,24 +1500,24 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  	struct pnv_ioda_pe    *pe;
>  	int                    pe_num;
>  	u16                    vf_index;
> -	struct pci_dn         *pdn;
> -
> -	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> +	struct pnv_iov_data   *iov;
>  
>  	if (!pdev->is_physfn)
>  		return;
>  
> +	phb = pci_bus_to_pnvhb(pdev->bus);
> +	iov = pnv_iov_get(pdev);
> +
>  	/* Reserve PE for each VF */
>  	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
>  		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
>  		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
>  		struct pci_dn *vf_pdn;
>  
> -		if (pdn->m64_single_mode)
> -			pe_num = pdn->pe_num_map[vf_index];
> +		if (iov->m64_single_mode)
> +			pe_num = iov->pe_num_map[vf_index];
>  		else
> -			pe_num = *pdn->pe_num_map + vf_index;
> +			pe_num = *iov->pe_num_map + vf_index;
>  
>  		pe = &phb->ioda.pe_array[pe_num];
>  		pe->pe_number = pe_num;
> @@ -1565,17 +1564,17 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  
>  int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
> +	struct pnv_iov_data   *iov;
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe;
> -	struct pci_dn         *pdn;
>  	int                    ret;
>  	u16                    i;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
> -	pdn = pci_get_pdn(pdev);
> +	iov = pnv_iov_get(pdev);
>  
>  	if (phb->type == PNV_PHB_IODA2) {
> -		if (!pdn->vfs_expanded) {
> +		if (!iov->vfs_expanded) {
>  			dev_info(&pdev->dev, "don't support this SRIOV device"
>  				" with non 64bit-prefetchable IOV BAR\n");
>  			return -ENOSPC;
> @@ -1585,28 +1584,26 @@ int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  		 * When M64 BARs functions in Single PE mode, the number of VFs
>  		 * could be enabled must be less than the number of M64 BARs.
>  		 */
> -		if (pdn->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
> +		if (iov->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
>  			dev_info(&pdev->dev, "Not enough M64 BAR for VFs\n");
>  			return -EBUSY;
>  		}
>  
>  		/* Allocating pe_num_map */
> -		if (pdn->m64_single_mode)
> -			pdn->pe_num_map = kmalloc_array(num_vfs,
> -							sizeof(*pdn->pe_num_map),
> -							GFP_KERNEL);
> +		if (iov->m64_single_mode)
> +			iov->pe_num_map = kmalloc_array(num_vfs, sizeof(*iov->pe_num_map), GFP_KERNEL);
>  		else
> -			pdn->pe_num_map = kmalloc(sizeof(*pdn->pe_num_map), GFP_KERNEL);
> +			iov->pe_num_map = kmalloc(sizeof(*iov->pe_num_map), GFP_KERNEL);
>  
> -		if (!pdn->pe_num_map)
> +		if (!iov->pe_num_map)
>  			return -ENOMEM;
>  
> -		if (pdn->m64_single_mode)
> +		if (iov->m64_single_mode)
>  			for (i = 0; i < num_vfs; i++)
> -				pdn->pe_num_map[i] = IODA_INVALID_PE;
> +				iov->pe_num_map[i] = IODA_INVALID_PE;
>  
>  		/* Calculate available PE for required VFs */
> -		if (pdn->m64_single_mode) {
> +		if (iov->m64_single_mode) {
>  			for (i = 0; i < num_vfs; i++) {
>  				pe = pnv_ioda_alloc_pe(phb);
>  				if (!pe) {
> @@ -1614,23 +1611,23 @@ int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  					goto m64_failed;
>  				}
>  
> -				pdn->pe_num_map[i] = pe->pe_number;
> +				iov->pe_num_map[i] = pe->pe_number;
>  			}
>  		} else {
>  			mutex_lock(&phb->ioda.pe_alloc_mutex);
> -			*pdn->pe_num_map = bitmap_find_next_zero_area(
> +			*iov->pe_num_map = bitmap_find_next_zero_area(
>  				phb->ioda.pe_alloc, phb->ioda.total_pe_num,
>  				0, num_vfs, 0);
> -			if (*pdn->pe_num_map >= phb->ioda.total_pe_num) {
> +			if (*iov->pe_num_map >= phb->ioda.total_pe_num) {
>  				mutex_unlock(&phb->ioda.pe_alloc_mutex);
>  				dev_info(&pdev->dev, "Failed to enable VF%d\n", num_vfs);
> -				kfree(pdn->pe_num_map);
> +				kfree(iov->pe_num_map);
>  				return -EBUSY;
>  			}
> -			bitmap_set(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
> +			bitmap_set(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
>  			mutex_unlock(&phb->ioda.pe_alloc_mutex);
>  		}
> -		pdn->num_vfs = num_vfs;
> +		iov->num_vfs = num_vfs;
>  
>  		/* Assign M64 window accordingly */
>  		ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
> @@ -1644,8 +1641,8 @@ int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  		 * the IOV BAR according to the PE# allocated to the VFs.
>  		 * Otherwise, the PE# for the VF will conflict with others.
>  		 */
> -		if (!pdn->m64_single_mode) {
> -			ret = pnv_pci_vf_resource_shift(pdev, *pdn->pe_num_map);
> +		if (!iov->m64_single_mode) {
> +			ret = pnv_pci_vf_resource_shift(pdev, *iov->pe_num_map);
>  			if (ret)
>  				goto m64_failed;
>  		}
> @@ -1657,19 +1654,19 @@ int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  	return 0;
>  
>  m64_failed:
> -	if (pdn->m64_single_mode) {
> +	if (iov->m64_single_mode) {
>  		for (i = 0; i < num_vfs; i++) {
> -			if (pdn->pe_num_map[i] == IODA_INVALID_PE)
> +			if (iov->pe_num_map[i] == IODA_INVALID_PE)
>  				continue;
>  
> -			pe = &phb->ioda.pe_array[pdn->pe_num_map[i]];
> +			pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
>  			pnv_ioda_free_pe(pe);
>  		}
>  	} else
> -		bitmap_clear(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
> +		bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
>  
>  	/* Releasing pe_num_map */
> -	kfree(pdn->pe_num_map);
> +	kfree(iov->pe_num_map);
>  
>  	return ret;
>  }
> @@ -2840,12 +2837,13 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  	struct resource *res;
>  	int i;
>  	resource_size_t size, total_vf_bar_sz;
> -	struct pci_dn *pdn;
> +	struct pnv_iov_data *iov;
>  	int mul, total_vfs;
>  
> -	pdn = pci_get_pdn(pdev);
> -	pdn->vfs_expanded = 0;
> -	pdn->m64_single_mode = false;
> +	iov = kzalloc(sizeof(*iov), GFP_KERNEL);
> +	if (!iov)
> +		goto truncate_iov;
> +	pdev->dev.archdata.iov_data = iov;
>  
>  	total_vfs = pci_sriov_get_totalvfs(pdev);
>  	mul = phb->ioda.total_pe_num;
> @@ -2882,7 +2880,7 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  			dev_info(&pdev->dev,
>  				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
>  				total_vf_bar_sz, gate, mul);
> -			pdn->m64_single_mode = true;
> +			iov->m64_single_mode = true;
>  			break;
>  		}
>  	}
> @@ -2897,7 +2895,7 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  		 * On PHB3, the minimum size alignment of M64 BAR in single
>  		 * mode is 32MB.
>  		 */
> -		if (pdn->m64_single_mode && (size < SZ_32M))
> +		if (iov->m64_single_mode && (size < SZ_32M))
>  			goto truncate_iov;
>  		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
>  		res->end = res->start + size * mul - 1;
> @@ -2905,7 +2903,7 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
>  			 i, res, mul);
>  	}
> -	pdn->vfs_expanded = mul;
> +	iov->vfs_expanded = mul;
>  
>  	return;
>  
> @@ -2916,6 +2914,9 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  		res->flags = 0;
>  		res->end = res->start - 1;
>  	}
> +
> +	pdev->dev.archdata.iov_data = NULL;
> +	kfree(iov);
>  }
>  
>  static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
> @@ -3321,7 +3322,7 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>  						      int resno)
>  {
>  	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> -	struct pci_dn *pdn = pci_get_pdn(pdev);
> +	struct pnv_iov_data *iov = pnv_iov_get(pdev);
>  	resource_size_t align;
>  
>  	/*
> @@ -3342,12 +3343,21 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>  	 * M64 segment size if IOV BAR size is less.
>  	 */
>  	align = pci_iov_resource_size(pdev, resno);
> -	if (!pdn->vfs_expanded)
> +
> +	/*
> +	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
> +	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
> +	 * In that case we don't allow VFs to be enabled so just return the
> +	 * default alignment.
> +	 */
> +	if (!iov)
>  		return align;
> -	if (pdn->m64_single_mode)
> +	if (!iov->vfs_expanded)
> +		return align;
> +	if (iov->m64_single_mode)
>  		return max(align, (resource_size_t)phb->ioda.m64_segsize);
>  
> -	return pdn->vfs_expanded * align;
> +	return iov->vfs_expanded * align;
>  }
>  #endif /* CONFIG_PCI_IOV */
>  
> @@ -3545,12 +3555,21 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
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
> +	/*
> +	 * FIXME: Try move this to sriov_disable(). It's here since we allocate
> +	 * the iov state at probe time since we need to fiddle with the IOV
> +	 * resources.
> +	 */
> +	if (pdev->is_physfn)
> +		kfree(pdev->dev.archdata.iov_data);


pdev->dev.archdata.iov_data = NULL just in case if some other device
shutdown code tries accessing it.


> +
>  	/*
>  	 * PCI hotplug can happen as part of EEH error recovery. The @pdn
>  	 * isn't removed and added afterwards in this scenario. We should
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 52dc4d05eaca..0e875f714911 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -168,6 +168,42 @@ struct pnv_phb {
>  	u8			*diag_data;
>  };
>  
> +#ifdef CONFIG_PCI_IOV
> +/*
> + * For SR-IOV we want to put each VF's MMIO resource in to a seperate PE.
> + * This requires a bit of acrobatics with the MMIO -> PE configuration
> + * and this structure is used to keep track of it all.
> + */
> +struct pnv_iov_data {
> +	/* number of VFs IOV BAR expanded. FIXME: rename this to something less bad */
> +	u16     vfs_expanded;


Can this one be removed from pci_dn now? It looks like it can after
46/46 indeed. And probably others as well as they do not seem to be used
by pseries anyway. Thanks,


> +
> +	/* number of VFs enabled */
> +	u16     num_vfs;
> +	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
> +
> +	/* Did we map the VF BARs with single-PE IODA BARs? */
> +	bool    m64_single_mode;
> +
> +	int     (*m64_map)[PCI_SRIOV_NUM_BARS];
> +#define IODA_INVALID_M64        (-1)
> +
> +	/*
> +	 * If we map the SR-IOV BARs with a segmented window then
> +	 * parts of that window will be "claimed" by other PEs.
> +	 *
> +	 * "holes" here is used to reserve the leading portion
> +	 * of the window that is used by other (non VF) PEs.
> +	 */
> +	struct resource holes[PCI_SRIOV_NUM_BARS];
> +};
> +
> +static inline struct pnv_iov_data *pnv_iov_get(struct pci_dev *pdev)
> +{
> +	return pdev->dev.archdata.iov_data;
> +}
> +#endif
> +
>  extern struct pci_ops pnv_pci_ops;
>  
>  void pnv_pci_dump_phb_diag_data(struct pci_controller *hose,
> 

-- 
Alexey
