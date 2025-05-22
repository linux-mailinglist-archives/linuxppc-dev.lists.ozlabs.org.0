Return-Path: <linuxppc-dev+bounces-8901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C7AC17CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PWQ4NByz3cJk;
	Fri, 23 May 2025 09:24:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956258;
	cv=none; b=ZMb2XOz4Kdhh1PuiqJkiHIgh/b1uSPjz8qnM20PUBlWPbbwbdBM1WEQdI0Ho7/UaaVfsWa/bQqNUQ7DdCGL7tM453h55qrkatG/wIxzf9H0DpY+VXxtq3+HBJAcJZgNYAumIe2ImQELW7qbbpi0dqKIcCsPQ0RXFLF7Z7seTcLyXYxJPwRnaThTF2aozXghQ8ZZSk8SdrWQCa5LSveai5tRJ0+zsTHMgQzbWEIdZ0FmghfOTQEyo+EQXwc2fiIJ0hnxsi+Cc/CgpnutVhwWQlwx8YyNcfPLPuIOQ6stIM8yAy3BfWueA2pDDohwhEzebFmy0MBCjKwUZdy4uMAm1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956258; c=relaxed/relaxed;
	bh=heDCI3qTtKj8cRm/PhN1luuvCMqSHVk/Sof+OHM2aaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QU47A/tdQ17u3eDy2Q9bTetBrIukKDH5TBy9GXLwXxAjJDeyhVG93hv7M3nKy2TBOka8rYjUqSgY10SpBBGON83QBAHJ4DhMkJKu3AGdoAb1QIc4dyBlBDhuJKl5qZRn9Zo1WiWoVkD8Z4aSfpXCbUfpb7wMcfT7Cw7s5wGcX0tAM5RSsf0JVIJdYwgRE404i6s+BapR+pygEIQoPkcYwctViUDkpxuYRDCbPkA3YOKEKB0OzN37ui5PV2RSZQ5MaLJy2+KwNs4s2RvKq8g5hLp/v/D+7Je2ZozsfvH9inX3GvxD/bB4ccBR00qJljwI1L79GMpr1zodQtu4KsRY2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQhBOQeP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQhBOQeP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PWP6FP1z3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:24:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03BDC5C6BEC;
	Thu, 22 May 2025 23:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CDEC4CEE4;
	Thu, 22 May 2025 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956255;
	bh=jutpcG0ZE3UNYnM28kKlMNptr/4x9KGHOyGkKPhvZ5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQhBOQePKk605nJTtWTzrz50v1ZlCXnjVH/hlQSBGTN+CnIeKiDGduDb/qyFC003M
	 VR080MyzRQ7HVN2b3jwIaS5b/XAtjlScJPQbJRN70b0ezRUkXlgLSjNK+oFGNYG2XD
	 i8zHPgC+OBPXxmjLdfYfgg0iYs+cWyVR2XQTCxQFIqPr+QIUsP3/bx10DKW9Izk82F
	 g7Umn1WCmAw6mX149vM2UBURwxrKULyVXie+DLcDZWrK/kyvTygsSxAz4Q1nQp7DLa
	 rVLlaThVpDcaonnMWJ8V/q6GWlpYwlCR2AthAFNGu1K4bClOnjuFjUVO7l9JnlHMbI
	 8nI9teosGRSoA==
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
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v8 20/20] PCI/AER: Add sysfs attributes for log ratelimits
Date: Thu, 22 May 2025 18:21:26 -0500
Message-ID: <20250522232339.1525671-21-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522232339.1525671-1-helgaas@kernel.org>
References: <20250522232339.1525671-1-helgaas@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jon Pan-Doh <pandoh@google.com>

Allow userspace to read/write log ratelimits per device (including
enable/disable). Create aer/ sysfs directory to store them and any
future AER configs.

The new sysfs files are:

  /sys/bus/pci/devices/*/aer/correctable_ratelimit_burst
  /sys/bus/pci/devices/*/aer/correctable_ratelimit_interval_ms
  /sys/bus/pci/devices/*/aer/nonfatal_ratelimit_burst
  /sys/bus/pci/devices/*/aer/nonfatal_ratelimit_interval_ms

The default values are ratelimit_burst=10, ratelimit_interval_ms=5000, so
if we try to emit more than 10 messages in a 5 second period, some are
suppressed.

Update AER sysfs ABI filename to reflect the broader scope of AER sysfs
attributes (e.g. stats and ratelimits).

  Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats ->
    sysfs-bus-pci-devices-aer

Tested using aer-inject[1]. Configured correctable log ratelimit to 5.
Sent 6 AER errors. Observed 5 errors logged while AER stats
(cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) shows 6.

Disabled ratelimiting and sent 6 more AER errors. Observed all 6 errors
logged and accounted in AER stats (12 total errors).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git

[bhelgaas: note fatal errors are not ratelimited, "aer_report" ->
"aer_info", replace ratelimit_log_enable toggle with *_ratelimit_interval_ms]

Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/20250520215047.1350603-18-helgaas@kernel.org
---
 ...es-aer_stats => sysfs-bus-pci-devices-aer} |  44 ++++++++
 Documentation/PCI/pcieaer-howto.rst           |   5 +-
 drivers/pci/pci-sysfs.c                       |   1 +
 drivers/pci/pci.h                             |   1 +
 drivers/pci/pcie/aer.c                        | 105 ++++++++++++++++++
 5 files changed, 155 insertions(+), 1 deletion(-)
 rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (72%)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
similarity index 72%
rename from Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
rename to Documentation/ABI/testing/sysfs-bus-pci-devices-aer
index d1f67bb81d5d..5ed284523956 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
@@ -117,3 +117,47 @@ Date:		July 2018
 KernelVersion:	4.19.0
 Contact:	linux-pci@vger.kernel.org, rajatja@google.com
 Description:	Total number of ERR_NONFATAL messages reported to rootport.
