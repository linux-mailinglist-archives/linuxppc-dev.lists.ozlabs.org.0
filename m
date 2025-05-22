Return-Path: <linuxppc-dev+bounces-8882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB7AC17A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PVv1HVcz3c44;
	Fri, 23 May 2025 09:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956231;
	cv=none; b=UPvYnFXVyroPRgbo1gxJuiaUljYo52QCKRedURiSnC9jowharj4SQh1ftLZQ+3MLj+pT5nIdsI7vYGuddn7sW8SSCKYqDuI3M2GUcO9ouPmzBwIpNobuV7zL1MiLusxa4YBivufpjDaH2S/h7HTeo9fN4pOEz1X9Zdf7NPBb7I666rTsBBWtQ45/ovORnh2VvsAFHNuH7CHAKWPSCSGAx5MWUJWWNnUJuwFlVBwNcjus4fhNlW+aGPkQ2h5nDpz090JeEFjeffd0xSD7WD55twCIxBNsKqsSoZxHaGqatH0tIXMAXpPswCARseMTz2chKnBhScrFWGAN767LZbeoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956231; c=relaxed/relaxed;
	bh=z/81Swan/GrpaIYN9QZ4C9waHTttuDuf7XFkNtVl4ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AukfUO1Hv2Iv4sTOqkwMi7tnIeOyrcYYp+PePDrvN4S9O8VXIN4qaUUdbShlpqkI3UlQFufYUcQRohNf2Q4LSqq0B3SnVWpllOBRQZaDeuF73AfVZ5BgtB/X4ZLtrbN0ibGwqWAQ/pbFSQYTQ2m2z+hHEnSApRUU9Lzki4eG12R2Hq7IX+vDmoLb5pDNRcmmZwSqpfy//TcRZIJq7Q4dds8tw/3w1sK/Aay4hqWbpvOS664n1wRPKOnABbq+OWrrRFLREQyFPgV8fTGubriHxnaoq1cDd28+klHS83risgmlJ/xifZuuv/ltgc+OdvSPJGRRe/lnSiDvHDiQvYTVrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JElANTf1; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JElANTf1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PVs1tsyz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92C8CA4F6CB;
	Thu, 22 May 2025 23:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7F3C4CEE4;
	Thu, 22 May 2025 23:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956225;
	bh=JslCIPszSsmyi2znukgQJEWh3RTB3A/cajYgz2Dd9YQ=;
	h=From:To:Cc:Subject:Date:From;
	b=JElANTf1g0S7RBPKeWchuaOuVZSfUuFO+JOKdT3Mkqrdf71H0p4AdgTfyf+ENdmLx
	 d0JygXIblwgPze7K/O3Cauyg+LK4CaajC9eCsrTtT8XRYo6giMvDgJlVWWcfS8ne9D
	 DgakANvaVFRacG70d4Alt1mTXqtwvpehq9sFNUUrf8ONRPiCNMoWAyVtS3JdEm74zY
	 +B4mGWscCNHYfxiLPl4ya3899J3ymoXRVvO5UW85ZkokheSmpfvsNG0R4Uvq/kwH6+
	 8bBbe3jxTwWMLOk0Bhk9fJzuEhKPUFvCzsC0j9k9fjAEU4LGN2q9KTX7d9ocASDQmm
	 aUbnd8u/DrrDw==
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
Subject: [PATCH v8 00/20] Rate limit AER logs
Date: Thu, 22 May 2025 18:21:06 -0500
Message-ID: <20250522232339.1525671-1-helgaas@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

This work is mostly due to Jon Pan-Doh and Karolina Stolarek.  I rebased
this to v6.15-rc1, factored out some of the trace and statistics updates,
and added some minor cleanups.

I pushed this to pci/aer at
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=aer
(head a524e63307cf ("PCI/AER: Add sysfs attributes for log ratelimits"))
and appended the interdiff from v7 to v8 below.

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


v8:
- Rename sysfs ratelimit burst files:
    ratelimit_burst_cor_log -> correctable_ratelimit_burst (Sathy)
    ratelimit_burst_uncor_log -> nonfatal_ratelimit_burst
- Split sysfs ratelimit_log_enable for correctable and nonfatal and make it
  an interval instead of a toggle:
    ratelimit_log_enable -> correctable_ratelimit_interval_ms
                         -> nonfatal_ratelimit_interval_ms
- Rework aer_get_device_error_info() and aer_print_error() to take an index
  instead of pci_dev pointer
- Move trace_aer_event() out of pci_dev_aer_stats_incr() (Jonathan)
- Move AER_FATAL checking to aer_ratelimit() to avoid calling
  __ratelimit(nonfatal_ratelimit) when we know we don't want to ratelimit
  fatal errors (Jonathan)
