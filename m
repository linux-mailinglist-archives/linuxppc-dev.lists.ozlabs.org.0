Return-Path: <linuxppc-dev+bounces-8773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFADABE64A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27XZ2jJ5z30dt;
	Wed, 21 May 2025 07:50:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777854;
	cv=none; b=oceYWj9T+9oIUgt1Nir4kk5PhcLnmjiV1dmKekQQJgWkg3HCv4PgpI6I7HYm62Ul+AazuhDm9wAqFbmiAaVcKiLP2renh17rah3VUTWYwY0faC43z7tHe6t+r8yP1Sc+Ta9hB9GznmgQy1venu/yw4MusELMuekCuDcV6y6P+ED1fSwV+96/K0UGpJV+q/a3mOoRq3L09e79DlKjWKCsclSfivA+1mZQGrpxGipdLhebnex2PHvvWoR7H3PONMdNhd0JzPgA5Sc8h6po9qTWxWF1djz1PnPMbOngntgtjXcqer50C8yEJfYsnmbi4+9cc/NUYZYb0MlYpgjKe5OT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777854; c=relaxed/relaxed;
	bh=b/gyxV2xWDJZXhBxZWesClMCJo0+EX/U1U9UgfVllmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z/OaEFvo5RY3lHqG6iyvSfqJIM4uxTsSFbb3lQHwYA0Xt8Tk59EjgBwTm9N8PBHv3mcYVV1hpc68abfGwprJXkXJDaTJyFxINEJZPy/L5xSfIde7Kia5qO2HR0lpNDAf1E3cc6GGSdj6c7daQQQUH1CQCcFXc00/nvLrcNBTFRDwz/7seXTOqXWxjKE5g136Lsvo2MT+Bwy9rOaOl4oCSJLCo2Wqi+qrgNlnY0E/949cnje6ueV6iBZvl0xnRwtaNFsVdt4ETRLNqT1zvDwTkavkWgt8Sk1Kv88gG1KRYV1dlpyG6MrhTqV32w3dgAMjwkVYHNo8k796oOzPh0rWNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N+xczVcO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N+xczVcO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27XY1ZPQz305P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:50:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25D7F4AB3F;
	Tue, 20 May 2025 21:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22C2C4CEE9;
	Tue, 20 May 2025 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777851;
	bh=6nhqSCesHEdYOIg39c2CprFwbx/2JpKfxOB4+iEgwkI=;
	h=From:To:Cc:Subject:Date:From;
	b=N+xczVcOpaXmeWMle8knXOZ/RUK2yL7oMon8kblqxoTxeDVNrbZcM4AxAobX6pcfz
	 iq3Mgg7pfwbOCtAgxXHRvRpM7Ut0bCVGsKKFYSh9ZO3bWtdWWiyq7E5uCTUj3LsGpp
	 1NBsKBtLg4LFrA+ErKAckxQoRJvoEJyWSn1ofNgwNrmvB+tI8d7elh66N3b+y1QC8d
	 DQqG9MAJpslnmm/PZoCrrLaGgVZgaDBZ7yI31Qt1nBSXm3THolwIGj5Zf5Nq9O9HEv
	 IkTyoJDhm5tWKvnLyO3DlIKlO4ltMwBWuMrK9E8JwbpOs/4Rar2C/qrxnHRO5HcgO9
	 xWvu2vfAEbAcg==
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
Subject: [PATCH v7 00/17] Rate limit AER logs
Date: Tue, 20 May 2025 16:50:17 -0500
Message-ID: <20250520215047.1350603-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

This work is mostly due to Jon Pan-Doh and Karolina Stolarek.  I rebased
this to v6.15-rc1, factored out some of the trace and statistics updates,
and added some minor cleanups.

I'm sorry to post a v7 so soon after v6, but I really want to get this in
v6.16 so it needs to get into pci/next soonish.  I pushed this to pci/aer
at https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=aer
(head cbde036e5615 ("PCI/AER: Add sysfs attributes for log ratelimits"))
and appended the interdiff from v6 to v7 below.

Proposal
========

