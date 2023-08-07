Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3D7718B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 05:07:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK1TW6h4zz3bWH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 13:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=wangxiongfeng2@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK1SL683bz307h
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 13:06:39 +1000 (AEST)
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RK1N92YQ8zGpxL;
	Mon,  7 Aug 2023 11:03:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 11:06:32 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <bhelgaas@google.com>, <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <ben.widawsky@intel.com>,
	<wangxiongfeng2@huawei.com>
Subject: [PATCH 1/2] PCI: Add pci_find_next_dvsec_capability to find next designated VSEC
Date: Mon, 7 Aug 2023 11:18:45 +0800
Message-ID: <20230807031846.77348-2-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230807031846.77348-1-wangxiongfeng2@huawei.com>
References: <20230807031846.77348-1-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
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
Cc: linux-pci@vger.kernel.org, yangyingliang@huawei.com, linuxppc-dev@lists.ozlabs.org, jonathan.cameron@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some devices may have several DVSEC(Designated Vendor-Specific Extended
Capability) entries with the same DVSEC ID. Add
pci_find_next_dvsec_capability() to find them all.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/pci/pci.c   | 37 +++++++++++++++++++++++++------------
 include/linux/pci.h |  2 ++
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 60230da957e0..3455ca7306ae 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -749,35 +749,48 @@ u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap)
 EXPORT_SYMBOL_GPL(pci_find_vsec_capability);
 
 /**
- * pci_find_dvsec_capability - Find DVSEC for vendor
+ * pci_find_next_dvsec_capability - Find next DVSEC for vendor
  * @dev: PCI device to query
+ * @start: address at which to start looking (0 to start at beginning of list)
  * @vendor: Vendor ID to match for the DVSEC
  * @dvsec: Designated Vendor-specific capability ID
  *
- * If DVSEC has Vendor ID @vendor and DVSEC ID @dvsec return the capability
- * offset in config space; otherwise return 0.
+ * Returns the address of the next DVSEC if the DVSEC has Vendor ID @vendor and
+ * DVSEC ID @dvsec; otherwise return 0. DVSEC can occur several times with the
+ * same DVSEC ID for some devices, and this provides a way to find them all.
  */
-u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec)
+u16 pci_find_next_dvsec_capability(struct pci_dev *dev, u16 start, u16 vendor,
+				   u16 dvsec)
 {
-	int pos;
+	u16 pos = start;
 
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DVSEC);
-	if (!pos)
-		return 0;
-
-	while (pos) {
+	while ((pos = pci_find_next_ext_capability(dev, pos,
+						  PCI_EXT_CAP_ID_DVSEC))) {
 		u16 v, id;
 
 		pci_read_config_word(dev, pos + PCI_DVSEC_HEADER1, &v);
 		pci_read_config_word(dev, pos + PCI_DVSEC_HEADER2, &id);
 		if (vendor == v && dvsec == id)
 			return pos;
-
-		pos = pci_find_next_ext_capability(dev, pos, PCI_EXT_CAP_ID_DVSEC);
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_find_next_dvsec_capability);
+
+/**
+ * pci_find_dvsec_capability - Find DVSEC for vendor
+ * @dev: PCI device to query
+ * @vendor: Vendor ID to match for the DVSEC
+ * @dvsec: Designated Vendor-specific capability ID
+ *
+ * If DVSEC has Vendor ID @vendor and DVSEC ID @dvsec return the capability
+ * offset in config space; otherwise return 0.
+ */
+u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec)
+{
+	return pci_find_next_dvsec_capability(dev, 0, vendor, dvsec);
+}
 EXPORT_SYMBOL_GPL(pci_find_dvsec_capability);
 
 /**
diff --git a/include/linux/pci.h b/include/linux/pci.h
index c69a2cc1f412..82bb905daf72 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1168,6 +1168,8 @@ u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 pos, int cap);
 struct pci_bus *pci_find_next_bus(const struct pci_bus *from);
 u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap);
 u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec);
+u16 pci_find_next_dvsec_capability(struct pci_dev *dev, u16 start, u16 vendor,
+				   u16 dvsec);
 
 u64 pci_get_dsn(struct pci_dev *dev);
 
-- 
2.20.1

