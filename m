Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D665C5C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 19:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmgkK2XMKz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 05:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B0kgb5hs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=rajat.khandelwal@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B0kgb5hs;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmf4n35mtz3bdS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 03:55:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672764953; x=1704300953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lCf3CkygM0RRymks3SyRZKTWmUhd9Lv3qTfO+5Y+XeQ=;
  b=B0kgb5hs68dTEGbcLIMGtSTtG/lDHqq76EfpjsY8nIRnI5U4zR1coWqS
   nLS8XU1sVx16PnarkX3BcDtQYZoFIvIz1TJ4mpkirKpj8kOLUDSi3I1/t
   U3IV7pURjmfma4UMC3r0UkU9b36oTPNILhVF+bdxG9Xhmej/BWvVGn/ZB
   vMPsZgEbfTBSmMNswqwFwGAOF1bFnbmxkTFQY1AJfp5aXALA/dvPQpV3q
   m9I9diYusLrKeKCuxFf8zn4rQ14QMKWQvK8iHQcE3R72JkLHp1zAhRry8
   TaP34pTEe9kb7wxTke25fRgSduRIkdvjzW9sokXMbhGJHAk90nGJxM6Vg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301385069"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="301385069"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 08:55:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="656820695"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="656820695"
Received: from unknown (HELO rajath-NUC10i7FNH..) ([10.223.165.88])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 08:55:46 -0800
From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
To: ruscur@russell.cc,
	oohall@gmail.com,
	bhelgaas@google.com
Subject: [PATCH] PCI/AER: Rate limit the reporting of the correctable errors
Date: Tue,  3 Jan 2023 22:25:48 +0530
Message-Id: <20230103165548.570377-1-rajat.khandelwal@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Jan 2023 05:08:44 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rajat.khandelwal@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are many instances where correctable errors tend to inundate
the message buffer. We observe such instances during thunderbolt PCIe
tunneling.

It's true that they are mitigated by the hardware and are non-fatal
but we shouldn't be spamming the logs with such correctable errors as it
confuses other kernel developers less familiar with PCI errors, support
staff, and users who happen to look at the logs, hence rate limit them.

A typical example log inside an HP TBT4 dock:
[54912.661142] pcieport 0000:00:07.0: AER: Multiple Corrected error received: 0000:2b:00.0
[54912.661194] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
[54912.661203] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001100/00002000
[54912.661211] igc 0000:2b:00.0:    [ 8] Rollover
[54912.661219] igc 0000:2b:00.0:    [12] Timeout
[54982.838760] pcieport 0000:00:07.0: AER: Corrected error received: 0000:2b:00.0
[54982.838798] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
[54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
[54982.838817] igc 0000:2b:00.0:    [12] Timeout
This gets repeated continuously, thus inundating the buffer.

Signed-off-by: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 54 +++++++++++++++++++++++++++---------------
 include/linux/pci.h    |  3 +++
 2 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2d8a74f83c3..7ae6761a8e59 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -684,23 +684,24 @@ static void __aer_print_error(struct pci_dev *dev,
 {
 	const char **strings;
 	unsigned long status = info->status & ~info->mask;
-	const char *level, *errmsg;
+	const char *errmsg;
 	int i;
 
-	if (info->severity == AER_CORRECTABLE) {
+	if (info->severity == AER_CORRECTABLE)
 		strings = aer_correctable_error_string;
-		level = KERN_WARNING;
-	} else {
+	else
 		strings = aer_uncorrectable_error_string;
-		level = KERN_ERR;
-	}
 
 	for_each_set_bit(i, &status, 32) {
 		errmsg = strings[i];
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
+		if (info->severity == AER_CORRECTABLE)
+			pci_warn_ratelimited(dev, "   [%2d] %-22s%s\n", i, errmsg,
+					     info->first_error == i ? " (First)" : "");
+		else
+			pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
@@ -710,7 +711,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
 	int id = ((dev->bus->number << 8) | dev->devfn);
-	const char *level;
 
 	if (!info->status) {
 		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
@@ -721,14 +718,21 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
+	if (info->severity == AER_CORRECTABLE) {
+		pci_warn_ratelimited(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+				     aer_error_severity_string[info->severity],
+				     aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
-		   aer_error_severity_string[info->severity],
-		   aer_error_layer[layer], aer_agent_string[agent]);
+		pci_warn_ratelimited(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+				     dev->vendor, dev->device, info->status, info->mask);
+	} else {
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+			aer_error_severity_string[info->severity],
+			aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		   dev->vendor, dev->device, info->status, info->mask);
+		pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+			dev->vendor, dev->device, info->status, info->mask);
+	}
 
 	__aer_print_error(dev, info);
 
@@ -748,11 +755,19 @@ static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
 	u8 bus = info->id >> 8;
 	u8 devfn = info->id & 0xff;
 
-	pci_info(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
-		 info->multi_error_valid ? "Multiple " : "",
-		 aer_error_severity_string[info->severity],
-		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
-		 PCI_FUNC(devfn));
+	if (info->severity == AER_CORRECTABLE)
+		pci_info_ratelimited(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
+				     info->multi_error_valid ? "Multiple " : "",
+				     aer_error_severity_string[info->severity],
+				     pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
+				     PCI_FUNC(devfn));
+	else
+		pci_info(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
+			 info->multi_error_valid ? "Multiple " : "",
+			 aer_error_severity_string[info->severity],
+			 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
+			 PCI_FUNC(devfn));
+
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 060af91bafcd..d9434bae10c8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2491,6 +2491,9 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #define pci_info_ratelimited(pdev, fmt, arg...) \
 	dev_info_ratelimited(&(pdev)->dev, fmt, ##arg)
 
+#define pci_warn_ratelimited(pdev, fmt, arg...) \
+	dev_warn_ratelimited(&(pdev)->dev, fmt, ##arg)
+
 #define pci_WARN(pdev, condition, fmt, arg...) \
 	WARN(condition, "%s %s: " fmt, \
 	     dev_driver_string(&(pdev)->dev), pci_name(pdev), ##arg)
-- 
2.34.1