When using native AER, spammy devices can flood kernel logs with AER errors
and slow/stall execution. Add per-device per-error-severity ratelimits for
more robust error logging. Allow userspace to configure ratelimits via
sysfs knobs.

Motivation
==========

Inconsistent PCIe error handling, exacerbated at datacenter scale (myriad
of devices), affects repairabilitiy flows for fleet operators.

Exposing PCIe errors/debug info in-band for a userspace daemon (e.g.
rasdaemon) to collect/pass on to repairability services will allow for more
predictable repair flows and decrease machine downtime.

Background
==========

AER error spam has been observed many times, both publicly (e.g. [1], [2],
[3]) and privately. While it usually occurs with correctable errors, it can
happen with uncorrectable errors (e.g. during new HW bringup).

There have been previous attempts to add ratelimits to AER logs ([4], [5]).
The most recent attempt[5] has many similarities with the proposed
approach.


v7:
- Update sysfs doc target kernel version & date (Ilpo)
- Fix sysfs doc "AER ratelimiting" typo (Ilpo)
- Ratelimit Correctable and Non-Fatal but not Fatal errors (Sathy)
- Rename "struct aer_report" to "aer_info" (Sathy)
- Expand comments about combining ratelimit for multiple devices (Ilpo)
- Rework Error Source logging ratelimiting (Sathy)
- Factor out aer_isr_one_error_type() to reduce code duplication
- Log DPC errors, which are all Fatal, at KERN_ERR (Sathy)
- Improve dpc_process_error() structure (Ilpo)
v6: https://lore.kernel.org/r/20250519213603.1257897-1-helgaas@kernel.org
- Rebase to v6.15-rc1
- Initialize struct aer_err_info completely before using it
- Log DPC Error Source ID only when it's valid
- Consolidate AER Error Source ID logging to one place
- Tidy Error Source ID bus/dev/fn decoding using macros
- Rename aer_print_port_info() to aer_print_source()
- Consolidate trace events and statistic updates to one non-ratelimited place
- Save log level in struct aer_err_info instead of passing as parameter
v5: https://lore.kernel.org/r/20250321015806.954866-1-pandoh@google.com
- Handle multi-error AER by evaluating ratelimits once and storing result
- Reword/rename commit messages/functions/variable
v4: https://lore.kernel.org/r/20250320082057.622983-1-pandoh@google.com
- Fix bug where trace not emitted with malformed aer_err_info
- Extend ratelimit to malformed aer_err_info
- Update commit messages with patch motivation
- Squash AER sysfs filename change (Patch 8)
v3: https://lore.kernel.org/r/20250319084050.366718-1-pandoh@google.com
- Ratelimit aer_print_port_info() (drop Patch 1)
- Add ratelimit enable toggle
- Move trace outside of ratelimit
- Split log level (Patch 2) into two
- More descriptive documentation/sysfs naming
v2: https://lore.kernel.org/r/20250214023543.992372-1-pandoh@google.com
- Rebased on top of pci/aer (6.14.rc-1)
- Split series into log and IRQ ratelimits (defer patch 5)
- Dropped patch 8 (Move AER sysfs)
- Added log level cleanup patch[7] from Karolina's series
- Fixed bug where dpc errors didn't increment counters
- "X callbacks suppressed" message on ratelimit release -> immediately
- Separate documentation into own patch
v1: https://lore.kernel.org/r/20250115074301.3514927-1-pandoh@google.com

[1] https://bugzilla.kernel.org/show_bug.cgi?id=215027
[2] https://bugzilla.kernel.org/show_bug.cgi?id=201517
[3] https://bugzilla.kernel.org/show_bug.cgi?id=196183
[4] https://lore.kernel.org/linux-pci/20230606035442.2886343-2-grundler@chromium.org/
[5] https://lore.kernel.org/linux-pci/cover.1736341506.git.karolina.stolarek@oracle.com/
[6]
https://lore.kernel.org/linux-pci/8bcb8c9a7b38ce3bdaca5a64fe76f08b0b337511.1742202797.git.k
arolina.stolarek@oracle.com/
[7]
https://lore.kernel.org/linux-pci/edd77011aafad4c0654358a26b4e538d0c5a321d.1736341506.git.k
arolina.stolarek@oracle.com/



