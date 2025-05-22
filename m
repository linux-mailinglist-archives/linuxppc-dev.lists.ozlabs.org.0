Return-Path: <linuxppc-dev+bounces-8899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5097AC17CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PWM6CNMz3cHx;
	Fri, 23 May 2025 09:24:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956255;
	cv=none; b=ITPYq6ztopMxL5JU0majVPTIWhfpdTfgi1PTa2PIfb59I+fg1CoTT9rZmCeUP+wRpuDgt4Up/DSoHAuqFSA/G/gqv05WXc6cbzb1kFkAHGvIXEvTxH+XAAmlvdoCndgndUmdEtPOJpjaCaA+jergl6lR66jDCypItrBM32EOhjn1Cd2Ia2s49/1aR2q3j9x/ltlGuAmbMG7hIEIxaRmGVms2iN3vO4wm0GAzrYEXuQHw5iVgVYKUNkSghhjqI3n0wUji277WBYcd6oND2xpJxbnmSP3x9u9LHZagjjV1lAib5H723vmnLcAq1sNn5HfsReaBO96nhpPXY75TDdmJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956255; c=relaxed/relaxed;
	bh=kNa7UmKnVnYN/194BJwA86xREB+c7nCFTP6ClhyopN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnaBqMWkOtone5dzrq96q0CzH6TyLN5NQxBVQSwsIWSCe7rxd62UT8MIzPkrMr0Gwlj2idhAuN0w2YUf4Bu83dfWzCOaPAZKiBF02cNVVRFCJW8e5sfwe9ia4rKDFU0benpLxEc2FCupTrEoB4BuB9vX8FpzOeLZTRnamEi+up72cyftkSmiTJxougZvwUVemsIxWFc0NshFnzl52E0FL8F9bkxxrDM4s6CXsD3jl7h8unzz5Q3YvB3n2XrXTZvtqyRo/ww/DgE/WzVv55CBTfAfhkNKU/R9VXjDydFOHaksOE1XzDAVH37j25JxsYxTEHnFnhWiSFUXpSVMHYY2Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d2zPJSIA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d2zPJSIA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PWM0ZTXz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:24:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F516A4F6E6;
	Thu, 22 May 2025 23:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9B7C4CEE4;
	Thu, 22 May 2025 23:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956252;
	bh=1oorHgUTF+X69XVlnPc3rvfjlARvJO5mXzyBMZUNfGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2zPJSIAjncOAzhy7//nOddqxOOFcaYR+Kw0u4CbdT4avIqWXQghYukon9b8vGfSz
	 lQaWY28Bsqbn/h37PheKku0njOZyiAiYDd0phv/bNmNYmehWpKQ5D7/7LIJfNYlIuV
	 mRY6TvQPbycQxcrnV6G0nvE+SSq1e68K4P8IgpXVTOkNf4swMUcmu1PYSIdNOvypYa
	 GEkbf0r9bToUMUXFCg2bUxItrWzzMaSvRG4udk8HmbffoDQF9IVvFUL3Yz85DANKLQ
	 oVCVck8F9UZE3zvaqT2xSaOeI2uwe6B4tVQgMBGYxlEj5OkydNvWei4XHABHjSJFPw
	 w5j23wfgGjMcg==
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
Subject: [PATCH v8 18/20] PCI/AER: Ratelimit correctable and non-fatal error logging
Date: Thu, 22 May 2025 18:21:24 -0500
Message-ID: <20250522232339.1525671-19-helgaas@kernel.org>
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

Spammy devices can flood kernel logs with AER errors and slow/stall
execution. Add per-device ratelimits for AER correctable and non-fatal
uncorrectable errors that use the kernel defaults (10 per 5s).  Logging of
fatal errors is not ratelimited.

There are two AER logging entry points:

  - aer_print_error() is used by DPC and native AER

  - pci_print_aer() is used by GHES and CXL

The native AER aer_print_error() case includes a loop that may log details
from multiple devices, which are ratelimited individually.  If we log
details for any device, we also log the Error Source ID from the Root Port
or RCEC.

If no such device details are found, we still log the Error Source from the
ERR_* Message, ratelimited by the Root Port or RCEC that received it.

The DPC aer_print_error() case is not ratelimited, since this only happens
for fatal errors.

The CXL pci_print_aer() case is ratelimited by the Error Source device.

The GHES pci_print_aer() case is via aer_recover_work_func(), which
searches for the Error Source device.  If the device is not found, there's
no per-device ratelimit, so we use a system-wide ratelimit that covers all
error types (correctable, non-fatal, and fatal).

Sargun at Meta reported internally that a flood of AER errors causes RCU
CPU stall warnings and CSD-lock warnings.

Tested using aer-inject[1]. Sent 11 AER errors. Observed 10 errors logged
while AER stats (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) show
true count of 11.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git

[bhelgaas: commit log, factor out trace_aer_event() and aer_print_rp_info()
changes to previous patches, enable Error Source logging if any downstream
detail will be printed, don't ratelimit fatal errors, "aer_report" ->
"aer_info", "cor_log_ratelimit" -> "correctable_ratelimit",
"uncor_log_ratelimit" -> "nonfatal_ratelimit"]

