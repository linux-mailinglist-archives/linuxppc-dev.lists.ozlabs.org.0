Return-Path: <linuxppc-dev+bounces-8693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD1BABC9F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WHM0tgsz2ypV;
	Tue, 20 May 2025 07:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690639;
	cv=none; b=ROsH06Pe+etssYugCJepN2keylik9FMnNnJ8flUQ5avwbUpgcb5kVXoSbSDoo935li5FaRgIFzeCJoSUN4ksBtbT8nHO81sRCHKf5+SNfMFUN2c2HyIpXn2/4B9/DwoJSIrhqnr2WKleQKSvGsE5DjKaF8VR87LLrlB8cVmEtWd8+IkH6BPlK2sVOIRhJlYp0oirCdOtdkjtzQMmugzBsVOftugD2AdH4EGQfWTBOZg0D58nFRUr3+Rr3J1BqfL6ghYNcy3dTPcoa/US0YoYzpvHLEjH5NRaEAo6lKOTfVcN4txK/vqeTcMbgRtidIz7M+OYMpBJZ6gBg3TR7+GbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690639; c=relaxed/relaxed;
	bh=xwqvHijYtu+DNsa6jORqrgN+JdDAKgTDBOE9JbF3lFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9M8qjnJwtEiqiYboMK52GrKTCvZ8G3lD+GoH6jzaaR2i/O2S5RLt9XSxXUFeR9odgYJfpoghqgWfzxfmo6/emhpKY00hzVzA+6ZYUjCqY2ezSJPXYUcRs+lRY3junysS/RJYALqyE+6fFtDigEP+2k7gu/fw+PZ945Retk5ZmogglzOK3AN4RtRV5aoOIRARq23sLGjhGhBjajv3Dy2j+SnNrQ3/jKFF/lBhGZ6VubcN6YoQEK4ajvOvDJH0Kc3tsG9nOoPo8Mnru52t/uVptuRp5mYIK6oleWFVaM0kuGJBbu2j9ib6xsDIW13a/Il4+wEYFhj5eQ23+uupnFLqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=in/YHymP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=in/YHymP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WHL20jzz30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52935A48DF2;
	Mon, 19 May 2025 21:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E29C4CEEB;
	Mon, 19 May 2025 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690636;
	bh=12/NRUft87RDeqIIYKl8SbdG7KYjWdZEJIx6gghpJCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=in/YHymPRXWbK35wvQKFGaNCJZBQ8UibZjrxnnVuSCYvfhUchO3AG2tByDNuvrdgG
	 3GvCHmis0plvbOBpd4DPFMFEOk9golJRoIiyPEXlIrvtvG5Egs8VUkqpWA87cnQ5ey
	 aCEwhrQtgEa3Tqjp7PU3UTpj8DjCXWq/Sd2ZXy6PCjt//O2ypHpfrgrvEiS++zwUw8
	 n+PyqU9WivhUVOQ8wSIilkAfq8bJaIEXCTYIj8ouMtc5bXixcnKvq8UU4rMricA2M3
	 VEgt7j7M6yBvDs0yUBzYFTACByp0ZJ2qqhBoGjv/EMmeRC7TavLmUwZA8JrnfnxtrB
	 vJzlSvHjYCD3Q==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
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
Subject: [PATCH v6 16/16] PCI/AER: Add sysfs attributes for log ratelimits
Date: Mon, 19 May 2025 16:35:58 -0500
Message-ID: <20250519213603.1257897-17-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519213603.1257897-1-helgaas@kernel.org>
References: <20250519213603.1257897-1-helgaas@kernel.org>
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
future aer configs.

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

Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
 ...es-aer_stats => sysfs-bus-pci-devices-aer} | 34 +++++++
 Documentation/PCI/pcieaer-howto.rst           |  5 +-
 drivers/pci/pci-sysfs.c                       |  1 +
 drivers/pci/pci.h                             |  1 +
 drivers/pci/pcie/aer.c                        | 99 +++++++++++++++++++
 5 files changed, 139 insertions(+), 1 deletion(-)
 rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (77%)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
