Return-Path: <linuxppc-dev+bounces-8747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E447ABD79D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 14:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1tTc05t2z2xVq;
	Tue, 20 May 2025 22:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747742547;
	cv=none; b=i7sMMVItLzrLtw6CSjSDdgP/6kGUo0OArg/tFAJhCLtZjPf7LbxoUfCLjpfPfw45jb4gtMCcbiu3wEk1I/F2OaQOUnb554/+vXB4QEdxl6P5clwe6vzlFuzHwHecQlLEuSCpeqnalHAT4FgFuN3hktKlYeI31xc6hSjrCXOpTLWib2KNPmTM4C7/ZldKSuxQ0IUqUi1T61R0NaHtf6kRWDZhPjNyaiuJICtVK6VC2tw0M8NN8WhOHezCBzbNaHTupGkT2tkbf3ZjFnLo/bNBltrSIxcvYNrSRJu/5Loa8ALsCoSVTpmmJbTrLkSPT1Ubx7oOYZYec9+eCLTxbtvixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747742547; c=relaxed/relaxed;
	bh=FJq+Yg2CYuBDxQdOYIh/evVyAUKti3BMRV6fqbeXOdU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e524TzM3R4UwfJjcfXEISS3DpMYu/1x+XVwouZEtInfO1NQnfeFKO62Sz3nOvHn1hsxNd2RCKyMnuqDtY0IO1fSjXVRapE/wszTP6ToXYw64h8jDZUWpS5aSUMuThXNBn6UVgOgyHdAyw/q3QTRpwZ5JWdDS7EkgaMSzFdmSsQmhzRcEQaTGIi5cs0JKcle7bIMU7zMj5zNlzON+7psDjvGfOw/jtfl7pa/wg5n47feFOo4rG99qml9wjDIj1IjpifSR/0c2bcpyjp9bIZX2RFiSfoBePEXGeRcjN0WgJgpqBnUzXufSe2RENLF0rm+B1C+3xf20Qy3vs20FfN6X3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsyPhzyt; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsyPhzyt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1tTZ6L2Rz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 22:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747742548; x=1779278548;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jYo9gyvmmG2RVr4yLv9L8nuvvaWGZ4xqnkjufYfE9Ns=;
  b=bsyPhzytuuUbyBtgAZUos5manQk/4oZ59cQLjztTQv9nCxc1lBXOBn3d
   RVmWDzyfaWa1ry/u5ZhSK6uCpqioG8iJSvx97JLNxA2NNz1gwUyOTgIqy
   Y/NGFW21F1frpTObPeXJwNvRwJNezr4WURwufUBVvsunJNHcy8MdCmuwm
   WZIJQtDRXki+Xfk4xOl/HG0TZUh3D26skxqBHkkEvB50n9vnHaQrRD/Vs
   MQmd2r89SurpIeuqs1EOC9qs6DuyCmklIBPajcuvrK4m/Q9WYVuAdYdCc
   XmAnxDvxBDPUmvE2Ej7m3+7UfjRflfdul/q/A6EsT8xsJJrP6D2/XwUy8
   A==;
X-CSE-ConnectionGUID: fasWJXuDSH+7paBv715mrA==
X-CSE-MsgGUID: 0ckTaBMaQhmU2g7FsptlwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72184706"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72184706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 05:02:17 -0700
X-CSE-ConnectionGUID: A+XgE2+iQOmTI75IVxwTnA==
X-CSE-MsgGUID: VMZ1grxaQ5isiH1pY6JTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144657345"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 05:02:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 15:02:06 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 16/16] PCI/AER: Add sysfs attributes for log
 ratelimits
In-Reply-To: <20250519213603.1257897-17-helgaas@kernel.org>
Message-ID: <cfe3d2a5-fe32-ca35-98f5-812da367dc99@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-17-helgaas@kernel.org>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Jon Pan-Doh <pandoh@google.com>
> 
> Allow userspace to read/write log ratelimits per device (including
> enable/disable). Create aer/ sysfs directory to store them and any
> future aer configs.
> 
> Update AER sysfs ABI filename to reflect the broader scope of AER sysfs
> attributes (e.g. stats and ratelimits).
> 
>   Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats ->
>     sysfs-bus-pci-devices-aer
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
>  ...es-aer_stats => sysfs-bus-pci-devices-aer} | 34 +++++++
>  Documentation/PCI/pcieaer-howto.rst           |  5 +-
>  drivers/pci/pci-sysfs.c                       |  1 +
>  drivers/pci/pci.h                             |  1 +
>  drivers/pci/pcie/aer.c                        | 99 +++++++++++++++++++
>  5 files changed, 139 insertions(+), 1 deletion(-)
>  rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (77%)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> similarity index 77%
> rename from Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> rename to Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> index d1f67bb81d5d..771204197b71 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
> @@ -117,3 +117,37 @@ Date:		July 2018
>  KernelVersion:	4.19.0
>  Contact:	linux-pci@vger.kernel.org, rajatja@google.com
>  Description:	Total number of ERR_NONFATAL messages reported to rootport.
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

This ship has sailed.

> +Contact:	linux-pci@vger.kernel.org, pandoh@google.com
> +Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
> +		gets whether or not AER is currently enabled.

AER or AER ratelimiting is enabled?

> +             Enabled by
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
>  AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
>  DEFAULT_RATELIMIT_INTERVAL (5 seconds).
>  
> +Ratelimits are exposed in the form of sysfs attributes and configurable.
> +See Documentation/ABI/testing/sysfs-bus-pci-devices-aer.
> +
>  AER Statistics / Counters
>  -------------------------
>  
>  When PCIe AER errors are captured, the counters / statistics are also exposed
>  in the form of sysfs attributes which are documented at
> -Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> +Documentation/ABI/testing/sysfs-bus-pci-devices-aer.
>  
>  Developer Guide
>  ===============
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index c6cda56ca52c..278de99b00ce 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1805,6 +1805,7 @@ const struct attribute_group *pci_dev_attr_groups[] = {
>  	&pcie_dev_attr_group,
>  #ifdef CONFIG_PCIEAER
>  	&aer_stats_attr_group,
> +	&aer_attr_group,
>  #endif
>  #ifdef CONFIG_PCIEASPM
>  	&aspm_ctrl_attr_group,
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 65c466279ade..a3261e842d6d 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -963,6 +963,7 @@ void pci_no_aer(void);
>  void pci_aer_init(struct pci_dev *dev);
>  void pci_aer_exit(struct pci_dev *dev);
>  extern const struct attribute_group aer_stats_attr_group;
> +extern const struct attribute_group aer_attr_group;
>  void pci_aer_clear_fatal_status(struct pci_dev *dev);
>  int pci_aer_clear_status(struct pci_dev *dev);
>  int pci_aer_raw_clear_status(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index c335e0bb9f51..42df5cb963b3 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -627,6 +627,105 @@ const struct attribute_group aer_stats_attr_group = {
>  	.is_visible = aer_stats_attrs_are_visible,
>  };
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
>  static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>  				   struct aer_err_info *info)
>  {
> 

-- 
 i.


