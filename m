Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1538A7D8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 09:59:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPgufZlZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKCxF31Wqz3vZy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 17:59:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPgufZlZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VK9gy5xQfz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 16:18:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713334687; x=1744870687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ub6kq74U0aYFIEC3DfFei2mAsfVCPJ20ozkIwFL9EQY=;
  b=iPgufZlZkgAAWHhxbfS7zT0YUdjvzdfP66j6+dluWCK6KcDedzESh2zB
   I4hI10icospEowVWD7Bnc+aHxxX6v6E6so9JQBGXjKMcgPZCF6EP05DDx
   4FE6YFv+vTuRat/60Wm282t5Tqwj1vKAPwNS9iA2qWFfs85iND36vgUQ7
   neO5KsXcTv5+bvPV4WlhfZYM6F2hrtsIzHsGv623+pWPjh8KjFtH6NfQp
   l0DF/LCNXHLVAFAxIy+GF9VDKeAqYI2mbpYYpyJqck6IOvIVK9YHg4let
   OQnvCWmYyXcTaFzKbbnMYviVfZMKtrQZZxF87E/yszdhQUbrg+7VSnQFA
   Q==;
X-CSE-ConnectionGUID: 694f0f/KRsOh9AUMHZpFLA==
X-CSE-MsgGUID: oAhdCSW+S/uCU8ce6f5T8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11750822"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="11750822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 23:17:02 -0700
X-CSE-ConnectionGUID: abTWy6MlTSue4rwbuM6wug==
X-CSE-MsgGUID: QIvtvlAbQQmcqJ/4U5WcuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="23109064"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.124])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 23:16:53 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 2/3] PCI/AER: Print UNCOR_STATUS bits that might be ANFE
Date: Wed, 17 Apr 2024 14:14:06 +0800
Message-Id: <20240417061407.1491361-3-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
References: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Apr 2024 17:57:48 +1000
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, jonathan.cameron@huawei.com, bhelgaas@google.com, dan.j.williams@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, leoyang.li@nxp.com, lukas@wunner.de, james.morse@arm.com, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When an Advisory Non-Fatal error(ANFE) triggers, both correctable error(CE)
status and ANFE related uncorrectable error(UE) status will be printed:

  AER: Correctable error message received from 0000:b7:02.0
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr
    Uncorrectable errors that may cause Advisory Non-Fatal:
     [18] TLP

Tested-by: Yudong Wang <yudong.wang@intel.com>
Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/pci/pcie/aer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 27364ab4b148..870e1d1a5159 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -681,6 +681,7 @@ static void __aer_print_error(struct pci_dev *dev,
 {
 	const char **strings;
 	unsigned long status = info->status & ~info->mask;
+	unsigned long anfe_status = info->anfe_status;
 	const char *level, *errmsg;
 	int i;
 
@@ -701,6 +702,20 @@ static void __aer_print_error(struct pci_dev *dev,
 				info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
+
+	if (!anfe_status)
+		return;
+
+	strings = aer_uncorrectable_error_string;
+	pci_printk(level, dev, "Uncorrectable errors that may cause Advisory Non-Fatal:\n");
+
+	for_each_set_bit(i, &anfe_status, 32) {
+		errmsg = strings[i];
+		if (!errmsg)
+			errmsg = "Unknown Error Bit";
+
+		pci_printk(level, dev, "   [%2d] %s\n", i, errmsg);
+	}
 }
 
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
-- 
2.34.1

