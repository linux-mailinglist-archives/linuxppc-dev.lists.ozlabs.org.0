Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E190A83C03A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:07:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YG91eQM7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLJ1l5Y3mz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 22:07:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YG91eQM7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 25 Jan 2024 17:30:36 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL9th31zzz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 17:30:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706164236; x=1737700236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+O6GABKRQ2LNWvey5j+xqRNX728ozxBB63IJoOeS85o=;
  b=YG91eQM7QxQtbMJV0GqJvFTt2GzqMtRf/9NrmRuJ644xUEi67u/FGTid
   b3H8vSEO9udOaU5F+MaXhhOAsiikaDzIcyp46YMtiyWEdUVKCDmRXHD/l
   yrKB3daCDiFYVZLSzu9Lt3Ju9om5uAaih4OH8uMhnB1SUDOkPZjeMGpoP
   DwAQPHneEu2Oh4GK7oiQBxT1d6J6W8KpTEvBHx037BsJLY2BCYoAKN1NG
   +8FHt+hmHyjjkazATJ9aYRP/jxSpzTm88yawTTcqc+4auWcfyYKjjPPnj
   IWUWr/KgiKln5ZC11d6N5YmBhOYMCWksMsMErOSAfK711ndno0q1EH++3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399233692"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399233692"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959760224"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="959760224"
Received: from linchen5-mobl.ccr.corp.intel.com (HELO localhost) ([10.254.209.209])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:29:20 -0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 3/4] PCI/AER: Fetch information for FTrace
Date: Thu, 25 Jan 2024 14:28:01 +0800
Message-ID: <20240125062802.50819-4-qingshun.wang@linux.intel.com>
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

Fetch and store the data of 3 more registers: "Link Status", "Device
Control 2", and "Advanced Error Capabilities and Control". This data is
needed for external observation to better understand ANFE.

Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
---
 drivers/acpi/apei/ghes.c |  8 +++++++-
 drivers/cxl/core/pci.c   | 11 ++++++++++-
 drivers/pci/pci.h        |  4 ++++
 drivers/pci/pcie/aer.c   | 26 ++++++++++++++++++++------
 include/linux/aer.h      |  6 ++++--
 5 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 6034039d5cff..047cc01be68c 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -594,7 +594,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
 	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
 		struct pcie_capability_regs *pcie_caps;
+		u16 device_control_2 = 0;
 		u16 device_status = 0;
+		u16 link_status = 0;
 		unsigned int devfn;
 		int aer_severity;
 		u8 *aer_info;
@@ -619,7 +621,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 
 		if (pcie_err->validation_bits & CPER_PCIE_VALID_CAPABILITY) {
 			pcie_caps = (struct pcie_capability_regs *)pcie_err->capability;
+			device_control_2 = pcie_caps->device_control_2;
 			device_status = pcie_caps->device_status;
+			link_status = pcie_caps->link_status;
 		}
 
 		aer_recover_queue(pcie_err->device_id.segment,
@@ -627,7 +631,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 				  devfn, aer_severity,
 				  (struct aer_capability_regs *)
 				  aer_info,
-				  device_status);
+				  device_status,
+				  link_status,
+				  device_control_2);
 	}
 #endif
 }
diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
index 9111a4415a63..3aa57fe8db42 100644
--- a/drivers/cxl/core/pci.c
+++ b/drivers/cxl/core/pci.c
@@ -903,7 +903,9 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
 	struct aer_capability_regs aer_regs;
 	struct cxl_dport *dport;
 	struct cxl_port *port;
+	u16 device_control_2;
 	u16 device_status;
+	u16 link_status;
 	int severity;
 
 	port = cxl_pci_find_port(pdev, &dport);
@@ -918,10 +920,17 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
 	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
 		return;
 
+	if (pcie_capability_read_word(pdev, PCI_EXP_DEVCTL2, &device_control_2))
+		return;
+
 	if (pcie_capability_read_word(pdev, PCI_EXP_DEVSTA, &device_status))
 		return;
 
