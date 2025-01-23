Return-Path: <linuxppc-dev+bounces-5488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB71A19DCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 05:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdpXj4tqdz2yRZ;
	Thu, 23 Jan 2025 15:55:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737608117;
	cv=none; b=DuIrw4JEzOmcop1DdRtmlXjf5p2Yqc8I6XslftibzbUUwXcHx1zrR0fieYLPBCIkSx8TOBsATZQGDUrbn1SI0fEDHDQuJA0wufzdawdFUPOLOs4Izi+ppUhv7RP2AyHOVEf9NjwNbfMXqjtnJdaZaMq1prz2aSuvbW0f70crslJiwvONSfDJ90OYdiQ9ZHo0NIADK71aIDOXyfmRO+NomBcf0z6bvVUAIHXqMsBwuJ35XjJjzxBl3bRM9cQE4FyKH+hY3KpzxDNvEvQP4g825V/b2yeI6OIhW4TDWAnBVWR8XMQmdeB84rVoOVhSBZFAvDVJQ7Vkr+9jPHGPT18GrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737608117; c=relaxed/relaxed;
	bh=F23d6xOlyWCvTN7MJbuH4BGTWiaDsNJvu5xMqAeKTFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQKftvNCXtmV8XiKvC0TFZ01M6i3G46Wi7CftYb3NPV0ZWz3maDlAel2Bm6BqQ7ytZgNbiYDQxksH5/UQJumkoRlnBH8XtMWouQdyoA3NE1tpb7JH12ywG4GTmrae5rDp4nPBSA5JxyvEUtskiIdqZIVCj/jWfPfiVBHm0wopHTzyJN6KuE+IbeOwF1y7zWSGIBovCRKr/ick/KrbIC8dF05OVazg+Q9sgGzAFJaDSas8ZY+z8WlRdsetuanMwgCIXVy4qf79FFSNjKZHud7ejKYFO79J6lp30ozFZNl8tl+RERSplz45nQ6pUGSv6WnUBRgQtF5RWoLSSHlSXw6Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fjvANng0; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fjvANng0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 23 Jan 2025 15:55:14 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdpXf6zMdz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 15:55:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737608115; x=1769144115;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VHtOVhntom8BTB/HjIiTtRyLLhH4JYi4Dw+wmQMvLB8=;
  b=fjvANng0bJSayniywkyVhGeBpje21j/R9xl3NiwHdGQKgJDV9cqu563P
   aVZuQvosjVKqBAhDk4idOGcFuXtRFS7PLCJboM1bQW/9/aVGrVomBk1vO
   FKqxCSCjdJ11u810l9WAEzdpAvkL+llvO6GC/lssuqxfJG5WkyITEkXpN
   C+mf7X/ouPyg908DPVtrI/xIACsdXV7k0ZSn4aztfYzPY3qYL5MtFgcGD
   m8BbHO7Bd0uqp4r9LS/OtlRuZ4abUoyHUWLV3VpHoE1cuirWVa2pTIds9
   /rFZuzaEfM7Uuxhf/HIsz5zS4ByhCz2WsFtGgYf97R9mWjcRnWUHbv0kz
   A==;
X-CSE-ConnectionGUID: S1FQkZPZTDyzBPqz7Effdw==
X-CSE-MsgGUID: o/OLEfmpSAuX313hgNaYLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37973435"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="37973435"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 20:54:06 -0800
X-CSE-ConnectionGUID: ywOf4q6/SX+lRRBTyVEc0Q==
X-CSE-MsgGUID: MJk9QptgQA6OEDkWOIVucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112457096"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.124.223.40]) ([10.124.223.40])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 20:54:05 -0800
Message-ID: <b109aca6-1eb2-43d2-b9c9-fb014d00bf7d@linux.intel.com>
Date: Wed, 22 Jan 2025 20:53:48 -0800
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
Subject: Re: [PATCH v2 1/2] PCI/DPC: Run recovery on device that detected the
 error
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-2-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20241112135419.59491-2-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 11/12/24 5:54 AM, Shuai Xue wrote:
> The current implementation of pcie_do_recovery() assumes that the
> recovery process is executed on the device that detected the error.
> However, the DPC driver currently passes the error port that experienced
> the DPC event to pcie_do_recovery().
>
> Use the SOURCE ID register to correctly identify the device that detected the
> error. By passing this error device to pcie_do_recovery(), subsequent
> patches will be able to accurately access AER status of the error device.

When passing the error device, I assume pcie_do_recovery() will find the
upstream bride and run the recovery logic .

>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

IMO, moving the "err_port" rename to a separate patch will make this change
more clear.  But it is up to you.

