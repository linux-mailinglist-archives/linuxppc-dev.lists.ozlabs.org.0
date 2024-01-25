Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D783C024
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:05:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5kE1X1L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLJ0214ktz3ckN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 22:05:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5kE1X1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL9sr69XRz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 17:29:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706164193; x=1737700193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x32LOme0VCi24BOXE0bhRSdLzmkLr19AHRZy9FC+YGQ=;
  b=V5kE1X1L3HA13xHhwNeeTKy/DPLG6YmoGvBLrAuXX5uF7iXQsyeuvstV
   /eMs++v3WEwHm+VVFqPyv6kDjQ2r2gDc0R1U0LqfRYR0lg8QtdymejnCM
   kLIYjMEhKqebJm3vFuURRLXtb0CpH5KI3qLueZkoqBi8J9rYXSN0iJ1kf
   pSvdr21UVqrKx/bvcbtyrKAjCwkYlL6xSvAtOJ9tDnfG1SKjSt05uCihv
   J3edoo6TN9cGEG37NHLEKGcjxIUS+cWk0F3jQHC7xSOZm5ixe1LEvGvZw
   HN6VL6AyV+WZZ2gq6bfzvcGZz4y+xj30TClnvShmfWdVb/zzwktKHJ7Yb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="976654"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="976654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28658999"
Received: from linchen5-mobl.ccr.corp.intel.com (HELO localhost) ([10.254.209.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:29:38 -0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 4/4] RAS: Trace more information in aer_event
Date: Thu, 25 Jan 2024 14:28:02 +0800
Message-ID: <20240125062802.50819-5-qingshun.wang@linux.intel.com>
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

Add following fields in aer_event to better understand Advisory
Non-Fatal and other errors for external observation:

  - cor_status		(Correctable Error Status)
  - cor_mask		(Correctable Error Mask)
  - uncor_status	(Uncorrectable Error Status)
  - uncor_severity	(Uncorrectable Error Severity)
  - uncor_mask		(Uncorrectable Error Mask)
  - aer_cap_ctrl	(AER Capabilities and Control)
  - link_status		(Link Status)
  - device_status	(Device Status)
  - device_control_2	(Device Control 2)

In addition to the raw register value, value of following fields are
extracted and logged for better observability:

  - "First Error Pointer" and "Completion Timeout Prefix/Header Log
    Capable" from "AER Capabilities and Control"
  - "Completion Timeout Value" and "Completion Timeout Disable"
    from "Device Control 2"

Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
---
 drivers/pci/pcie/aer.c        | 17 +++++++++++--
 include/ras/ras_event.h       | 48 ++++++++++++++++++++++++++++++++---
 include/uapi/linux/pci_regs.h |  1 +
 3 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index eec3406f727a..2f5639f6c40f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -757,6 +757,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	int layer, agent;
 	int id = pci_dev_id(dev);
 	const char *level;
+	struct aer_capability_regs aer_caps;
 
 	if (info->severity == AER_CORRECTABLE) {
 		status = info->cor_status;
@@ -793,8 +794,18 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	if (info->id && info->error_dev_num > 1 && info->id == id)
 		pci_err(dev, "  Error of this Agent is reported first\n");
 
+	aer_caps = (struct aer_capability_regs) {
+	  .cor_status = info->cor_status,
+	  .cor_mask = info->cor_mask,
+	  .uncor_status = info->uncor_status,
+	  .uncor_severity = info->uncor_severity,
+	  .uncor_mask = info->uncor_mask,
+	  .cap_control = info->aer_cap_ctrl
+	};
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
-			info->severity, info->tlp_header_valid, &info->tlp);
+			info->severity, info->tlp_header_valid, &info->tlp,
+			&aer_caps, info->link_status,
+			info->device_status, info->device_control_2);
 }
 
 static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
@@ -870,7 +881,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		__print_tlp_header(dev, &aer->header_log);
 
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
-			aer_severity, tlp_header_valid, &aer->header_log);
+			aer_severity, tlp_header_valid, &aer->header_log,
+			aer, info.link_status,
+			info.device_status, info.device_control_2);
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, CXL);
 
diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
index cbd3ddd7c33d..a94997073d90 100644
--- a/include/ras/ras_event.h
+++ b/include/ras/ras_event.h
@@ -300,9 +300,14 @@ TRACE_EVENT(aer_event,
 		 const u32 status,
 		 const u8 severity,
 		 const u8 tlp_header_valid,
-		 struct aer_header_log_regs *tlp),
+		 struct aer_header_log_regs *tlp,
+		 struct aer_capability_regs *aer_caps,
+		 const u16 link_status,
+		 const u16 device_status,
+		 const u16 device_control_2),
 
