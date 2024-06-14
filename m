Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51950908E51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 17:12:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y11gyXgc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W12p60tjpz3cYk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 01:12:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y11gyXgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W12lV13ktz3cbd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 01:10:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718377831; x=1749913831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o2NPSa264TsX89kQvYw6c2W52Obbl82MGm8ffWtcZv8=;
  b=Y11gyXgcQZgZGhFh1nkLVRMC9rZTbGQg04N3CZCvqZsDg7a7jGWOr+8/
   +b/qVdY9oojJCy5vkrZUKra2p/otFc3dd0785DKMBkyVuijnfNHGrndXJ
   lASQAT+JaYHzchXtCZ5zD8pzjmw3uEmLCe93x9vhSd43J6cFQhBXOaHfV
   EGdUvZWn2hff6QN9l61n73ShgUB1CdiflewS59YzP7b6RcwlZ3luV9jnn
   FnFPelSnzr14y+5t7kkf6Qr7R0Te4Qro8DneZVSZnMsEG4KsmBNfwy0U3
   EwPkPWBrRIy2ED82QWQQS8HZvgEDe+aQPRi12swVm4fGIMwkcDPdbHMh8
   Q==;
X-CSE-ConnectionGUID: 5xLBOKXnTFGmY9TviBgz4g==
X-CSE-MsgGUID: JSy6K9EESMS1vPksdfQLzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19089354"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="19089354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:10:29 -0700
X-CSE-ConnectionGUID: N1Dwe7OqQf+rOj+D1l+Iew==
X-CSE-MsgGUID: 5c6fQ8PESlmv98LU/Q1+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40629403"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.222])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:10:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-edac@vger.kernel.org
Subject: [PATCH 3/3] PCI: Handle TLP Log in Flit mode
Date: Fri, 14 Jun 2024 18:09:21 +0300
Message-Id: <20240614150921.29724-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614150921.29724-1-ilpo.jarvinen@linux.intel.com>
References: <20240614150921.29724-1-ilpo.jarvinen@linux.intel.com>
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

Flit mode introduced in PCIe r6.0 alters how the TLP Header Log is
presented through AER and DPC Capability registers. The TLP Prefix Log
Register is not present with Flit mode and the register becomes
extension for TLP Header Log (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13).

Adapt pcie_read_tlp_log() and struct pcie_tlp_log to read and store
also the extended TLP Header Log when the link is in Flit mode. As
Prefix Log and Extended TLP Header are not present at the same time,
C union can be used.

Determining whether the error occurred while the Link was in Flit mode
is bit complicated. In case of AER, Advanced Error Capabilities and
Control Register directly tells whether the error was logged in Flit
mode or not (PCIe r6.1 sec 7.8.4.7). DPC Capability (PCIe r6.1 sec
7.9.14), unfortunately, does not contain the same information.

Unlike AER, the DPC capability does not provide way to discern whether
the error was logged in Flit mode (this is confirmed by PCI WG to be an
oversight in the spec). DPC will bring link down immediately following
an error, which make it impossible to acquire the Flit mode status
directly from the Link Status 2 register because Flit Mode Status is
only set in certain Link states (PCIe r6.1 sec 7.5.3.20). As a
workaround, use the flit_mode value stored into the struct pci_bus.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h             |  5 +--
 drivers/pci/pcie/aer.c        |  4 ++-
 drivers/pci/pcie/dpc.c        | 23 +++++++++++---
 drivers/pci/pcie/tlp.c        | 57 ++++++++++++++++++++++++-----------
 include/linux/aer.h           | 13 ++++++--
 include/ras/ras_event.h       | 12 ++++----
 include/uapi/linux/pci_regs.h |  6 +++-
 7 files changed, 85 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 54f5a1584ed8..12e8cfd04ebe 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -425,8 +425,9 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
