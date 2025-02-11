Return-Path: <linuxppc-dev+bounces-6106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89859A31790
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 22:24:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsvZs0qZ3z2ykX;
	Wed, 12 Feb 2025 08:24:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739309045;
	cv=none; b=i3ZSWjUZvcuReGVaUkLKkYQv57sSap8q1rO1m2PzOUYr9aK5jtcQL74i/4O8Dm0JyAh/l4b90o3CwSFbFWbmhhhxQ2wgtB7TnFCkoSZ2qAtWNwIshbErgqsWIwk/2HHiI6OLc6hRAGfI0cFQRP9rM4pqGo5O7laY0DYb64iCYwXR91FHkN+BorvwxViyuLMHFnyuRvBTaZ0vSPpuZaSzJsyEUzHCtEz0ytGJkJIvyj50dvr03BJi29rH6E3CWrReoMZTE/KAHpCIXXim7qxxC87P6PtyO+qN/NmEMcePtFZdUdnzPyQN9mq1EThhSEE3XEXTYzDsv2NsWnqeCHaZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739309045; c=relaxed/relaxed;
	bh=9u7ZoSmAU5vsvWqI2s6EXx5qk860P3zWDHsuCHDDm94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ/Nxz7cWI0cxBVqVwmQeYPp7btOZ2L4dDUH5NBKn5TSLipNxJD1PA7AHWCd1y9rIjwhOCgPuZggm32eTVZVoIVyzIX4UNXVf4XopHZsK9l442NpcngDZSh3BaMyuqixdu9PpPHF8ekfaHhqDXymLPtMiEyln8jAFLSwmmdw9wrBRHJz/KzaT3/BpUAP6gojeY+wXPYT+f4GtV5qTd4tEY38nbFN+TwWfIgC/bRM/yl8q2LxZ7lDplc1g0NwtLxKeTtJ1ufcZyBHxBOJn6YpU01nze8pdsKFpOeedkWG9jP9WgTOG4lFVWbV57LA79iMqFss0EEgZrzam94QvY8Zjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uf2LHuYq; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uf2LHuYq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsvZr0kj5z2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 08:24:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739309044; x=1770845044;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6pPNSu5khxEBFBWsc9uEcZ7LoQqrd8LuHQ1iOQbmUx8=;
  b=Uf2LHuYq8UV9gl3lYe2OI+JJLkXpiBs3SynBLtbek3Q54PH46u2eXUSd
   IqSOdczNRtImERq6OMm5SDckaamIHBiH72NW9MJOv42Gkzk62j9tbvQKz
   Ue0JefL3/jtrcLgXKY8NpRocL+3/d/1ZtMklyq7gXGg9aSlsScwrGXqDR
   x7GKybYzR5FYgUBXFSkin26P4ZvNbXRKI9W9YDAIZgcFfe5Jw836KAi9/
   9FA+NxjxpyWrXnH19qlxxiIWkKUI69ndfEr74RKExu7R6q8h39v0+YHZI
   IWgWVGGYKK21+BcNj3D1xpma8GjeUo4mIkQWTa5CB3bG+6HQsfLX713Hr
   w==;
X-CSE-ConnectionGUID: glFk79pNQc2dwOqQOY4swg==
X-CSE-MsgGUID: EeKtJRuFQNyd8CwBt5ckMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39183700"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39183700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 13:24:02 -0800
X-CSE-ConnectionGUID: X6nVqjD8SWG1wP9zerP9Cg==
X-CSE-MsgGUID: vDvaQ1dTRTmqZ8Kg8ZeVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="117708689"
Received: from jdoman-desk1.amr.corp.intel.com (HELO [10.124.222.44]) ([10.124.222.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 13:24:01 -0800
Message-ID: <c1837324-98b0-4548-893f-b14e89ced9db@linux.intel.com>
Date: Tue, 11 Feb 2025 13:23:30 -0800
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
Subject: Re: [PATCH v3 3/4] PCI/DPC: Run recovery on device that detected the
 error
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com
References: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
 <20250207093500.70885-4-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250207093500.70885-4-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 2/7/25 1:34 AM, Shuai Xue wrote:
> The current implementation of pcie_do_recovery() assumes that the
> recovery process is executed on the device that detected the error.
> However, the DPC driver currently passes the error port that experienced
> the DPC event to pcie_do_recovery().
>
> Use the SOURCE ID register to correctly identify the device that detected the
> error. By passing this error device to pcie_do_recovery(), subsequent
> patches will be able to accurately access AER status of the error device.

I also recommend adding info about the fact that pcie_do_recovery() finds
upstream bridge to run the recovery process and hence should not observe
any functional changes (compared to previous version)


>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   drivers/pci/pci.h      |  2 +-
>   drivers/pci/pcie/dpc.c | 25 +++++++++++++++++++++----
>   drivers/pci/pcie/edr.c |  7 ++++---
>   3 files changed, 26 insertions(+), 8 deletions(-)
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
> index 1a54a0b657ae..a91440f3b118 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -253,10 +253,17 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>   	return 1;
>   }
>   
> -void dpc_process_error(struct pci_dev *pdev)
> +/**
> + * dpc_process_error - handle the DPC error status
> + * @pdev: the port that experienced the containment event
> + *
> + * Return the device that detected the error.
> + */

Add a note about calling pci_dev_put() after using this function.

> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>   {
>   	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>   	struct aer_err_info info;
> +	struct pci_dev *err_dev;
>   
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> @@ -279,6 +286,13 @@ void dpc_process_error(struct pci_dev *pdev)
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
> @@ -291,6 +305,8 @@ void dpc_process_error(struct pci_dev *pdev)
>   		pci_aer_clear_nonfatal_status(pdev);
>   		pci_aer_clear_fatal_status(pdev);
>   	}
> +
> +	return err_dev;
>   }
>   
>   static void pci_clear_surpdn_errors(struct pci_dev *pdev)
> @@ -346,7 +362,7 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>   
>   static irqreturn_t dpc_handler(int irq, void *context)
>   {
> -	struct pci_dev *err_port = context;
> +	struct pci_dev *err_port = context, *err_dev;
>   
>   	/*
>   	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
> @@ -357,10 +373,11 @@ static irqreturn_t dpc_handler(int irq, void *context)
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


