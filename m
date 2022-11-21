Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF8632883
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 16:46:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGBZ25sCcz3f4P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 02:46:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGBYT27Ssz3bc5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:45:29 +1100 (AEDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NGBTW327tzFqSM;
	Mon, 21 Nov 2022 23:42:07 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 23:45:21 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 23:45:21 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <mpe@ellerman.id.au>
Subject: [PATCH v2] ocxl: fix pci device refcount leak when calling get_function_0()
Date: Mon, 21 Nov 2022 23:43:39 +0800
Message-ID: <20221121154339.4088935-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Cc: linuxppc-dev@lists.ozlabs.org, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

get_function_0() calls pci_get_domain_bus_and_slot(), as comment
says, it returns a pci device with refcount increment, so after
using it, pci_dev_put() needs be called.

Get the device reference when get_function_0() is not called, so
pci_dev_put() can be called in the error path and callers
unconditionally. And add comment above get_dvsec_vendor0() to tell
callers to call pci_dev_put().

Fixes: 87db7579ebd5 ("ocxl: control via sysfs whether the FPGA is reloaded on a link reset")
Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Add comment above get_dvsec_vendor0().
  Get reference where dev is function 0, and call pci_dev_put()
  unconditionally in callers.
---
 drivers/misc/ocxl/config.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index e401a51596b9..92ab49705f64 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -193,6 +193,18 @@ static int read_dvsec_vendor(struct pci_dev *dev)
 	return 0;
 }
 
+/**
+ * get_dvsec_vendor0() - Find a related PCI device (function 0)
+ * @dev: PCI device to match
+ * @dev0: The PCI device (function 0) found
+ * @out_pos: The position of PCI device (function 0)
+ *
+ * Returns 0 on success, negative on failure.
+ *
+ * NOTE: If it's successful, the reference of dev0 is increased,
+ * so after using it, the callers must call pci_dev_put() to give
+ * up the reference.
+ */
 static int get_dvsec_vendor0(struct pci_dev *dev, struct pci_dev **dev0,
 			     int *out_pos)
 {
@@ -202,10 +214,14 @@ static int get_dvsec_vendor0(struct pci_dev *dev, struct pci_dev **dev0,
 		dev = get_function_0(dev);
 		if (!dev)
 			return -1;
+	} else {
+		dev = pci_dev_get(dev);
 	}
 	pos = find_dvsec(dev, OCXL_DVSEC_VENDOR_ID);
-	if (!pos)
+	if (!pos) {
+		pci_dev_put(dev);
 		return -1;
+	}
 	*dev0 = dev;
 	*out_pos = pos;
 	return 0;
@@ -222,6 +238,7 @@ int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val)
 
 	pci_read_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
 			      &reset_reload);
+	pci_dev_put(dev0);
 	*val = !!(reset_reload & BIT(0));
 	return 0;
 }
@@ -243,6 +260,7 @@ int ocxl_config_set_reset_reload(struct pci_dev *dev, int val)
 		reset_reload &= ~BIT(0);
 	pci_write_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
 			       reset_reload);
+	pci_dev_put(dev0);
 	return 0;
 }
 
-- 
2.25.1