similarity index 77%
rename from Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
rename to Documentation/ABI/testing/sysfs-bus-pci-devices-aer
index d1f67bb81d5d..771204197b71 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
@@ -117,3 +117,37 @@ Date:		July 2018
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
+What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_log_enable
+Date:		March 2025
+KernelVersion:	6.15.0
+Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
+		gets whether or not AER is currently enabled. Enabled by
+		default.
+
+What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_cor_log
+Date:		March 2025
+KernelVersion:	6.15.0
+Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Description:	Ratelimit burst for correctable error logs. Writing a value
+		changes the number of errors (burst) allowed per interval
+		(5 second window) before ratelimiting. Reading gets the
+		current ratelimit burst.
+
+What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log
+Date:		March 2025
+KernelVersion:	6.15.0
+Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Description:	Ratelimit burst for uncorrectable error logs. Writing a
+		value changes the number of errors (burst) allowed per
+		interval (5 second window) before ratelimiting. Reading
+		gets the current ratelimit burst.
diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 896d2a232a90..043cdb3194be 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -96,12 +96,15 @@ type (correctable vs. uncorrectable).
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
index 65c466279ade..a3261e842d6d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -963,6 +963,7 @@ void pci_no_aer(void);
 void pci_aer_init(struct pci_dev *dev);
 void pci_aer_exit(struct pci_dev *dev);
 extern const struct attribute_group aer_stats_attr_group;
+extern const struct attribute_group aer_attr_group;
 void pci_aer_clear_fatal_status(struct pci_dev *dev);
 int pci_aer_clear_status(struct pci_dev *dev);
 int pci_aer_raw_clear_status(struct pci_dev *dev);
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c335e0bb9f51..42df5cb963b3 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -627,6 +627,105 @@ const struct attribute_group aer_stats_attr_group = {
 	.is_visible = aer_stats_attrs_are_visible,
 };
 
+/*
+ * Ratelimit enable toggle
+ * 0: disabled with ratelimit.interval = 0
+ * 1: enabled with ratelimit.interval = nonzero
+ */
+static ssize_t ratelimit_log_enable_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	bool enabled = pdev->aer_report->cor_log_ratelimit.interval != 0;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+static ssize_t ratelimit_log_enable_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	bool enable;
+	int interval;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (kstrtobool(buf, &enable) < 0)
+		return -EINVAL;
+
+	if (enable)
+		interval = DEFAULT_RATELIMIT_INTERVAL;
+	else
+		interval = 0;
+
+	pdev->aer_report->cor_log_ratelimit.interval = interval;
+	pdev->aer_report->uncor_log_ratelimit.interval = interval;
+
+	return count;
+}
+static DEVICE_ATTR_RW(ratelimit_log_enable);
+
+#define aer_ratelimit_burst_attr(name, ratelimit)			\
+	static ssize_t							\
+	name##_show(struct device *dev, struct device_attribute *attr,	\
+		    char *buf)						\
+{									\
+	struct pci_dev *pdev = to_pci_dev(dev);				\
+									\
+	return sysfs_emit(buf, "%d\n",					\
+			  pdev->aer_report->ratelimit.burst);		\
+}									\
+									\
+	static ssize_t							\
+	name##_store(struct device *dev, struct device_attribute *attr,	\
+		     const char *buf, size_t count)			\
+{									\
+	struct pci_dev *pdev = to_pci_dev(dev);				\
+	int burst;							\
+									\
+	if (!capable(CAP_SYS_ADMIN))					\
+		return -EPERM;						\
+									\
+	if (kstrtoint(buf, 0, &burst) < 0)				\
+		return -EINVAL;						\
+									\
+	pdev->aer_report->ratelimit.burst = burst;			\
+									\
+	return count;							\
+}									\
+static DEVICE_ATTR_RW(name)
+
+aer_ratelimit_burst_attr(ratelimit_burst_cor_log, cor_log_ratelimit);
+aer_ratelimit_burst_attr(ratelimit_burst_uncor_log, uncor_log_ratelimit);
+
+static struct attribute *aer_attrs[] = {
+	&dev_attr_ratelimit_log_enable.attr,
+	&dev_attr_ratelimit_burst_cor_log.attr,
+	&dev_attr_ratelimit_burst_uncor_log.attr,
+	NULL
+};
+
+static umode_t aer_attrs_are_visible(struct kobject *kobj,
+				     struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	if (!pdev->aer_report)
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


