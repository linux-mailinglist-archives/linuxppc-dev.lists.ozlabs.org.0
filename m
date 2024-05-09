Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 435AE8C0CE4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 10:52:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lOJgWjLn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZm4H5xgqz3cYY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 18:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lOJgWjLn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZm2p6qbWz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 18:51:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715244691; x=1746780691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wWOLNvWn/NYnzTnKRGERN+aKnQlH6GnZnESAaBtdIKE=;
  b=lOJgWjLnXdznIylaDiHjQgRQSx30ff+/s6nov8kPWo49rRlYMI9u4VqI
   7M5C4FVdRzHtXq572/hqfzAUFJ+KyHOWnYSAs/YfP6DR74jjQLMdahsmx
   4u5pA02AjGkvZng/3tHpeq6s8AXzrfWBiJJ0zk/Qc0wGkGzyWdIvuUMuA
   ELhsxtEHuG1sWwZf8wp2jEmQwYHKYoXGc7iIFXosdLuUazmqtfyesle0K
   UzRhvp4sAljG4SVQfP9S4fU6OCIrmXRkUzq0UwdO7WceCSRq0mwMhTQQX
   r4+RIZnA2a1Daj3hcA+UByWfFCXtCN29f/2812UrlOcwBiFZhOUX0RFgN
   w==;
X-CSE-ConnectionGUID: kSkg/J7DTburNzjcPpvksw==
X-CSE-MsgGUID: /bB1+qWxQ/q96S8JfceM6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14103958"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="14103958"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:51:30 -0700
X-CSE-ConnectionGUID: bfSjVD32RCKchufsKiY1Cw==
X-CSE-MsgGUID: uwo0H4/ATgqjzPTT4FBdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29060797"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.124])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:51:23 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v4 1/3] PCI/AER: Store UNCOR_STATUS bits that might be ANFE in aer_err_info
Date: Thu,  9 May 2024 16:48:31 +0800
Message-Id: <20240509084833.2147767-2-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, jonathan.cameron@huawei.com, bhelgaas@google.com, dan.j.williams@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In some cases the detector of a Non-Fatal Error(NFE) is not the most
appropriate agent to determine the type of the error. For example,
when software performs a configuration read from a non-existent
device or Function, completer will send an ERR_NONFATAL Message.
On some platforms, ERR_NONFATAL results in a System Error, which
breaks normal software probing.

Advisory Non-Fatal Error(ANFE) is a special case that can be used
in above scenario. It is predominantly determined by the role of the
detecting agent (Requester, Completer, or Receiver) and the specific
error. In such cases, an agent with AER signals the NFE (if enabled)
by sending an ERR_COR Message as an advisory to software, instead of
sending ERR_NONFATAL.

When processing an ANFE, ideally both correctable error(CE) status and
uncorrectable error(UE) status should be cleared. However, there is no
way to fully identify the UE associated with ANFE. Even worse, Non-Fatal
Error(NFE) may set the same UE status bit as ANFE. Treating an ANFE as
NFE will reproduce above mentioned issue, i.e., breaking softwore probing;
treating NFE as ANFE will make us ignoring some UEs which need active
recover operation. To avoid clearing UEs that are not ANFE by accident,
the most conservative route is taken here: If any of the NFE Detected
bits is set in Device Status, do not touch UE status, they should be
cleared later by the UE handler. Otherwise, a specific set of UEs that
may be raised as ANFE according to the PCIe specification will be cleared
if their corresponding severity is Non-Fatal.

To achieve above purpose, store UNCOR_STATUS bits that might be ANFE
in aer_err_info.anfe_status. So that those bits could be printed and
processed later.

Tested-by: Yudong Wang <yudong.wang@intel.com>
Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/pci/pci.h      |  1 +
 drivers/pci/pcie/aer.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 17fed1846847..3f9eb807f9fd 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -412,6 +412,7 @@ struct aer_err_info {
 
 	unsigned int status;		/* COR/UNCOR Error Status */
 	unsigned int mask;		/* COR/UNCOR Error Mask */
+	unsigned int anfe_status;	/* UNCOR Error Status for ANFE */
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ac6293c24976..f2839b51321a 100644
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
 
@@ -1196,6 +1202,49 @@ void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 EXPORT_SYMBOL_GPL(aer_recover_queue);
 #endif
 
+static void anfe_get_uc_status(struct pci_dev *dev, struct aer_err_info *info)
+{
+	u32 uncor_mask, uncor_status, anfe_status;
+	u16 device_status;
+	int aer = dev->aer_cap;
+
+	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &uncor_status);
+	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &uncor_mask);
+	/*
+	 * According to PCIe Base Specification Revision 6.1,
+	 * Section 6.2.3.2.4, if an UNCOR error is raised as
+	 * Advisory Non-Fatal error, it will match the following
+	 * conditions:
+	 *	a. The severity of the error is Non-Fatal.
+	 *	b. The error is one of the following:
+	 *		1. Poisoned TLP           (Section 6.2.3.2.4.3)
+	 *		2. Completion Timeout     (Section 6.2.3.2.4.4)
+	 *		3. Completer Abort        (Section 6.2.3.2.4.1)
+	 *		4. Unexpected Completion  (Section 6.2.3.2.4.5)
+	 *		5. Unsupported Request    (Section 6.2.3.2.4.1)
+	 */
+	anfe_status = uncor_status & ~uncor_mask & ~info->severity &
+		      AER_ERR_ANFE_UNC_MASK;
+
+	if (pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &device_status))
+		return;
+	/*
+	 * Take the most conservative route here. If there are Non-Fatal errors
+	 * detected, do not assume any bit in uncor_status is set by ANFE.
+	 */
+	if (device_status & PCI_EXP_DEVSTA_NFED)
+		return;
+
+	/*
+	 * If there is another ANFE between reading uncor_status and clearing
+	 * PCI_ERR_COR_ADV_NFAT bit in cor_status register, that ANFE isn't
+	 * recorded in info->anfe_status. It will be read out as NFE in
+	 * following uncor_status register reading and processed by NFE
+	 * handler.
+	 */
+	info->anfe_status = anfe_status;
+}
+
 /**
  * aer_get_device_error_info - read error status from dev and store it to info
  * @dev: pointer to the device expected to have a error record
@@ -1213,6 +1262,7 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 
 	/* Must reset in this function */
 	info->status = 0;
+	info->anfe_status = 0;
 	info->tlp_header_valid = 0;
 
 	/* The device might not support AER */
@@ -1226,6 +1276,9 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 			&info->mask);
 		if (!(info->status & ~info->mask))
 			return 0;
+
+		if (info->status & PCI_ERR_COR_ADV_NFAT)
+			anfe_get_uc_status(dev, info);
 	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
 		   type == PCI_EXP_TYPE_RC_EC ||
 		   type == PCI_EXP_TYPE_DOWNSTREAM ||
-- 
2.34.1

