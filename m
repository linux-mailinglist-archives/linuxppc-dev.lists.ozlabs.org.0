Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19360220246
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 04:20:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B61MT62WTzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 12:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xPJ3zCb2; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B61HV4dKzzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 12:17:26 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id y22so779891oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S3jmlCC6y67G4LfDI5AL1Iz8qrVAA3ZIzaEcqyQbXbA=;
 b=xPJ3zCb2fC4LCrvUXlTATZ+j79sqSnGcS4UjwganfLo3/btSQYcDzLFJZXY/JhAVfY
 EgwDtW6KdVJvTdt21k8dxuI0XhWKxJmSufOadEQsvq1mxvoP1RxITIiH7DDl8PgV3Ivn
 SrqwqTWwaLCfPAS0iMko3NHc+4n6gz5QCjChI2jtafy5aXCRIrH+5BJNst9HkrsX1IE9
 fEd7i7ty1x34b3w1dZ7LUFX2OomsjYm925vec6F7Rk8j5mLGaIhHlv1s1Y9KJFqRE1hq
 gtRdKsQkT4p9jt7QMya1aH0SPF0cGOJjpdYdNhOTyLsEPzAhdOyVeTtvXMyr98fp2Vf9
 7V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S3jmlCC6y67G4LfDI5AL1Iz8qrVAA3ZIzaEcqyQbXbA=;
 b=MK0qlrVM2GF2f+wINBOCIqh1NLcxkEoDESzMbb9kQEzNb7zOlLKc1eRvG5WvuN48vr
 ldyo0T+ijco05qXoTWNeiNmjIYltrZcMA21weildZWhP4GT+lg79JenT89mDq4UYx0EO
 fB5Gn3DvfWRLj93hyr5hfbms1zyUoqVIQUkGoqLxMwDw+g3U3hSp8vwPtGoyX4PHrUh3
 PsdPzZjs+foktjlkysfVyH1PcJVzay+Jfc6+V3viOdCPJMTVJZM4W4hzKu2E+ljwug1n
 +nQ17VPv4vOYFA0YWXzqd0Q5+PRjAnStH7Tve06egl6JZHw+G9E90VQt2y+BrLI3+ZK0
 SFeA==
X-Gm-Message-State: AOAM530ORj/LbG4KzvhFjxdhdVOIaBgDN5fIPGbgIM6LZ5AqQzlZ3of9
 kU18iJ3PMNpxotO1Jna164e8dqTk7eo7AA==
X-Google-Smtp-Source: ABdhPJxrSAGuyUD+7zTvoJVWkzxjZgCRh9qgC+KXuwf3thAPD81MfbzRIDWicBYVH6aFS4yiyyLBJQ==
X-Received: by 2002:a17:90b:380b:: with SMTP id
 mq11mr7833008pjb.46.1594778970544; 
 Tue, 14 Jul 2020 19:09:30 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id o4sm308782pjo.16.2020.07.14.19.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 19:09:29 -0700 (PDT)
Subject: Re: [PATCH 09/15] powerpc/powernv/sriov: Factor out M64 BAR setup
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-10-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <4692395e-ff35-1efa-dc15-21107f7bc0ad@ozlabs.ru>
Date: Wed, 15 Jul 2020 12:09:26 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-10-oohall@gmail.com>
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
> The sequence required to use the single PE BAR mode is kinda janky and
> requires a little explanation. The API was designed with P7-IOC style
> windows where the setup process is something like:
> 
> 1. Configure the window start / end address
> 2. Enable the window
> 3. Map the segments of each window to the PE
> 
> For Single PE BARs the process is:
> 
> 1. Set the PE for segment zero on a disabled window
> 2. Set the range
> 3. Enable the window
> 
> Move the OPAL calls into their own helper functions where the quirks can be
> contained.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>


I'd use "segmented" instead of "accordion". Otherwise,

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>




