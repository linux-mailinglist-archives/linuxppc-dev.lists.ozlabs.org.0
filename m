Return-Path: <linuxppc-dev+bounces-8904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A471AC18A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:57:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3QF95zxTz3c8x;
	Fri, 23 May 2025 09:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747958221;
	cv=none; b=BsJ3z/PZorMrgxx+KRpkx6/bAPF+aGbmvtUrlIP3W1xwpf3HUd81MEpIcZieNvay8lg+j1sxFGdWkZbFtcWZHc0j9z0YrGaZ/zLXEENoN0yiSPIZ9VQCFRhlp2llKVqnAGg8aKiUJQqDNNcOBFVx4csLomHoR6oaUXGCPqgsOzhU5aqdROYln5MIxABdcXIWSh8Ka9/hAVvRS5Qxhl1EFYOWm4k/msyHL8n5nBwHUFf03Y0/aaD7K8GpNRPDMwcEDZ7mKOxc29IWACKIC2OXeDlgipTTyfVFVHAC2z6wty8nfKHVHoVgC3hX62BvRc6pH/XyEn207xHJiI+noUMyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747958221; c=relaxed/relaxed;
	bh=D2gzed/rF0MP4INEQbFqjGBFzMWBacxx2uHschwcoGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilWc6eAGcyzdFL+A5J+b1Fke7UTDoCwMrFRGzySctO+dV+37W+pZb5sqa98mlBATm1NVcHIH7TaD7p9VsWzUVON2nGMm6GCahyP2T1m4lwB8e1cn472YZA/zyb8RZCrnENnPv56YzYUY2JfFQsdkfiYG8uhw5TmRl6iTvI+Hp1u0OTVjXKkVtXCIfXPIO8VX/wlKjMBv/tTHkzmLcfq4slzzrKV5OU38PziI1jsrS5bYMEKN3FpD7Fa30Hr93ZMQ4yic45znqbWoTT/PhWbslluRqjjPusXIiUt2uJtieaZddd9q7NzgoRxFDVS6vo794Pad+KMV/AhdSbIfV0Azrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BMf50YNO; dkim-atps=neutral; spf=none (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BMf50YNO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3QF84tl0z3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:57:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747958221; x=1779494221;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R85bbT9Dc81H+rqCAe21eFxOQojAs8DRz3kMLmRqjIg=;
  b=BMf50YNO/MY46GUwFoyRBYpQOxhKE1KRkRNZvQFYzWcB3FRvIcATDkmz
   ahDaBEP0PmQWoj41SeFdGLeo2hhVKzR4PokpEtKl6cqhGMFcfUhfF+MXm
   ttrvTircW6dBSXKcRSAMdAcldGrrzc35GU43Gyf47Do8udAiA4we2Vp9f
   IlTKWoExTZVoramGGlgV1mwxKK0bY/9KkCGZNJSt/ASUBDMyCUGTfo9jq
   AsJlUZ8FsS1oUIEGQhcDerT3PnTDcIGjKv7D/ZCYXHzRkrXOB7iqLwSGj
   9oKpNbDr54DKB14q9+xINwZf5t4suwdkXrn8jRyEV2rsu/L1V3K2gkKFm
   g==;
X-CSE-ConnectionGUID: RGLTBuXaT7yehX3nXfwGJw==
X-CSE-MsgGUID: eHqDsHjBROuPY+l69DLC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60643686"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60643686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:56:58 -0700
X-CSE-ConnectionGUID: vqIPccFTQXebMm9zTebhfA==
X-CSE-MsgGUID: IQaxMz21SkeYaWHU/DxIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140657751"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.120]) ([10.124.223.120])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:56:57 -0700
Message-ID: <eb9bca3e-cb0a-41e9-bf7f-0889eb3f3c47@linux.intel.com>
Date: Thu, 22 May 2025 16:56:56 -0700
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
Subject: Re: [PATCH v8 18/20] PCI/AER: Ratelimit correctable and non-fatal
 error logging
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Weinan Liu <wnliu@google.com>, Martin Petersen <martin.petersen@oracle.com>,
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
References: <20250522232339.1525671-1-helgaas@kernel.org>
 <20250522232339.1525671-19-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250522232339.1525671-19-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/22/25 4:21 PM, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
>
> Spammy devices can flood kernel logs with AER errors and slow/stall
> execution. Add per-device ratelimits for AER correctable and non-fatal
> uncorrectable errors that use the kernel defaults (10 per 5s).  Logging of
> fatal errors is not ratelimited.
>
> There are two AER logging entry points:
>
>    - aer_print_error() is used by DPC and native AER
>
>    - pci_print_aer() is used by GHES and CXL
>
> The native AER aer_print_error() case includes a loop that may log details
> from multiple devices, which are ratelimited individually.  If we log
> details for any device, we also log the Error Source ID from the Root Port
> or RCEC.
>
> If no such device details are found, we still log the Error Source from the
> ERR_* Message, ratelimited by the Root Port or RCEC that received it.
>
> The DPC aer_print_error() case is not ratelimited, since this only happens
> for fatal errors.
>
> The CXL pci_print_aer() case is ratelimited by the Error Source device.
>
> The GHES pci_print_aer() case is via aer_recover_work_func(), which
> searches for the Error Source device.  If the device is not found, there's
> no per-device ratelimit, so we use a system-wide ratelimit that covers all
> error types (correctable, non-fatal, and fatal).
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
> changes to previous patches, enable Error Source logging if any downstream
> detail will be printed, don't ratelimit fatal errors, "aer_report" ->
> "aer_info", "cor_log_ratelimit" -> "correctable_ratelimit",
> "uncor_log_ratelimit" -> "nonfatal_ratelimit"]
>
> Reported-by: Sargun Dhillon <sargun@meta.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Link: https://patch.msgid.link/20250520215047.1350603-16-helgaas@kernel.org
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pci.h      |  4 ++-
>   drivers/pci/pcie/aer.c | 69 +++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 67 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index e1a28215967f..3023c68fe485 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -587,13 +587,15 @@ static inline bool pci_dev_test_and_set_removed(struct pci_dev *dev)
>   
>   struct aer_err_info {
>   	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
> +	int ratelimit_print[AER_MAX_MULTI_ERR_DEVICES];
>   	int error_dev_num;
>   	const char *level;		/* printk level */
>   
>   	unsigned int id:16;
>   
>   	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
> -	unsigned int __pad1:5;
> +	unsigned int root_ratelimit_print:1;	/* 0=skip, 1=print */
> +	unsigned int __pad1:4;
>   	unsigned int multi_error_valid:1;
>   
>   	unsigned int first_error:5;
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 24f0f5c55256..ebac126144fc 100644
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
> @@ -88,6 +89,10 @@ struct aer_info {
>   	u64 rootport_total_cor_errs;
>   	u64 rootport_total_fatal_errs;
>   	u64 rootport_total_nonfatal_errs;
> +
> +	/* Ratelimits for errors */
> +	struct ratelimit_state correctable_ratelimit;
> +	struct ratelimit_state nonfatal_ratelimit;
>   };
>   
>   #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
> @@ -379,6 +384,11 @@ void pci_aer_init(struct pci_dev *dev)
>   
>   	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
>   
> +	ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
> +			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> +	ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
> +			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> +
>   	/*
>   	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
>   	 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
> @@ -669,6 +679,21 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   	}
>   }
>   
> +static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
> +{
> +	struct ratelimit_state *ratelimit;
> +
> +	if (severity == AER_FATAL)
> +		return 1;	/* AER_FATAL not ratelimited */
> +
> +	if (severity == AER_CORRECTABLE)
> +		ratelimit = &dev->aer_info->correctable_ratelimit;
> +	else
> +		ratelimit = &dev->aer_info->nonfatal_ratelimit;
> +
> +	return __ratelimit(ratelimit);
> +}
> +

