Return-Path: <linuxppc-dev+bounces-12355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A72B816E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 21:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRpHr42qtz2ymg;
	Thu, 18 Sep 2025 05:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758136216;
	cv=none; b=lgtULXzdJeD0wwKVMiHvXdKbMjhzCS7oJlVcr7AUzglSBkn74FwjC67/a/n6TYdkzGuGtvxmPZ+/5svZ8CLYvNKZSaVDXebTQ7iJdb7XlyzEtFdct2WNNQ9+rvaBtCF+OEsByMRYEWk7it6+zPPMohMN7FCnYEjrE72c88Dxh9vaLqO2vmdDDROdscWHiwxzr2+D/tdnyaDA1lKlffQD2eFz9SMF5/7PlOggCySKkR0DW/kMRsfbLzMz4l4XkhfIePnRlXH61+xrMErF27ePZbLA134SbA0IObDKJfd5QqSovwOfwclJCMUGN+ZgmxW3MVA6JuFs2Afcqn8bmQBs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758136216; c=relaxed/relaxed;
	bh=DZGekDDGHBmt3tT9IJ5oEvr0agv5JpgBfD8eOTMFPig=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n/ZpyJC7fcdUjiLkcDQ4EIo9QTbbnQNiiQimXR0kBKH50UUrhvpFkYkK667lDStMXFaWMrykt7AJmlA+sGOO66qjxbeBQXkQ1FeC7Z1doSW/2MjhBNWJeFOBRqRT7sJEtyxQ2nJR/TOuVJlZuwxTCkv0GuCWnEaVrBy8g5MxHy/haPPYJEB+srWzX8zKBnlM/7Q0Ij4+9XeBH3KMKN5QlvZH0SUAcATED7jVJXmTQzaxDQViYESd405kxAGObw6CqLNWTHGrm1TJEH1euGQokvKHW6/YDtRtP7tivKeTXOeRTZNLztBVdWJBQAYUeK6fdthMuDHwzaBbo1hp7i4fyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWQlWWTs; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWQlWWTs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRpHp0W67z2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 05:10:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758136214; x=1789672214;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=7tRIZV6upeMWSvtkamc7GBh/C+JXZ89rhwhu8ilQuAg=;
  b=DWQlWWTsnuKyW64poD4lQQbcEv0q2cUhvOsd/sxy+CfcCk6v233kFSfZ
   FQPfUFiEaeIV15GEvKkItOnFnbqG5+QKCgpz9YCQkRy0l6Jxubt/xwfLN
   mmFIkYSJFsnUMwvAwOIbosLEf4jzoZnLYfWwr+Rz9hpaUm3QW2+YJQXhJ
   dH5eWLqMjeCguFH7YxfFapUFABKXuYrFBGfW0SXL82Wir+u1JxkaDoHVG
   Pta7CuibeTb29lu32rtbEdLOp5CTaqFfuCQMMgq5etorr2OvGp3s87wmU
   Ih8ll0pPMuIVgphjexJ0IIEXKnQTvjtABvJT4U9VteVJsUb8zMHrtSG2P
   w==;
X-CSE-ConnectionGUID: bBwYJ+nNSeyYAjjZBOoT+w==
X-CSE-MsgGUID: b3lDfgWEQs6lG0FB6jtJzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60522233"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60522233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 12:10:10 -0700
X-CSE-ConnectionGUID: ewyB4kgSSX6E7fQdH84+Ew==
X-CSE-MsgGUID: mElF4NHpS8mr9pu7oOl2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="179319190"
Received: from skuppusw-desk2.jf.intel.com (HELO [10.165.154.101]) ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 12:10:09 -0700
Message-ID: <2712a56a-1e2f-4ad8-8ad9-8b7825f4eefd@linux.intel.com>
Date: Wed, 17 Sep 2025 12:09:57 -0700
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
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v5 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Shuai Xue <xueshuai@linux.alibaba.com>, bhelgaas@google.com,
 mahesh@linux.ibm.com, mani@kernel.org, Jonathan.Cameron@huawei.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250917063352.19429-1-xueshuai@linux.alibaba.com>
 <20250917063352.19429-4-xueshuai@linux.alibaba.com>