-	pci_print_aer(pdev, severity, &aer_regs, device_status);
+	if (pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &link_status))
+		return;
+
+	pci_print_aer(pdev, severity, &aer_regs, device_status,
+		      link_status, device_control_2);
 
 	if (severity == AER_CORRECTABLE)
 		cxl_handle_rdport_cor_ras(cxlds, dport);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f881a1b42f14..5788a94b4e95 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -412,7 +412,11 @@ struct aer_err_info {
 	u32 uncor_mask;		/* UNCOR Error Mask */
 	u32 uncor_status;	/* UNCOR Error Status */
 	u32 uncor_severity;	/* UNCOR Error Severity */
+
+	u16 link_status;
+	u32 aer_cap_ctrl;	/* AER Capabilities and Control */
 	u16 device_status;
+	u16 device_control_2;
 	struct aer_header_log_regs tlp;	/* TLP Header */
 };
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 713cbf625d3f..eec3406f727a 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -825,7 +825,8 @@ EXPORT_SYMBOL_GPL(cper_severity_to_aer);
 #endif
 
 void pci_print_aer(struct pci_dev *dev, int aer_severity,
-		   struct aer_capability_regs *aer, u16 device_status)
+		   struct aer_capability_regs *aer, u16 device_status,
+		   u16 link_status, u16 device_control_2)
 {
 	int layer, agent, tlp_header_valid = 0;
 	u32 status, mask;
@@ -850,7 +851,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	info.uncor_status = aer->uncor_status;
 	info.uncor_severity = aer->uncor_severity;
 	info.uncor_mask = aer->uncor_mask;
+	info.link_status = link_status;
+	info.aer_cap_ctrl = aer->cap_control;
 	info.device_status = device_status;
+	info.device_control_2 = device_control_2;
 	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
 
 	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
@@ -1205,7 +1209,9 @@ struct aer_recover_entry {
 	u8	devfn;
 	u16	domain;
 	int	severity;
+	u16	link_status;
 	u16	device_status;
+	u16	device_control_2;
 	struct aer_capability_regs *regs;
 };
 
@@ -1226,7 +1232,8 @@ static void aer_recover_work_func(struct work_struct *work)
 			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
 			continue;
 		}
-		pci_print_aer(pdev, entry.severity, entry.regs, entry.device_status);
+		pci_print_aer(pdev, entry.severity, entry.regs, entry.device_status,
+			      entry.link_status, entry.device_control_2);
 		/*
 		 * Memory for aer_capability_regs(entry.regs) is being allocated from the
 		 * ghes_estatus_pool to protect it from overwriting when multiple sections
@@ -1255,7 +1262,8 @@ static DEFINE_SPINLOCK(aer_recover_ring_lock);
 static DECLARE_WORK(aer_recover_work, aer_recover_work_func);
 
 void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
-		       int severity, struct aer_capability_regs *aer_regs, u16 device_status)
+		       int severity, struct aer_capability_regs *aer_regs, u16 device_status,
+		       u16 link_status, u16 device_control_2)
 {
 	struct aer_recover_entry entry = {
 		.bus		= bus,
@@ -1263,7 +1271,9 @@ void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 		.domain		= domain,
 		.severity	= severity,
 		.regs		= aer_regs,
+		.link_status	= link_status,
 		.device_status	= device_status,
+		.device_control_2 = device_control_2,
 	};
 
 	if (kfifo_in_spinlocked(&aer_recover_ring, &entry, 1,
@@ -1289,7 +1299,6 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int type = pci_pcie_type(dev);
 	int aer = dev->aer_cap;
-	int temp;
 
 	/* Must reset in this function */
 	info->cor_status = 0;
@@ -1317,8 +1326,14 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 				      &info->uncor_severity);
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
 				      &info->uncor_mask);
+		pci_read_config_dword(dev, aer + PCI_ERR_CAP,
+				      &info->aer_cap_ctrl);
+		pcie_capability_read_word(dev, PCI_EXP_LNKSTA,
+					  &info->link_status);
 		pcie_capability_read_word(dev, PCI_EXP_DEVSTA,
 					  &info->device_status);
+		pcie_capability_read_word(dev, PCI_EXP_DEVCTL2,
+					  &info->device_control_2);
 	} else {
 		return 1;
 	}
@@ -1331,8 +1346,7 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 			return 0;
 
 		/* Get First Error Pointer */
-		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &temp);
-		info->first_error = PCI_ERR_CAP_FEP(temp);
+		info->first_error = PCI_ERR_CAP_FEP(info->aer_cap_ctrl);
 
 		if (info->uncor_status & AER_LOG_TLP_MASKS) {
 			info->tlp_header_valid = 1;
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 38ac802250ac..327ebec1e4b3 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -52,9 +52,11 @@ static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
 #endif
 
 void pci_print_aer(struct pci_dev *dev, int aer_severity,
-		    struct aer_capability_regs *aer, u16 device_status);
+		    struct aer_capability_regs *aer, u16 device_status,
+		    u16 link_status, u16 device_control_2);
 int cper_severity_to_aer(int cper_severity);
 void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
-		       int severity, struct aer_capability_regs *aer_regs, u16 device_status);
+		       int severity, struct aer_capability_regs *aer_regs, u16 device_status,
+		       u16 link_status, u16 device_control_2);
 #endif //_AER_H_
 
-- 
2.42.0

