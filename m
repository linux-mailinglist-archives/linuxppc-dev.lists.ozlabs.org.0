Return-Path: <linuxppc-dev+bounces-8713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41DABCE5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 06:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1j5m0LqXz2yvk;
	Tue, 20 May 2025 14:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747717179;
	cv=none; b=TVwLhKQxo5NsY4ma65kM5Wxz3eRDxdxjpFPQpeUwDs8HPgq/npUAvOzzv+YlCtPAYd/B06lkaMO39A7H/hkjijEV8tCJEop+EorSX5skfU2UOJtoPpENW4mu+2O2EtCp835hE2iDxDP7UirkBI0bb7uubGaCAoRc95m5O2OcTxY/rqUsLi5u7mMrslndomLlbqTXM9Km7odkKKzYqBDINCV7u9oKXEUFANOz8aWGdHvrSkRu/EHhVb4qdOMh0FbAj1Bnqh8KQIWrF2LQx+5PRddzGTfwZd7qoQxoX/sXV04wQKO6httAF2wGgqlCL8WmLMTEbDLvHzWwz25B1AWP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747717179; c=relaxed/relaxed;
	bh=sSQOrmb/XJA3p1rrATcXJE6Y8I+YZp1fZtB5oYfPXBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xe3brVMsz6tqviNUr8pLSbJEkPZTwH2cHWS/+Rko7YoqvMD6YbPTQ6w4q6QBcL003jeek9MlmFyZt2QSwIVQVYTtmSTgbUf0WZvxtf7aoIVj3RaJwjKXc4VwDn26yCbCVwed76VSUraPUeA8bg0PGVm/X194DIgZuPn9PcSa9fFkHxGOparfcla/45s+v7CKbobQ9sMyRg5GXGJIIriwK8DQCIzy62H6siFwt1FQ6pz+FS8OcftoF3faR5/W4CbL+g4Ti30iHof68gfNoGkf2d5v1qjyi918bFXmfNlI4M24sivOzy/5zYfbv+WGGmrbQXknKdSpgbKqmxNgNzeCQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bMEY5Pf6; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bMEY5Pf6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1j5j40FDz2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 14:59:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747717178; x=1779253178;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GZDcuorP/pXX666TLKaJr4ROBUaG28ei/hv6M8Pc4+A=;
  b=bMEY5Pf6XOWbMGlXhfQn/i7SM6wMM8+6KwIqBJsbPY+fdetQZ16FTN3M
   DSdusRkoAckFZfD5/eH0GUVLQrw9DPrysnA4Nu2/ugyym1RSmOGvUGEFY
   lf2kA9P9g1eYXMEi1WNtWs/J9WmBYKBduhWoegimV7I6OGyiZKNOrZ0hR
   vAoB+Zp/KGtHTPhVRoJCyB1Yd08kVJJI4zSQPL5cs8PGli+YhTPe7f1dq
   i1Ms7nZrx/kSUhjroCgqAuit6PviUdzCNv2V+93uF6br8MiVWr3UO6yPN
   xpxltKAkMdM6+NRSfjCcWQtHcrzvHJfdJk3sVeVfP5CWTz2oW9A9spLRy
   w==;
X-CSE-ConnectionGUID: QaWhTtZ2TgGcmXDd+tERFw==
X-CSE-MsgGUID: KuRp6tA8RB6+PnUkTAyuJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="37251637"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="37251637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:59:33 -0700
X-CSE-ConnectionGUID: 0keAV7GJTkOovI04xB5YHA==
X-CSE-MsgGUID: vSHYEWaeQXqQ/cV2uOL9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139305901"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:59:31 -0700
Message-ID: <e056eb23-e38a-4a0e-83d7-c17c62c0f9f7@linux.intel.com>
Date: Mon, 19 May 2025 21:59:29 -0700
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
Subject: Re: [PATCH v6 14/16] PCI/AER: Introduce ratelimit for error logs
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Martin Petersen <martin.petersen@oracle.com>,
 Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>,
 Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
 Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20250519213603.1257897-1-helgaas@kernel.org>
 <20250519213603.1257897-15-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-15-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn,

On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
>
> Spammy devices can flood kernel logs with AER errors and slow/stall
> execution. Add per-device ratelimits for AER correctable and uncorrectable
> errors that use the kernel defaults (10 per 5s).
>
> There are two AER logging entry points:
>
>    - aer_print_error() is used by DPC and native AER
>
>    - pci_print_aer() is used by GHES and CXL
>
> The native AER aer_print_error() case includes a loop that may log details
> from multiple devices.  This is ratelimited by the union of ratelimits for
> these devices, set by add_error_device(), which collects the devices.  If
> no such device is found, the Error Source message is ratelimited by the
> Root Port or RCEC that received the ERR_* message.
>
> The DPC aer_print_error() case is currently not ratelimited.

Can we also not rate limit fatal errors in AER driver?

