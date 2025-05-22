Return-Path: <linuxppc-dev+bounces-8880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3723AC1738
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:05:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3P6736Vzz3bsf;
	Fri, 23 May 2025 09:05:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747955151;
	cv=none; b=SovRo8hnNhsnJHWDni1bQKf0vthcDd4NjDSHA8TnUEG+EQotcbz03CBZkHSAzUSXuFj3YvNKU0YMpnZ+F1GKzFI+EkH+/JEHHIuX6vOUVIK8hO6Juvfc8I0oJc1bLeQZyi1ChdX1gRuGK3RAWVMlMEbmrL9eZkZj4/4NmoMXddvis+8z0rirOEX0egCD5B0+sB4+BXi3Q8QpSD/TKHHPHaq/NvgLhAsODMH5kIPk2dSuucl6RA63pcyG2x0oBMGIZDFtXXG22ZNFkwGG9jmu3BYjB/5hFgsZZsaKG1UV+NLc4kwEWmQ43C2rJ2b3OAmvNaUPzunDQc4YR6xYHMKZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747955151; c=relaxed/relaxed;
	bh=7GdD15z8zbxV1DULYk+iOUxK1DJrgkNwnL/kJxMFLDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ilPI4rpVYo2N16y0iniu7K2abm5aR0+7LI7b/yqgM98iT3HC+jNVty0ClXf1oYYHT5ZJQVkDNvB5sNHM4I9scQC2JuM0F+9X+ZF9AcoGhWHCliqggJY+jbjPlakbW6JOGSw5SxA4X3Clz9eOh8KzpcUzoDW+ZBgi6bOQPb47LhZ95o+nL7pU6Ig7oqGAh5z2VhRuVivDihvMI9p2cVm+X/721Te1GTRGvYzj6t1XXGltr1pgsgdl1IgiKYarvnWFFUqcVyYisxceJtArNnvXytvc2dNuZJ3uvsBvwqyhhv0XM/OVGpVprW19Ee0bjfstZmZQ23iAKv30lORgDnfTYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nPW+fP+9; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nPW+fP+9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3P6604bXz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:05:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AA9062A56;
	Thu, 22 May 2025 23:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E9C4CEE4;
	Thu, 22 May 2025 23:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955146;
	bh=r4ITQcw1+GunUGAmNVITy56pCkvnCemY9Tx2nWzkD44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nPW+fP+9dG39OxRDoleYIK+aH7/ZYKA784Q2slH/0ORJB6spXZ0mf9H7BmwClgCgo
	 0G24og15eN/0A1SFrIw1mLQzfK8pQ86tOp5jkPRAGO8tLYfc2qJOzhqGjo/98uxQGP
	 5SMwkuVkYRofgPLpURTPJEjXt4rCuyGF7sDjvOcdJnaAA7rUAxllYZ0jrsl4jZOJSc
	 J3sAfMMpH7bXi4NPev5x1rH3T0c+C1YU2QMx9D4G2lQgNh2uPD/UYEhLLxCPc6JMKC
	 MQohE1oTgp1VkEYqcstBzTTEPL7YjXPZ0WzYyMoD0dtSMYekZXdPDut/fj8k3lDiqs
	 kDeJ+nGdoi+uQ==
Date: Thu, 22 May 2025 18:05:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log ratelimits
Message-ID: <20250522230545.GA1496972@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520215047.1350603-18-helgaas@kernel.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 04:50:34PM -0500, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
> 
> Allow userspace to read/write log ratelimits per device (including
> enable/disable). Create aer/ sysfs directory to store them and any
> future aer configs.

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

I propose that we rename these to:

  aer/correctable_ratelimit_burst
  aer/nonfatal_ratelimit_burst

I think "log" is probably unnecessary, and the error type part
should correspond with the existing entries (unfortunately not in the
"aer" directory):

  aer_dev_correctable
  aer_dev_nonfatal

