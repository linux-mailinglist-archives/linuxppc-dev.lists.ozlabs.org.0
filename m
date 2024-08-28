Return-Path: <linuxppc-dev+bounces-682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 524349624F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0zj1gSTz2y8l;
	Wed, 28 Aug 2024 20:30:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724841025;
	cv=none; b=iM7Y0F72wnjZzW20CthE5q6/je0bUMahFdJqTyqGld9Aa9U7Tf9HV/QUnrWGBW251R2eWvFECpd7Mi9jFa1+djumrEb2UMsby5zAUYduOeMwOLJ/lCHWJD164priVoHfuKvkpM0dPVTB/cbDHtk5JWJzWN8NoS8UbwrYh5KhaBRXxJY/Xspnep+DzvMxMFST1giCO2A+DBqci6kigqe/4ESUudSI4vAmaNpw6nx7OQK8eFwfaf33Eet+tAhBMOZ3rLsOGdKD6Gfm36RZuO8yLIEJw90TxA25ewydkvSzN7BXOB1u6L51E+J6wAbIOZkPEheDovS/6EoNxc5izsqVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724841025; c=relaxed/relaxed;
	bh=SoQibYPLfKyv0jK3I/Mcs9L7GvYgtvTrP2tDplrwF1E=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=GkXQteFCEHS3oFr8v2PmTOaVtHiXUeNbtyC+oUalYk4+bAZop3ZToFepGm1r8JC5oIlMSahAlz0e2sWk2N0u0SqWrruyLWY2kkjomYFTdLwpMWuwTqku2fI2F7HokNU1ZKnhxFkDWCm5UrvhLLNVCJqCsE4KPF2Dj7RkBG0QmQomWrqWt4EcG84hFDrvgDnPlrCheOmhpG6KqkOW0INX9NT/rBhpuIrywZmyD2Ysa8oktqfVxwB79CENrFxSMUb9bwnhgGHy1NbZLed8wOx2Zcd3O85Zjhvd1M3LhBvKLxiCVYnSxuf8VRAHf7vL3e7cw5izB7YMDoKDUQOYTl5zUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0zh1lkHz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:30:20 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wv0zB45Dcz1j7cl;
	Wed, 28 Aug 2024 18:29:58 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id AA80A1A016C;
	Wed, 28 Aug 2024 18:30:09 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Aug
 2024 18:30:09 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] cxl: Remove unused cxl_pci_to_cfg_record()
Date: Wed, 28 Aug 2024 18:38:07 +0800
Message-ID: <20240828103807.3683308-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

cxl_pci_to_cfg_record() is not used anywhere, and its function can be
replacd with PCI_DEVID(), so remove it.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/misc/cxl/vphb.c | 12 +-----------
 include/misc/cxl.h      |  4 ----
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/misc/cxl/vphb.c b/drivers/misc/cxl/vphb.c
index 6332db8044bd..1cf614bf104d 100644
--- a/drivers/misc/cxl/vphb.c
+++ b/drivers/misc/cxl/vphb.c
@@ -72,11 +72,6 @@ static void cxl_pci_reset_secondary_bus(struct pci_dev *dev)
 	/* Should we do an AFU reset here ? */
 }
 
-static int cxl_pcie_cfg_record(u8 bus, u8 devfn)
-{
-	return (bus << 8) + devfn;
-}
-
 static inline struct cxl_afu *pci_bus_to_afu(struct pci_bus *bus)
 {
 	struct pci_controller *phb = bus ? pci_bus_to_host(bus) : NULL;
@@ -99,7 +94,7 @@ static inline int cxl_pcie_config_info(struct pci_bus *bus, unsigned int devfn,
 {
 	int record;
 
-	record = cxl_pcie_cfg_record(bus->number, devfn);
+	record = PCI_DEVID(bus->number, devfn);
 	if (record > afu->crs_num)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -302,8 +297,3 @@ struct cxl_afu *cxl_pci_to_afu(struct pci_dev *dev)
 }
 EXPORT_SYMBOL_GPL(cxl_pci_to_afu);
 
-unsigned int cxl_pci_to_cfg_record(struct pci_dev *dev)
-{
-	return cxl_pcie_cfg_record(dev->bus->number, dev->devfn);
-}
-EXPORT_SYMBOL_GPL(cxl_pci_to_cfg_record);
diff --git a/include/misc/cxl.h b/include/misc/cxl.h
index d8044299d654..5ffa6e02bb07 100644
--- a/include/misc/cxl.h
+++ b/include/misc/cxl.h
@@ -23,10 +23,6 @@
 /* Get the AFU associated with a pci_dev */
 struct cxl_afu *cxl_pci_to_afu(struct pci_dev *dev);
 
-/* Get the AFU conf record number associated with a pci_dev */
-unsigned int cxl_pci_to_cfg_record(struct pci_dev *dev);
-
-
 /*
  * Context lifetime overview:
  *
-- 
2.34.1


