Return-Path: <linuxppc-dev+bounces-6606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2139A4B6CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 04:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5kzZ6qngz3093;
	Mon,  3 Mar 2025 14:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740973082;
	cv=none; b=IkPOal3fFHuT3h7tJVVaSUYpWKgdFJDn26KbEjiJg38bkINDGHpfqMSHpxTAE60xRkzHyt5DLE9E81aqfM2ii0ebTcGNBJajNm0tPlQLHB4mR5V60JrG1rDTjBOuFImYkyzQB8ddL74tc4bNU0INrrivHdyp97UGimi7q5XT93x+sB1vU+Vq4cKaVp2r/D9b+9feVhQ3c7EjtfJJ1kM/F3hn0tNnYoLuCTAfOH/6vyKqyA11nWcZmHqGy01QZ15T2VKLHQyQwQj6FmjF5bNiyDqKRleQ7HXincgJT1HIXXuuyfNFUKLnudTQs9h2rbkbolQcqK4Lx+D8J9B58LHpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740973082; c=relaxed/relaxed;
	bh=CTt5KZaPdAX+EVG0leBiyLUtBUT428iuj42Yemf77Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMwlMFVMQ+WRDy+2b7aKyLIclJQqa1JgJ5KR5ij+qsE8PasiexS6tkaqOmfid20MfujM3482P7gO7PmwnaoyGLWaKsHomzL1g3IIL7T3OttmCEjnwd26xgx2iNtKRiOeypAxh6XAficWJTzcJcrPfTIlIzwERiaafpU+sPTlVxRfo4sGFkq+/XDMUkpZp75r1H75qI5ex8pFsHfTYwVtj2p62yjLIorL+RTPdex1mb1AtWqVHUJAl/Ux6PCL0DfELjvx8RRm4856/pUtO50crcUqZVXA9VAiD5qoiNbYcGmTdtrkb3EmLsLhTZc0S2e0c08U4MHw/VCxt+KQabBLRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfuxFceS; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfuxFceS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 03 Mar 2025 14:38:00 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5kzX1r8vz305n
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 14:37:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740973080; x=1772509080;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YbOxaH+xAWHtqAVyGtst1vc6Yj0yhNJdcd7+v0mM7YI=;
  b=VfuxFceSz/Rup8jJqlnGmEXjL1VuxvY16z9CZLpp133Q62PC+cD7hZ83
   56OAuyeapFg1lf7yAhhI5L9NunfO8aJ4gckF0W24RNu4X29xEPsuAiaKl
   AT5cEsmMJZyvG68lea8XBZurWzcXF7YTNc6ociEsAAvyTWqMJIXLpo3TA
   o+snLk3KBkccKldWhTSRb6BWbF+aVNeFIf4qUnYnuKq7HJ44x0N+SOEzq
   9Jkrp4Fg+Iuub+ZcqOyCRtedzD+GpZrpi+6JskMl7F9M6XccSRHhK9tg1
   8JWrtymuFizQeWEwYYkIbg1hjPY7RFWXHxAyuP0UQYv07NJalFe02/wp1
   A==;
X-CSE-ConnectionGUID: PP+X2Y9ISNiajgKplF5tCA==
X-CSE-MsgGUID: FKhhX0bFTXyUG6CszEC0Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="64293303"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="64293303"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:36:52 -0800
X-CSE-ConnectionGUID: dFAsw1enTJK6Dwh8yD3u7A==
X-CSE-MsgGUID: BxI0pDgXSfOjBfw1Qvku+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148792149"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO [10.124.221.161]) ([10.124.221.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:36:50 -0800
Message-ID: <8bb49ca2-6b27-4b05-9ad7-ed10cfa841d5@linux.intel.com>
Date: Sun, 2 Mar 2025 19:36:49 -0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] PCI/DPC: Run recovery on device that detected the
 error
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-3-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250217024218.1681-3-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 2/16/25 6:42 PM, Shuai Xue wrote:
> The current implementation of pcie_do_recovery() assumes that the
> recovery process is executed on the device that detected the error.
> However, the DPC driver currently passes the error port that experienced
> the DPC event to pcie_do_recovery().
>
> Use the SOURCE ID register to correctly identify the device that
> detected the error. When passing the error device, the
> pcie_do_recovery() will find the upstream bridge and walk bridges
> potentially AER affected. And subsequent patches will be able to
> accurately access AER status of the error device.
>
> Should not observe any functional changes.
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

