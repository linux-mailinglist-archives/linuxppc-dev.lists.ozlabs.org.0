Return-Path: <linuxppc-dev+bounces-5244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE36A10D0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:09:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbFR6rRJz3bSP;
	Wed, 15 Jan 2025 04:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874539;
	cv=none; b=odl3Znn4ht9c2Txn/WhYKYGXGzDed0V2Tv63b20Z0JZj1v/EU0WjDUTSP4FDkMhyb6gqQIlAkFP2xJTyxWfAzEJynfkbRIE0kpHIFew+ED2AUSyVHnmYv/JwylBpzmLKlv9/BjbHMJXivLL1vvFcWYOC18k16Vm5V4ua8JJqwP0TJBAm9uZFQS+4GMk8hKGPwbtfOeAKjL9uKFGAN7HUo4wBq799u2LkJCUl5lLKT4FiuEElWGZwrSSf8co2W4PPGLgIHmfgresC+WLa4Ydy/Cy/VCg5t1YYIoHcWUREZaLX9GQXuC6jEn8aUXRogh1dEK7nNCPOE/5RNuzQ0CEGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874539; c=relaxed/relaxed;
	bh=qgiFL8nNEXXFMN8S9JAnTsNquWi2keE1zAf/RGnbN3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DntCKwo5ztVFORVMrn+/awWKQs1VKFGtBobDXWz5AkeatxrBAEnbrBssgPiN3LUVV591dFcDvnQCCxMsvFx2HIG24hBh6Zu/lfG7z4+zJ6o7dg67VEHy1wlaDAfHh6NfATb2sEUb3TKPHoY0q6E8Ndarw3jFkP6L8VMQDQZIKxYztswX5a1Lc0PRw1qW3Kxm2AnvL20xVSsA58NUIy7poqTJwX+59gptdXAcEH53kr1tarCRIqlFcJpcYRRAPj3YyJFoDUnx8UJw+ieD7Qzsy8Dm+SvUNcUTiLnPIeLAoZOkU1kEFg6dE+AT+K83aOwM+nyfkekqBWQ85ML6tc8Q0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mR96gpLb; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mR96gpLb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbFR0FxXz3bSN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:08:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874539; x=1768410539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pXjtmPoKkze1c7/j4xatE9Enm2xkSBMMDaCx6NabS/o=;
  b=mR96gpLbApegbGMIG2DXTuaqM+mubW3k2IIno7z3TM259g3bIUqAdxye
   E60r43mqvI/DC5PESXsjn0/NcA0vktlESuCYoyWCZ2enMW5g6RaYR4bnR
   IYPkMGw+vzZDQUAZlDDoD491IWuv13cMr/XlBMSlp6W7fSEip15ofk1Ag
   GrdO8AkOfpaIzBJ/yEHieNms83vJdjRKqIVSXGZZ7TrGmxU7tcWODuo09
   fys+wCNhPToBiCYgXMaPGnZZf5WILEDtdFJU2RjOcLPZlnn1x3PdtN6l6
   xiFWEPJ7WP/xm3bHk0F60KprZs2Ovkapmm5IJ4ZRTibW683Kfc2E8Ymke
   A==;
X-CSE-ConnectionGUID: w5az0GKSQyaeTu+Agsuiag==
X-CSE-MsgGUID: 69aGUirqRSCRN0sunw9QRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24783671"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="24783671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:08:58 -0800
X-CSE-ConnectionGUID: yE6wL3dCQU2yCxwnrZO8eA==
X-CSE-MsgGUID: 8qjH3Ol2Se22Zkg1SfXGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105377280"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:08:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v9 1/8] PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
Date: Tue, 14 Jan 2025 19:08:33 +0200
Message-Id: <20250114170840.1633-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
References: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
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
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
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