Bjorn Helgaas (10):
  PCI/DPC: Initialize aer_err_info before using it
  PCI/DPC: Log Error Source ID only when valid
  PCI/AER: Factor COR/UNCOR error handling out from aer_isr_one_error()
  PCI/AER: Consolidate Error Source ID logging in
    aer_isr_one_error_type()
  PCI/AER: Extract bus/dev/fn in aer_print_port_info() with
    PCI_BUS_NUM(), etc
  PCI/AER: Move aer_print_source() earlier in file
  PCI/AER: Initialize aer_err_info before using it
  PCI/AER: Simplify pci_print_aer()
  PCI/AER: Update statistics early in logging
  PCI/AER: Combine trace_aer_event() with statistics updates

Jon Pan-Doh (4):
  PCI/AER: Rename aer_print_port_info() to aer_print_source()
  PCI/AER: Ratelimit correctable and non-fatal error logging
  PCI/AER: Add ratelimits to PCI AER Documentation
  PCI/AER: Add sysfs attributes for log ratelimits

Karolina Stolarek (3):
  PCI/AER: Check log level once and remember it
  PCI/AER: Make all pci_print_aer() log levels depend on error type
  PCI/AER: Rename struct aer_stats to aer_info

 ...es-aer_stats => sysfs-bus-pci-devices-aer} |  34 ++
 Documentation/PCI/pcieaer-howto.rst           |  17 +-
 drivers/pci/pci-sysfs.c                       |   1 +
 drivers/pci/pci.h                             |   5 +-
 drivers/pci/pcie/aer.c                        | 387 +++++++++++++-----
 drivers/pci/pcie/dpc.c                        |  68 +--
 include/linux/pci.h                           |   2 +-
 7 files changed, 370 insertions(+), 144 deletions(-)
 rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (77%)

-- 
2.43.0


diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
index 771204197b71..01bb577bfee8 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer
@@ -127,16 +127,16 @@ They represent configurable ratelimits of logs per error type.
 See Documentation/PCI/pcieaer-howto.rst for more info on ratelimits.
 
 What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_log_enable
-Date:		March 2025
-KernelVersion:	6.15.0
+Date:		May 2025
+KernelVersion:	6.16.0
 Contact:	linux-pci@vger.kernel.org, pandoh@google.com
 Description:	Writing 1/0 enables/disables AER log ratelimiting. Reading
-		gets whether or not AER is currently enabled. Enabled by
-		default.
+		gets whether or not AER ratelimiting is currently enabled.
+		Enabled by default.
 
 What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_cor_log
-Date:		March 2025
-KernelVersion:	6.15.0
+Date:		May 2025
+KernelVersion:	6.16.0
 Contact:	linux-pci@vger.kernel.org, pandoh@google.com
 Description:	Ratelimit burst for correctable error logs. Writing a value
 		changes the number of errors (burst) allowed per interval
@@ -144,10 +144,10 @@ Description:	Ratelimit burst for correctable error logs. Writing a value
 		current ratelimit burst.
 
 What:		/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log
-Date:		March 2025
-KernelVersion:	6.15.0
+Date:		May 2025
+KernelVersion:	6.16.0
 Contact:	linux-pci@vger.kernel.org, pandoh@google.com
-Description:	Ratelimit burst for uncorrectable error logs. Writing a
-		value changes the number of errors (burst) allowed per
-		interval (5 second window) before ratelimiting. Reading
-		gets the current ratelimit burst.
+Description:	Ratelimit burst for non-fatal uncorrectable error logs.
+		Writing a value changes the number of errors (burst)
+		allowed per interval (5 second window) before ratelimiting.
+		Reading gets the current ratelimit burst.
diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 043cdb3194be..4b71e2f43ca7 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -91,7 +91,8 @@ AER Ratelimits
 Since error messages can be generated for each transaction, we may see
 large volumes of errors reported. To prevent spammy devices from flooding
 the console/stalling execution, messages are throttled by device and error
