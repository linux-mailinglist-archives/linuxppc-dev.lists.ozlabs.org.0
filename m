Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA990FB81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 05:03:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2LKcECJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4QLL1KwFz30VT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 13:03:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2LKcECJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4QJM3KGQz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 13:02:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718852533; x=1750388533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pX6yLIgJt2iX60Vu88UyxHydot/8e2sqBVfmTWy6BT4=;
  b=j2LKcECJpZ7VsaQkhiZPLhfsIpao6xAfp9HzzDxmjfWMra7VF3z7RZAK
   59JUqx7e0QncvTemUD1v+B1QZiGbNW+6GWBxgbjqN4luAafQ1nWDsTvM7
   nd8oehlKE6XFUG/vPaShceUh9nEqxiK2TdeFrF665gYvnkvwryrJlDeRM
   X2aZ5dKzwKgOxHVE11+WsJ9x+k/9egLzsBN2qlFsN+JvX0YlHpwPZdtB0
   kORQKkyCgh/WeIsd73vMaiSKtgSoYpWd7oojhQMEdOR4wGvNHBIDbzMVX
   PBPnCK/qqgQDzwRgdBGyCxiuI5hYlWxE50YzWJw3/GFSVXZQOM68RUaBz
   A==;
X-CSE-ConnectionGUID: 5Fu4hXwtRu6P72wPfp6UXA==
X-CSE-MsgGUID: B8mJr6DmS2uHNgOmOs/dlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26444271"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26444271"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 20:02:09 -0700
X-CSE-ConnectionGUID: j3RjqRmeQfitApUR7+ovhg==
X-CSE-MsgGUID: 91FXVXzXSP+7S/ROgY8EIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42049454"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.127])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 20:02:01 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v5 2/2] PCI/AER: Print UNCOR_STATUS bits that might be ANFE
Date: Thu, 20 Jun 2024 10:58:57 +0800
Message-Id: <20240620025857.206647-3-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620025857.206647-1-zhenzhong.duan@intel.com>
References: <20240620025857.206647-1-zhenzhong.duan@intel.com>
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>, bhelgaas@google.com, dan.j.williams@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When an Advisory Non-Fatal error(ANFE) triggers, both correctable error(CE)
status and ANFE related uncorrectable error(UE) status will be printed:

  AER: Correctable error message received from 0000:b7:02.0
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr
    Uncorrectable errors that may cause Advisory Non-Fatal:
     [12] TLP

Tested-by: Yudong Wang <yudong.wang@intel.com>
Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 3dcfa0191169..ba3a54092f2c 100644
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