Why not combine severity checks? May be something like below:

     switch (severity) {
     case AER_NONFATAL:
         return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
     case AER_CORRECTABLE:
         return __ratelimit(&dev->aer_info->correctable_ratelimit);
     default:
         return 1; /* Don't rate-limit fatal errors */
     }

>   static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   {
>   	const char **strings;
> @@ -721,6 +746,9 @@ void aer_print_error(struct aer_err_info *info, int i)
>   	trace_aer_event(pci_name(dev), (info->status & ~info->mask),
>   			info->severity, info->tlp_header_valid, &info->tlp);
>   
> +	if (!info->ratelimit_print[i])
> +		return;
> +
>   	if (!info->status) {
>   		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
>   			aer_error_severity_string[info->severity]);
> @@ -790,6 +818,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   	trace_aer_event(pci_name(dev), (status & ~mask),
>   			aer_severity, tlp_header_valid, &aer->header_log);
>   
> +	if (!aer_ratelimit(dev, info.severity))
> +		return;
> +
>   	layer = AER_GET_LAYER_ERROR(aer_severity, status);
>   	agent = AER_GET_AGENT(aer_severity, status);
>   
> @@ -824,6 +855,18 @@ static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
>   	e_info->dev[i] = pci_dev_get(dev);
>   	e_info->error_dev_num++;
>   
> +	/*
> +	 * Ratelimit AER log messages.  "dev" is either the source
> +	 * identified by the root's Error Source ID or it has an unmasked
> +	 * error logged in its own AER Capability.  Messages are emitted
> +	 * when "ratelimit_print[i]" is non-zero.  If we will print detail
> +	 * for a downstream device, make sure we print the Error Source ID
> +	 * from the root as well.
> +	 */
> +	if (aer_ratelimit(dev, e_info->severity)) {
> +		e_info->ratelimit_print[i] = 1;
> +		e_info->root_ratelimit_print = 1;
> +	}
>   	return 0;
>   }
>   
> @@ -918,7 +961,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
>    * e_info->error_dev_num and e_info->dev[], based on the given information.
>    */
>   static bool find_source_device(struct pci_dev *parent,
> -		struct aer_err_info *e_info)
> +			       struct aer_err_info *e_info)
>   {
>   	struct pci_dev *dev = parent;
>   	int result;
> @@ -1144,9 +1187,10 @@ static void aer_recover_work_func(struct work_struct *work)
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
> @@ -1294,7 +1338,22 @@ static void aer_isr_one_error_type(struct pci_dev *root,
>   	bool found;
>   
>   	found = find_source_device(root, info);
> -	aer_print_source(root, info, found);
> +
> +	/*
> +	 * If we're going to log error messages, we've already set
> +	 * "info->root_ratelimit_print" and "info->ratelimit_print[i]" to
> +	 * non-zero (which enables printing) because this is either an
> +	 * ERR_FATAL or we found a device with an error logged in its AER
> +	 * Capability.
> +	 *
> +	 * If we didn't find the Error Source device, at least log the
> +	 * Requester ID from the ERR_* Message received by the Root Port or
> +	 * RCEC, ratelimited by the RP or RCEC.
> +	 */
> +	if (info->root_ratelimit_print ||
> +	    (!found && aer_ratelimit(root, info->severity)))
> +		aer_print_source(root, info, found);
> +
>   	if (found)
>   		aer_process_err_devices(info);
>   }

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


