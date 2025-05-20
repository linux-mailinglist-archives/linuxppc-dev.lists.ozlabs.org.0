Return-Path: <linuxppc-dev+bounces-8712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7811ABCDDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 05:30:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1g6Z2r2Nz3020;
	Tue, 20 May 2025 13:30:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747711814;
	cv=none; b=kAKmHympSLX3Yb5bQt/QOay7IuX/vcSXLWDR3MY3hm3l6ewjGEyHXjn69PZSjkJPX3ZWE9xo0YyR6HoYGZyY00Wq6l7X4OjqKhvh0LM2OpIOBpms3GkRhBOOive0uB2aDS3TOpRXqTjZ2VgzODOhe5NkMkn63irQTU/A7A3AkRzdTXQqmcMnzLELNnOJXJmPySdPu2NWQ2WIJjzh6YEdCWErlGAXHxLy3f5CyA8EK4YOYD/mUvp18e3OHxg4HAyU1HvokkbvZQ9b5Vji/TLdf8z8S89FfJzCCM5Ye40L+jGylQUHbUKLzmPnYO3+42DDw/1VmqZsOr5YStb/JpA+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747711814; c=relaxed/relaxed;
	bh=opQIj2MjPXFnZ0wcJ4XSv4e2LidOnBwSc5OZGmkxaVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDEaucsUk103D5cAAp/BeW3gyE+6sMiy+4ZuSktZeavYh+HX7tWUit8QQVm35CeVfqEpK1wLOyvgMQ9U8l1YDfhMgyypvpnZmwc+cBz5K7zh6jpRz6Clc/x+59Ahw6gSNtWWUNuvzdeoz7Xj1zaUv4tQOLAb02xyjzueJ5FPKiUy4kBcpOYneFN7WgcHNrtkNRbLJPuwhr1z2bVQAmn3I4+59nTxlIYBCDbnuBbPrG2R5YSOAQBp2RJGN3qIoYzt7dW1JANI7QIo3bPbswPk16FXvwp4U85rXoz2ZDstAEb4YbQFO+dgYycG9WbwYd63cAhLJyqUJdEaLfRz9UISjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kdqy4JB7; dkim-atps=neutral; spf=none (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kdqy4JB7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1g6Y30xFz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 13:30:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747711814; x=1779247814;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3958qdAkC/Zcg7qE7Q02GOb5R+VsY2tzmB31N1eLkro=;
  b=Kdqy4JB7s4z5ZirTR66ZGd980tWrV2sOxPE26kTON9dqUIRDFhS/p3m5
   hr4fO3cnHFfE6Gf0BRIyAneNMxT/ajJEnLK9GcbFmWglyYUAdnzi9TcVE
   xuHdJqcOYl5MXKeq189jumAq+j75104lfyRgWq319mJ4ournna2SgJIeD
   kAI6xqG05nc30FF0i7PX+S7B+taqyjeuO+yy4PfYshrrrq1kFXVortYAH
   y/GA/xhlQ7VsZpQBbxCgVerRPO6TRC/2TotNV6bYcYUUOEdmsLXLqMc7a
   gTdJEjH2VpjfD6B+hx/y23e2tpC6a7D3EbeZrTIRP2EfdUmMi2rR+5zB/
   Q==;
X-CSE-ConnectionGUID: /fsGy6JGTO6mYo2cRyeO3g==
X-CSE-MsgGUID: JMSruKkSR7SSBUTUbbkxZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53429075"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53429075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 20:30:11 -0700
X-CSE-ConnectionGUID: ro3lLGvqSvWFml5zYkmBVg==
X-CSE-MsgGUID: r19yAhXvSweqMW1EK5YEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139974763"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 20:30:10 -0700
Message-ID: <8624dd16-83a3-4fd3-a5d9-a79c50236e58@linux.intel.com>
Date: Mon, 19 May 2025 20:30:09 -0700
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
Subject: Re: [PATCH v6 13/16] PCI/AER: Rename struct aer_stats to aer_report
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
 <20250519213603.1257897-14-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-14-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Karolina Stolarek <karolina.stolarek@oracle.com>
>
> Update name to reflect the broader definition of structs/variables that are
> stored (e.g. ratelimits). This is a preparatory patch for adding rate limit
> support.
>
> Link: https://lore.kernel.org/r/20250321015806.954866-6-pandoh@google.com
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 50 +++++++++++++++++++++---------------------
>   include/linux/pci.h    |  2 +-
>   2 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 06a7dda20846..da62032bf024 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -54,11 +54,11 @@ struct aer_rpc {
>   	DECLARE_KFIFO(aer_fifo, struct aer_err_source, AER_ERROR_SOURCES_MAX);
>   };
>   
> -/* AER stats for the device */
> -struct aer_stats {
> +/* AER report for the device */
> +struct aer_report {

For me aer_report also sounds like stats like struct. I prefer aer_info, but
it is up to you.

>   
>   	/*
> -	 * Fields for all AER capable devices. They indicate the errors
> +	 * Stats for all AER capable devices. They indicate the errors
>   	 * "as seen by this device". Note that this may mean that if an
>   	 * Endpoint is causing problems, the AER counters may increment
>   	 * at its link partner (e.g. Root Port) because the errors will be
> @@ -80,7 +80,7 @@ struct aer_stats {
>   	u64 dev_total_nonfatal_errs;
>   
>   	/*
> -	 * Fields for Root Ports & Root Complex Event Collectors only; these
> +	 * Stats for Root Ports & Root Complex Event Collectors only; these
>   	 * indicate the total number of ERR_COR, ERR_FATAL, and ERR_NONFATAL
>   	 * messages received by the Root Port / Event Collector, INCLUDING the
>   	 * ones that are generated internally (by the Root Port itself)
> @@ -377,7 +377,7 @@ void pci_aer_init(struct pci_dev *dev)
>   	if (!dev->aer_cap)
>   		return;
>   
> -	dev->aer_stats = kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
> +	dev->aer_report = kzalloc(sizeof(*dev->aer_report), GFP_KERNEL);
>   
>   	/*
>   	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
> @@ -398,8 +398,8 @@ void pci_aer_init(struct pci_dev *dev)
>   
>   void pci_aer_exit(struct pci_dev *dev)
>   {
> -	kfree(dev->aer_stats);
> -	dev->aer_stats = NULL;
> +	kfree(dev->aer_report);
> +	dev->aer_report = NULL;
>   }
>   
>   #define AER_AGENT_RECEIVER		0
> @@ -537,10 +537,10 @@ static const char *aer_agent_string[] = {
>   {									\
>   	unsigned int i;							\
>   	struct pci_dev *pdev = to_pci_dev(dev);				\
> -	u64 *stats = pdev->aer_stats->stats_array;			\
> +	u64 *stats = pdev->aer_report->stats_array;			\
>   	size_t len = 0;							\
>   									\
> -	for (i = 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
> +	for (i = 0; i < ARRAY_SIZE(pdev->aer_report->stats_array); i++) {\
>   		if (strings_array[i])					\
>   			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
>   					     strings_array[i],		\
> @@ -551,7 +551,7 @@ static const char *aer_agent_string[] = {
>   					     i, stats[i]);		\
>   	}								\
>   	len += sysfs_emit_at(buf, len, "TOTAL_%s %llu\n", total_string,	\
> -			     pdev->aer_stats->total_field);		\
> +			     pdev->aer_report->total_field);		\
>   	return len;							\
>   }									\
>   static DEVICE_ATTR_RO(name)
> @@ -572,7 +572,7 @@ aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_errs,
>   		     char *buf)						\
>   {									\
>   	struct pci_dev *pdev = to_pci_dev(dev);				\
> -	return sysfs_emit(buf, "%llu\n", pdev->aer_stats->field);	\
> +	return sysfs_emit(buf, "%llu\n", pdev->aer_report->field);	\
>   }									\
>   static DEVICE_ATTR_RO(name)
>   
> @@ -599,7 +599,7 @@ static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   
> -	if (!pdev->aer_stats)
> +	if (!pdev->aer_report)
>   		return 0;
>   
>   	if ((a == &dev_attr_aer_rootport_total_err_cor.attr ||
> @@ -623,28 +623,28 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   	unsigned long status = info->status & ~info->mask;
>   	int i, max = -1;
>   	u64 *counter = NULL;
> -	struct aer_stats *aer_stats = pdev->aer_stats;
> +	struct aer_report *aer_report = pdev->aer_report;
>   
>   	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
>   			info->severity, info->tlp_header_valid, &info->tlp);
>   
> -	if (!aer_stats)
> +	if (!aer_report)
>   		return;
>   
>   	switch (info->severity) {
>   	case AER_CORRECTABLE:
> -		aer_stats->dev_total_cor_errs++;
> -		counter = &aer_stats->dev_cor_errs[0];
> +		aer_report->dev_total_cor_errs++;
> +		counter = &aer_report->dev_cor_errs[0];
>   		max = AER_MAX_TYPEOF_COR_ERRS;
>   		break;
>   	case AER_NONFATAL:
> -		aer_stats->dev_total_nonfatal_errs++;
> -		counter = &aer_stats->dev_nonfatal_errs[0];
> +		aer_report->dev_total_nonfatal_errs++;
> +		counter = &aer_report->dev_nonfatal_errs[0];
>   		max = AER_MAX_TYPEOF_UNCOR_ERRS;
>   		break;
>   	case AER_FATAL:
> -		aer_stats->dev_total_fatal_errs++;
> -		counter = &aer_stats->dev_fatal_errs[0];
> +		aer_report->dev_total_fatal_errs++;
> +		counter = &aer_report->dev_fatal_errs[0];
>   		max = AER_MAX_TYPEOF_UNCOR_ERRS;
>   		break;
>   	}
> @@ -656,19 +656,19 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   				 struct aer_err_source *e_src)
>   {
> -	struct aer_stats *aer_stats = pdev->aer_stats;
> +	struct aer_report *aer_report = pdev->aer_report;
>   
> -	if (!aer_stats)
> +	if (!aer_report)
>   		return;
>   
>   	if (e_src->status & PCI_ERR_ROOT_COR_RCV)
> -		aer_stats->rootport_total_cor_errs++;
> +		aer_report->rootport_total_cor_errs++;
>   
>   	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
>   		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
> -			aer_stats->rootport_total_fatal_errs++;
> +			aer_report->rootport_total_fatal_errs++;
>   		else
> -			aer_stats->rootport_total_nonfatal_errs++;
> +			aer_report->rootport_total_nonfatal_errs++;
>   	}
>   }
>   
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96..4b11a90107cb 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -346,7 +346,7 @@ struct pci_dev {
>   	u8		hdr_type;	/* PCI header type (`multi' flag masked out) */
>   #ifdef CONFIG_PCIEAER
>   	u16		aer_cap;	/* AER capability offset */
> -	struct aer_stats *aer_stats;	/* AER stats for this device */
> +	struct aer_report *aer_report;	/* AER report for this device */
>   #endif
>   #ifdef CONFIG_PCIEPORTBUS
>   	struct rcec_ea	*rcec_ea;	/* RCEC cached endpoint association */

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