and making "ratelimit_burst" a suffix will make it correspond to
these:

  fs/ext4/sysfs.c:        ATTR_LIST(err_ratelimit_burst),
  fs/ext4/sysfs.c:        ATTR_LIST(warning_ratelimit_burst),
  fs/ext4/sysfs.c:        ATTR_LIST(msg_ratelimit_burst),
  lib/fault-inject.c:FAULT_CONFIGFS_ATTR_NAMED(ratelimit_burst, "verbose_ratelimit_burst",

Also, I think we should split up "aer/ratelimit_log_enable" so we can
do it separately for correctable and nonfatal errors and name as:

  aer/correctable_ratelimit_interval_ms
  aer/nonfatal_ratelimit_interval_ms

so we can set the interval as well as the burst and to match these:

  fs/ext4/sysfs.c:        ATTR_LIST(err_ratelimit_interval_ms),
  fs/ext4/sysfs.c:        ATTR_LIST(warning_ratelimit_interval_ms),
  fs/ext4/sysfs.c:        ATTR_LIST(msg_ratelimit_interval_ms),
  lib/fault-inject.c:FAULT_CONFIGFS_ATTR_NAMED(ratelimit_interval, "verbose_ratelimit_interval_ms",

I'll post the series as a whole again, but here's the interdiff
related to this particular change:


diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
index 01bb577bfee8..5ed284523956 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
@@ -126,28 +126,38 @@ They represent configurable ratelimits of logs per error type.
 
 See Documentation/PCI/pcieaer-howto.rst for more info on ratelimits.
 
-What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_log_enable
+What:		/sys/bus/pci/devices/<dev>/aer/correctable_ratelimit_interval_ms
 Date:		May 2025
 KernelVersion:	6.16.0
-Contact:	linux-pci@vger.kernel.org, pandoh@google.com
-Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
-		gets whether or not AER ratelimiting is currently enabled.
-		Enabled by default.
+Contact:	linux-pci@vger.kernel.org
+Description:	Writing 0 disables AER correctable error log ratelimiting.
+		Writing a positive value sets the ratelimit interval in ms.
+		Default is DEFAULT_RATELIMIT_INTERVAL (5000 ms).
 
-What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_cor_log
+What:		/sys/bus/pci/devices/<dev>/aer/correctable_ratelimit_burst
 Date:		May 2025
 KernelVersion:	6.16.0
-Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Contact:	linux-pci@vger.kernel.org
 Description:	Ratelimit burst for correctable error logs. Writing a value
 		changes the number of errors (burst) allowed per interval
-		(5 second window) before ratelimiting. Reading gets the
-		current ratelimit burst.
+		before ratelimiting. Reading gets the current ratelimit
+		burst. Default is DEFAULT_RATELIMIT_BURST (10).
 
-What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log
+What:		/sys/bus/pci/devices/<dev>/aer/nonfatal_ratelimit_interval_ms
 Date:		May 2025
 KernelVersion:	6.16.0
-Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Contact:	linux-pci@vger.kernel.org
+Description:	Writing 0 disables AER non-fatal uncorrectable error log
+		ratelimiting. Writing a positive value sets the ratelimit
+		interval in ms. Default is DEFAULT_RATELIMIT_INTERVAL
+		(5000 ms).
+
+What:		/sys/bus/pci/devices/<dev>/aer/nonfatal_ratelimit_burst
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	linux-pci@vger.kernel.org
 Description:	Ratelimit burst for non-fatal uncorrectable error logs.
 		Writing a value changes the number of errors (burst)
-		allowed per interval (5 second window) before ratelimiting.
-		Reading gets the current ratelimit burst.
+		allowed per interval before ratelimiting. Reading gets the
+		current ratelimit burst. Default is DEFAULT_RATELIMIT_BURST
+		(10).
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 48014010dc8b..6c331695af58 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -91,8 +91,8 @@ struct aer_info {
 	u64 rootport_total_nonfatal_errs;
 
 	/* Ratelimits for errors */
-	struct ratelimit_state cor_log_ratelimit;
-	struct ratelimit_state uncor_log_ratelimit;
+	struct ratelimit_state correctable_ratelimit;
+	struct ratelimit_state nonfatal_ratelimit;
 };
 
 #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
@@ -384,9 +384,9 @@ void pci_aer_init(struct pci_dev *dev)
 
 	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
 
-	ratelimit_state_init(&dev->aer_info->cor_log_ratelimit,
+	ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
-	ratelimit_state_init(&dev->aer_info->uncor_log_ratelimit,
+	ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
 
 	/*
@@ -628,45 +628,44 @@ const struct attribute_group aer_stats_attr_group = {
 };
 
 /*
- * Ratelimit enable toggle
- * 0: disabled with ratelimit.interval = 0
- * 1: enabled with ratelimit.interval = nonzero
+ * Ratelimit interval
+ * <=0: disabled with ratelimit.interval = 0
+ * >0: enabled with ratelimit.interval in ms
  */
-static ssize_t ratelimit_log_enable_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	bool enabled = pdev->aer_info->cor_log_ratelimit.interval != 0;
-
-	return sysfs_emit(buf, "%d\n", enabled);
-}
-
-static ssize_t ratelimit_log_enable_store(struct device *dev,
-					  struct device_attribute *attr,
-					  const char *buf, size_t count)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	bool enable;
-	int interval;
-
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
-	if (kstrtobool(buf, &enable) < 0)
-		return -EINVAL;
-
-	if (enable)
-		interval = DEFAULT_RATELIMIT_INTERVAL;
-	else
-		interval = 0;
-
-	pdev->aer_info->cor_log_ratelimit.interval = interval;
-	pdev->aer_info->uncor_log_ratelimit.interval = interval;
-
-	return count;
-}
-static DEVICE_ATTR_RW(ratelimit_log_enable);
+#define aer_ratelimit_interval_attr(name, ratelimit)			\
+	static ssize_t							\
+	name##_show(struct device *dev, struct device_attribute *attr,	\
+					 char *buf)			\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
+									\
+		return sysfs_emit(buf, "%d\n",				\
+				  pdev->aer_info->ratelimit.interval);	\
+	}								\
+									\
+	static ssize_t							\
+	name##_store(struct device *dev, struct device_attribute *attr, \
+		     const char *buf, size_t count) 			\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
+		int interval;						\
+									\
+		if (!capable(CAP_SYS_ADMIN))				\
+			return -EPERM;					\
+									\
+		if (kstrtoint(buf, 0, &interval) < 0)			\
+			return -EINVAL;					\
+									\
+		if (interval <= 0)					\
+			interval = 0;					\
+		else							\
+			interval = msecs_to_jiffies(interval); 		\
+									\
+		pdev->aer_info->ratelimit.interval = interval;		\
+									\
+		return count;						\
+	}								\
+	static DEVICE_ATTR_RW(name);
 
 #define aer_ratelimit_burst_attr(name, ratelimit)			\
 	static ssize_t							\
