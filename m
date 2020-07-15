Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD9D2201E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 03:36:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B60NJ684zzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 11:36:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gLpzgbEd; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B60LM4fpVzDqCX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 11:34:48 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n5so951988pgf.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNs9uov1uzaFN7PJc8LiH/53P4+AVMTUQ0vCQCMN+0U=;
 b=gLpzgbEdLQjpbydKNyd/HFyUSWc/S0m4uktKbc/Vt6JZSDWG6t2lJgge+OYpxJa8IZ
 vIN7fBxUcFMLc4aVvaWnA/q5JzZCSprjSAgR1YWzWJl7E/TTsrqGmFEsuCv4yiyQYnO0
 bVLcQ7T/mZcavNbd4DqV4wIwe+7FR3mTSLGZ9j37e5PGk6eS9KncHvrLkcjXYetqGh3S
 gLXYMpG9/ag1dbKQzBo+9O2HlVUy20JHPQH9BDPjANKacw7sTVD72x2cJfuQCYwIeKxr
 C9oZ/vyfUFf3iid9m55w6BXj/COZzr5GkdA4YvR2HVPTBAIXncPv21hctZIyEKG1dYd9
 oFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNs9uov1uzaFN7PJc8LiH/53P4+AVMTUQ0vCQCMN+0U=;
 b=LmSGt04BEwsCDq5yqOgLsLP0DfsY90TIKG0mpFyNjWZEJxndnu4XtjYrA8FrWlYmJi
 TC04X7N/5P2JYxxrsYh+rPW68ie2APgtmpJNMaSk7m4tQ4XEa9XCkiEMUs3SbIXkYifz
 thO5rEbWK5ga9KuSy6SWFyw/Zh5wsMX4TuYLeLResFJ6fuzxK9+5V1D+DE1jWP16DcNr
 Q5PWVXEDUC6uifxSDfbgxfgwLiD/EuMVqWCYkhvUdeB+Wj/s+9XbIYHoAb2fhWP5sSUu
 T5Nl18IQ+WLMly/SC3/Ta/HWftCBGLmHDDqyLeHJs6eHJFVsNbJ5g2vMbRjS6GoqLgYX
 NhYg==
X-Gm-Message-State: AOAM530ZcXJSkVbMiHenv9VQh8GICfV68UgxbzAcS/ssIAO/Q43PxWY4
 r9cOmKmoCv8VAyb4qCvobfdOsHZT/lykdQ==
X-Google-Smtp-Source: ABdhPJxnpKpqyuP5vvNZaToFRoKdd6ZiccwR307M17xy+bhDP8kH5VWUIcXQfWZTMSGn4GCCc0OEKA==
X-Received: by 2002:aa7:8edc:: with SMTP id b28mr6734551pfr.230.1594776886020; 
 Tue, 14 Jul 2020 18:34:46 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id m22sm336576pfk.216.2020.07.14.18.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 18:34:45 -0700 (PDT)