-	TP_ARGS(dev_name, status, severity, tlp_header_valid, tlp),
+	TP_ARGS(dev_name, status, severity, tlp_header_valid, tlp,
+		aer_caps, link_status, device_status, device_control_2),
 
 	TP_STRUCT__entry(
 		__string(	dev_name,	dev_name	)
@@ -310,6 +315,10 @@ TRACE_EVENT(aer_event,
 		__field(	u8,		severity	)
 		__field(	u8, 		tlp_header_valid)
 		__array(	u32, 		tlp_header, 4	)
+		__field_struct(struct aer_capability_regs, aer_caps)
+		__field(	u16,		link_status	)
+		__field(	u16,		device_status	)
+		__field(	u16,		device_control_2)
 	),
 
 	TP_fast_assign(
@@ -317,6 +326,10 @@ TRACE_EVENT(aer_event,
 		__entry->status		= status;
 		__entry->severity	= severity;
 		__entry->tlp_header_valid = tlp_header_valid;
+		__entry->aer_caps	= *aer_caps;
+		__entry->link_status	= link_status;
+		__entry->device_status	= device_status;
+		__entry->device_control_2 = device_control_2;
 		if (tlp_header_valid) {
 			__entry->tlp_header[0] = tlp->dw0;
 			__entry->tlp_header[1] = tlp->dw1;
@@ -325,7 +338,20 @@ TRACE_EVENT(aer_event,
 		}
 	),
 
-	TP_printk("%s PCIe Bus Error: severity=%s, %s, TLP Header=%s\n",
+	TP_printk("%s PCIe Bus Error: severity=%s, %s, TLP Header=%s, "
+		  "Correctable Error Status=0x%08x, "
+		  "Correctable Error Mask=0x%08x, "
+		  "Uncorrectable Error Status=0x%08x, "
+		  "Uncorrectable Error Severity=0x%08x, "
+		  "Uncorrectable Error Mask=0x%08x, "
+		  "AER Capability and Control=0x%08x, "
+		  "First Error Pointer=0x%x, "
+		  "Completion Timeout Prefix/Header Log Capable=%s, "
+		  "Link Status=0x%04x, "
+		  "Device Status=0x%04x, "
+		  "Device Control 2=0x%04x, "
+		  "Completion Timeout Value=0x%x, "
+		  "Completion Timeout Disable=%sn",
 		__get_str(dev_name),
 		__entry->severity == AER_CORRECTABLE ? "Corrected" :
 			__entry->severity == AER_FATAL ?
@@ -335,7 +361,21 @@ TRACE_EVENT(aer_event,
 		__print_flags(__entry->status, "|", aer_uncorrectable_errors),
 		__entry->tlp_header_valid ?
 			__print_array(__entry->tlp_header, 4, 4) :
-			"Not available")
+			"Not available",
+		__entry->aer_caps.cor_status,
+		__entry->aer_caps.cor_mask,
+		__entry->aer_caps.uncor_status,
+		__entry->aer_caps.uncor_severity,
+		__entry->aer_caps.uncor_mask,
+		__entry->aer_caps.cap_control,
+		PCI_ERR_CAP_FEP(__entry->aer_caps.cap_control),
+		__entry->aer_caps.cap_control & PCI_ERR_CAP_CTO_LOGC ? "True" : "False",
+		__entry->link_status,
+		__entry->device_status,
+		__entry->device_control_2,
+		__entry->device_control_2 & PCI_EXP_DEVCTL2_COMP_TIMEOUT,
+		__entry->device_control_2 & PCI_EXP_DEVCTL2_COMP_TMOUT_DIS ?
+					    "True" : "False")
 );
 
 /*
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index a39193213ff2..54160ed2a8c9 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -787,6 +787,7 @@
 #define  PCI_ERR_CAP_ECRC_GENE	0x00000040	/* ECRC Generation Enable */
 #define  PCI_ERR_CAP_ECRC_CHKC	0x00000080	/* ECRC Check Capable */
 #define  PCI_ERR_CAP_ECRC_CHKE	0x00000100	/* ECRC Check Enable */
+#define  PCI_ERR_CAP_CTO_LOGC	0x00001000	/* Completion Timeout Prefix/Header Log Capable */
 #define PCI_ERR_HEADER_LOG	0x1c	/* Header Log Register (16 bytes) */
 #define PCI_ERR_ROOT_COMMAND	0x2c	/* Root Error Command */
 #define  PCI_ERR_ROOT_CMD_COR_EN	0x00000001 /* Correctable Err Reporting Enable */
-- 
2.42.0

