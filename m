Return-Path: <linuxppc-dev+bounces-4325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4439F68AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:38:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCx9v0ZMkz30Vn;
	Thu, 19 Dec 2024 01:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532691;
	cv=none; b=hXNzmypAfbVNwN3aQ80Ly207amGNFSSBHNO3Dh7iEQ4VJuNwecchKC2q90IQIQ+glh/81hLsFIsdkTnampTg0NIFKMal8nmRvn1/2k4MOZ/cdPLV5l+BfMNo3aPyeyGmZ1sHykbOgPB5Pg/ngvzM79+tJXBgJnDCVotGxz4CyXtFnh+oORSgU0S/1EgAnAUyTg+n9RFbrxerwZWqZ1putZFyI1KsLlFe9flyyKGdiB8SUgKLpkBILLuunMbT24IzR9pMqy2trbtYJwTF63vlI4jhEBlQFpNgzLSkfSEOhs14IWzVuMkkPQ3RFIXCTDWqcrVbStccvrFvV7CjNwqjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532691; c=relaxed/relaxed;
	bh=1a8n8R9b/ld1I5SEwAkArh79u6EULjtl+bhjKS6S+nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEpaxjhcEQlUl3f9hZconvZoL/RFeBJAnTE/fpHszl4NGJ0oJuheU2FG8tRZIS/Y8L6FC4KhGEgSlPALZPJA2/rPgtZgynziNVhicnuzxG4s3ETYh7yam2y5oBlS1jNLFwJLV3QN09Gnmfq7PyfgiVfuiJ3tqdZjYlh9CIXlKMeXoKbaEdM8x/TQJog4CsRJ1orxK+JNB98UM1Tl0cIC1RaFPkQDjK/bMuLMOhRLfUwuCnsiJjZz0ohEc1YAfYoFrCI5tZD4AkuIx6jfE0GdqZ0z43rY3gtAXlJqo99yI/G4XwcxK6YExImO9lVzf0fPDrDXC/rWXe61RHIw/UxcKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LfXGtZU5; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LfXGtZU5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCx9s6nJJz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532690; x=1766068690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pEPLOEVYfxTevDLItm+PDeMI6pv8ZNbePX0cYmjRMKk=;
  b=LfXGtZU5xsBxtF2n+2G+Nwpsavya8+yAQrYGL8u82vnEQlkRBf88QvUr
   1Dg0HClajKvIAzhI0ELvAYt2l15B2tJPjtCxcDCHTfKD5Wlh6bx06lC4f
   n2xZcQe7K1lRjBn+s1cKIq9tdkg3tnXNGUxfqHRB59g6mh0hACRo/jxda
   nNsecMTZR/spR8Sw4hlw4BvSlmVjXTB578dtcuB0dig6FceappnJSN+Kv
   fZxZhCd/siNdcDToUI4AJ/2p9F3YRwGvgcHubCnI8WNeGDZMwKP69oqP2
   tgSrGTOvt+RhmBf5JAQgoJGDMgw2xmTk793m7d3vY3Z+Tbiua6u4dhejt
   g==;
X-CSE-ConnectionGUID: XAK0jbgBT9ae5yktv8OE+g==
X-CSE-MsgGUID: moDLxFoHQQ2JejdA7+83AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22597275"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22597275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:07 -0800
X-CSE-ConnectionGUID: wxrgTiwpT6aNO10AM4Garg==
X-CSE-MsgGUID: YwYqw0fsTo2CERc5vKoceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102974605"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 1/7] PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
Date: Wed, 18 Dec 2024 16:37:41 +0200
Message-Id: <20241218143747.3159-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
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


