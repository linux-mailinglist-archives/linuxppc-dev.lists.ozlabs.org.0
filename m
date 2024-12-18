Return-Path: <linuxppc-dev+bounces-4330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CE9F68B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:38:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxBm6YN9z30VQ;
	Thu, 19 Dec 2024 01:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532736;
	cv=none; b=Sw9UgnjHuCt0nu1zkiwnntx6UgeEsfRtpXtR2E3kk4iNT9tmKE9tzwHM6gk5sNmSH/teYljQzFZrMUD3R/X9UzAjL12dvweYKef2xbAJ1e4qjjc9JIvDlZAuE/waNsljxz0Ptre4MnrFnexHeQ94dX0xe6U1oKnPbEDaaSKazwzvpdwN1fX+bs61lSOykK3xP01YSFvVfci4taNsKtVY3ef+bER3iKiXnebCYoUtXLELTG/6BapPOvXHWauhIDe9fnG2LwQ5kYiVN9321vQBRhTbvmJejGXZM1cXpTk9wqIBY1bXrGEo4DI/Ss0UouHRq3cWo/QA7miMVGMjlwks/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532736; c=relaxed/relaxed;
	bh=c223EvVsxdkWUMmW0qpUhfrXrJZxyGDwX16xMiYdV34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=akuYV0xsdessECTJYVA2VVrCWNvI4JvAnpuY0sQpXhQv5O8Ja93mq1uLiCbhxLBGNVYjCIlnoRypruQf1LoP77CNdqomQPf1OhqSm7Ctule7L1nCtG0VTCoszDWoTbqFuM7FX2sj8X4iXleqlKIBs4ja/KxK00dFbERkGWxwX19qHXHW66IO+oV8/DfVI5YkdUfs5szBTyZCE72L84a5FzKWFu0u7PpsPlATzUITsLsLqe1WQ0tDYWKEZGaBlpPdbMSNeq+dDNzm642VKD9udwORPBH5YNUWLb3p7upVTupjZ6v+lMmlkKEwAEUWs0l3PlV4WNbRn2VQA8AcvuK39Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bXCIuhBM; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bXCIuhBM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxBl4xS1z30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:38:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532736; x=1766068736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wrvSiWdTDAWi26bRIwCKuI10sLxgSO+OyS9tHMgtzeQ=;
  b=bXCIuhBMbEJZ7y/H4R6BJ5mx2I/WLUOOIu2FacomSgS3SJq8nzOEMBYk
   o7wzUuvHxpmhVR8WRJKYtQHLTYyvJ3kaG1lXoc3K2GXTK9oNSH18qKzz0
   N+eBIxFmJQa2/wGrkYaJEcdSqmx9OUxAWZnokEZVt1InvI9H5w90pvU92
   Ys5Y+3jzufLrXwjVJWXCjuaJlpMCI67JMvdS1U04aZKABhuwPzdJfGPyH
   lX1CkzmFrMzshOPMTSgmrd8T0FhlWYDolYpg2BVwSIeX5BaY3mj9tuPcX
   QF1tsPYHkO2N7bR23uJjR3+jc+ois13ARUDTnvzohUV6Vdj9Gd64DGnR9
   w==;
X-CSE-ConnectionGUID: Kpxgl53VTACCJU9ofwrHLg==
X-CSE-MsgGUID: qFO9awTvQn29LOWiJwnlPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22597479"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22597479"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:53 -0800
X-CSE-ConnectionGUID: ZtV2dW0ESp2MEKjMn4+OBw==
X-CSE-MsgGUID: 9wOAxTQYScWQ6s+EF3bN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102974674"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 6/7] PCI: Add TLP Prefix reading into pcie_read_tlp_log()
Date: Wed, 18 Dec 2024 16:37:46 +0200
Message-Id: <20241218143747.3159-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
(PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.

Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
TLP Prefix Log. The relevant registers are formatted identically in AER
and DPC Capability, but has these variations:

a) The offsets of TLP Prefix Log registers vary.
b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
c) AER TLP Prefix Log Present (PCIe r6.1 sec 7.8.4.7) can indicate
   Prefix Log is not present.

