Return-Path: <linuxppc-dev+bounces-4258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2629F4CD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:54:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJFr68mjz30Sv;
	Wed, 18 Dec 2024 00:54:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443664;
	cv=none; b=Mpm8EXZBu3+NKl630tJPrQtmLTKri5MsP24AkDKPHnwri/q/W94LJU92ftBZFF7IOPoV5mmVpV5iCm5Jnw77nQeRHBFUpTnCeJX2crS6qvHV5zzYw9GQe0wm/jH98NLmMEwoJjK0f7X1abJVxCTh1mBw0iImKAF1sNk/66boak9q6LOYjve4h1i+l7bbL0ivSvl0HRDNrvKSMci0TcEBJj3eZq2Bbjel2rgTTPLDFoyrJq6mQM+/Dbrr8FUfkqrxNWJnKkdNLcQOjOBnXLANcuQ+Q4y2gsMhM1LmEM9rq3dnGK7k6CdNO/EAWa5yh9wXRFkdcWBksNy8xVYxlBy4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443664; c=relaxed/relaxed;
	bh=1a8n8R9b/ld1I5SEwAkArh79u6EULjtl+bhjKS6S+nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lRW/dPiZaIc1fJe2rfquByD8ZVNo+geXZ3JcVkFOxlfC9I4awR5CicsZFtbpOwLVvl8Ly4hDwq0xAXruMGJoow/9Wsxrug0wYGXScVUs2ZJysM3FSHBJBv06aTv+9GYlsHLV35kSpU5pmFxu5TO1X/eo+gyg0t5tXgG/kJ4AzJGl+O6C4u/7v8ewwfORjqe2+MoeQAQdb0FG6FN0oiCCLmGh82upLV+X56kazUnZJ7g+KG6/qll+++kK2TRyYNINXnzUW4bNpMv/MnLNQLIevNQXjFdvZp0dYgTTFMF3lmszneiWgoQTlxD81MMwM+BWdPESUGhe4ZvjMNpBZowBJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPqAcwxp; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPqAcwxp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJFq758wz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:54:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443664; x=1765979664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pEPLOEVYfxTevDLItm+PDeMI6pv8ZNbePX0cYmjRMKk=;
  b=CPqAcwxpij4fwqLKj2ZSAzYCWjue7PzRxajKWcZEZTAIMD/BgGuYkzoN
   vHWiKLM/zqATevIc10LrIUDi/nNfPePOiJzyUmV2hSwNunIzckEehke2Z
   m0izBdxzcs0/ZzkQNztiHYhC1Dmkr5bXZJdY3RkkNOXpLPExBv22f077N
   7rT1fmgBMne3mw0QT55ujScSLuRDtV7b/PZNBIjOqkwxysOshOBSlGfLi
   Z2EnwsbHAUIEhQasmhDZt4nXzq3lTDEX1k/WcQf+yQry4hHm4d+EmODWw
   xrjDGjqlyT+3OX5Rjwf+MzYHXfUJB8oj+tr2SReRu6RVdezxs4Nc00+jS
   Q==;
X-CSE-ConnectionGUID: K2E6SRV7TL+XhK3OIvnEGQ==
X-CSE-MsgGUID: V5q8POy+Siui30AlTbpI0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34192990"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34192990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:23 -0800
X-CSE-ConnectionGUID: XzIOqxNAS0+ahWy+NPorqQ==
X-CSE-MsgGUID: fpEOTE/MQZO8rre+yvSb7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102634427"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 1/8] PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
Date: Tue, 17 Dec 2024 15:53:51 +0200
Message-Id: <20241217135358.9345-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
References: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
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

pcie_read_tlp_log() was exposed by the commit 0a5a46a6a61b ("PCI/AER:
Generalize TLP Header Log reading") but this is now considered a
mistake. No drivers outside of PCI subsystem should build their own
diagnostic logging but should rely on PCI core doing it for them.

There's currently one driver (ixgbe) doing it independently which was
the initial reason why the export was added but it was decided by the
PCI maintainer that it's something that should be eliminated.

Remove the unwanted EXPORT of pcie_read_tlp_log() and remove it from
include/linux/aer.h.

Link: https://lore.kernel.org/all/20240322193011.GA701027@bhelgaas/
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pci.c   | 1 -
 drivers/pci/pci.h   | 4 ++++
 include/linux/aer.h | 2 --
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 0b29ec6e8e5e..e0fdc9d10f91 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1125,7 +1125,6 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pcie_read_tlp_log);
 
 /**
  * pci_restore_bars - restore a device's BAR values (e.g. after wake-up)
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 2e40fc63ba31..8a60fc9e7786 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -4,6 +4,8 @@
 
 #include <linux/pci.h>
 
+struct pcie_tlp_log;
+
 /* Number of possible devfns: 0.0 to 1f.7 inclusive */
 #define MAX_NR_DEVFNS 256
 
@@ -549,6 +551,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 #endif	/* CONFIG_PCIEAER */
 
+int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
+
 #ifdef CONFIG_PCIEPORTBUS
 /* Cached RCEC Endpoint Association */
 struct rcec_ea {
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 4b97f38f3fcf..190a0a2061cd 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -37,8 +37,6 @@ struct aer_capability_regs {
 	u16 uncor_err_source;
 };
 
-int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
-
 #if defined(CONFIG_PCIEAER)
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
 int pcie_aer_is_native(struct pci_dev *dev);
-- 
2.39.5


