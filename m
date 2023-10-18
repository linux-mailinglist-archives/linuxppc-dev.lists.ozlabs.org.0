Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F37CDAA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 13:38:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gawI2h5l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9TP54nZFz3vYs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 22:38:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gawI2h5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9TLc6wRCz3cQr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 22:35:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697628953; x=1729164953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k/22Q3ibxWUMJOAz8W7Fp9YO2SyS1HtQWBwVBnojOT4=;
  b=gawI2h5ltXma7a97OFNsj7djLI+GpX8r/A8Dw3IKo/bmayJPPLXodFz5
   uZRhTpJuAJfA9PImg4RK63JX4DStDZRjPJNmifhaKN3+4HDXZ4OiHXzSM
   XiwKV3pDhtTi7ojac6fwk5bAfkeyogMiojvGotxeep8J3E+XH0oY3bnWH
   Xhzx2A8gf4QVcypCioGs93d/OfhRAsg11NvGXtFJPCUkDiPlCCwhgOzCW
   7Mnm9MKpUSewovxR4ISoZ4zid7Oasl97hpHlfoSXOatSaD3Mmmict+AvI
   FXlj8BLpj5jWBJuI+N5I+k4C1YOqL98leBOkZBPD1Difqub51K1aqpzA8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="383216009"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="383216009"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826855333"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826855333"
Received: from suguccin-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.44.63])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:34:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] PCI/DPC: Use defines with DPC reason fields
Date: Wed, 18 Oct 2023 14:32:53 +0300
Message-Id: <20231018113254.17616-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231018113254.17616-1-ilpo.jarvinen@linux.intel.com>
References: <20231018113254.17616-1-ilpo.jarvinen@linux.intel.com>
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

Add new defines for DPC reason fields and use them instead of literals.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/dpc.c        | 27 +++++++++++++++++----------
 include/uapi/linux/pci_regs.h |  6 ++++++
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 0048a11bd119..94111e438241 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -274,20 +274,27 @@ void dpc_process_error(struct pci_dev *pdev)
 	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
 		 status, source);
 
-	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
-	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
+	reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN;
+	ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
 	pci_warn(pdev, "%s detected\n",
-		 (reason == 0) ? "unmasked uncorrectable error" :
-		 (reason == 1) ? "ERR_NONFATAL" :
-		 (reason == 2) ? "ERR_FATAL" :
-		 (ext_reason == 0) ? "RP PIO error" :
-		 (ext_reason == 1) ? "software trigger" :
-				     "reserved error");
+		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR) ?
+		 "unmasked uncorrectable error" :
+		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE) ?
+		 "ERR_NONFATAL" :
+		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
+		 "ERR_FATAL" :
+		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
+		 "RP PIO error" :
+		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
+		 "software trigger" :
+		 "reserved error");
 
 	/* show RP PIO error detail information */
-	if (pdev->dpc_rp_extensions && reason == 3 && ext_reason == 0)
+	if (pdev->dpc_rp_extensions &&
+	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
+	    ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO)
 		dpc_process_rp_pio_error(pdev);
-	else if (reason == 0 &&
+	else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 2d6df02a4b93..c4d67ceae20d 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -1044,9 +1044,15 @@
 #define PCI_EXP_DPC_STATUS		0x08	/* DPC Status */
 #define  PCI_EXP_DPC_STATUS_TRIGGER	    0x0001 /* Trigger Status */
 #define  PCI_EXP_DPC_STATUS_TRIGGER_RSN	    0x0006 /* Trigger Reason */
+#define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR  0x0000 /* DPC due to unmasked uncorrectable error */
+#define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE    0x0002 /* DPC due to receiving ERR_NONFATAL */
+#define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE     0x0004 /* DPC due to receiving ERR_FATAL */
+#define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT 0x0006 /* Reason in Trig Reason Extension field */
 #define  PCI_EXP_DPC_STATUS_INTERRUPT	    0x0008 /* Interrupt Status */
 #define  PCI_EXP_DPC_RP_BUSY		    0x0010 /* Root Port Busy */
 #define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT 0x0060 /* Trig Reason Extension */
+#define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO		0x0000	/* DPC due to RP PIO error */
+#define  PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER	0x0020	/* DPC due to DPC SW Trigger bit */
 #define  PCI_EXP_DPC_RP_PIO_FEP		    0x1f00 /* Root Port PIO First Error Pointer */
 
 #define PCI_EXP_DPC_SOURCE_ID		 0x0A	/* DPC Source Identifier */
-- 
2.30.2