Looks good to me

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pci.h      |  2 +-
>   drivers/pci/pcie/dpc.c | 28 ++++++++++++++++++++++++----
>   drivers/pci/pcie/edr.c |  7 ++++---
>   3 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 01e51db8d285..870d2fbd6ff2 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -572,7 +572,7 @@ struct rcec_ea {
>   void pci_save_dpc_state(struct pci_dev *dev);
>   void pci_restore_dpc_state(struct pci_dev *dev);
>   void pci_dpc_init(struct pci_dev *pdev);
> -void dpc_process_error(struct pci_dev *pdev);
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>   pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>   bool pci_dpc_recovered(struct pci_dev *pdev);
>   unsigned int dpc_tlp_log_len(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 1a54a0b657ae..ea3ea989afa7 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -253,10 +253,20 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>   	return 1;
>   }
>   
> -void dpc_process_error(struct pci_dev *pdev)
> +/**
> + * dpc_process_error - handle the DPC error status
> + * @pdev: the port that experienced the containment event
> + *
> + * Return the device that detected the error.
> + *
> + * NOTE: The device reference count is increased, the caller must decrement
> + * the reference count by calling pci_dev_put().
> + */
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>   {
>   	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>   	struct aer_err_info info;
> +	struct pci_dev *err_dev;
>   
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> @@ -279,6 +289,13 @@ void dpc_process_error(struct pci_dev *pdev)
>   		 "software trigger" :
>   		 "reserved error");
>   
> +	if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE ||
> +	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE)
> +		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +					    PCI_BUS_NUM(source), source & 0xff);
> +	else
> +		err_dev = pci_dev_get(pdev);
> +
>   	/* show RP PIO error detail information */
>   	if (pdev->dpc_rp_extensions &&
>   	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
> @@ -291,6 +308,8 @@ void dpc_process_error(struct pci_dev *pdev)
>   		pci_aer_clear_nonfatal_status(pdev);
>   		pci_aer_clear_fatal_status(pdev);
>   	}
> +
> +	return err_dev;
>   }
>   
>   static void pci_clear_surpdn_errors(struct pci_dev *pdev)
> @@ -346,7 +365,7 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>   
>   static irqreturn_t dpc_handler(int irq, void *context)
>   {
> -	struct pci_dev *err_port = context;
> +	struct pci_dev *err_port = context, *err_dev;
>   
>   	/*
>   	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
> @@ -357,10 +376,11 @@ static irqreturn_t dpc_handler(int irq, void *context)
>   		return IRQ_HANDLED;
>   	}
>   
> -	dpc_process_error(err_port);
> +	err_dev = dpc_process_error(err_port);
>   
>   	/* We configure DPC so it only triggers on ERR_FATAL */
> -	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
> +	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
> +	pci_dev_put(err_dev);
>   
>   	return IRQ_HANDLED;
>   }
> diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
> index 521fca2f40cb..088f3e188f54 100644
> --- a/drivers/pci/pcie/edr.c
> +++ b/drivers/pci/pcie/edr.c
> @@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
>   
>   static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   {
> -	struct pci_dev *pdev = data, *err_port;
> +	struct pci_dev *pdev = data, *err_port, *err_dev;
>   	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
>   	u16 status;
>   
> @@ -190,7 +190,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   		goto send_ost;
>   	}
>   
> -	dpc_process_error(err_port);
> +	err_dev = dpc_process_error(err_port);
>   	pci_aer_raw_clear_status(err_port);
>   
>   	/*
> @@ -198,7 +198,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   	 * or ERR_NONFATAL, since the link is already down, use the FATAL
>   	 * error recovery path for both cases.
>   	 */
> -	estate = pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
> +	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
>   
>   send_ost:
>   
> @@ -216,6 +216,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   	}
>   
>   	pci_dev_put(err_port);
> +	pci_dev_put(err_dev);
>   }
>   
>   void pci_acpi_add_edr_notifier(struct pci_dev *pdev)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