@@ -696,15 +695,22 @@ static DEVICE_ATTR_RW(ratelimit_log_enable);
 									\
 		return count;						\
 	}								\
-	static DEVICE_ATTR_RW(name)
+	static DEVICE_ATTR_RW(name);
 
-aer_ratelimit_burst_attr(ratelimit_burst_cor_log, cor_log_ratelimit);
-aer_ratelimit_burst_attr(ratelimit_burst_uncor_log, uncor_log_ratelimit);
+#define aer_ratelimit_attrs(name)					\
+	aer_ratelimit_interval_attr(name##_ratelimit_interval_ms,	\
+				    name##_ratelimit)			\
+	aer_ratelimit_burst_attr(name##_ratelimit_burst,		\
+				 name##_ratelimit)
+
+aer_ratelimit_attrs(correctable)
+aer_ratelimit_attrs(nonfatal)
 
 static struct attribute *aer_attrs[] = {
-	&dev_attr_ratelimit_log_enable.attr,
-	&dev_attr_ratelimit_burst_cor_log.attr,
-	&dev_attr_ratelimit_burst_uncor_log.attr,
+	&dev_attr_correctable_ratelimit_interval_ms.attr,
+	&dev_attr_correctable_ratelimit_burst.attr,
+	&dev_attr_nonfatal_ratelimit_interval_ms.attr,
+	&dev_attr_nonfatal_ratelimit_burst.attr,
 	NULL
 };
 
@@ -786,9 +792,9 @@ static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 		return 1;	/* AER_FATAL not ratelimited */
 
 	if (severity == AER_CORRECTABLE)
-		ratelimit = &dev->aer_info->cor_log_ratelimit;
+		ratelimit = &dev->aer_info->correctable_ratelimit;
 	else
-		ratelimit = &dev->aer_info->uncor_log_ratelimit;
+		ratelimit = &dev->aer_info->nonfatal_ratelimit;
 
 	return __ratelimit(ratelimit);
 }