-		      unsigned int tlp_len, struct pcie_tlp_log *log);
-unsigned int aer_tlp_log_len(struct pci_dev *dev);
+		      unsigned int tlp_len, bool flit,
+		      struct pcie_tlp_log *log);
+unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
 void pcie_print_tlp_log(const struct pci_dev *dev,
 			const struct pcie_tlp_log *log, const char *pfx);
 #endif	/* CONFIG_PCIEAER */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index efb9e728fe94..6beb856964e1 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1241,7 +1241,9 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 			info->tlp_header_valid = 1;
 			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
 					  aer + PCI_ERR_PREFIX_LOG,
-					  aer_tlp_log_len(dev), &info->tlp);
+					  aer_tlp_log_len(dev, aercc),
+					  aercc & PCI_ERR_CAP_TLP_LOG_FLIT,
+					  &info->tlp);
 		}
 	}
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 598f74384471..a374f3216ce2 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -219,7 +219,9 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 		goto clear_status;
 	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
 			  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
-			  dpc_tlp_log_len(pdev), &tlp_log);
+			  dpc_tlp_log_len(pdev),
+			  pdev->subordinate->flit_mode,
+			  &tlp_log);
 	pcie_print_tlp_log(pdev, &tlp_log, "");
 
 	if (pdev->dpc_rp_log_size < 5)
@@ -398,12 +400,23 @@ void pci_dpc_init(struct pci_dev *pdev)
 
 	/* Quirks may set dpc_rp_log_size if device or firmware is buggy */
 	if (!pdev->dpc_rp_log_size) {
+		u16 flags;
+		int ret;
+
+		ret = pcie_capability_read_word(pdev, PCI_EXP_FLAGS, &flags);
+		if (ret)
+			return;
+
 		pdev->dpc_rp_log_size =
 				FIELD_GET(PCI_EXP_DPC_RP_PIO_LOG_SIZE, cap);
-		if (pdev->dpc_rp_log_size < 4 || pdev->dpc_rp_log_size > 9) {
-			pci_err(pdev, "RP PIO log size %u is invalid\n",
-				pdev->dpc_rp_log_size);
-			pdev->dpc_rp_log_size = 0;
+		if (FIELD_GET(PCI_EXP_FLAGS_FLIT, flags)) {
+			pdev->dpc_rp_log_size += FIELD_GET(PCI_EXP_DPC_RP_PIO_LOG_SIZE4, cap) << 4;
+		} else {
+			if (pdev->dpc_rp_log_size < 4 || pdev->dpc_rp_log_size > 9) {
+				pci_err(pdev, "RP PIO log size %u is invalid\n",
+					pdev->dpc_rp_log_size);
+				pdev->dpc_rp_log_size = 0;
+			}
 		}
 	}
 }
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 097ac8514e96..5e68b1516f68 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -7,6 +7,7 @@
 
 #include <linux/aer.h>
 #include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
@@ -15,11 +16,15 @@
 /**
  * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log length
  * @dev: PCIe device
+ * @aercc: AER Capabilities and Control register value
  *
  * Return: TLP Header/Prefix Log length
  */
-unsigned int aer_tlp_log_len(struct pci_dev *dev)
+unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc)
 {
+	if (aercc & PCI_ERR_CAP_TLP_LOG_FLIT)
+		return FIELD_GET(PCI_ERR_CAP_TLP_LOG_SIZE, aercc);
+
 	return 4 + dev->eetlp_prefix_max;
 }
 
@@ -46,6 +51,7 @@ unsigned int dpc_tlp_log_len(struct pci_dev *dev)
  * @where: PCI Config offset of TLP Header Log
  * @where2: PCI Config offset of TLP Prefix Log
  * @tlp_len: TLP Log length (Header Log + TLP Prefix Log in DWORDs)
+ * @flit: TLP Logged in Flit mode
  * @log: TLP Log structure to fill
  *
  * Fill @log from TLP Header Log registers, e.g., AER or DPC.
