Return-Path: <linuxppc-dev+bounces-8795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C85ABE73F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 00:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b28Wg66b9z3bsR;
	Wed, 21 May 2025 08:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747780511;
	cv=none; b=lAjat63xTCgy8Pt4PGvw3LkuRARy6IL/OeecMEF/vIUq1bKacE5iXJvXwENqObU6C1/dtfZXxW6vKF41mrh7ct/QP9i5r6zkHgENb17xNSPm0Eki4zdXALh12+OCC3nXLPKLokBi/FkiukS2SfjLdPp+tvjUtrOUaPoJIa+LfiruBe7rAfGIPaj0WnSZxxjXelMJ3k4Cfpjt0+1ewOLRIkb8PjC4FhHD9t3qsOXlmRRB32gsFVrwcfjx5lv+XhqcsCvSYpxaaOkzA54dJj7RBi0iXqkMEOK6ARQuG0ik5zoU81rLI3gUnHig57Rl7dx5Qw0w98SUu93QJIq2a4EAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747780511; c=relaxed/relaxed;
	bh=KNTKOhNUe95LlN4S/KsbnO3EWFqB/fj06bxfVWT1Usc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqK1Zvz5nTpyk34HzgD9Q1kkstp6qFY01ZnRARJlZe3kqgQc53peNegxh6mCzggNNtF1GK+THXEIbHoRxAQJISaPK/s5++N/YS817Np8VW/9TITqQO5bOSHg0LuUAFh7AtMJo63iptzOzHXtcyIU1hRQINNrl0uTsng0ijfAntlMEhvBdtTkrT69i0T5UetG91qNw43Lkilw0/YN6p3wSBTD7SUoUXr+nhsp583HRlkvxDGeYnx2qW3Ft88vgs1hSG1W13SNyN+cgNiliw2sqoZcPnnnM5CxJyMVJFdXjlJbQBY4R4xPxXhj4/sss0N9gWoakL7U/2piRG7pvHlhlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=edqtzvO4; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=edqtzvO4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b28Wf5XqYz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 08:35:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747780511; x=1779316511;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IQkpAQPzHZXRcrPSkC3DW3/Yn3xi4KpmzCgvdp1oIV0=;
  b=edqtzvO4MdMEWAYgvPbtAbfp7xUXU4zbqMlwDTv3Ria8NkXkVK3UDPA4
   20n21KQW5KD4CcJO2UR8GJ3vbGFKbs8XX/OqmBrFARnvFXV+Dum3Wuc8g
   fvVHAvtFW9KzrP/QCuS3TVoDRBPRESRiyaJ43uIBk+aHSrWr4OG1VbFGH
   5cE9vnKp/tWgLw6Bq9sET5Z38KUlbksgH6j8GDlMHzR3VmethLTRctF1d
   t8NjIdK8Zht6VsWAZySzaXt68GLd72q7Ke0ppk98mmCCvzrKRmBOn1H+x
   hyC5WlYIzgNBFr99qInUUxV0uCp19VNXnDhd5mUFymJHBApDna45d29iS
   g==;
X-CSE-ConnectionGUID: 6kfOWPXxQsKFMcspcocSKw==
X-CSE-MsgGUID: usDILGIyQZqTQBvQO4Vx+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49665347"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49665347"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:35:10 -0700
X-CSE-ConnectionGUID: 166wFNzmTLu5ve1EO8+i5A==
X-CSE-MsgGUID: j+YAHzFdQ7qaOgCKKuCstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140758647"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.222.89]) ([10.124.222.89])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:35:08 -0700
Message-ID: <11d6dbb5-34de-4008-bc0b-1f0599b02029@linux.intel.com>
Date: Tue, 20 May 2025 15:35:07 -0700
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
Subject: Re: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log ratelimits
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
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
 <20250520215047.1350603-18-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250520215047.1350603-18-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/20/25 2:50 PM, Bjorn Helgaas wrote:
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
> [bhelgaas: note fatal errors are not ratelimited, "aer_report" -> "aer_info"]
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
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
> index d1f67bb81d5d..01bb577bfee8 100644
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
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
> +		gets whether or not AER ratelimiting is currently enabled.
> +		Enabled by default.
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_cor_log
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Ratelimit burst for correctable error logs. Writing a value
> +		changes the number of errors (burst) allowed per interval
> +		(5 second window) before ratelimiting. Reading gets the
> +		current ratelimit burst.
> +
> +What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log
> +Date:		May 2025
> +KernelVersion:	6.16.0
> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Ratelimit burst for non-fatal uncorrectable error logs.
> +		Writing a value changes the number of errors (burst)
> +		allowed per interval (5 second window) before ratelimiting.
> +		Reading gets the current ratelimit burst.
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
> index f9e684ac7878..9b8dea317a79 100644
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
> +	bool enabled = pdev->aer_info->cor_log_ratelimit.interval != 0;
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
> +	pdev->aer_info->cor_log_ratelimit.interval = interval;
> +	pdev->aer_info->uncor_log_ratelimit.interval = interval;
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
> +			  pdev->aer_info->ratelimit.burst);		\
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
> +	pdev->aer_info->ratelimit.burst = burst;			\
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