> ---
>  arch/powerpc/platforms/powernv/pci-sriov.c | 132 ++++++++++++++++-----
>  1 file changed, 103 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index e4c65cb49757..d53a85ccb538 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -320,6 +320,102 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
>  	return 0;
>  }
>  
> +
> +/*
> + * PHB3 and beyond support "accordion" windows. The window's address range
> + * is subdivided into phb->ioda.total_pe_num segments and there's a 1-1
> + * mapping between PEs and segments.
> + *
> + * They're called that because as the window size changes the segment sizes
> + * change with it. Sort of like an accordion, sort of.
> + */
> +static int64_t pnv_ioda_map_m64_accordion(struct pnv_phb *phb,
> +					  int window_id,
> +					  resource_size_t start,
> +					  resource_size_t size)
> +{
> +	int64_t rc;
> +
> +	rc = opal_pci_set_phb_mem_window(phb->opal_id,
> +					 OPAL_M64_WINDOW_TYPE,
> +					 window_id,
> +					 start,
> +					 0, /* unused */
> +					 size);
> +	if (rc)
> +		goto out;
> +
> +	rc = opal_pci_phb_mmio_enable(phb->opal_id,
> +				      OPAL_M64_WINDOW_TYPE,
> +				      window_id,
> +				      OPAL_ENABLE_M64_SPLIT);
> +out:
> +	if (rc)
> +		pr_err("Failed to map M64 window #%d: %lld\n", window_id, rc);
> +
> +	return rc;
> +}
> +
> +static int64_t pnv_ioda_map_m64_single(struct pnv_phb *phb,
> +				       int pe_num,
> +				       int window_id,
> +				       resource_size_t start,
> +				       resource_size_t size)
> +{
> +	int64_t rc;
> +
> +	/*
> +	 * The API for setting up m64 mmio windows seems to have been designed
> +	 * with P7-IOC in mind. For that chip each M64 BAR (window) had a fixed
> +	 * split of 8 equally sized segments each of which could individually
> +	 * assigned to a PE.
> +	 *
> +	 * The problem with this is that the API doesn't have any way to
> +	 * communicate the number of segments we want on a BAR. This wasn't
> +	 * a problem for p7-ioc since you didn't have a choice, but the
> +	 * single PE windows added in PHB3 don't map cleanly to this API.
> +	 *
> +	 * As a result we've got this slightly awkward process where we
> +	 * call opal_pci_map_pe_mmio_window() to put the single in single
> +	 * PE mode, and set the PE for the window before setting the address
> +	 * bounds. We need to do it this way because the single PE windows
> +	 * for PHB3 have different alignment requirements on PHB3.
> +	 */
> +	rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> +					 pe_num,
> +					 OPAL_M64_WINDOW_TYPE,
> +					 window_id,
> +					 0);
> +	if (rc)
> +		goto out;
> +
> +	/*
> +	 * NB: In single PE mode the window needs to be aligned to 32MB
> +	 */
> +	rc = opal_pci_set_phb_mem_window(phb->opal_id,
> +					 OPAL_M64_WINDOW_TYPE,
> +					 window_id,
> +					 start,
> +					 0, /* ignored by FW, m64 is 1-1 */
> +					 size);
> +	if (rc)
> +		goto out;
> +
> +	/*
> +	 * Now actually enable it. We specified the BAR should be in "non-split"
> +	 * mode so FW will validate that the BAR is in single PE mode.
> +	 */
> +	rc = opal_pci_phb_mmio_enable(phb->opal_id,
> +				      OPAL_M64_WINDOW_TYPE,
> +				      window_id,
> +				      OPAL_ENABLE_M64_NON_SPLIT);
> +out:
> +	if (rc)
> +		pr_err("Error mapping single PE BAR\n");
> +
> +	return rc;
> +}
> +
>  static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
>  	struct pnv_iov_data   *iov;
> @@ -330,7 +426,6 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  	int64_t                rc;
>  	int                    total_vfs;
>  	resource_size_t        size, start;
> -	int                    pe_num;
>  	int                    m64_bars;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
> @@ -359,49 +454,28 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
>  			set_bit(win, iov->used_m64_bar_mask);
>  
> +
>  			if (iov->m64_single_mode) {
>  				size = pci_iov_resource_size(pdev,
>  							PCI_IOV_RESOURCES + i);
>  				start = res->start + size * j;
> +				rc = pnv_ioda_map_m64_single(phb, win,
> +							     iov->pe_num_map[j],
> +							     start,
> +							     size);
>  			} else {
>  				size = resource_size(res);
>  				start = res->start;
> -			}
>  
> -			/* Map the M64 here */
> -			if (iov->m64_single_mode) {
> -				pe_num = iov->pe_num_map[j];
> -				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> -						pe_num, OPAL_M64_WINDOW_TYPE,
> -						win, 0);
> +				rc = pnv_ioda_map_m64_accordion(phb, win, start,
> +								size);
>  			}
>  
> -			rc = opal_pci_set_phb_mem_window(phb->opal_id,
> -						 OPAL_M64_WINDOW_TYPE,
> -						 win,
> -						 start,
> -						 0, /* unused */
> -						 size);
> -
> -
>  			if (rc != OPAL_SUCCESS) {
>  				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
>  					win, rc);
>  				goto m64_failed;
>  			}
> -
> -			if (iov->m64_single_mode)
> -				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, win, 2);
> -			else
> -				rc = opal_pci_phb_mmio_enable(phb->opal_id,
> -				     OPAL_M64_WINDOW_TYPE, win, 1);
> -
> -			if (rc != OPAL_SUCCESS) {
> -				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
> -					win, rc);
> -				goto m64_failed;
> -			}
>  		}
>  	}
>  	return 0;
> 

-- 
Alexey