@@ -53,28 +59,34 @@ unsigned int dpc_tlp_log_len(struct pci_dev *dev)
  * Return: 0 on success and filled TLP Log structure, <0 on error.
  */
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
-		      unsigned int tlp_len, struct pcie_tlp_log *log)
+		      unsigned int tlp_len, bool flit, struct pcie_tlp_log *log)
 {
 	unsigned int i;
 	int off, ret;
-	u32 *to;
+
+	if (tlp_len > ARRAY_SIZE(log->dw))
+		tlp_len = ARRAY_SIZE(log->dw);
 
 	memset(log, 0, sizeof(*log));
 
 	for (i = 0; i < tlp_len; i++) {
-		if (i < 4) {
+		if (i < 4)
 			off = where + i * 4;
-			to = &log->dw[i];
-		} else {
+		else
 			off = where2 + (i - 4) * 4;
-			to = &log->prefix[i - 4];
-		}
 
-		ret = pci_read_config_dword(dev, off, to);
+		ret = pci_read_config_dword(dev, off, &log->dw[i]);
 		if (ret)
 			return pcibios_err_to_errno(ret);
 	}
 
+	/*
+	 * Hard-code non-Flit mode to 4 DWORDs, for now. The exact length
+	 * can only be known if the TLP is parsed.
+	 */
+	log->header_len = flit ? tlp_len : 4;
+	log->flit = flit;
+
 	return 0;
 }
 
@@ -89,21 +101,30 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 void pcie_print_tlp_log(const struct pci_dev *dev,
 			const struct pcie_tlp_log *log, const char *pfx)
 {
-	char buf[(10 + 1) * (4 + ARRAY_SIZE(log->prefix)) + 14 + 1];
+	char buf[(10 + 1) * PCIE_TLP_LOG_MAXLEN + 1];
 	unsigned int i;
 	int len;
 
 	len = scnprintf(buf, sizeof(buf), "%#010x %#010x %#010x %#010x",
 			log->dw[0], log->dw[1], log->dw[2], log->dw[3]);
 
-	if (log->prefix[0])
-		len += scnprintf(buf + len, sizeof(buf) - len, " E-E Prefixes:");
-	for (i = 0; i < ARRAY_SIZE(log->prefix); i++) {
-		if (!log->prefix[i])
-			break;
-		len += scnprintf(buf + len, sizeof(buf) - len,
-				 " %#010x", log->prefix[i]);
+	if (log->flit) {
+		for (i = 4; i < log->header_len; i++) {
+			len += scnprintf(buf + len, sizeof(buf) - len,
+					 " %#010x", log->dw[i]);
+		}
+	} else {
+		if (log->prefix[0])
+			len += scnprintf(buf + len, sizeof(buf) - len,
+					 " E-E Prefixes:");
+		for (i = 0; i < ARRAY_SIZE(log->prefix); i++) {
+			if (!log->prefix[i])
+				break;
+			len += scnprintf(buf + len, sizeof(buf) - len,
+					 " %#010x", log->prefix[i]);
+		}
 	}
 
-	pci_err(dev, "%sTLP Header: %s\n", pfx, buf);
+	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
+		log->flit ? " (Flit)" : "", buf);
 }
diff --git a/include/linux/aer.h b/include/linux/aer.h
index dc498adaa1c8..96d1f83e4a65 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -18,9 +18,18 @@
 
 struct pci_dev;
 
