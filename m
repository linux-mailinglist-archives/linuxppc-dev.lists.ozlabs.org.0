Return-Path: <linuxppc-dev+bounces-6607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B519A4B6D2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 04:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5l696hd4z30VF;
	Mon,  3 Mar 2025 14:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740973425;
	cv=none; b=M3VxtRk2RBPbg4v+S7NO5CMUCEdWAYxYG4fXmTKlSW8ZHlgudoQ/twoF0lh7xS0Q9mj3rO9lo+cCi0Ii3YrntPN7cRUTMOE69IAg96H1g79cgjP10Iuf4fUCplZhp+//0cGCy5bNawSlnYj9QHEwQCUecgGSnEe/fW3YG1ZpKUwDTdqDxe2m/zD5KG+nzYGq1QQPmTVsIhC7GYAEoFD9YczC3ZDVMrDb689tFtI3STypO7mgiZCFc2d99D+jQH+YD6+wFqWiU0UQ4ZrazM8J+juMYQT6a7v8rB5Ms00NJQFO4VNQ05OF5GNKYMjW9014s774F0pijSYJjGyFV/6cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740973425; c=relaxed/relaxed;
	bh=QlwWd/OecOjmkjSnHZU9XfsQrDRvzdxN0GPIdyCnS7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuPizvU/LBYt4kRRsr8TVxYZkoUewzRDG/x0NgJN7rgm/HRmrcVPWTvA//ZdRP2CM00zsI6JaUbQEzl6490T/U3EIkHhUUSPBBanMA6fDHBdLnXM+tR65m4/VhnXcE53U2/nTxxrqIj122fBRbWaFmk4w06Pu8hMaTVbtwsJceIU8nKDIFrErx/0dDCMgoe2fueKLHJXY8ZAydGXc6/T8GNiO1zQ3n5UAbMNxg2037ivx5FD35RvkISjPIUq7FnomXTafng0K6Mmpj0e0dojRUn+fcVNRP5tevIQJAdbUWClF/G7mfdG7DWlEH3bkzhHtE6W0+UtGv7dDq8LPEwadA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VOj0soCA; dkim-atps=neutral; spf=none (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VOj0soCA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5l6863bbz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 14:43:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740973425; x=1772509425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JhJJsOVkl020/RuDlqm6PtBR0stted05yIyDq6WVP2Q=;
  b=VOj0soCA5VkfC3AEqGGdhKgiNM9XCO4rg0ZmyT4csGeJK8IrrN5yznII
   +U9L9WPaBKGWH2G8BRE0aZLtpusIPMO/45TKIC77USqUnrIHvEwZbkCar
   +cRf7aHX/tmczXvdmCl4N7WQ9pfDzASsAc12+7vYVg0s/Sw2SjDKs9kqq
   5rSQcr2OM6l7S3ra3fSMyz+tfbeEwahrinnBMO7l/VDhZ3qAikXSkoGc3
   rBnLZ6yqmwYarcpdin0uS91lmUROHY/Adlx20xN9Z3qSEWk4azIF9NKMK
   cLXJ8aHQnndhPiULM6WI3k3D4Np+YQphizgMvn/ffC3FkbZTsaXTdhpG3
   A==;
