Return-Path: <linuxppc-dev+bounces-8715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB5ABCE63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 07:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1jDt66hsz3bV5;
	Tue, 20 May 2025 15:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747717550;
	cv=none; b=Su2kw9AJeLadtRwxWaJ/Inx0YHI77vk54t536LL6EXX0Ax6tqP1c+djuO0D61UypiLqTi/BXoU7Qf3p+pLBJu5duigtxlPfCH6CVaKdYTvSX97/zSetLV1v7S6Nr6kEwZ5VAc6m45vsfBbNXT2hfJ1kNurhgdDPmNA1Defob4bUoa9Faan5TJVB4a0uZahtvKjLAXc/RreHmeP7vKXGg1TwbqRKq+cqD6qElmVA2wLhfy9goamsEQrjX+4wF2WMmAyV6hiJwUNwadzXktA7Ij7gtpbEUu9dxlRsTkJJdbibhG/GWkPP2hAFtxjFKdcRJ0WswbDJDF8DCgiMhPI8LJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747717550; c=relaxed/relaxed;
	bh=o8KE/w+utVwKB7UYp3ew1t/o8TZG6hXT3fgXoa9Q0bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7GRA3DCpugh+uyixC5dVdyzu9+aj6crjkJa7he7ketxutNBOf+9jYPxoFSV5Ek/G+gVJ9ynPfdC+WALA+VlA+FDmoHqFDbs5ixN6NogVsktdpZTRElJqXTrI/dr5a06H3owEHxv+y2KoQSogmrVWC0uU3sGjQIt1b2lcgrvSHTNIgEYf5Oe40amXCuT+ayvMkt4S1xJ6PTm3nlcLsj7GhZAPtX/kKnJrwDbJRaRDwLv8ITfM9Z2hceFETSDuFOZDy34DEKWzARTF/p7KDsKhTn43HElz6megrOSL7JpahH2ebk6hXEukGdlGFIudFxpfxxr4MFc/KzijvgDCqrkSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bGvZW4q0; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bGvZW4q0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1jDs4yRqz3bTj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 15:05:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747717550; x=1779253550;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cVt/MR5F4AUSCy5ltlIRYhDDOljGXGJLpkRGc8I8n+4=;
  b=bGvZW4q0l/jWbmnszURauLiM/oIlDudGwB73kMNPLMN37JSE9c8Ss66i
   0rzKTvVCjNFipWDavyzCrRBUyu/rW9p3rHQ5bT2itRuJT6drh3YSG5qN7
   86tmrG+soIS8ztf3BZbHu+56LqHtReh0lxHHM58MoOdhdCtt0pcasQsMN
   d/DlieNCIuWXqKIvHDbeWKa8PHneiNPP1drNcnEhOOx3URC/zDDMTmtMI
   Esf44PHOnzcxQiofmO2o6cEuiJ9k7Rl27nvs5uHzLnPn4KzRxRJhrBvqM
   TNrHm5OqLfYyyT64JEgutu/OHXJ3Dy3PDsUqGm9ZdqiBSMsB6vDpMvrIP
   w==;
X-CSE-ConnectionGUID: qRkJ4PZnTLitOYYJAPs/LQ==
X-CSE-MsgGUID: qOGVvPTFSvaGaEyiX1EOpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61026161"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61026161"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 22:05:47 -0700
X-CSE-ConnectionGUID: oxPzYVqaRrmM8SZCQc74gA==
X-CSE-MsgGUID: 67m9MSMnSKqK1x8rlRZKtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144329169"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.221.231]) ([10.124.221.231])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 22:05:45 -0700
Message-ID: <2760ba5a-f39d-4c0f-bfd3-1f5c0bdf8f6e@linux.intel.com>
Date: Mon, 19 May 2025 22:05:44 -0700
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
Subject: Re: [PATCH v6 16/16] PCI/AER: Add sysfs attributes for log ratelimits
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
 <20250519213603.1257897-17-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-17-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
