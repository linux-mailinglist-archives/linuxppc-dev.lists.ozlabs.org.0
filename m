Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084883C00A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:04:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cFrMD8/c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLHyJ18WZz3cTS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 22:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cFrMD8/c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL9s66hGyz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 17:29:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706164155; x=1737700155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g/eRLBA9JTOcnlfR0mRp9q/UKYK4eIgcF5N2CtD/gIg=;
  b=cFrMD8/c87+bLobP/SlZwrCcEet3hpBzNpiqUSX+0rDAo+5muAAsur2p
   SgSwWNYKo9NFOOuqtLunwn8wPeIKc+p3Dfsqb0oXbd7ozoMlvg+/69WnC
   MpenEu+LruoGrrxnenWW/GO6MKntXQYiCeaRVBA40uv+QcmvnEUtj8b1C
   NyPjk8ir1RjcuiOoHnVtT16OMVeH4DQs8UnxrUYKo7sTCoUXIH9RNyhmo
   H6HNkA2H3FInK3F5i+RjwPL9WnuE8+XZPEzk1w1uY36k6GCNwf3ZSRNus
   2Z3vQWpxnWf+eHQoSRLdMHcLJ3FYuVIuMEKDFnxp9aofn1fHbA0cYFA0D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433227508"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="433227508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20957073"
Received: from linchen5-mobl.ccr.corp.intel.com (HELO localhost) ([10.254.209.209])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:29:04 -0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 2/4] PCI/AER: Handle Advisory Non-Fatal properly
Date: Thu, 25 Jan 2024 14:28:00 +0800
Message-ID: <20240125062802.50819-3-qingshun.wang@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
References: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Jan 2024 22:03:28 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, Bjorn Helgaas <helgaas@kernel.org>, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, "Wang, Qingshun" <qingshun.wang@linux.intel.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Sa
 lgaonkar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, qingshun.wang@intel.com, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When processing an Advisory Non-Fatal error, ideally both correctable
error status and uncorrectable error status should be cleared. However,
there is no way to fully identify the UE associated with ANFE. Even
worse, a Fatal/Non-Fatal error may set the same UE status bit as ANFE.
Assuming an ANFE is FE/NFE is kind of bad, but assuming a FE/NFE is an
ANFE is usually unacceptable. To avoid clearing UEs that are not ANFE by
accident, the most conservative route is taken here: If any of the
Fatal/Non-Fatal Error Detected bits is set in Device Status, do not
touch UE status, they should be cleared later by the UE handler.
Otherwise, a specific set of UEs that may be raised as ANFE according to
the PCIe specification will be cleared if their corresponding severity
is non-fatal. Additionally, log UEs that will be cleared.

For instance, previously when kernel receives an ANFE with Poisoned TLP
in OS native AER mode, only status of CE will be reported and cleared:

  AER: Corrected error received: 0000:b7:02.0
  PCIe Bus Error: severity=Corrected, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr

If the kernel receives a Malformed TLP after that, two UE will be
reported, which is unexpected. Malformed TLP Header was lost since
the previous ANF gated the TLP header logs:

  PCIe Bus Error: severity=Uncorrected (Fatal), type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00041000/00180020
     [12] TLP                    (First)
     [18] MalfTLP

Now, in the same scenario, both CE status and related UE status will be
reported and cleared after ANFE:

  AER: Corrected error received: 0000:b7:02.0
  PCIe Bus Error: severity=Corrected, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr
    Uncorrectable errors that may cause Advisory Non-Fatal:
     [18] TLP

Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 61 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 6583dcf50977..713cbf625d3f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -107,6 +107,12 @@ struct aer_stats {
 					PCI_ERR_ROOT_MULTI_COR_RCV |	\
 					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
 
+#define AER_ERR_ANFE_UNC_MASK		(PCI_ERR_UNC_POISON_TLP |	\
+					PCI_ERR_UNC_COMP_TIME |		\
+					PCI_ERR_UNC_COMP_ABORT |	\
+					PCI_ERR_UNC_UNX_COMP |		\
+					PCI_ERR_UNC_UNSUP)
+
 static int pcie_aer_disable;
 static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
 
@@ -612,6 +618,32 @@ const struct attribute_group aer_stats_attr_group = {
 	.is_visible = aer_stats_attrs_are_visible,
 };
 
+static int anfe_get_related_err(struct aer_err_info *info)
+{
+	/*
+	 * Take the most conservative route here. If there are
+	 * Non-Fatal/Fatal errors detected, do not assume any
+	 * bit in uncor_status is set by ANFE.
+	 */
+	if (info->device_status & (PCI_EXP_DEVSTA_NFED | PCI_EXP_DEVSTA_FED))
+		return 0;
+	/*
+	 * According to PCIe Base Specification Revision 6.1,
+	 * Section 6.2.3.2.4, if an UNCOR error is rasied as
+	 * Advisory Non-Fatal error, it will match the following
+	 * conditions:
+	 *	a. The severity of the error is Non-Fatal.
+	 *	b. The error is one of the following:
+	 *		1. Poisoned TLP
+	 *		2. Completion Timeout
+	 *		3. Completer Abort
+	 *		4. Unexpected Completion
+	 *		5. Unsupported Request
+	 */
+	return info->uncor_status & ~info->uncor_mask
+		& AER_ERR_ANFE_UNC_MASK & ~info->severity;
+}
+
 static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 				   struct aer_err_info *info)
 {
@@ -678,6 +710,7 @@ static void __aer_print_error(struct pci_dev *dev,
 			      struct aer_err_info *info)
 {
 	unsigned long status;
+	unsigned long anfe_status;
 	const char **strings;
 	const char *level, *errmsg;
 	int i;
@@ -700,6 +733,21 @@ static void __aer_print_error(struct pci_dev *dev,
 		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
 	}
+
+	if (info->severity == AER_CORRECTABLE && (status & PCI_ERR_COR_ADV_NFAT)) {
+		anfe_status = anfe_get_related_err(info);
+		if (anfe_status) {
+			pci_printk(level, dev, "Uncorrectable errors that may cause Advisory Non-Fatal:");
+			for_each_set_bit(i, &anfe_status, 32) {
+				errmsg = aer_uncorrectable_error_string[i];
+				if (!errmsg)
+					errmsg = "Unknown Error Bit";
+
+				pci_printk(level, dev, "   [%2d] %-22s\n", i, errmsg);
+			}
+		}
+	}
+
 	pci_dev_aer_stats_incr(dev, info);
 }
 
@@ -1097,6 +1145,14 @@ static inline void cxl_rch_handle_error(struct pci_dev *dev,
 					struct aer_err_info *info) { }
 #endif
 
+static void handle_advisory_nonfatal(struct pci_dev *dev, struct aer_err_info *info)
+{
+	int aer = dev->aer_cap;
+
+	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
+			       anfe_get_related_err(info));
+}
+
 /**
  * pci_aer_handle_error - handle logging error into an event log
  * @dev: pointer to pci_dev data structure of error source device
@@ -1113,9 +1169,12 @@ static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
 		 * Correctable error does not need software intervention.
 		 * No need to go through error recovery process.
 		 */
-		if (aer)
+		if (aer) {
 			pci_write_config_dword(dev, aer + PCI_ERR_COR_STATUS,
 					info->cor_status);
+			if (info->cor_status & PCI_ERR_COR_ADV_NFAT)
+				handle_advisory_nonfatal(dev, info);
+		}
 		if (pcie_aer_is_native(dev)) {
 			struct pci_driver *pdrv = dev->driver;
 
-- 
2.42.0