-type (correctable vs. uncorrectable).
+type (correctable vs. non-fatal uncorrectable).  Fatal errors, including
+DPC errors, are not ratelimited.
 
 AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
 DEFAULT_RATELIMIT_INTERVAL (5 seconds).
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 42df5cb963b3..9b8dea317a79 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -55,11 +55,11 @@ struct aer_rpc {
 	DECLARE_KFIFO(aer_fifo, struct aer_err_source, AER_ERROR_SOURCES_MAX);
 };
 
-/* AER report for the device */
-struct aer_report {
+/* AER info for the device */
+struct aer_info {
 
 	/*
-	 * Stats for all AER capable devices. They indicate the errors
+	 * Fields for all AER capable devices. They indicate the errors
 	 * "as seen by this device". Note that this may mean that if an
 	 * Endpoint is causing problems, the AER counters may increment
 	 * at its link partner (e.g. Root Port) because the errors will be
@@ -81,7 +81,7 @@ struct aer_report {
 	u64 dev_total_nonfatal_errs;
 
 	/*
-	 * Stats for Root Ports & Root Complex Event Collectors only; these
+	 * Fields for Root Ports & Root Complex Event Collectors only; these
 	 * indicate the total number of ERR_COR, ERR_FATAL, and ERR_NONFATAL
 	 * messages received by the Root Port / Event Collector, INCLUDING the
 	 * ones that are generated internally (by the Root Port itself)
@@ -382,11 +382,11 @@ void pci_aer_init(struct pci_dev *dev)
 	if (!dev->aer_cap)
 		return;
 
-	dev->aer_report = kzalloc(sizeof(*dev->aer_report), GFP_KERNEL);
+	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
 
-	ratelimit_state_init(&dev->aer_report->cor_log_ratelimit,
+	ratelimit_state_init(&dev->aer_info->cor_log_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
-	ratelimit_state_init(&dev->aer_report->uncor_log_ratelimit,
+	ratelimit_state_init(&dev->aer_info->uncor_log_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
 
 	/*
@@ -408,8 +408,8 @@ void pci_aer_init(struct pci_dev *dev)
 
 void pci_aer_exit(struct pci_dev *dev)
 {
-	kfree(dev->aer_report);
-	dev->aer_report = NULL;
+	kfree(dev->aer_info);
+	dev->aer_info = NULL;
 }
 
 #define AER_AGENT_RECEIVER		0
@@ -547,10 +547,10 @@ static const char *aer_agent_string[] = {
 {									\
 	unsigned int i;							\
 	struct pci_dev *pdev = to_pci_dev(dev);				\
-	u64 *stats = pdev->aer_report->stats_array;			\
+	u64 *stats = pdev->aer_info->stats_array;			\
 	size_t len = 0;							\
 									\
-	for (i = 0; i < ARRAY_SIZE(pdev->aer_report->stats_array); i++) {\
+	for (i = 0; i < ARRAY_SIZE(pdev->aer_info->stats_array); i++) {	\
 		if (strings_array[i])					\
 			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
 					     strings_array[i],		\
@@ -561,7 +561,7 @@ static const char *aer_agent_string[] = {
 					     i, stats[i]);		\
 	}								\
 	len += sysfs_emit_at(buf, len, "TOTAL_%s %llu\n", total_string,	\
-			     pdev->aer_report->total_field);		\
+			     pdev->aer_info->total_field);		\
 	return len;							\
 }									\
 static DEVICE_ATTR_RO(name)
@@ -582,7 +582,7 @@ aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_errs,
 		     char *buf)						\
 {									\
 	struct pci_dev *pdev = to_pci_dev(dev);				\
-	return sysfs_emit(buf, "%llu\n", pdev->aer_report->field);	\
+	return sysfs_emit(buf, "%llu\n", pdev->aer_info->field);	\
 }									\
 static DEVICE_ATTR_RO(name)
 
@@ -609,7 +609,7 @@ static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (!pdev->aer_report)
+	if (!pdev->aer_info)
 		return 0;
 
 	if ((a == &dev_attr_aer_rootport_total_err_cor.attr ||
@@ -637,7 +637,7 @@ static ssize_t ratelimit_log_enable_show(struct device *dev,
 					 char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	bool enabled = pdev->aer_report->cor_log_ratelimit.interval != 0;
+	bool enabled = pdev->aer_info->cor_log_ratelimit.interval != 0;
 
 	return sysfs_emit(buf, "%d\n", enabled);
 }
@@ -661,8 +661,8 @@ static ssize_t ratelimit_log_enable_store(struct device *dev,
 	else
 		interval = 0;
 
-	pdev->aer_report->cor_log_ratelimit.interval = interval;
-	pdev->aer_report->uncor_log_ratelimit.interval = interval;
+	pdev->aer_info->cor_log_ratelimit.interval = interval;
+	pdev->aer_info->uncor_log_ratelimit.interval = interval;
 
 	return count;
 }
@@ -676,7 +676,7 @@ static DEVICE_ATTR_RW(ratelimit_log_enable);
 	struct pci_dev *pdev = to_pci_dev(dev);				\
 									\
 	return sysfs_emit(buf, "%d\n",					\
-			  pdev->aer_report->ratelimit.burst);		\
+			  pdev->aer_info->ratelimit.burst);		\
 }									\
 									\
 	static ssize_t							\
@@ -692,7 +692,7 @@ static DEVICE_ATTR_RW(ratelimit_log_enable);
 	if (kstrtoint(buf, 0, &burst) < 0)				\
 		return -EINVAL;						\
 									\
-	pdev->aer_report->ratelimit.burst = burst;			\
+	pdev->aer_info->ratelimit.burst = burst;			\
 									\
 	return count;							\
 }									\
@@ -714,7 +714,7 @@ static umode_t aer_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (!pdev->aer_report)
+	if (!pdev->aer_info)
 		return 0;
 
 	return a->mode;
@@ -732,28 +732,28 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 	unsigned long status = info->status & ~info->mask;
 	int i, max = -1;
 	u64 *counter = NULL;
-	struct aer_report *aer_report = pdev->aer_report;
+	struct aer_info *aer_info = pdev->aer_info;
 
 	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
 			info->severity, info->tlp_header_valid, &info->tlp);
 
-	if (!aer_report)
+	if (!aer_info)
 		return;
 
 	switch (info->severity) {
 	case AER_CORRECTABLE:
-		aer_report->dev_total_cor_errs++;
-		counter = &aer_report->dev_cor_errs[0];
+		aer_info->dev_total_cor_errs++;
+		counter = &aer_info->dev_cor_errs[0];
 		max = AER_MAX_TYPEOF_COR_ERRS;
 		break;
 	case AER_NONFATAL:
-		aer_report->dev_total_nonfatal_errs++;
-		counter = &aer_report->dev_nonfatal_errs[0];
+		aer_info->dev_total_nonfatal_errs++;
+		counter = &aer_info->dev_nonfatal_errs[0];
 		max = AER_MAX_TYPEOF_UNCOR_ERRS;
 		break;
 	case AER_FATAL:
-		aer_report->dev_total_fatal_errs++;
-		counter = &aer_report->dev_fatal_errs[0];
+		aer_info->dev_total_fatal_errs++;
+		counter = &aer_info->dev_fatal_errs[0];
 		max = AER_MAX_TYPEOF_UNCOR_ERRS;
 		break;
 	}
@@ -765,19 +765,19 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 				 struct aer_err_source *e_src)
 {
-	struct aer_report *aer_report = pdev->aer_report;
+	struct aer_info *aer_info = pdev->aer_info;
 
-	if (!aer_report)
+	if (!aer_info)
 		return;
 
 	if (e_src->status & PCI_ERR_ROOT_COR_RCV)
-		aer_report->rootport_total_cor_errs++;
+		aer_info->rootport_total_cor_errs++;
 
 	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
 		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
-			aer_report->rootport_total_fatal_errs++;
+			aer_info->rootport_total_fatal_errs++;
 		else
-			aer_report->rootport_total_nonfatal_errs++;
+			aer_info->rootport_total_nonfatal_errs++;
 	}
 }
 
@@ -786,9 +786,9 @@ static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 	struct ratelimit_state *ratelimit;
 
 	if (severity == AER_CORRECTABLE)
-		ratelimit = &dev->aer_report->cor_log_ratelimit;
+		ratelimit = &dev->aer_info->cor_log_ratelimit;
 	else
-		ratelimit = &dev->aer_report->uncor_log_ratelimit;
+		ratelimit = &dev->aer_info->uncor_log_ratelimit;
 
 	return __ratelimit(ratelimit);
 }
@@ -943,9 +943,14 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
 static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 {
 	/*
-	 * Ratelimit AER log messages.  Generally we add the Error Source
-	 * device, but there are is_error_source() cases that can result in
-	 * multiple devices being added here, so we OR them all together.
+	 * Ratelimit AER log messages.  "dev" is either the source
+	 * identified by the root's Error Source ID or it has an unmasked
+	 * error logged in its own AER Capability.  If any of these devices
+	 * has not reached its ratelimit, log messages for all of them.
+	 * Messages are emitted when "e_info->ratelimit" is non-zero.
+	 *
+	 * Note that "e_info->ratelimit" was already initialized to 1 for the
+	 * ERR_FATAL case.
 	 */
 	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
 		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
@@ -1065,17 +1070,8 @@ static bool find_source_device(struct pci_dev *parent,
 	else
 		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
 
-	/*
-	 * If we didn't find any devices with errors logged in the AER
-	 * Capability, just print the Error Source ID from the Root Port or
-	 * RCEC that received an ERR_* Message, ratelimited by the RP or
-	 * RCEC.
-	 */
-	if (!e_info->error_dev_num) {
-		if (aer_ratelimit(parent, e_info->severity))
-			aer_print_source(parent, e_info, " (no details found)");
+	if (!e_info->error_dev_num)
 		return false;
-	}
 	return true;
 }
 
@@ -1415,17 +1411,48 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 }
 
 /**
- * aer_isr_one_error - consume an error detected by Root Port
- * @rpc: pointer to the Root Port which holds an error
+ * aer_isr_one_error_type - consume a Correctable or Uncorrectable Error
+ *			    detected by Root Port or RCEC
+ * @root: pointer to Root Port or RCEC that signaled AER interrupt
+ * @info: pointer to AER error info
+ */
+static void aer_isr_one_error_type(struct pci_dev *root,
+				   struct aer_err_info *info)
+{
+	bool found;
+
+	found = find_source_device(root, info);
+
+	/*
+	 * If we're going to log error messages, we've already set
+	 * "info->ratelimit" to non-zero (which enables printing) because
+	 * this is either an ERR_FATAL or we found a device with an error
+	 * logged in its AER Capability.
+	 *
+	 * If we didn't find the Error Source device, at least log the
+	 * Requester ID from the ERR_* Message received by the Root Port or
+	 * RCEC, ratelimited by the RP or RCEC.
+	 */
+	if (info->ratelimit ||
+	    (!found && aer_ratelimit(root, info->severity)))
+		aer_print_source(root, info, found ? "" : " (no details found");
+
+	if (found)
+		aer_process_err_devices(info);
+}
+
+/**
+ * aer_isr_one_error - consume error(s) signaled by an AER interrupt from
+ *		       Root Port or RCEC
+ * @root: pointer to Root Port or RCEC that signaled AER interrupt
  * @e_src: pointer to an error source
  */
-static void aer_isr_one_error(struct aer_rpc *rpc,
-		struct aer_err_source *e_src)
+static void aer_isr_one_error(struct pci_dev *root,
+			      struct aer_err_source *e_src)
 {
-	struct pci_dev *pdev = rpc->rpd;
 	u32 status = e_src->status;
 
-	pci_rootport_aer_stats_incr(pdev, e_src);
+	pci_rootport_aer_stats_incr(root, e_src);
 
 	/*
 	 * There is a possibility that both correctable error and
@@ -1440,26 +1467,22 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 			.multi_error_valid = multi ? 1 : 0,
 		};
 
-		if (find_source_device(pdev, &e_info)) {
-			aer_print_source(pdev, &e_info, "");
-			aer_process_err_devices(&e_info);
-		}
+		aer_isr_one_error_type(root, &e_info);
 	}
 
+	/* Note that messages for ERR_FATAL are never ratelimited */
 	if (status & PCI_ERR_ROOT_UNCOR_RCV) {
 		int fatal = status & PCI_ERR_ROOT_FATAL_RCV;
 		int multi = status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
 		struct aer_err_info e_info = {
 			.id = ERR_UNCOR_ID(e_src->id),
 			.severity = fatal ? AER_FATAL : AER_NONFATAL,
+			.ratelimit = fatal ? 1 : 0,
 			.level = KERN_ERR,
 			.multi_error_valid = multi ? 1 : 0,
 		};
 
-		if (find_source_device(pdev, &e_info)) {
-			aer_print_source(pdev, &e_info, "");
-			aer_process_err_devices(&e_info);
-		}
+		aer_isr_one_error_type(root, &e_info);
 	}
 }
 
@@ -1480,7 +1503,7 @@ static irqreturn_t aer_isr(int irq, void *context)
 		return IRQ_NONE;
 
 	while (kfifo_get(&rpc->aer_fifo, &e_src))
-		aer_isr_one_error(rpc, &e_src);
+		aer_isr_one_error(rpc->rpd, &e_src);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 597df7790f36..530c5e2cf7e8 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -252,14 +252,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 	else
 		info->severity = AER_NONFATAL;
 
-	info->level = KERN_WARNING;
+	info->level = KERN_ERR;
 	return 1;
 }
 
 void dpc_process_error(struct pci_dev *pdev)
 {
 	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
-	struct aer_err_info info = { 0 };
+	struct aer_err_info info = {};
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 
@@ -269,6 +269,13 @@ void dpc_process_error(struct pci_dev *pdev)
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR:
 		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
 			 status);
