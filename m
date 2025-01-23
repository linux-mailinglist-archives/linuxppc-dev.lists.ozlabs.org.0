Return-Path: <linuxppc-dev+bounces-5532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84058A1AAE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 21:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfBs900Pxz30J8;
	Fri, 24 Jan 2025 07:10:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737663052;
	cv=none; b=IAy7Amgq1ssSnu00uI8/uvaB0HtSTvr1SBFSu996P3d9yRgROpd/KP/CFiJbsuIKq+jH2f+UkiJj5lVmj2UFV3RyJaFmWlwwXdoON3IKuEp+6VYs9hy6qiUb04btYaG7HlrWZmLlp6K1CIOgVIbR9tyebfd1MFQ6aRi51fYYn83aCs4gFaU56rqS55IZoPaM+P8AjttxXWBr0kG3YWN7eL6E+Gcxb1S9FcOAB9TgTNUkv7oXLo27O6eDqSe35jsxT9YIz+tCdbhePNXvvvnR1kUPfZxY/bGTxObwCIkSGYOm06xlVm0uDmJAhKShlnQrWIsH3xYQidvhR338YLniXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737663052; c=relaxed/relaxed;
	bh=m51p6OgwUz1OojHnKCDmGlbCqF/xgfUBL6rlovqevE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft7i+0bUJP6YrbXuhhQcYxIMCzVs3x8S56Mn0fKo59Fct701n3waekuhpxVYb51tJStDpJchtpQi12ezaxOuD+rO+v9PLwEmtNo1LdBeYniyXyQK4M6z0bHhBvA5eZWYS9BGQF6Sgpbl2oQVv81qNA1GKeaN1dVwAdqnVqmF5KRMm+4Kh/5vJM0YNC5tSqhyNUOZ2tW7rGVrerRn0seMBokfeshr9hmT5WVjUcd0Q6A/QrSV1mXOUEgN0LBy1djqUEQR+9wjJz2dtS1rABzU3M4CYAcjk5mIxk29enH+UgQh1R/JAwo/iihGS8mGRK5/t8o1hZdAmbakYqnQCoyDjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h++6Jhrc; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h++6Jhrc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfBs63N1bz30DV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 07:10:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737663051; x=1769199051;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i00Df96kpTYh88wolV91mHKE7jCvN56hXQ7Oxg4LBio=;
  b=h++6JhrcVjeBp7o5zX9gZZeBQa6KsZtyY+roxKPjXOXZq0qVR4LwRLn1
   hYh5TnCsBWhBE5OKASN8J1HNklQsfytYmRliLQCEZr0Rtx16DhJVbX1Xy
   qLJ5EZfZ1QB0fCkYvLpEdDYDoeSc7REdR+Bk7jtrLONcQ93TH3lUiJK9x
   g4GRof1XFWsyOAn2zwEDAmhCzutRMqgrK+5Ck+ghK+tsrAgn17xRAJK4K
   JBnX+db5X4SrICq7izigieJO/fU1f7TXu/BRf6LnVIf6ipWTFoly7jYDo
   7IWv4EIci5BRovhzPnHslHYTfWmA/HUqbm7F/O4BP0m3nyrO6ZzhSMjme
   w==;
X-CSE-ConnectionGUID: Fkv6B1X8QR6JGkwLPRtkmQ==
X-CSE-MsgGUID: DfhPjrp+RF2j4yY4Zo/b4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55599691"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="55599691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:10:46 -0800
X-CSE-ConnectionGUID: DPdciZukRWqligHQknASow==
X-CSE-MsgGUID: M4R5m23dQMuMGquFlmFLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144809297"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.124.223.78]) ([10.124.223.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:10:45 -0800
Message-ID: <4b5230a1-26fd-4594-9daf-5df314c6b4c6@linux.intel.com>
Date: Thu, 23 Jan 2025 12:10:27 -0800
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
Subject: Re: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-3-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20241112135419.59491-3-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On 11/12/24 5:54 AM, Shuai Xue wrote:
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
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   drivers/pci/pci.h      |  3 ++-
>   drivers/pci/pcie/aer.c | 11 +++++++----
>   drivers/pci/pcie/dpc.c |  2 +-
>   drivers/pci/pcie/err.c |  9 +++++++++
>   4 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 0866f79aec54..6f827c313639 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -504,7 +504,8 @@ struct aer_err_info {
>   	struct pcie_tlp_log tlp;	/* TLP Header */
>   };
>   
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
> +			      bool link_healthy);
>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>   #endif	/* CONFIG_PCIEAER */
>   
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 13b8586924ea..97ec1c17b6f4 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1200,12 +1200,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
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
> @@ -1229,7 +1231,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
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
> index 62a68cde4364..b3f157a00405 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -304,7 +304,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
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

IMO, error device information is more like a debug info. Can we change
the print level of this info to debug?

>   	} else {
>   		pci_walk_bridge(bridge, report_normal_detected, &status);
>   	}
> @@ -259,6 +267,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	if (host->native_aer || pcie_ports_native) {
>   		pcie_clear_device_status(dev);
>   		pci_aer_clear_nonfatal_status(dev);
> +		pci_aer_clear_fatal_status(dev);

I think we clear fatal status in DPC driver, why do it again?

>   	}
>   
>   	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


