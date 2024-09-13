Return-Path: <linuxppc-dev+bounces-1331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF99782AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xj94Kd0z2ymr;
	Sat, 14 Sep 2024 00:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238237;
	cv=none; b=SsGmEaedT5+0QKTqyb3QIDZjMhOp4NEe2onsbpZsGD2w7kVVKEdL8zorwr6LKgWxfouhHAcytoOOWvO2bZ88Isvzc5pxmvWy564H+NB1+gQ8pfrlix3cnfy8J5h78lIVg+DBC8cYW1gEhY1uqMqed9QMyTAq0kr2eDAu7BRH51IyTdDn6f1UBXeR1mnnwXQiX16i9gmMWjYO2GDRQXXcsWqC9FknrAlsyadECQS/C0oWNvGnwjBA36evm/taZteQJP0JIE4AkiCujED5EBxx9mDsMzVQXKAiVlAqune1Mmf0T/P/UBSbt5Sabdu5MYGOOq2xq7yOhDS5HEeobIjCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238237; c=relaxed/relaxed;
	bh=XD4sv754b1pkXvXvH4+bwdWftbTknUEG8mft+qsHnuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjKFJpdaZJDndAj/1CPVMLlA6XEABmA9eIADTFEYin/V99U6SS889M4OSKM2b34mVnO/1DiKswMBqgX9h/dM3yPKghLrGdM5w2jU92q1HzyiMWVlQt45e/qNk1IldXzbctDm9FpywSkFIxdTQ+Obo70YN6a0sh89acvzG1J/Klcn7mYpLeEqLFy37dK4gGQ8nXuma+MR9EntS1xW8K77F/DkrAgD7UEFnV9LltqZbB8qxhZ7cKwUKIYqgt/hb6Yg8p89eEC+oUOKYbwmqUe+G+mcNJnoPUi7VGaw6EEZ/6mAfcTy2ww7D6UfdWeIog57GOcbiV9hklyvC5kaASETGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=biCveypr; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=biCveypr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xj874K6z2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:37:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238237; x=1757774237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=evQuuqWFYfqXRdK4cCd1u1trTMAUjrTXVQa7VhzPyW4=;
  b=biCveyprJqFuc7PMNWowqPCXWk1XZcMYS83FH2ApVTYuAYip3exiBU+W
   QatOOBteQeeYJl9s90K9VHEbHnhzDTB4ry9//bCEpkv1LEhaDnEn4AahO
   9WQSF7QI3uaXIPgHjVzkAQZbUbpw6HLWO0yp4Re1GClC2oh/7SYDuVogE
   uamKfVU6lFdSmYN6NkqDROv95Vz1Eq0tGkeES8vYa22AZaU6Fq9GeVEmP
   7j8KVsm6WcvswqO0XpGXSsyR/5XuR8lm9Ha4HUGphwy6jXNrdolo1d8tX
   OdD/Rd01wZkyJZw3UlR/xplwGziGI+lwQTAmo5Eq+p/LvOp9zL980a/FD
   A==;
X-CSE-ConnectionGUID: SPAepCQUQ4SAOoZ/nlPlpw==
X-CSE-MsgGUID: dbDSmkRpRjSLdHNErnUZww==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25075272"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25075272"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:36:55 -0700
X-CSE-ConnectionGUID: 0fVSlgULT3C5aQJHTibMUw==
X-CSE-MsgGUID: Z9rDjUDFTtWBzE4BBhW08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="67934647"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:36:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 1/8] PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
Date: Fri, 13 Sep 2024 17:36:25 +0300
Message-Id: <20240913143632.5277-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
 drivers/pci/pci.c   | 1 -
 drivers/pci/pci.h   | 4 ++++
 include/linux/aer.h | 2 --
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e3a49f66982d..378fc645424f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1121,7 +1121,6 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pcie_read_tlp_log);
 
 /**
  * pci_restore_bars - restore a device's BAR values (e.g. after wake-up)
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 79c8398f3938..b4fc6726eab3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -4,6 +4,8 @@
 
 #include <linux/pci.h>
 
+struct pcie_tlp_log;
+
 /* Number of possible devfns: 0.0 to 1f.7 inclusive */
 #define MAX_NR_DEVFNS 256
 
@@ -482,6 +484,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
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
2.39.2


