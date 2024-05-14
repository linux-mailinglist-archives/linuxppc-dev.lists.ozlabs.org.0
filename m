Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B08148C526D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:36:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqsYRWxs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdvTP1csbz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 21:36:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqsYRWxs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdvMm662Wz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 21:32:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715686325; x=1747222325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=muDPYeTDqUqXMJ0EJOzrmCFm6YAucOY0ej2xemGJzmU=;
  b=gqsYRWxsAqOYiE6tQhcnEGNUERNbKNqOiB53TGxIPp1/fqvJGHAURTT3
   fwePdxNM7rvdVUwGyUopsrtlZnaKZmGzZ4kpUA5wB0WrDle1dWwLrn32m
   EXu2iyRvtr8m+Zb9kEaY9a9QPnK5uAOVnOj5itGHk25/D/aFfbvTd+3+D
   BBgmfqYHNuetbp9Mm+GQhO/1if904TgsTheN4pBbzBBPujQtTf8vhqX/X
   uDyqHzZAgK5fNIpR1xeo1drywOIn0ptZVcOKDrl/YBjcEQFjoSPCrR2O3
   xfK2GINmMdoUuE6l6OTYDZCftcsg5jFGa8bUa8RaAW0fWW+iWfJF/juck
   g==;
X-CSE-ConnectionGUID: PqOjga5fRoiIC6p6dxUb4A==
X-CSE-MsgGUID: /mpq84yHReWbVGvDTWSKLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11828382"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11828382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:32:03 -0700
X-CSE-ConnectionGUID: OPvY+vUWTOGolxa2EvWFXw==
X-CSE-MsgGUID: Plao2HLxTf+Ix/1wfeJbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35546238"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.94])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:32:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 6/7] PCI: Add TLP Prefix reading into pcie_read_tlp_log()
Date: Tue, 14 May 2024 14:31:08 +0300
Message-Id: <20240514113109.6690-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
References: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
(PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.

Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
TLP Prefix Log. The relevant registers are formatted identically in AER
and DPC Capability, but has these variations:

a) The offsets of TLP Prefix Log registers vary.
b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.

Therefore callers must pass the offset of the TLP Prefix Log register
and the entire length to pcie_read_tlp_log() to be able to read the
correct number of TLP Prefix DWORDs from the correct offset.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h             |  5 +++-
 drivers/pci/pcie/aer.c        |  4 ++-
 drivers/pci/pcie/dpc.c        | 13 +++++-----
 drivers/pci/pcie/tlp.c        | 49 +++++++++++++++++++++++++++++++----
 include/linux/aer.h           |  1 +
 include/uapi/linux/pci_regs.h |  1 +
 6 files changed, 59 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0e9917f8bf3f..7afdd71f9026 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -420,7 +420,9 @@ struct aer_err_info {
 int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 
-int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
+int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
+		      unsigned int tlp_len, struct pcie_tlp_log *log);
+unsigned int aer_tlp_log_len(struct pci_dev *dev);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
@@ -439,6 +441,7 @@ void pci_dpc_init(struct pci_dev *pdev);
 void dpc_process_error(struct pci_dev *pdev);
 pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
+unsigned int dpc_tlp_log_len(struct pci_dev *dev);
 #else
 static inline void pci_save_dpc_state(struct pci_dev *dev) { }
 static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ac6293c24976..ecc1dea5a208 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1245,7 +1245,9 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 
 		if (info->status & AER_LOG_TLP_MASKS) {
 			info->tlp_header_valid = 1;
-			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
+			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
+					  aer + PCI_ERR_PREFIX_LOG,
+					  aer_tlp_log_len(dev), &info->tlp);
 		}
 	}
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index a668820696dc..5056cc6961ec 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -190,7 +190,7 @@ pci_ers_result_t dpc_reset_link(struct pci_dev *pdev)
 static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 {
 	u16 cap = pdev->dpc_cap, dpc_status, first_error;
-	u32 status, mask, sev, syserr, exc, log, prefix;
+	u32 status, mask, sev, syserr, exc, log;
 	struct pcie_tlp_log tlp_log;
 	int i;
 
@@ -217,20 +217,19 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 
 	if (pdev->dpc_rp_log_size < 4)
 		goto clear_status;
-	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG, &tlp_log);
+	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
+			  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
+			  dpc_tlp_log_len(pdev), &tlp_log);
 	pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
 		tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
