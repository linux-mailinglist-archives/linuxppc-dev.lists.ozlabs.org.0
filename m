Return-Path: <linuxppc-dev+bounces-8790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B2ABE66C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Y44Z7fz3c6b;
	Wed, 21 May 2025 07:51:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777880;
	cv=none; b=HyS+iDFA/W9qPboRhZ3Bpd/6e/hXfx9Ztn9Z7rObsGl7fCHiL0t1eG4BGrjpdu33Sw4rtSdFEWl+nmpEZXKlMQhsZ+CCYBIcsdSjzDPn98Dp7oVra8OZWv3WUmiTLJ0vgJv8EaP8U5LUBXY3Euyxi9bvIpL6DGjfR+GSwehzt8anVmQALRL13yypa6EWlZDDLr4/ZHtwTIbJhGRCwf7YmpbL769AopN6yFJg9SwThIDf8BUFN7+o2YnCiDQOTnaXUJa5SnUTrccp/zyyaJxhHs3NyAAk3k6lzWsuwdvvmJaE3XbDp1NfDXYxQeHAcaz6tniy7h7++fnSRb9zsml9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777880; c=relaxed/relaxed;
	bh=btQTlrwkGrCwXWP2J9j782tftAulnocMm69OBnLqBr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGesrqaMyXGETkjnWBRyRSp+ovYBizkMS8z5vN7RMBmn5C2kPWEOaPLGC6KdYlQ1sX8AS8ko2IqjFYI4K0jPuOHRQBcYi4PIr04IJZR3BOQcBs939TdPkGwbe23OfYb/BVhKYHpRjwvWsdrZ4+d1HWnUU64VEXwYEi2JAHuVc3pvK+tzCtr/qx3ZPs+htTe61h9RRn4olgvp6iPQ7cbiyvNWaa8J4IcuY3kvdulbNjQWPJ58j83uzGRfvlttaFjFVUQGATPKcf60hNDZvb/Z89wlr1S3js5rHRk4z8gGLwCObd9xMpUtZI9SLX9UeUBTcbpJLb0bFzYdoHMSBivFXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BlTtgSyn; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BlTtgSyn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Y36NhVz3c2t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07E5E5C5B16;
	Tue, 20 May 2025 21:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF3FC4CEE9;
	Tue, 20 May 2025 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777877;
	bh=ePMKG3T5vfY+LwUDoZFiic/kKbAZ9/8HM+EMKL4+U2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BlTtgSyntsHKGPDqr8Qdas+NegyKnANh638UWrJQf8rC4Zh5hYgwMBmv9CBr5IrK8
	 xiA2JXr11YVwAs+UNtQdbeYBoSKnaCt+qU2jmN/m3QI/xPo22hHyczelvX8KLTw/wV
	 QMwNYH5P0ogOfzOWc20j7VHXbLsH2/r/3gdMB+As9m6hu0bHyWX07y33CD/nmZzGYN
	 /q4I90vGDmc8ky9BF9z3PR22lnCv0SOQOAflZ0XltgPUg/x3yHzRMUuhAuIHQ8lzek
	 h1TSwj2d8QnakwGnKbuq/eANcAvgYHm9y4iWQxywGoB6zBwqEakG1Jma5tOdFwfhVH
	 WA2KjrXPgyiZg==
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
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log ratelimits
Date: Tue, 20 May 2025 16:50:34 -0500
Message-ID: <20250520215047.1350603-18-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520215047.1350603-1-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

[bhelgaas: note fatal errors are not ratelimited, "aer_report" -> "aer_info"]
Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
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
index d1f67bb81d5d..01bb577bfee8 100644
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
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
+		gets whether or not AER ratelimiting is currently enabled.
+		Enabled by default.
+
+What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_cor_log
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Description:	Ratelimit burst for correctable error logs. Writing a value
+		changes the number of errors (burst) allowed per interval
+		(5 second window) before ratelimiting. Reading gets the
+		current ratelimit burst.
+
+What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	linux-pci@vger.kernel.org, pandoh@google.com
+Description:	Ratelimit burst for non-fatal uncorrectable error logs.
+		Writing a value changes the number of errors (burst)
+		allowed per interval (5 second window) before ratelimiting.
+		Reading gets the current ratelimit burst.
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
index f9e684ac7878..9b8dea317a79 100644
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
+	bool enabled = pdev->aer_info->cor_log_ratelimit.interval != 0;
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
+	pdev->aer_info->cor_log_ratelimit.interval = interval;
+	pdev->aer_info->uncor_log_ratelimit.interval = interval;
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
+			  pdev->aer_info->ratelimit.burst);		\
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
+	pdev->aer_info->ratelimit.burst = burst;			\
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