+#define PCIE_TLP_LOG_MAXLEN		14
+
 struct pcie_tlp_log {
-	u32 dw[4];
-	u32 prefix[4];
+	union {
+		u32 dw[PCIE_TLP_LOG_MAXLEN];
+		struct {
+			u32 _do_not_use[4];
+			u32 prefix[4];
+		};
+	};
+	u8 header_len;		/* Length of the Logged TLP Header in DWORDs */
+	bool flit;		/* TLP was logged when in Flit mode */
 };
 
 struct aer_capability_regs {
diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
index 7c47151d5c72..316d216e0573 100644
--- a/include/ras/ras_event.h
+++ b/include/ras/ras_event.h
@@ -309,7 +309,7 @@ TRACE_EVENT(aer_event,
 		__field(	u32,		status		)
 		__field(	u8,		severity	)
 		__field(	u8, 		tlp_header_valid)
-		__array(	u32, 		tlp_header, 4	)
+		__array(	u32, 		tlp_header, PCIE_TLP_LOG_MAXLEN	)
 	),
 
 	TP_fast_assign(
@@ -318,10 +318,10 @@ TRACE_EVENT(aer_event,
 		__entry->severity	= severity;
 		__entry->tlp_header_valid = tlp_header_valid;
 		if (tlp_header_valid) {
-			__entry->tlp_header[0] = tlp->dw[0];
-			__entry->tlp_header[1] = tlp->dw[1];
-			__entry->tlp_header[2] = tlp->dw[2];
-			__entry->tlp_header[3] = tlp->dw[3];
+			int i;
+
+			for (i = 0; i < PCIE_TLP_LOG_MAXLEN; i++)
+				__entry->tlp_header[i] = tlp->dw[i];
 		}
 	),
 
@@ -334,7 +334,7 @@ TRACE_EVENT(aer_event,
 		__print_flags(__entry->status, "|", aer_correctable_errors) :
 		__print_flags(__entry->status, "|", aer_uncorrectable_errors),
 		__entry->tlp_header_valid ?
-			__print_array(__entry->tlp_header, 4, 4) :
+			__print_array(__entry->tlp_header, PCIE_TLP_LOG_MAXLEN, 4) :
 			"Not available")
 );
 
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index b6f9012a3fc4..161b67525447 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -485,6 +485,7 @@
 #define   PCI_EXP_TYPE_RC_EC	   0xa	/* Root Complex Event Collector */
 #define  PCI_EXP_FLAGS_SLOT	0x0100	/* Slot implemented */
 #define  PCI_EXP_FLAGS_IRQ	0x3e00	/* Interrupt message number */
+#define  PCI_EXP_FLAGS_FLIT	0x8000	/* Flit Mode Supported */
 #define PCI_EXP_DEVCAP		0x04	/* Device capabilities */
 #define  PCI_EXP_DEVCAP_PAYLOAD	0x00000007 /* Max_Payload_Size */
 #define  PCI_EXP_DEVCAP_PHANTOM	0x00000018 /* Phantom functions */
@@ -788,6 +789,8 @@
 #define  PCI_ERR_CAP_ECRC_GENE	0x00000040	/* ECRC Generation Enable */
 #define  PCI_ERR_CAP_ECRC_CHKC	0x00000080	/* ECRC Check Capable */
 #define  PCI_ERR_CAP_ECRC_CHKE	0x00000100	/* ECRC Check Enable */
+#define  PCI_ERR_CAP_TLP_LOG_FLIT	0x00040000 /* TLP was logged in Flit Mode */
+#define  PCI_ERR_CAP_TLP_LOG_SIZE	0x00f80000 /* Logged TLP Size (only in Flit mode) */
 #define PCI_ERR_HEADER_LOG	0x1c	/* Header Log Register (16 bytes) */
 #define PCI_ERR_ROOT_COMMAND	0x2c	/* Root Error Command */
 #define  PCI_ERR_ROOT_CMD_COR_EN	0x00000001 /* Correctable Err Reporting Enable */
@@ -1038,8 +1041,9 @@
 #define  PCI_EXP_DPC_CAP_RP_EXT		0x0020	/* Root Port Extensions */
 #define  PCI_EXP_DPC_CAP_POISONED_TLP	0x0040	/* Poisoned TLP Egress Blocking Supported */
 #define  PCI_EXP_DPC_CAP_SW_TRIGGER	0x0080	/* Software Triggering Supported */
-#define  PCI_EXP_DPC_RP_PIO_LOG_SIZE	0x0F00	/* RP PIO Log Size */
+#define  PCI_EXP_DPC_RP_PIO_LOG_SIZE	0x0F00	/* RP PIO Log Size [3:0] */
 #define  PCI_EXP_DPC_CAP_DL_ACTIVE	0x1000	/* ERR_COR signal on DL_Active supported */
+#define  PCI_EXP_DPC_RP_PIO_LOG_SIZE4	0x2000	/* RP PIO Log Size [4] */
 
 #define PCI_EXP_DPC_CTL			0x06	/* DPC control */
 #define  PCI_EXP_DPC_CTL_EN_FATAL	0x0001	/* Enable trigger on ERR_FATAL message */
-- 
2.39.2