>   drivers/pci/pci.h      |  2 +-
>   drivers/pci/pcie/dpc.c | 30 ++++++++++++++++++++++++------
>   drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
>   3 files changed, 43 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 14d00ce45bfa..0866f79aec54 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -521,7 +521,7 @@ struct rcec_ea {
>   void pci_save_dpc_state(struct pci_dev *dev);
>   void pci_restore_dpc_state(struct pci_dev *dev);
>   void pci_dpc_init(struct pci_dev *pdev);
> -void dpc_process_error(struct pci_dev *pdev);
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>   pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>   bool pci_dpc_recovered(struct pci_dev *pdev);
>   #else
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 2b6ef7efa3c1..62a68cde4364 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -257,10 +257,17 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>   	return 1;
>   }
>   
> -void dpc_process_error(struct pci_dev *pdev)
> +/**
> + * dpc_process_error - handle the DPC error status

Handling the DPC error status has nothing to do with finding
the error source. Why not add a new helper function?

> + * @pdev: the port that experienced the containment event
> + *
> + * Return the device that experienced the error.
detected the error?
> + */
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>   {
>   	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>   	struct aer_err_info info;
> +	struct pci_dev *err_dev = NULL;

I don't think you need NULL initialization here.

>   
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> @@ -283,6 +290,13 @@ void dpc_process_error(struct pci_dev *pdev)
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
> @@ -295,6 +309,8 @@ void dpc_process_error(struct pci_dev *pdev)
>   		pci_aer_clear_nonfatal_status(pdev);
>   		pci_aer_clear_fatal_status(pdev);
>   	}
> +
> +	return err_dev;
>   }
>   
>   static void pci_clear_surpdn_errors(struct pci_dev *pdev)
> @@ -350,21 +366,23 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>   
>   static irqreturn_t dpc_handler(int irq, void *context)
>   {
> -	struct pci_dev *pdev = context;
> +	struct pci_dev *err_port = context, *err_dev = NULL;

NULL initialization is not needed.

>   
>   	/*
>   	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
>   	 * of async removal and should be ignored by software.
>   	 */
> -	if (dpc_is_surprise_removal(pdev)) {
> -		dpc_handle_surprise_removal(pdev);
> +	if (dpc_is_surprise_removal(err_port)) {
> +		dpc_handle_surprise_removal(err_port);
>   		return IRQ_HANDLED;
>   	}
>   
> -	dpc_process_error(pdev);
> +	err_dev = dpc_process_error(err_port);
>   
>   	/* We configure DPC so it only triggers on ERR_FATAL */
> -	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
> +	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
> +
> +	pci_dev_put(err_dev);
>   
>   	return IRQ_HANDLED;
>   }
> diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
> index e86298dbbcff..6ac95e5e001b 100644
> --- a/drivers/pci/pcie/edr.c
> +++ b/drivers/pci/pcie/edr.c
> @@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
>   
>   static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   {
> -	struct pci_dev *pdev = data, *edev;
> +	struct pci_dev *pdev = data, *err_port, *err_dev = NULL;
>   	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
>   	u16 status;
>   
> @@ -169,36 +169,36 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   	 * may be that port or a parent of it (PCI Firmware r3.3, sec
>   	 * 4.6.13).
>   	 */
> -	edev = acpi_dpc_port_get(pdev);
> -	if (!edev) {
> +	err_port = acpi_dpc_port_get(pdev);
> +	if (!err_port) {
>   		pci_err(pdev, "Firmware failed to locate DPC port\n");
>   		return;
>   	}
>   
> -	pci_dbg(pdev, "Reported EDR dev: %s\n", pci_name(edev));
> +	pci_dbg(pdev, "Reported EDR dev: %s\n", pci_name(err_port));
>   
>   	/* If port does not support DPC, just send the OST */
> -	if (!edev->dpc_cap) {
> -		pci_err(edev, FW_BUG "This device doesn't support DPC\n");
> +	if (!err_port->dpc_cap) {
> +		pci_err(err_port, FW_BUG "This device doesn't support DPC\n");
>   		goto send_ost;
>   	}
>   
>   	/* Check if there is a valid DPC trigger */
> -	pci_read_config_word(edev, edev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
> +	pci_read_config_word(err_port, err_port->dpc_cap + PCI_EXP_DPC_STATUS, &status);
>   	if (!(status & PCI_EXP_DPC_STATUS_TRIGGER)) {
> -		pci_err(edev, "Invalid DPC trigger %#010x\n", status);
> +		pci_err(err_port, "Invalid DPC trigger %#010x\n", status);
>   		goto send_ost;
>   	}
>   
> -	dpc_process_error(edev);
> -	pci_aer_raw_clear_status(edev);
> +	err_dev = dpc_process_error(err_port);
> +	pci_aer_raw_clear_status(err_port);
>   
>   	/*
>   	 * Irrespective of whether the DPC event is triggered by ERR_FATAL
>   	 * or ERR_NONFATAL, since the link is already down, use the FATAL
>   	 * error recovery path for both cases.
>   	 */
> -	estate = pcie_do_recovery(edev, pci_channel_io_frozen, dpc_reset_link);
> +	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
>   
>   send_ost:
>   
> @@ -207,15 +207,16 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>   	 * to firmware. If not successful, send _OST(0xF, BDF << 16 | 0x81).
>   	 */
>   	if (estate == PCI_ERS_RESULT_RECOVERED) {
> -		pci_dbg(edev, "DPC port successfully recovered\n");
> -		pcie_clear_device_status(edev);
> -		acpi_send_edr_status(pdev, edev, EDR_OST_SUCCESS);
> +		pci_dbg(err_port, "DPC port successfully recovered\n");
> +		pcie_clear_device_status(err_port);
> +		acpi_send_edr_status(pdev, err_port, EDR_OST_SUCCESS);
>   	} else {
> -		pci_dbg(edev, "DPC port recovery failed\n");
> -		acpi_send_edr_status(pdev, edev, EDR_OST_FAILED);
> +		pci_dbg(err_port, "DPC port recovery failed\n");
> +		acpi_send_edr_status(pdev, err_port, EDR_OST_FAILED);
>   	}
>   
> -	pci_dev_put(edev);
> +	pci_dev_put(err_port);
> +	pci_dev_put(err_dev);
>   }
>   
>   void pci_acpi_add_edr_notifier(struct pci_dev *pdev)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