Therefore callers must pass the offset of the TLP Prefix Log register
and the entire length to pcie_read_tlp_log() to be able to read the
correct number of TLP Prefix DWORDs from the correct offset.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pci.h             |  5 +++-
 drivers/pci/pcie/aer.c        |  5 +++-
 drivers/pci/pcie/dpc.c        | 13 +++++----
 drivers/pci/pcie/tlp.c        | 51 +++++++++++++++++++++++++++++++----
 include/linux/aer.h           |  1 +
 include/uapi/linux/pci_regs.h | 10 ++++---
 6 files changed, 67 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 55fcf3bac4f7..7797b2544d00 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -550,7 +550,9 @@ struct aer_err_info {
 int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 
-int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
+int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
+		      unsigned int tlp_len, struct pcie_tlp_log *log);
+unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
@@ -569,6 +571,7 @@ void pci_dpc_init(struct pci_dev *pdev);
 void dpc_process_error(struct pci_dev *pdev);
 pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
+unsigned int dpc_tlp_log_len(struct pci_dev *dev);
 #else
 static inline void pci_save_dpc_state(struct pci_dev *dev) { }
 static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 80c5ba8d8296..656dbf1ac45b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1248,7 +1248,10 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 
 		if (info->status & AER_LOG_TLP_MASKS) {
 			info->tlp_header_valid = 1;
-			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
+			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
+					  aer + PCI_ERR_PREFIX_LOG,
+					  aer_tlp_log_len(dev, aercc),
+					  &info->tlp);
 		}
 	}
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b6ef7efa3c1..7933b3cedb59 100644
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
index 65ac7b5d8a87..302ba99e64e6 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -11,26 +11,67 @@
 
 #include "../pci.h"
 
+/**
+ * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log length
+ * @dev: PCIe device
+ * @aercc: AER Capabilities and Control register value
+ *
+ * Return: TLP Header/Prefix Log length
+ */
+unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc)
+{
+	return 4 + (aercc & PCI_ERR_CAP_PREFIX_LOG_PRESENT) ?
+		   dev->eetlp_prefix_max : 0;
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
index 14a6306c4ce1..82866ac0bda7 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -790,10 +790,11 @@
 	/* Same bits as above */
 #define PCI_ERR_CAP		0x18	/* Advanced Error Capabilities & Ctrl*/
 #define  PCI_ERR_CAP_FEP(x)	((x) & 0x1f)	/* First Error Pointer */
-#define  PCI_ERR_CAP_ECRC_GENC	0x00000020	/* ECRC Generation Capable */
-#define  PCI_ERR_CAP_ECRC_GENE	0x00000040	/* ECRC Generation Enable */
-#define  PCI_ERR_CAP_ECRC_CHKC	0x00000080	/* ECRC Check Capable */
-#define  PCI_ERR_CAP_ECRC_CHKE	0x00000100	/* ECRC Check Enable */
+#define  PCI_ERR_CAP_ECRC_GENC		0x00000020 /* ECRC Generation Capable */
+#define  PCI_ERR_CAP_ECRC_GENE		0x00000040 /* ECRC Generation Enable */
+#define  PCI_ERR_CAP_ECRC_CHKC		0x00000080 /* ECRC Check Capable */
+#define  PCI_ERR_CAP_ECRC_CHKE		0x00000100 /* ECRC Check Enable */
+#define  PCI_ERR_CAP_PREFIX_LOG_PRESENT	0x00000800 /* TLP Prefix Log Present */
 #define PCI_ERR_HEADER_LOG	0x1c	/* Header Log Register (16 bytes) */
 #define PCI_ERR_ROOT_COMMAND	0x2c	/* Root Error Command */
 #define  PCI_ERR_ROOT_CMD_COR_EN	0x00000001 /* Correctable Err Reporting Enable */
@@ -809,6 +810,7 @@
 #define  PCI_ERR_ROOT_FATAL_RCV		0x00000040 /* Fatal Received */
 #define  PCI_ERR_ROOT_AER_IRQ		0xf8000000 /* Advanced Error Interrupt Message Number */
 #define PCI_ERR_ROOT_ERR_SRC	0x34	/* Error Source Identification */
+#define PCI_ERR_PREFIX_LOG	0x38	/* TLP Prefix LOG Register (up to 16 bytes) */
 
 /* Virtual Channel */
 #define PCI_VC_PORT_CAP1	0x04
-- 
2.39.5