X-CSE-ConnectionGUID: mD+DfTxhSSSyCqa48XH5hw==
X-CSE-MsgGUID: 4xZb3ZGUTwKiv5n8WFEDWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52041171"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="52041171"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:43:43 -0800
X-CSE-ConnectionGUID: W9zYYC1pSHmIFkoA1Zl+Vw==
X-CSE-MsgGUID: tNDC99FWSiSp6hkLTPHkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="122894023"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO [10.124.221.161]) ([10.124.221.161])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:43:42 -0800
Message-ID: <8a833aaf-53aa-4e56-a560-2b84a6e9c28c@linux.intel.com>
Date: Sun, 2 Mar 2025 19:43:41 -0800
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
Subject: Re: [PATCH v4 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-4-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250217024218.1681-4-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 2/16/25 6:42 PM, Shuai Xue wrote:
> The AER driver has historically avoided reading the configuration space of
> an endpoint or RCiEP that reported a fatal error, considering the link to
> that device unreliable. Consequently, when a fatal error occurs, the AER
> and DPC drivers do not report specific error types, resulting in logs like:
>
>    pcieport 0000:30:03.0: EDR: EDR event received
>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>    nvme nvme0: frozen state error detected, reset controller
>    nvme 0000:34:00.0: ready 0ms after DPC
>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status of the error device.
> In such case, report fatal errors which helps to figure out the error root
> case.
>
> After this patch, the logs like:
>
>    pcieport 0000:30:03.0: EDR: EDR event received
>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>    nvme nvme0: frozen state error detected, reset controller
>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>    nvme 0000:34:00.0: ready 0ms after DPC
>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>    pcieport 0000:30:03.0: AER: broadcast slot_reset message

IMO, above info about device error details is more of a debug info. 
Since the
main use of this info use to understand more details about the recovered
DPC error. So I think is better to print with debug tag. Lets see what 
others
think.

Code wise, looks fine to me.



> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   drivers/pci/pci.h      |  3 ++-
>   drivers/pci/pcie/aer.c | 11 +++++++----
>   drivers/pci/pcie/dpc.c |  2 +-
>   drivers/pci/pcie/err.c |  9 +++++++++
>   4 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 870d2fbd6ff2..e852fa58b250 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -549,7 +549,8 @@ struct aer_err_info {
>   	struct pcie_tlp_log tlp;	/* TLP Header */
>   };
>   
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
> +			      bool link_healthy);
>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>   
>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 508474e17183..bfb67db074f0 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1197,12 +1197,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>    * aer_get_device_error_info - read error status from dev and store it to info
>    * @dev: pointer to the device expected to have a error record
>    * @info: pointer to structure to store the error record
> + * @link_healthy: link is healthy or not
>    *
>    * Return 1 on success, 0 on error.
>    *
>    * Note that @info is reused among all error devices. Clear fields properly.
>    */
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
> +			      bool link_healthy)
>   {
>   	int type = pci_pcie_type(dev);
>   	int aer = dev->aer_cap;
> @@ -1226,7 +1228,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>   	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>   		   type == PCI_EXP_TYPE_RC_EC ||
>   		   type == PCI_EXP_TYPE_DOWNSTREAM ||
> -		   info->severity == AER_NONFATAL) {
> +		   info->severity == AER_NONFATAL ||
> +		   (info->severity == AER_FATAL && link_healthy)) {
>   
>   		/* Link is still healthy for IO reads */
>   		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
> @@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>   
>   	/* Report all before handle them, not to lost records by reset etc. */
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info->dev[i], e_info))
> +		if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>   			aer_print_error(e_info->dev[i], e_info);
>   	}
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info->dev[i], e_info))
> +		if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>   			handle_error_source(e_info->dev[i], e_info);
>   	}
>   }
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index ea3ea989afa7..2d3dd831b755 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -303,7 +303,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>   		dpc_process_rp_pio_error(pdev);
>   	else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
>   		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
> -		 aer_get_device_error_info(pdev, &info)) {
> +		 aer_get_device_error_info(pdev, &info, false)) {
>   		aer_print_error(pdev, &info);
>   		pci_aer_clear_nonfatal_status(pdev);
>   		pci_aer_clear_fatal_status(pdev);
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffc..462577b8d75a 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	struct pci_dev *bridge;
>   	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>   	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	struct aer_err_info info;
>   
>   	/*
>   	 * If the error was detected by a Root Port, Downstream Port, RCEC,
> @@ -223,6 +224,13 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   			pci_warn(bridge, "subordinate device reset failed\n");
>   			goto failed;
>   		}
> +
> +		info.severity = AER_FATAL;
> +		/* Link recovered, report fatal errors of RCiEP or EP */
> +		if ((type == PCI_EXP_TYPE_ENDPOINT ||
> +		     type == PCI_EXP_TYPE_RC_END) &&
> +		    aer_get_device_error_info(dev, &info, true))
> +			aer_print_error(dev, &info);
>   	} else {
>   		pci_walk_bridge(bridge, report_normal_detected, &status);
>   	}
> @@ -259,6 +267,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	if (host->native_aer || pcie_ports_native) {
>   		pcie_clear_device_status(dev);
>   		pci_aer_clear_nonfatal_status(dev);
> +		pci_aer_clear_fatal_status(dev);

Add some info about above change in the commit log.

>   	}
>   
>   	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