>
> The GHES and CXL pci_print_aer() cases are ratelimited by the Error Source
> device.
>
> Sargun at Meta reported internally that a flood of AER errors causes RCU
> CPU stall warnings and CSD-lock warnings.
>
> Tested using aer-inject[1]. Sent 11 AER errors. Observed 10 errors logged
> while AER stats (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) show
> true count of 11.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
>
> [bhelgaas: commit log, factor out trace_aer_event() and aer_print_rp_info()
> changes to previous patches, collect single aer_err_info.ratelimit as union
> of ratelimits of all error source devices]
> Link: https://lore.kernel.org/r/20250321015806.954866-7-pandoh@google.com
> Reported-by: Sargun Dhillon <sargun@meta.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>   drivers/pci/pci.h      |  3 ++-
>   drivers/pci/pcie/aer.c | 49 ++++++++++++++++++++++++++++++++++++------
>   drivers/pci/pcie/dpc.c |  1 +
>   3 files changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 705f9ef58acc..65c466279ade 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -593,7 +593,8 @@ struct aer_err_info {
>   	unsigned int id:16;
>   
>   	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
> -	unsigned int __pad1:5;
> +	unsigned int ratelimit:1;	/* 0=skip, 1=print */
> +	unsigned int __pad1:4;
>   	unsigned int multi_error_valid:1;
>   
>   	unsigned int first_error:5;
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index da62032bf024..c335e0bb9f51 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -28,6 +28,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/delay.h>
>   #include <linux/kfifo.h>
> +#include <linux/ratelimit.h>
>   #include <linux/slab.h>
>   #include <acpi/apei.h>
>   #include <acpi/ghes.h>
> @@ -88,6 +89,10 @@ struct aer_report {
>   	u64 rootport_total_cor_errs;
>   	u64 rootport_total_fatal_errs;
>   	u64 rootport_total_nonfatal_errs;
> +
> +	/* Ratelimits for errors */
> +	struct ratelimit_state cor_log_ratelimit;
> +	struct ratelimit_state uncor_log_ratelimit;
>   };
>   
>   #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
> @@ -379,6 +384,11 @@ void pci_aer_init(struct pci_dev *dev)
>   
>   	dev->aer_report = kzalloc(sizeof(*dev->aer_report), GFP_KERNEL);
>   
> +	ratelimit_state_init(&dev->aer_report->cor_log_ratelimit,
> +			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> +	ratelimit_state_init(&dev->aer_report->uncor_log_ratelimit,
> +			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> +
>   	/*
>   	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
>   	 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
> @@ -672,6 +682,18 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   	}
>   }
>   
> +static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
> +{
> +	struct ratelimit_state *ratelimit;
> +
> +	if (severity == AER_CORRECTABLE)
> +		ratelimit = &dev->aer_report->cor_log_ratelimit;
> +	else
> +		ratelimit = &dev->aer_report->uncor_log_ratelimit;
> +
> +	return __ratelimit(ratelimit);
> +}
> +
>   static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   {
>   	const char **strings;
> @@ -715,6 +737,9 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   
>   	pci_dev_aer_stats_incr(dev, info);
>   
> +	if (!info->ratelimit)
> +		return;
> +
>   	if (!info->status) {
>   		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
>   			aer_error_severity_string[info->severity]);
> @@ -785,6 +810,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   
>   	pci_dev_aer_stats_incr(dev, &info);
>   
> +	if (!aer_ratelimit(dev, info.severity))
> +		return;
> +
>   	layer = AER_GET_LAYER_ERROR(aer_severity, status);
>   	agent = AER_GET_AGENT(aer_severity, status);
>   
> @@ -815,8 +843,14 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>    */
>   static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
>   {
> +	/*
> +	 * Ratelimit AER log messages.  Generally we add the Error Source
> +	 * device, but there are is_error_source() cases that can result in
> +	 * multiple devices being added here, so we OR them all together.
> +	 */
>   	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
>   		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
> +		e_info->ratelimit |= aer_ratelimit(dev, e_info->severity);
>   		e_info->error_dev_num++;
>   		return 0;
>   	}
> @@ -914,7 +948,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
>    * e_info->error_dev_num and e_info->dev[], based on the given information.
>    */
>   static bool find_source_device(struct pci_dev *parent,
> -		struct aer_err_info *e_info)
> +			       struct aer_err_info *e_info)
>   {
>   	struct pci_dev *dev = parent;
>   	int result;
> @@ -935,10 +969,12 @@ static bool find_source_device(struct pci_dev *parent,
>   	/*
>   	 * If we didn't find any devices with errors logged in the AER
>   	 * Capability, just print the Error Source ID from the Root Port or
> -	 * RCEC that received an ERR_* Message.
> +	 * RCEC that received an ERR_* Message, ratelimited by the RP or
> +	 * RCEC.
>   	 */
>   	if (!e_info->error_dev_num) {
> -		aer_print_source(parent, e_info, " (no details found)");
> +		if (aer_ratelimit(parent, e_info->severity))
> +			aer_print_source(parent, e_info, " (no details found)");
>   		return false;
>   	}
>   	return true;
> @@ -1147,9 +1183,10 @@ static void aer_recover_work_func(struct work_struct *work)
>   		pdev = pci_get_domain_bus_and_slot(entry.domain, entry.bus,
>   						   entry.devfn);
>   		if (!pdev) {
> -			pr_err("no pci_dev for %04x:%02x:%02x.%x\n",
> -			       entry.domain, entry.bus,
> -			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
> +			pr_err_ratelimited("%04x:%02x:%02x.%x: no pci_dev found\n",
> +					   entry.domain, entry.bus,
> +					   PCI_SLOT(entry.devfn),
> +					   PCI_FUNC(entry.devfn));
>   			continue;
>   		}
>   		pci_print_aer(pdev, entry.severity, entry.regs);
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 34af0ea45c0d..597df7790f36 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -301,6 +301,7 @@ void dpc_process_error(struct pci_dev *pdev)
>   	else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
>   		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
>   		 aer_get_device_error_info(pdev, &info)) {
> +		info.ratelimit = 1;	/* no ratelimiting */
>   		aer_print_error(pdev, &info);
>   		pci_aer_clear_nonfatal_status(pdev);
>   		pci_aer_clear_fatal_status(pdev);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