Content-Language: en-US
In-Reply-To: <20250917063352.19429-4-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/16/25 23:33, Shuai Xue wrote:
> The AER driver has historically avoided reading the configuration space of
> an endpoint or RCiEP that reported a fatal error, considering the link to
> that device unreliable. Consequently, when a fatal error occurs, the AER
> and DPC drivers do not report specific error types, resulting in logs like:
>
> 	pcieport 0015:00:00.0: EDR: EDR event received
> 	pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
> 	pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
> 	pcieport 0015:00:00.0: AER: broadcast error_detected message
> 	pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
> 	pcieport 0015:00:00.0: AER: broadcast resume message
> 	pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
> 	pcieport 0015:00:00.0: AER: device recovery successful
> 	pcieport 0015:00:00.0: EDR: DPC port successfully recovered
> 	pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status and TLP header of the
> error device. In such case, report fatal errors which helps to figure out the
> error root case.
>
> After this patch, the logs like:
>
> 	pcieport 0015:00:00.0: EDR: EDR event received
> 	pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
> 	pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
> 	pcieport 0015:00:00.0: AER: broadcast error_detected message
> 	vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
> 	pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
> 	vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
> 	vfio-pci 0015:01:00.0:    [12] TLP                    (First)
> 	vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
> 	pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
> 	pcieport 0015:00:00.0: AER: broadcast resume message
> 	pcieport 0015:00:00.0: AER: device recovery successful
> 	pcieport 0015:00:00.0: EDR: DPC port successfully recovered
> 	pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   drivers/pci/pci.h      |  3 ++-
>   drivers/pci/pcie/aer.c | 11 +++++++----
>   drivers/pci/pcie/dpc.c |  2 +-
>   drivers/pci/pcie/err.c | 11 +++++++++++
>   4 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index de2f07cefa72..b8d364545e7d 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -629,7 +629,8 @@ struct aer_err_info {
>   	struct pcie_tlp_log tlp;	/* TLP Header */
>   };
>   
> -int aer_get_device_error_info(struct aer_err_info *info, int i);
> +int aer_get_device_error_info(struct aer_err_info *info, int i,
> +			      bool link_healthy);
>   void aer_print_error(struct aer_err_info *info, int i);
>   
>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d716..157ad7fb44a0 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1351,12 +1351,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>    * aer_get_device_error_info - read error status from dev and store it to info
>    * @info: pointer to structure to store the error record
>    * @i: index into info->dev[]
> + * @link_healthy: link is healthy or not
>    *
>    * Return: 1 on success, 0 on error.
>    *
>    * Note that @info is reused among all error devices. Clear fields properly.
>    */
> -int aer_get_device_error_info(struct aer_err_info *info, int i)
> +int aer_get_device_error_info(struct aer_err_info *info, int i,
> +			      bool link_healthy)
>   {
>   	struct pci_dev *dev;
>   	int type, aer;
> @@ -1387,7 +1389,8 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>   	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>   		   type == PCI_EXP_TYPE_RC_EC ||
>   		   type == PCI_EXP_TYPE_DOWNSTREAM ||
> -		   info->severity == AER_NONFATAL) {
> +		   info->severity == AER_NONFATAL ||
> +		   (info->severity == AER_FATAL && link_healthy)) {
>   
>   		/* Link is still healthy for IO reads */
>   		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
> @@ -1420,11 +1423,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>   
>   	/* Report all before handling them, to not lose records by reset etc. */
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info, i))
> +		if (aer_get_device_error_info(e_info, i, false))
>   			aer_print_error(e_info, i);
>   	}
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info, i))
> +		if (aer_get_device_error_info(e_info, i, false))
>   			handle_error_source(e_info->dev[i], e_info);
>   	}
>   }
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index f6069f621683..21c4e8371279 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -284,7 +284,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>   		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
>   			 status);
>   		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
> -		    aer_get_device_error_info(&info, 0)) {
> +		    aer_get_device_error_info(&info, 0, false)) {
>   			aer_print_error(&info, 0);
>   			pci_aer_clear_nonfatal_status(pdev);
>   			pci_aer_clear_fatal_status(pdev);
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5..744d77ee7271 100644
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
> @@ -223,6 +224,15 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   			pci_warn(bridge, "subordinate device reset failed\n");
>   			goto failed;
>   		}
> +
> +		info.dev[0] = dev;
> +		info.level = KERN_ERR;
> +		info.severity = AER_FATAL;
> +		/* Link recovered, report fatal errors of RCiEP or EP */
> +		if ((type == PCI_EXP_TYPE_ENDPOINT ||
> +		     type == PCI_EXP_TYPE_RC_END) &&
> +		    aer_get_device_error_info(&info, 0, true))
> +			aer_print_error(&info, 0);
>   	} else {
>   		pci_walk_bridge(bridge, report_normal_detected, &status);
>   	}
> @@ -259,6 +269,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	if (host->native_aer || pcie_ports_native) {
>   		pcie_clear_device_status(dev);
>   		pci_aer_clear_nonfatal_status(dev);
> +		pci_aer_clear_fatal_status(dev);

Above change looks unrelated to dumping the error info. It would be better if
you move it to a separate patch.

>   	}
>   
>   	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

