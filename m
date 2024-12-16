Return-Path: <linuxppc-dev+bounces-4204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F89F356D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:10:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBlKr0sTtz30Bx;
	Tue, 17 Dec 2024 03:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365456;
	cv=none; b=iOnWZkaXthtBTW3sSKYgSxYFh+UQihJZS/b87yjJd1CkabLXbp32XrgMQ6V3mjb/pdEIP1CwTPmXI8a8G+B4xbYcOAP4pNAYuJ0uEA6PCmphstiWzFn/C99DSibBbJ/uhHYKvyFFc/6lAmRmVCl/fPC60pbT5hRXQzXRyzCk4Fsz2mesHxs6Dm1d+BLNo7Cb1df1dPDB1eDBer18RMito6iFcUBTkzhWWCxrHfjTYb4jpl7lKzhnTG8j39NtKKaJ7Y/aLGfVZHgLiTKTUGrLUOnIg87A3lK6jgpOuW9EhI7+XxAIK3cYHFU5VRuKSFnk2mWE2M9+T2vSE+/oAhObnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365456; c=relaxed/relaxed;
	bh=3+3/j8LmCVBd7mk8mNioEHCnqHgY1fJpLitAzIZ4S30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jY4BD4zJQFI+aDOcYsCb80SfHNfggRtvPthpYMMKiu2XLqvKWCMw7IuVZda0J9J4gGnibzpCqsBXikr555n4lDTLuiHrlxgTgdnG/VRAD7psZ4h/mXueyWdHFY0M4FDIxa2NJ3I1KcOrvPvztwj2J/k/1p1OsLSq1N/6Vj1VluZQy3Z/Bqi9r3KJNAwzsMPXfXn5sEwiAB/Y5zaJMZEWQ2fhzr9t/UnJnELVNRi9voEvmO42MFH7VWTDEIQ+lM7eXcADUgSVSMbWfXb4b1EB1FQAyI9hhP3NNASzmGQSBfBnVAPxvWWiIiI7LxtjdvyvjysvkJziNyS9IlCub59dGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n8tgBze8; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n8tgBze8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBlKp6r3Dz3050
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:10:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734365455; x=1765901455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j/8R7WJoDO6RfNflWfXR5RXnV1qmNJGf5O3f1LCn+y0=;
  b=n8tgBze8I2DeWWqq1GuYyseXo4S8l7FI7W7QhXLlMcNIafcZE1nyTOGK
   hUsLcJcrnqHmOLWLlPT2J7R34pz9iumX2EMgIuOpWMbhExePBjRhOgjuS
   bmKf70o1soDcxEn6uxUPx12XJytoQTlRuh6fNwJjrgaOL2eVW/4yl9cd+
   zBNDa6/xlugfe7BDb+7jthZu5S3/sUlGOL82H+j49qx5Arn+zTrvuXZHs
   YYbL2granOjEjQAWsk6zmLwkFd3sTdubix8byYwCyOTuWLEKHS+/07i/Z
   swhx7+si+aV5+8ziPVVcZqx38irFybT1AZ8eTeMnELYrZJQu3y81Ox/1Z
   w==;
X-CSE-ConnectionGUID: hOV0jKCUREiuibDUpF8EUQ==
X-CSE-MsgGUID: pZu8+zFLRWKjBoFW00tapA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45761393"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45761393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:53 -0800
X-CSE-ConnectionGUID: wrjHuh+eSAuFg8ggGOFU2Q==
X-CSE-MsgGUID: 7efW7r51SWaBvrsH3B67mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97015539"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 4/4] PCI: Descope pci_printk() to aer_printk()
Date: Mon, 16 Dec 2024 18:10:12 +0200
Message-Id: <20241216161012.1774-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
References: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
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

include/linux/pci.h provides low-level pci_printk() interface that is
only used by AER because it needs to print the same message with
different levels depending on the error severity. No other PCI code
uses that functionality and calls pci_<level>() logging functions
directly with the appropriate level.

Descope pci_printk() into AER as aer_printk().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 10 +++++++---
 include/linux/pci.h    |  3 ---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 80c5ba8d8296..bfc6b94dad4d 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -17,6 +17,7 @@
 
 #include <linux/bitops.h>
 #include <linux/cper.h>
+#include <linux/dev_printk.h>
 #include <linux/pci.h>
 #include <linux/pci-acpi.h>
 #include <linux/sched.h>
@@ -35,6 +36,9 @@
 #include "../pci.h"
 #include "portdrv.h"
 
+#define aer_printk(level, pdev, fmt, arg...) \
+	dev_printk(level, &(pdev)->dev, fmt, ##arg)
+
 #define AER_ERROR_SOURCES_MAX		128
 
 #define AER_MAX_TYPEOF_COR_ERRS		16	/* as per PCI_ERR_COR_STATUS */
@@ -692,7 +696,7 @@ static void __aer_print_error(struct pci_dev *dev,
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
+		aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
@@ -715,11 +719,11 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 
 	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
 
-	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+	aer_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
 		   aer_error_severity_string[info->severity],
 		   aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+	aer_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
 		   dev->vendor, dev->device, info->status, info->mask);
 
 	__aer_print_error(dev, info);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index db9b47ce3eef..02d23e795915 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2685,9 +2685,6 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 
 #include <linux/dma-mapping.h>
 
-#define pci_printk(level, pdev, fmt, arg...) \
-	dev_printk(level, &(pdev)->dev, fmt, ##arg)
-
 #define pci_emerg(pdev, fmt, arg...)	dev_emerg(&(pdev)->dev, fmt, ##arg)
 #define pci_alert(pdev, fmt, arg...)	dev_alert(&(pdev)->dev, fmt, ##arg)
 #define pci_crit(pdev, fmt, arg...)	dev_crit(&(pdev)->dev, fmt, ##arg)
-- 
2.39.5