- Move all Error Source ID string building into aer_print_source() instead
  of putting part in caller (Jonathan)
- Rename struct aer_err_info.ratelimit -> ratelimit_print[] (Jonathan)
- Pass printk level into pcie_print_tlp_log() (Jonathan)
- Rework Error Source ratelimiting vs detail ratelimiting (Jonathan)
v7: https://lore.kernel.org/r/20250520215047.1350603-1-helgaas@kernel.org
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



Bjorn Helgaas (13):
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
  PCI/AER: Update statistics before ratelimiting
  PCI/AER: Trace error event before ratelimiting
  PCI/ERR: Add printk level to pcie_print_tlp_log()
  PCI/AER: Convert aer_get_device_error_info(), aer_print_error() to
    index
  PCI/AER: Simplify add_error_device()

Jon Pan-Doh (4):
  PCI/AER: Rename aer_print_port_info() to aer_print_source()
  PCI/AER: Ratelimit correctable and non-fatal error logging
  PCI/AER: Add ratelimits to PCI AER Documentation
  PCI/AER: Add sysfs attributes for log ratelimits

Karolina Stolarek (3):
  PCI/AER: Check log level once and remember it
  PCI/AER: Reduce pci_print_aer() correctable error level to
    KERN_WARNING
  PCI/AER: Rename struct aer_stats to aer_info

 ...es-aer_stats => sysfs-bus-pci-devices-aer} |  44 ++
 Documentation/PCI/pcieaer-howto.rst           |  17 +-
 drivers/pci/pci-sysfs.c                       |   1 +
 drivers/pci/pci.h                             |  13 +-
 drivers/pci/pcie/aer.c                        | 441 +++++++++++++-----
 drivers/pci/pcie/dpc.c                        |  73 +--
 drivers/pci/pcie/tlp.c                        |   6 +-
 include/linux/pci.h                           |   2 +-
 8 files changed, 430 insertions(+), 167 deletions(-)
 rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (72%)

-- 
2.43.0


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
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index a3261e842d6d..eca2812cfd25 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -587,13 +587,14 @@ static inline bool pci_dev_test_and_set_removed(struct pci_dev *dev)
 
 struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
+	int ratelimit_print[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 	const char *level;		/* printk level */
 
 	unsigned int id:16;
 
 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
-	unsigned int ratelimit:1;	/* 0=skip, 1=print */
+	unsigned int root_ratelimit_print:1;	/* 0=skip, 1=print */
 	unsigned int __pad1:4;
 	unsigned int multi_error_valid:1;
 
@@ -606,15 +607,16 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
-void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
+int aer_get_device_error_info(struct aer_err_info *info, int i);
+void aer_print_error(struct aer_err_info *info, int i);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, bool flit,
 		      struct pcie_tlp_log *log);
 unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
 void pcie_print_tlp_log(const struct pci_dev *dev,
-			const struct pcie_tlp_log *log, const char *pfx);
+			const struct pcie_tlp_log *log, const char *level,
+			const char *pfx);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9b8dea317a79..6c331695af58 100644
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
@@ -628,83 +628,89 @@ const struct attribute_group aer_stats_attr_group = {
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
 	name##_show(struct device *dev, struct device_attribute *attr,	\
 		    char *buf)						\
-{									\
-	struct pci_dev *pdev = to_pci_dev(dev);				\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
 									\
-	return sysfs_emit(buf, "%d\n",					\
-			  pdev->aer_info->ratelimit.burst);		\
-}									\
+		return sysfs_emit(buf, "%d\n",				\
+				  pdev->aer_info->ratelimit.burst);	\
+	}								\
 									\
 	static ssize_t							\
 	name##_store(struct device *dev, struct device_attribute *attr,	\
 		     const char *buf, size_t count)			\
-{									\
-	struct pci_dev *pdev = to_pci_dev(dev);				\
-	int burst;							\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
+		int burst;						\
 									\
-	if (!capable(CAP_SYS_ADMIN))					\
-		return -EPERM;						\
+		if (!capable(CAP_SYS_ADMIN))				\
+			return -EPERM;					\
 									\
-	if (kstrtoint(buf, 0, &burst) < 0)				\
-		return -EINVAL;						\
+		if (kstrtoint(buf, 0, &burst) < 0)			\
+			return -EINVAL;					\
 									\
-	pdev->aer_info->ratelimit.burst = burst;			\
+		pdev->aer_info->ratelimit.burst = burst;		\
 									\
-	return count;							\
-}									\
-static DEVICE_ATTR_RW(name)
+		return count;						\
+	}								\
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
 
@@ -734,9 +740,6 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 	u64 *counter = NULL;
 	struct aer_info *aer_info = pdev->aer_info;
 