+		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
+		    aer_get_device_error_info(pdev, &info)) {
+			info.ratelimit = 1;	/* ERR_FATAL; no ratelimit */
+			aer_print_error(pdev, &info);
+			pci_aer_clear_nonfatal_status(pdev);
+			pci_aer_clear_fatal_status(pdev);
+		}
 		break;
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
@@ -280,7 +287,7 @@ void dpc_process_error(struct pci_dev *pdev)
 				"ERR_FATAL" : "ERR_NONFATAL",
 			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
 			 PCI_SLOT(source), PCI_FUNC(source));
-		return;
+		break;
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
 		ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
 		pci_warn(pdev, "containment event, status:%#06x: %s detected\n",
@@ -290,22 +297,12 @@ void dpc_process_error(struct pci_dev *pdev)
 			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
 			 "software trigger" :
 			 "reserved error");
+		/* show RP PIO error detail information */
+		if (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO &&
+		    pdev->dpc_rp_extensions)
+			dpc_process_rp_pio_error(pdev);
 		break;
 	}
-
-	/* show RP PIO error detail information */
-	if (pdev->dpc_rp_extensions &&
-	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
-	    ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO)
-		dpc_process_rp_pio_error(pdev);
-	else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
-		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
-		 aer_get_device_error_info(pdev, &info)) {
-		info.ratelimit = 1;	/* no ratelimiting */
-		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
-	}
 }
 
 static void pci_clear_surpdn_errors(struct pci_dev *pdev)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4b11a90107cb..81a81dbfc873 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -346,7 +346,7 @@ struct pci_dev {
 	u8		hdr_type;	/* PCI header type (`multi' flag masked out) */
 #ifdef CONFIG_PCIEAER
 	u16		aer_cap;	/* AER capability offset */
-	struct aer_report *aer_report;	/* AER report for this device */
+	struct aer_info	*aer_info;	/* AER info for this device */
 #endif
 #ifdef CONFIG_PCIEPORTBUS
 	struct rcec_ea	*rcec_ea;	/* RCEC cached endpoint association */