Reported-by: Sargun Dhillon <sargun@meta.com>
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/20250520215047.1350603-16-helgaas@kernel.org
---
 drivers/pci/pci.h      |  4 ++-
 drivers/pci/pcie/aer.c | 69 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e1a28215967f..3023c68fe485 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -587,13 +587,15 @@ static inline bool pci_dev_test_and_set_removed(struct pci_dev *dev)
 
 struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
+	int ratelimit_print[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 	const char *level;		/* printk level */
 
 	unsigned int id:16;
 
 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
-	unsigned int __pad1:5;
+	unsigned int root_ratelimit_print:1;	/* 0=skip, 1=print */
+	unsigned int __pad1:4;
 	unsigned int multi_error_valid:1;
 
 	unsigned int first_error:5;
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 24f0f5c55256..ebac126144fc 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -28,6 +28,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/kfifo.h>
+#include <linux/ratelimit.h>
 #include <linux/slab.h>
 #include <acpi/apei.h>
 #include <acpi/ghes.h>
@@ -88,6 +89,10 @@ struct aer_info {
 	u64 rootport_total_cor_errs;
 	u64 rootport_total_fatal_errs;
 	u64 rootport_total_nonfatal_errs;
+
+	/* Ratelimits for errors */
+	struct ratelimit_state correctable_ratelimit;
+	struct ratelimit_state nonfatal_ratelimit;
 };
 
 #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
@@ -379,6 +384,11 @@ void pci_aer_init(struct pci_dev *dev)
 
 	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
 
+	ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
+			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
+	ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
+			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
+
 	/*
 	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
 	 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
@@ -669,6 +679,21 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 	}
 }
 
+static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
+{
+	struct ratelimit_state *ratelimit;
+
+	if (severity == AER_FATAL)
+		return 1;	/* AER_FATAL not ratelimited */
+
+	if (severity == AER_CORRECTABLE)
+		ratelimit = &dev->aer_info->correctable_ratelimit;
+	else
+		ratelimit = &dev->aer_info->nonfatal_ratelimit;
+
+	return __ratelimit(ratelimit);
+}
+
 static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	const char **strings;
@@ -721,6 +746,9 @@ void aer_print_error(struct aer_err_info *info, int i)
 	trace_aer_event(pci_name(dev), (info->status & ~info->mask),
 			info->severity, info->tlp_header_valid, &info->tlp);
 
+	if (!info->ratelimit_print[i])
+		return;
+
 	if (!info->status) {
 		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
 			aer_error_severity_string[info->severity]);
@@ -790,6 +818,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	trace_aer_event(pci_name(dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
 
+	if (!aer_ratelimit(dev, info.severity))
+		return;
+
 	layer = AER_GET_LAYER_ERROR(aer_severity, status);
 	agent = AER_GET_AGENT(aer_severity, status);
 
@@ -824,6 +855,18 @@ static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 	e_info->dev[i] = pci_dev_get(dev);
 	e_info->error_dev_num++;
 
+	/*
+	 * Ratelimit AER log messages.  "dev" is either the source
+	 * identified by the root's Error Source ID or it has an unmasked
+	 * error logged in its own AER Capability.  Messages are emitted
+	 * when "ratelimit_print[i]" is non-zero.  If we will print detail
+	 * for a downstream device, make sure we print the Error Source ID
+	 * from the root as well.
+	 */
+	if (aer_ratelimit(dev, e_info->severity)) {
+		e_info->ratelimit_print[i] = 1;
+		e_info->root_ratelimit_print = 1;
+	}
 	return 0;
 }
 
@@ -918,7 +961,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
  * e_info->error_dev_num and e_info->dev[], based on the given information.
  */
 static bool find_source_device(struct pci_dev *parent,
-		struct aer_err_info *e_info)
+			       struct aer_err_info *e_info)
 {
 	struct pci_dev *dev = parent;
 	int result;
@@ -1144,9 +1187,10 @@ static void aer_recover_work_func(struct work_struct *work)
 		pdev = pci_get_domain_bus_and_slot(entry.domain, entry.bus,
 						   entry.devfn);
 		if (!pdev) {
-			pr_err("no pci_dev for %04x:%02x:%02x.%x\n",
-			       entry.domain, entry.bus,
-			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
+			pr_err_ratelimited("%04x:%02x:%02x.%x: no pci_dev found\n",
+					   entry.domain, entry.bus,
+					   PCI_SLOT(entry.devfn),
+					   PCI_FUNC(entry.devfn));
 			continue;
 		}
 		pci_print_aer(pdev, entry.severity, entry.regs);
@@ -1294,7 +1338,22 @@ static void aer_isr_one_error_type(struct pci_dev *root,
 	bool found;
 
 	found = find_source_device(root, info);
-	aer_print_source(root, info, found);
+
+	/*
+	 * If we're going to log error messages, we've already set
+	 * "info->root_ratelimit_print" and "info->ratelimit_print[i]" to
+	 * non-zero (which enables printing) because this is either an
+	 * ERR_FATAL or we found a device with an error logged in its AER
+	 * Capability.
+	 *
+	 * If we didn't find the Error Source device, at least log the
+	 * Requester ID from the ERR_* Message received by the Root Port or
+	 * RCEC, ratelimited by the RP or RCEC.
+	 */
+	if (info->root_ratelimit_print ||
+	    (!found && aer_ratelimit(root, info->severity)))
+		aer_print_source(root, info, found);
+
 	if (found)
 		aer_process_err_devices(info);
 }
-- 
2.43.0