Subject: Re: [PATCH 08/15] powerpc/powernv/sriov: Simplify used window tracking
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-9-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <86273d91-6c38-6d63-4f5b-1ed0d619f465@ozlabs.ru>
Date: Wed, 15 Jul 2020 11:34:42 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-9-oohall@gmail.com>
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
> No need for the multi-dimensional arrays, just use a bitmap.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-sriov.c | 48 +++++++---------------
>  arch/powerpc/platforms/powernv/pci.h       |  7 +++-
>  2 files changed, 20 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index 216ceeff69b0..e4c65cb49757 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -303,28 +303,20 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
>  	struct pnv_iov_data   *iov;
>  	struct pnv_phb        *phb;
> -	int                    i, j;
> -	int                    m64_bars;
> +	int window_id;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
>  	iov = pnv_iov_get(pdev);
>  
> -	if (iov->m64_single_mode)
> -		m64_bars = num_vfs;
> -	else
> -		m64_bars = 1;
> +	for_each_set_bit(window_id, iov->used_m64_bar_mask, 64) {
> +		opal_pci_phb_mmio_enable(phb->opal_id,
> +					 OPAL_M64_WINDOW_TYPE,
> +					 window_id,
> +					 0);
>  
> -	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> -		for (j = 0; j < m64_bars; j++) {
> -			if (iov->m64_map[j][i] == IODA_INVALID_M64)
> -				continue;
> -			opal_pci_phb_mmio_enable(phb->opal_id,
> -				OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 0);
> -			clear_bit(iov->m64_map[j][i], &phb->ioda.m64_bar_alloc);
> -			iov->m64_map[j][i] = IODA_INVALID_M64;
> -		}
> +		clear_bit(window_id, &phb->ioda.m64_bar_alloc);
> +	}
>  
> -	kfree(iov->m64_map);
>  	return 0;
>  }
>  
> @@ -350,23 +342,14 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  	else
>  		m64_bars = 1;
>  
> -	iov->m64_map = kmalloc_array(m64_bars,
> -				     sizeof(*iov->m64_map),
> -				     GFP_KERNEL);
> -	if (!iov->m64_map)
> -		return -ENOMEM;
> -	/* Initialize the m64_map to IODA_INVALID_M64 */
> -	for (i = 0; i < m64_bars ; i++)
> -		for (j = 0; j < PCI_SRIOV_NUM_BARS; j++)
> -			iov->m64_map[i][j] = IODA_INVALID_M64;
> -
> -
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
>  		res = &pdev->resource[i + PCI_IOV_RESOURCES];
>  		if (!res->flags || !res->parent)
>  			continue;
>  
>  		for (j = 0; j < m64_bars; j++) {
> +
> +			/* allocate a window ID for this BAR */
>  			do {
>  				win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
>  						phb->ioda.m64_bar_idx + 1, 0);
> @@ -374,8 +357,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  				if (win >= phb->ioda.m64_bar_idx + 1)
>  					goto m64_failed;
>  			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
> -
> -			iov->m64_map[j][i] = win;
> +			set_bit(win, iov->used_m64_bar_mask);
>  
>  			if (iov->m64_single_mode) {
>  				size = pci_iov_resource_size(pdev,
> @@ -391,12 +373,12 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  				pe_num = iov->pe_num_map[j];
>  				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
>  						pe_num, OPAL_M64_WINDOW_TYPE,
> -						iov->m64_map[j][i], 0);
> +						win, 0);
>  			}
>  
>  			rc = opal_pci_set_phb_mem_window(phb->opal_id,
>  						 OPAL_M64_WINDOW_TYPE,
> -						 iov->m64_map[j][i],
> +						 win,
>  						 start,
>  						 0, /* unused */
>  						 size);
> @@ -410,10 +392,10 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  
>  			if (iov->m64_single_mode)
>  				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 2);
> +				     OPAL_M64_WINDOW_TYPE, win, 2);
>  			else
>  				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 1);
> +				     OPAL_M64_WINDOW_TYPE, win, 1);
>  
>  			if (rc != OPAL_SUCCESS) {
>  				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 0156d7d17f7d..58c97e60c3db 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -243,8 +243,11 @@ struct pnv_iov_data {
>  	/* Did we map the VF BARs with single-PE IODA BARs? */
>  	bool    m64_single_mode;
>  
> -	int     (*m64_map)[PCI_SRIOV_NUM_BARS];
> -#define IODA_INVALID_M64        (-1)
> +	/*
> +	 * Bit mask used to track which m64 windows that we used to map the


Language question: either "which" or "that" but both?


> +	 * SR-IOV BARs for this device.
> +	 */
> +	DECLARE_BITMAP(used_m64_bar_mask, 64);

64 here is the maximum number of M64's (which is 16 at the moment)? Can
we define this 64 somehow (appears twice in this patch alone)?

Anyway, the change is correct.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



>  
>  	/*
>  	 * If we map the SR-IOV BARs with a segmented window then
> 

-- 
Alexey