+
+PCIe AER ratelimits
+-------------------
+
+These attributes show up under all the devices that are AER capable.
+They represent configurable ratelimits of logs per error type.
+
+See Documentation/PCI/pcieaer-howto.rst for more info on ratelimits.
+
+What:		/sys/bus/pci/devices/<dev>/aer/correctable_ratelimit_interval_ms
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	linux-pci@vger.kernel.org
+Description:	Writing 0 disables AER correctable error log ratelimiting.
+		Writing a positive value sets the ratelimit interval in ms.
+		Default is DEFAULT_RATELIMIT_INTERVAL (5000 ms).
+
+What:		/sys/bus/pci/devices/<dev>/aer/correctable_ratelimit_burst
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	linux-pci@vger.kernel.org
+Description:	Ratelimit burst for correctable error logs. Writing a value
+		changes the number of errors (burst) allowed per interval
+		before ratelimiting. Reading gets the current ratelimit
+		burst. Default is DEFAULT_RATELIMIT_BURST (10).
+
+What:		/sys/bus/pci/devices/<dev>/aer/nonfatal_ratelimit_interval_ms
+Date:		May 2025
+KernelVersion:	6.16.0
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
+Description:	Ratelimit burst for non-fatal uncorrectable error logs.
+		Writing a value changes the number of errors (burst)
+		allowed per interval before ratelimiting. Reading gets the
+		current ratelimit burst. Default is DEFAULT_RATELIMIT_BURST
+		(10).
diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 6fb31516fff1..4b71e2f43ca7 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -97,12 +97,15 @@ DPC errors, are not ratelimited.
 AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
 DEFAULT_RATELIMIT_INTERVAL (5 seconds).
 
+Ratelimits are exposed in the form of sysfs attributes and configurable.
+See Documentation/ABI/testing/sysfs-bus-pci-devices-aer.
+
 AER Statistics / Counters
 -------------------------
 
 When PCIe AER errors are captured, the counters / statistics are also exposed
 in the form of sysfs attributes which are documented at
-Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
+Documentation/ABI/testing/sysfs-bus-pci-devices-aer.
 
 Developer Guide
 ===============
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index c6cda56ca52c..278de99b00ce 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1805,6 +1805,7 @@ const struct attribute_group *pci_dev_attr_groups[] = {
 	&pcie_dev_attr_group,
 #ifdef CONFIG_PCIEAER
 	&aer_stats_attr_group,
+	&aer_attr_group,
 #endif
 #ifdef CONFIG_PCIEASPM
 	&aspm_ctrl_attr_group,
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3023c68fe485..eca2812cfd25 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -965,6 +965,7 @@ void pci_no_aer(void);
 void pci_aer_init(struct pci_dev *dev);
 void pci_aer_exit(struct pci_dev *dev);
 extern const struct attribute_group aer_stats_attr_group;
+extern const struct attribute_group aer_attr_group;
 void pci_aer_clear_fatal_status(struct pci_dev *dev);
 int pci_aer_clear_status(struct pci_dev *dev);
 int pci_aer_raw_clear_status(struct pci_dev *dev);
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ebac126144fc..6c331695af58 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -627,6 +627,111 @@ const struct attribute_group aer_stats_attr_group = {
 	.is_visible = aer_stats_attrs_are_visible,
 };
 
+/*
+ * Ratelimit interval
+ * <=0: disabled with ratelimit.interval = 0
+ * >0: enabled with ratelimit.interval in ms
+ */
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
+
+#define aer_ratelimit_burst_attr(name, ratelimit)			\
+	static ssize_t							\
+	name##_show(struct device *dev, struct device_attribute *attr,	\
+		    char *buf)						\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
+									\
+		return sysfs_emit(buf, "%d\n",				\
+				  pdev->aer_info->ratelimit.burst);	\
+	}								\
+									\
+	static ssize_t							\
+	name##_store(struct device *dev, struct device_attribute *attr,	\
+		     const char *buf, size_t count)			\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
+		int burst;						\
+									\
+		if (!capable(CAP_SYS_ADMIN))				\
+			return -EPERM;					\
+									\
+		if (kstrtoint(buf, 0, &burst) < 0)			\
+			return -EINVAL;					\
+									\
+		pdev->aer_info->ratelimit.burst = burst;		\
+									\
+		return count;						\
+	}								\
+	static DEVICE_ATTR_RW(name);
+
+#define aer_ratelimit_attrs(name)					\
+	aer_ratelimit_interval_attr(name##_ratelimit_interval_ms,	\
+				    name##_ratelimit)			\
+	aer_ratelimit_burst_attr(name##_ratelimit_burst,		\
+				 name##_ratelimit)
+
+aer_ratelimit_attrs(correctable)
+aer_ratelimit_attrs(nonfatal)
+
+static struct attribute *aer_attrs[] = {
+	&dev_attr_correctable_ratelimit_interval_ms.attr,
+	&dev_attr_correctable_ratelimit_burst.attr,
+	&dev_attr_nonfatal_ratelimit_interval_ms.attr,
+	&dev_attr_nonfatal_ratelimit_burst.attr,
+	NULL
+};
+
+static umode_t aer_attrs_are_visible(struct kobject *kobj,
+				     struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	if (!pdev->aer_info)
+		return 0;
+
+	return a->mode;
+}
+
+const struct attribute_group aer_attr_group = {
+	.name = "aer",
+	.attrs = aer_attrs,
+	.is_visible = aer_attrs_are_visible,
+};
+
 static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 				   struct aer_err_info *info)
 {
-- 
2.43.0