+	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++)
+		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.prefix[i]);
 
 	if (pdev->dpc_rp_log_size < 5)
 		goto clear_status;
 	pci_read_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_IMPSPEC_LOG, &log);
 	pci_err(pdev, "RP PIO ImpSpec Log %#010x\n", log);
 
-	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++) {
-		pci_read_config_dword(pdev,
-			cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG + i * 4, &prefix);
-		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, prefix);
-	}
  clear_status:
 	pci_write_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_STATUS, status);
 }
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 65ac7b5d8a87..def9dd7b73e8 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -11,26 +11,65 @@
 
 #include "../pci.h"
 
+/**
+ * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log length
+ * @dev: PCIe device
+ *
+ * Return: TLP Header/Prefix Log length
+ */
+unsigned int aer_tlp_log_len(struct pci_dev *dev)
+{
+	return 4 + dev->eetlp_prefix_max;
+}
+
+#ifdef CONFIG_PCIE_DPC
+/**
+ * dpc_tlp_log_len - Calculates DPC RP PIO TLP Header/Prefix Log length
+ * @dev: PCIe device
+ *
+ * Return: TLP Header/Prefix Log length
+ */
+unsigned int dpc_tlp_log_len(struct pci_dev *dev)
+{
+	/* Remove ImpSpec Log register from the count */
+	if (dev->dpc_rp_log_size >= 5)
+		return dev->dpc_rp_log_size - 1;
+
+	return dev->dpc_rp_log_size;
+}
+#endif
+
 /**
  * pcie_read_tlp_log - read TLP Header Log
  * @dev: PCIe device
  * @where: PCI Config offset of TLP Header Log
+ * @where2: PCI Config offset of TLP Prefix Log
+ * @tlp_len: TLP Log length (Header Log + TLP Prefix Log in DWORDs)
  * @log: TLP Log structure to fill
  *
  * Fill @log from TLP Header Log registers, e.g., AER or DPC.
  *
  * Return: 0 on success and filled TLP Log structure, <0 on error.
  */
-int pcie_read_tlp_log(struct pci_dev *dev, int where,
-		      struct pcie_tlp_log *log)
+int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
+		      unsigned int tlp_len, struct pcie_tlp_log *log)
 {
 	unsigned int i;
-	int ret;
+	int off, ret;
+	u32 *to;
 
 	memset(log, 0, sizeof(*log));
 
-	for (i = 0; i < 4; i++) {
-		ret = pci_read_config_dword(dev, where + i * 4, &log->dw[i]);
+	for (i = 0; i < tlp_len; i++) {
+		if (i < 4) {
+			off = where + i * 4;
+			to = &log->dw[i];
+		} else {
+			off = where2 + (i - 4) * 4;
+			to = &log->prefix[i - 4];
+		}
+
+		ret = pci_read_config_dword(dev, off, to);
 		if (ret)
 			return pcibios_err_to_errno(ret);
 	}
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 190a0a2061cd..dc498adaa1c8 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -20,6 +20,7 @@ struct pci_dev;
 
 struct pcie_tlp_log {
 	u32 dw[4];
+	u32 prefix[4];
 };
 
 struct aer_capability_regs {
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 09e0c300c952..cf7a07fa4a3b 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -803,6 +803,7 @@
 #define  PCI_ERR_ROOT_FATAL_RCV		0x00000040 /* Fatal Received */
 #define  PCI_ERR_ROOT_AER_IRQ		0xf8000000 /* Advanced Error Interrupt Message Number */
 #define PCI_ERR_ROOT_ERR_SRC	0x34	/* Error Source Identification */
+#define PCI_ERR_PREFIX_LOG	0x38	/* TLP Prefix LOG Register (up to 16 bytes) */
 
 /* Virtual Channel */
 #define PCI_VC_PORT_CAP1	0x04
-- 
2.39.2