-	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
-			info->severity, info->tlp_header_valid, &info->tlp);
-
 	if (!aer_info)
 		return;
 
@@ -785,10 +788,13 @@ static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 {
 	struct ratelimit_state *ratelimit;
 
+	if (severity == AER_FATAL)
+		return 1;	/* AER_FATAL not ratelimited */
+
 	if (severity == AER_CORRECTABLE)
-		ratelimit = &dev->aer_info->cor_log_ratelimit;
+		ratelimit = &dev->aer_info->correctable_ratelimit;
 	else
-		ratelimit = &dev->aer_info->uncor_log_ratelimit;
+		ratelimit = &dev->aer_info->nonfatal_ratelimit;
 
 	return __ratelimit(ratelimit);
 }
@@ -817,7 +823,7 @@ static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 }
 
 static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
-			     const char *details)
+			     bool found)
 {
 	u16 source = info->id;
 
@@ -825,18 +831,27 @@ static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
 		 info->multi_error_valid ? "Multiple " : "",
 		 aer_error_severity_string[info->severity],
 		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
-		 PCI_SLOT(source), PCI_FUNC(source), details);
+		 PCI_SLOT(source), PCI_FUNC(source),
+		 found ? "" : " (no details found");
 }
 
-void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
+void aer_print_error(struct aer_err_info *info, int i)
 {
-	int layer, agent;
-	int id = pci_dev_id(dev);
+	struct pci_dev *dev;
+	int layer, agent, id;
 	const char *level = info->level;
 
-	pci_dev_aer_stats_incr(dev, info);
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return;
 
-	if (!info->ratelimit)
+	dev = info->dev[i];
+	id = pci_dev_id(dev);
+
+	pci_dev_aer_stats_incr(dev, info);
+	trace_aer_event(pci_name(dev), (info->status & ~info->mask),
+			info->severity, info->tlp_header_valid, &info->tlp);
+
+	if (!info->ratelimit_print[i])
 		return;
 
 	if (!info->status) {
@@ -858,7 +873,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	__aer_print_error(dev, info);
 
 	if (info->tlp_header_valid)
-		pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
+		pcie_print_tlp_log(dev, &info->tlp, level, dev_fmt("  "));
 
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
@@ -903,11 +918,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 
 	info.status = status;
 	info.mask = mask;
-	info.tlp_header_valid = tlp_header_valid;
-	if (tlp_header_valid)
-		info.tlp = aer->header_log;
 
 	pci_dev_aer_stats_incr(dev, &info);
+	trace_aer_event(pci_name(dev), (status & ~mask),
+			aer_severity, tlp_header_valid, &aer->header_log);
 
 	if (!aer_ratelimit(dev, info.severity))
 		return;
@@ -925,13 +939,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
 			   aer->uncor_severity);
 
-	/*
-	 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
-	 * tlp_header_valid is set, and info.level is always KERN_ERR in
-	 * that case.
-	 */
 	if (tlp_header_valid)
-		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
+		pcie_print_tlp_log(dev, &aer->header_log, info.level,
+				   dev_fmt("  "));
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
 
@@ -942,23 +952,27 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
  */
 static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 {
+	int i = e_info->error_dev_num;
+
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return -ENOSPC;
+
+	e_info->dev[i] = pci_dev_get(dev);
+	e_info->error_dev_num++;
+
 	/*
 	 * Ratelimit AER log messages.  "dev" is either the source
 	 * identified by the root's Error Source ID or it has an unmasked
-	 * error logged in its own AER Capability.  If any of these devices
-	 * has not reached its ratelimit, log messages for all of them.
-	 * Messages are emitted when "e_info->ratelimit" is non-zero.
-	 *
-	 * Note that "e_info->ratelimit" was already initialized to 1 for the
-	 * ERR_FATAL case.
+	 * error logged in its own AER Capability.  Messages are emitted
+	 * when "ratelimit_print[i]" is non-zero.  If we will print detail
+	 * for a downstream device, make sure we print the Error Source ID
+	 * from the root as well.
 	 */
-	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
-		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
-		e_info->ratelimit |= aer_ratelimit(dev, e_info->severity);
-		e_info->error_dev_num++;
-		return 0;
+	if (aer_ratelimit(dev, e_info->severity)) {
+		e_info->ratelimit_print[i] = 1;
+		e_info->root_ratelimit_print = 1;
 	}
-	return -ENOSPC;
+	return 0;
 }
 
 /**
@@ -1337,19 +1351,26 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
 
 /**
  * aer_get_device_error_info - read error status from dev and store it to info
- * @dev: pointer to the device expected to have an error record
  * @info: pointer to structure to store the error record
+ * @i: index into info->dev[]
  *
  * Return: 1 on success, 0 on error.
  *
  * Note that @info is reused among all error devices. Clear fields properly.
  */
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
+int aer_get_device_error_info(struct aer_err_info *info, int i)
 {
-	int type = pci_pcie_type(dev);
-	int aer = dev->aer_cap;
+	struct pci_dev *dev;
+	int type, aer;
 	u32 aercc;
 
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return 0;
+
+	dev = info->dev[i];
+	aer = dev->aer_cap;
+	type = pci_pcie_type(dev);
+
 	/* Must reset in this function */
 	info->status = 0;
 	info->tlp_header_valid = 0;
@@ -1401,11 +1422,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 
 	/* Report all before handling them, to not lose records by reset etc. */
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
-			aer_print_error(e_info->dev[i], e_info);
+		if (aer_get_device_error_info(e_info, i))
+			aer_print_error(e_info, i);
 	}
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
+		if (aer_get_device_error_info(e_info, i))
 			handle_error_source(e_info->dev[i], e_info);
 	}
 }
