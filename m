Return-Path: <linuxppc-dev+bounces-8903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C954AC1838
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3Q6H6YF0z3c7R;
	Fri, 23 May 2025 09:51:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747957863;
	cv=none; b=loKGfLi5C21BQzEzHCDLLCv1ZI6XBHtUWxRQ3g1yf/axVxM5DOt488ADQHVF0v5WZUFhl7EvMrfpcvDPPxL2Xj0w9ukz82MZaxVX7h+qToM2tch1B9TVDLRNcFoiNolM7cc2rl2FDXSBzJNoV+0JdnJ3ncOSgNHoNtzjgUPnxnrH+acCPoh2NpL+colAzTGNmOR+4aogGOHq8KxuZG5oDnwA+LG6ScA60ItMKncPRcuqVYX3waMGExhG81e7DwOwhV3DQthj02fkC6qbpzlshYn7ZSdtpIGoYMfdZS2mAHtdeYzNVvZylRz++ki7XFsT+RCkZXHg7RJYL1DcfJdFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747957863; c=relaxed/relaxed;
	bh=NnLoNVXCIryOUWe+E4gQf6E0EMc0soL4WTdk1PbcxVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOASrJUsPtFhld9nDLVFAPrD1jlVxe7gxtiiI92RwnExZhhhMR/1VfHsIsiWG/GyuIly6uLBOA/olhxd7r/f1/DaIOMr+aoseoVtX25BsTw/PUdvjGdgrZL1dIpcQ3w7qqkWvW/ogJomfrZ0fiE34YBgdIYBZcMbPUGKVBAv9IYS7VxSNc8BYkkVto6Bulyey5B2n0GEY/WIXfzMot8khB3+OIL+a05QmCDeetB80O/DESyl6YXgBzOGR52m53v240fgDW+aJjXEhLq3/B19yjxWmkQ6xshKFo7uofDds3sjnX4qipvRtpUnBOgnHjXAfdvxXPNe/3rOS4ZIcccxpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBPEpp+N; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBPEpp+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3Q6G63mVz3c7H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:51:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747957863; x=1779493863;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Zn+ucjjHqXaHvhZRtxjTufhtCPyOQzdr+n3oV2AG7Ag=;
  b=DBPEpp+NsUoyGNHHlG7PUdKusXHAqqK5vg5eXGrvwuDSKhabfvhfn/X1
   QhiQ/a61JHnqvK9FkeXX5AT3deuOsOcbmFVDYTbW8+mA/HslNgGPnOCee
   aa/SO9MVkQgwOpFyyDxsIUjqFCDXv0+A4fVHWU+XSvGSnQZmPUNbNOis3
   dOI3eWhIAzxXi1sZk+I66oYzFoOzrBfI6uhLHj1m7N6A56WBx1LQhRm1X
   5bNh5j/dQ93JhsoS1xPgwY8rT1ZBzJOSdl7molKOXf5dDEYNs/dIwe+Lt
   uB9fMEmgs+FeHrHRktePkVpKXZJ/r2kj5vykgn9W+/dgf2KS7fcJGulm5
   Q==;
X-CSE-ConnectionGUID: v5d/G4FfQaaoRjuGLc0Jcg==
X-CSE-MsgGUID: vE2TBPwxRK6JnhjTaxgqMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72534346"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="72534346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:51:00 -0700
X-CSE-ConnectionGUID: vUJfXozOSuOQ/nNYHg9X5A==
X-CSE-MsgGUID: Ijw220yQQhK7CjYW5CrcAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140884664"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.120]) ([10.124.223.120])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:50:59 -0700
Message-ID: <97a45686-3b54-489f-b0f4-847b99312aa0@linux.intel.com>
Date: Thu, 22 May 2025 16:50:58 -0700
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
Subject: Re: [PATCH v8 20/20] PCI/AER: Add sysfs attributes for log ratelimits
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
 <20250522232339.1525671-21-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250522232339.1525671-21-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 5/22/25 4:21 PM, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