>
> Allow userspace to read/write log ratelimits per device (including
> enable/disable). Create aer/ sysfs directory to store them and any
> future aer configs.
>
> Update AER sysfs ABI filename to reflect the broader scope of AER sysfs
> attributes (e.g. stats and ratelimits).
>
>    Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats ->
>      sysfs-bus-pci-devices-aer
>
> Tested using aer-inject[1]. Configured correctable log ratelimit to 5.
> Sent 6 AER errors. Observed 5 errors logged while AER stats
> (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) shows 6.
>
> Disabled ratelimiting and sent 6 more AER errors. Observed all 6 errors
> logged and accounted in AER stats (12 total errors).
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   ...es-aer_stats => sysfs-bus-pci-devices-aer} | 34 +++++++
>   Documentation/PCI/pcieaer-howto.rst           |  5 +-
>   drivers/pci/pci-sysfs.c                       |  1 +
>   drivers/pci/pci.h                             |  1 +
>   drivers/pci/pcie/aer.c                        | 99 +++++++++++++++++++
>   5 files changed, 139 insertions(+), 1 deletion(-)
>   rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (77%)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> similarity index 77%
> rename from Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> rename to Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> index d1f67bb81d5d..771204197b71 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> @@ -117,3 +117,37 @@ Date:		July 2018
>   KernelVersion:	4.19.0
>   Contact:	linux-pci@vger.kernel.org, rajatja@google.com
>   Description:	Total number of ERR_NONFATAL messages reported to rootport.
> +
> +PCIe AER ratelimits
> +-------------------
> +
> +These attributes show up under all the devices that are AER capable.
> +They represent configurable ratelimits of logs per error type.
> +
> +See Documentation/PCI/pcieaer-howto.rst for more info on ratelimits.
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_log_enable
> +Date:		March 2025
> +KernelVersion:	6.15.0
> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
> +		gets whether or not AER is currently enabled. Enabled by
> +		default.
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_cor_log
> +Date:		March 2025
> +KernelVersion:	6.15.0
> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Ratelimit burst for correctable error logs. Writing a value
> +		changes the number of errors (burst) allowed per interval
> +		(5 second window) before ratelimiting. Reading gets the
> +		current ratelimit burst.
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log
> +Date:		March 2025
> +KernelVersion:	6.15.0
> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Ratelimit burst for uncorrectable error logs. Writing a
> +		value changes the number of errors (burst) allowed per
> +		interval (5 second window) before ratelimiting. Reading
> +		gets the current ratelimit burst.
> diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
> index 896d2a232a90..043cdb3194be 100644
> --- a/Documentation/PCI/pcieaer-howto.rst
> +++ b/Documentation/PCI/pcieaer-howto.rst
> @@ -96,12 +96,15 @@ type (correctable vs. uncorrectable).
>   AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
>   DEFAULT_RATELIMIT_INTERVAL (5 seconds).
>   
> +Ratelimits are exposed in the form of sysfs attributes and configurable.
> +See Documentation/ABI/testing/sysfs-bus-pci-devices-aer.
> +
>   AER Statistics / Counters
>   -------------------------
>   
>   When PCIe AER errors are captured, the counters / statistics are also exposed
>   in the form of sysfs attributes which are documented at
> -Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> +Documentation/ABI/testing/sysfs-bus-pci-devices-aer.
>   
>   Developer Guide
>   ===============
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index c6cda56ca52c..278de99b00ce 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1805,6 +1805,7 @@ const struct attribute_group *pci_dev_attr_groups[] = {
>   	&pcie_dev_attr_group,
>   #ifdef CONFIG_PCIEAER
>   	&aer_stats_attr_group,
> +	&aer_attr_group,
>   #endif
>   #ifdef CONFIG_PCIEASPM
>   	&aspm_ctrl_attr_group,
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 65c466279ade..a3261e842d6d 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -963,6 +963,7 @@ void pci_no_aer(void);
>   void pci_aer_init(struct pci_dev *dev);
>   void pci_aer_exit(struct pci_dev *dev);
>   extern const struct attribute_group aer_stats_attr_group;
> +extern const struct attribute_group aer_attr_group;
>   void pci_aer_clear_fatal_status(struct pci_dev *dev);
>   int pci_aer_clear_status(struct pci_dev *dev);
>   int pci_aer_raw_clear_status(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index c335e0bb9f51..42df5cb963b3 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -627,6 +627,105 @@ const struct attribute_group aer_stats_attr_group = {
>   	.is_visible = aer_stats_attrs_are_visible,
>   };
>   
> +/*
> + * Ratelimit enable toggle
> + * 0: disabled with ratelimit.interval = 0
> + * 1: enabled with ratelimit.interval = nonzero
> + */
> +static ssize_t ratelimit_log_enable_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	bool enabled = pdev->aer_report->cor_log_ratelimit.interval != 0;
> +
> +	return sysfs_emit(buf, "%d\n", enabled);
> +}
> +
> +static ssize_t ratelimit_log_enable_store(struct device *dev,
> +					  struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	bool enable;
> +	int interval;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (kstrtobool(buf, &enable) < 0)
> +		return -EINVAL;
> +
> +	if (enable)
> +		interval = DEFAULT_RATELIMIT_INTERVAL;
> +	else
> +		interval = 0;
> +
> +	pdev->aer_report->cor_log_ratelimit.interval = interval;
> +	pdev->aer_report->uncor_log_ratelimit.interval = interval;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(ratelimit_log_enable);
> +
> +#define aer_ratelimit_burst_attr(name, ratelimit)			\
> +	static ssize_t							\
> +	name##_show(struct device *dev, struct device_attribute *attr,	\
> +		    char *buf)						\
> +{									\
> +	struct pci_dev *pdev = to_pci_dev(dev);				\
> +									\
> +	return sysfs_emit(buf, "%d\n",					\
> +			  pdev->aer_report->ratelimit.burst);		\
> +}									\
> +									\
> +	static ssize_t							\
> +	name##_store(struct device *dev, struct device_attribute *attr,	\
> +		     const char *buf, size_t count)			\
> +{									\
> +	struct pci_dev *pdev = to_pci_dev(dev);				\
> +	int burst;							\
> +									\
> +	if (!capable(CAP_SYS_ADMIN))					\
> +		return -EPERM;						\
> +									\
> +	if (kstrtoint(buf, 0, &burst) < 0)				\
> +		return -EINVAL;						\
> +									\
> +	pdev->aer_report->ratelimit.burst = burst;			\
> +									\
> +	return count;							\
> +}									\
> +static DEVICE_ATTR_RW(name)
> +
> +aer_ratelimit_burst_attr(ratelimit_burst_cor_log, cor_log_ratelimit);
> +aer_ratelimit_burst_attr(ratelimit_burst_uncor_log, uncor_log_ratelimit);
> +
> +static struct attribute *aer_attrs[] = {
> +	&dev_attr_ratelimit_log_enable.attr,
> +	&dev_attr_ratelimit_burst_cor_log.attr,
> +	&dev_attr_ratelimit_burst_uncor_log.attr,
> +	NULL
> +};
> +
> +static umode_t aer_attrs_are_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	if (!pdev->aer_report)
> +		return 0;
> +
> +	return a->mode;
> +}
> +
> +const struct attribute_group aer_attr_group = {
> +	.name = "aer",
> +	.attrs = aer_attrs,
> +	.is_visible = aer_attrs_are_visible,
> +};
> +
>   static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   				   struct aer_err_info *info)
>   {

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