@@ -1425,17 +1446,18 @@ static void aer_isr_one_error_type(struct pci_dev *root,
 
 	/*
 	 * If we're going to log error messages, we've already set
-	 * "info->ratelimit" to non-zero (which enables printing) because
-	 * this is either an ERR_FATAL or we found a device with an error
-	 * logged in its AER Capability.
+	 * "info->root_ratelimit_print" and "info->ratelimit_print[i]" to
+	 * non-zero (which enables printing) because this is either an
+	 * ERR_FATAL or we found a device with an error logged in its AER
+	 * Capability.
 	 *
 	 * If we didn't find the Error Source device, at least log the
 	 * Requester ID from the ERR_* Message received by the Root Port or
 	 * RCEC, ratelimited by the RP or RCEC.
 	 */
-	if (info->ratelimit ||
+	if (info->root_ratelimit_print ||
 	    (!found && aer_ratelimit(root, info->severity)))
-		aer_print_source(root, info, found ? "" : " (no details found");
+		aer_print_source(root, info, found);
 
 	if (found)
 		aer_process_err_devices(info);
@@ -1470,14 +1492,12 @@ static void aer_isr_one_error(struct pci_dev *root,
 		aer_isr_one_error_type(root, &e_info);
 	}
 
-	/* Note that messages for ERR_FATAL are never ratelimited */
 	if (status & PCI_ERR_ROOT_UNCOR_RCV) {
 		int fatal = status & PCI_ERR_ROOT_FATAL_RCV;
 		int multi = status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
 		struct aer_err_info e_info = {
 			.id = ERR_UNCOR_ID(e_src->id),
 			.severity = fatal ? AER_FATAL : AER_NONFATAL,
-			.ratelimit = fatal ? 1 : 0,
 			.level = KERN_ERR,
 			.multi_error_valid = multi ? 1 : 0,
 		};
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 530c5e2cf7e8..fc18349614d7 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -222,7 +222,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 			  dpc_tlp_log_len(pdev),
 			  pdev->subordinate->flit_mode,
 			  &tlp_log);
-	pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
+	pcie_print_tlp_log(pdev, &tlp_log, KERN_ERR, dev_fmt(""));
 
 	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
 		goto clear_status;
@@ -253,6 +253,10 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 		info->severity = AER_NONFATAL;
 
 	info->level = KERN_ERR;
+
+	info->dev[0] = dev;
+	info->error_dev_num = 1;
+
 	return 1;
 }
 
@@ -270,9 +274,8 @@ void dpc_process_error(struct pci_dev *pdev)
 		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
 			 status);
 		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
-		    aer_get_device_error_info(pdev, &info)) {
-			info.ratelimit = 1;	/* ERR_FATAL; no ratelimit */
-			aer_print_error(pdev, &info);
+		    aer_get_device_error_info(&info, 0)) {
+			aer_print_error(&info, 0);
 			pci_aer_clear_nonfatal_status(pdev);
 			pci_aer_clear_fatal_status(pdev);
 		}
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 890d5391d7f5..71f8fc9ea2ed 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -98,12 +98,14 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
  * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
  * @dev: PCIe device
  * @log: TLP Log structure
+ * @level: Printk log level
  * @pfx: String prefix
  *
  * Prints TLP Header and Prefix Log information held by @log.
  */
 void pcie_print_tlp_log(const struct pci_dev *dev,
-			const struct pcie_tlp_log *log, const char *pfx)
+			const struct pcie_tlp_log *log, const char *level,
+			const char *pfx)
 {
 	/* EE_PREFIX_STR fits the extended DW space needed for the Flit mode */
 	char buf[11 * PCIE_STD_MAX_TLP_HEADERLOG + 1];
@@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
 		}
 	}
 
-	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
+	dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
 		log->flit ? " (Flit)" : "", buf);
 }