>
> Allow userspace to read/write log ratelimits per device (including
> enable/disable). Create aer/ sysfs directory to store them and any
> future AER configs.
>
> The new sysfs files are:
>
>    /sys/bus/pci/devices/*/aer/correctable_ratelimit_burst
>    /sys/bus/pci/devices/*/aer/correctable_ratelimit_interval_ms
>    /sys/bus/pci/devices/*/aer/nonfatal_ratelimit_burst
>    /sys/bus/pci/devices/*/aer/nonfatal_ratelimit_interval_ms
>
> The default values are ratelimit_burst=10, ratelimit_interval_ms=5000, so
> if we try to emit more than 10 messages in a 5 second period, some are
> suppressed.
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
> [bhelgaas: note fatal errors are not ratelimited, "aer_report" ->
> "aer_info", replace ratelimit_log_enable toggle with *_ratelimit_interval_ms]
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Link: https://patch.msgid.link/20250520215047.1350603-18-helgaas@kernel.org
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   ...es-aer_stats => sysfs-bus-pci-devices-aer} |  44 ++++++++
>   Documentation/PCI/pcieaer-howto.rst           |   5 +-
>   drivers/pci/pci-sysfs.c                       |   1 +
>   drivers/pci/pci.h                             |   1 +
>   drivers/pci/pcie/aer.c                        | 105 ++++++++++++++++++
>   5 files changed, 155 insertions(+), 1 deletion(-)
>   rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (72%)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> similarity index 72%
> rename from Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> rename to Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> index d1f67bb81d5d..5ed284523956 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> @@ -117,3 +117,47 @@ Date:		July 2018
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
> +What:		/sys/bus/pci/devices/<dev>/aer/correctable_ratelimit_interval_ms
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org
> +Description:	Writing 0 disables AER correctable error log ratelimiting.
> +		Writing a positive value sets the ratelimit interval in ms.
> +		Default is DEFAULT_RATELIMIT_INTERVAL (5000 ms).
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/correctable_ratelimit_burst
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org
> +Description:	Ratelimit burst for correctable error logs. Writing a value
> +		changes the number of errors (burst) allowed per interval
> +		before ratelimiting. Reading gets the current ratelimit
> +		burst. Default is DEFAULT_RATELIMIT_BURST (10).
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/nonfatal_ratelimit_interval_ms
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org
> +Description:	Writing 0 disables AER non-fatal uncorrectable error log
> +		ratelimiting. Writing a positive value sets the ratelimit
> +		interval in ms. Default is DEFAULT_RATELIMIT_INTERVAL
> +		(5000 ms).
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/nonfatal_ratelimit_burst
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org
> +Description:	Ratelimit burst for non-fatal uncorrectable error logs.
> +		Writing a value changes the number of errors (burst)
> +		allowed per interval before ratelimiting. Reading gets the
> +		current ratelimit burst. Default is DEFAULT_RATELIMIT_BURST
> +		(10).
> diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
> index 6fb31516fff1..4b71e2f43ca7 100644
> --- a/Documentation/PCI/pcieaer-howto.rst
> +++ b/Documentation/PCI/pcieaer-howto.rst
> @@ -97,12 +97,15 @@ DPC errors, are not ratelimited.
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
> index 3023c68fe485..eca2812cfd25 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -965,6 +965,7 @@ void pci_no_aer(void);
>   void pci_aer_init(struct pci_dev *dev);
>   void pci_aer_exit(struct pci_dev *dev);
>   extern const struct attribute_group aer_stats_attr_group;
> +extern const struct attribute_group aer_attr_group;
>   void pci_aer_clear_fatal_status(struct pci_dev *dev);
>   int pci_aer_clear_status(struct pci_dev *dev);
>   int pci_aer_raw_clear_status(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ebac126144fc..6c331695af58 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -627,6 +627,111 @@ const struct attribute_group aer_stats_attr_group = {
>   	.is_visible = aer_stats_attrs_are_visible,
>   };
>   
> +/*
> + * Ratelimit interval
> + * <=0: disabled with ratelimit.interval = 0
> + * >0: enabled with ratelimit.interval in ms
> + */
> +#define aer_ratelimit_interval_attr(name, ratelimit)			\
> +	static ssize_t							\
> +	name##_show(struct device *dev, struct device_attribute *attr,	\
> +					 char *buf)			\
> +	{								\
> +		struct pci_dev *pdev = to_pci_dev(dev);			\
> +									\
> +		return sysfs_emit(buf, "%d\n",				\
> +				  pdev->aer_info->ratelimit.interval);	\
> +	}								\
> +									\
> +	static ssize_t							\
> +	name##_store(struct device *dev, struct device_attribute *attr, \
> +		     const char *buf, size_t count) 			\
> +	{								\
> +		struct pci_dev *pdev = to_pci_dev(dev);			\
> +		int interval;						\
> +									\
> +		if (!capable(CAP_SYS_ADMIN))				\
> +			return -EPERM;					\
> +									\
> +		if (kstrtoint(buf, 0, &interval) < 0)			\
> +			return -EINVAL;					\
> +									\
> +		if (interval <= 0)					\
> +			interval = 0;					\
> +		else							\
> +			interval = msecs_to_jiffies(interval); 		\
> +									\
> +		pdev->aer_info->ratelimit.interval = interval;		\
> +									\
> +		return count;						\
> +	}								\
> +	static DEVICE_ATTR_RW(name);
> +
> +#define aer_ratelimit_burst_attr(name, ratelimit)			\
> +	static ssize_t							\
> +	name##_show(struct device *dev, struct device_attribute *attr,	\
> +		    char *buf)						\
> +	{								\
> +		struct pci_dev *pdev = to_pci_dev(dev);			\
> +									\
> +		return sysfs_emit(buf, "%d\n",				\
> +				  pdev->aer_info->ratelimit.burst);	\
> +	}								\
> +									\
> +	static ssize_t							\
> +	name##_store(struct device *dev, struct device_attribute *attr,	\
> +		     const char *buf, size_t count)			\
> +	{								\
> +		struct pci_dev *pdev = to_pci_dev(dev);			\
> +		int burst;						\
> +									\
> +		if (!capable(CAP_SYS_ADMIN))				\
> +			return -EPERM;					\
> +									\
> +		if (kstrtoint(buf, 0, &burst) < 0)			\
> +			return -EINVAL;					\
> +									\
> +		pdev->aer_info->ratelimit.burst = burst;		\
> +									\
> +		return count;						\
> +	}								\
> +	static DEVICE_ATTR_RW(name);
> +
> +#define aer_ratelimit_attrs(name)					\
> +	aer_ratelimit_interval_attr(name##_ratelimit_interval_ms,	\
> +				    name##_ratelimit)			\
> +	aer_ratelimit_burst_attr(name##_ratelimit_burst,		\
> +				 name##_ratelimit)
> +
> +aer_ratelimit_attrs(correctable)
> +aer_ratelimit_attrs(nonfatal)
> +
> +static struct attribute *aer_attrs[] = {
> +	&dev_attr_correctable_ratelimit_interval_ms.attr,
> +	&dev_attr_correctable_ratelimit_burst.attr,
> +	&dev_attr_nonfatal_ratelimit_interval_ms.attr,
> +	&dev_attr_nonfatal_ratelimit_burst.attr,
> +	NULL
> +};
> +
> +static umode_t aer_attrs_are_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	if (!pdev->aer_info)
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


