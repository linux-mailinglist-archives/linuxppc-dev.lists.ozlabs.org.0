Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE47737C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 05:58:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKfYj2RVnz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 13:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangxiongfeng2@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKfXN13d4z3bYg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 13:57:23 +1000 (AEST)
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKfRk0NhDztRwp;
	Tue,  8 Aug 2023 11:53:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:56:49 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <bhelgaas@google.com>, <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <ben.widawsky@intel.com>
Subject: [PATCH v2 2/2] ocxl: use pci_find_next_dvsec_capability() to simplify the code
Date: Tue, 8 Aug 2023 12:08:58 +0800
Message-ID: <20230808040858.183568-3-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230808040858.183568-1-wangxiongfeng2@huawei.com>
References: <20230808040858.183568-1-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: linux-pci@vger.kernel.org, yangyingliang@huawei.com, helgaas@kernel.org, david.e.box@linux.intel.com, jonathan.cameron@huawei.com, linuxppc-dev@lists.ozlabs.org, wangxiongfeng2@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI core add pci_find_next_dvsec_capability() to query the next DVSEC.
We can use that core API to simplify the code. Also remove the unused
macros.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/ocxl.c | 20 ++------------------
 drivers/misc/ocxl/config.c            | 21 ++++++---------------
 include/misc/ocxl-config.h            |  4 ----
 3 files changed, 8 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 629067781cec..8dbc1a9535fc 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -71,29 +71,13 @@ static DEFINE_MUTEX(links_list_lock);
  * the AFUs, by pro-rating if needed.
  */
 
-static int find_dvsec_from_pos(struct pci_dev *dev, int dvsec_id, int pos)
-{
-	int vsec = pos;
-	u16 vendor, id;
-
-	while ((vsec = pci_find_next_ext_capability(dev, vsec,
-						    OCXL_EXT_CAP_ID_DVSEC))) {
-		pci_read_config_word(dev, vsec + OCXL_DVSEC_VENDOR_OFFSET,
-				&vendor);
-		pci_read_config_word(dev, vsec + OCXL_DVSEC_ID_OFFSET, &id);
-		if (vendor == PCI_VENDOR_ID_IBM && id == dvsec_id)
-			return vsec;
-	}
-	return 0;
-}
-
 static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
 {
 	int vsec = 0;
 	u8 idx;
 
-	while ((vsec = find_dvsec_from_pos(dev, OCXL_DVSEC_AFU_CTRL_ID,
-					   vsec))) {
+	while ((vsec = pci_find_next_dvsec_capability(dev, vsec,
+				PCI_VENDOR_ID_IBM, OCXL_DVSEC_AFU_CTRL_ID))) {
 		pci_read_config_byte(dev, vsec + OCXL_DVSEC_AFU_CTRL_AFU_IDX,
 				&idx);
 		if (idx == afu_idx)
diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index 92ab49705f64..6c0fca32e6db 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -39,23 +39,14 @@ static int find_dvsec(struct pci_dev *dev, int dvsec_id)
 static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
 {
 	int vsec = 0;
-	u16 vendor, id;
 	u8 idx;
 
-	while ((vsec = pci_find_next_ext_capability(dev, vsec,
-						    OCXL_EXT_CAP_ID_DVSEC))) {
-		pci_read_config_word(dev, vsec + OCXL_DVSEC_VENDOR_OFFSET,
-				&vendor);
-		pci_read_config_word(dev, vsec + OCXL_DVSEC_ID_OFFSET, &id);
-
-		if (vendor == PCI_VENDOR_ID_IBM &&
-			id == OCXL_DVSEC_AFU_CTRL_ID) {
-			pci_read_config_byte(dev,
-					vsec + OCXL_DVSEC_AFU_CTRL_AFU_IDX,
-					&idx);
-			if (idx == afu_idx)
-				return vsec;
-		}
+	while ((vsec = pci_find_next_dvsec_capability(dev, vsec,
+				PCI_VENDOR_ID_IBM, OCXL_DVSEC_AFU_CTRL_ID))) {
+		pci_read_config_byte(dev, vsec + OCXL_DVSEC_AFU_CTRL_AFU_IDX,
+				     &idx);
+		if (idx == afu_idx)
+			return vsec;
 	}
 	return 0;
 }
diff --git a/include/misc/ocxl-config.h b/include/misc/ocxl-config.h
index ccfd3b463517..40cf1b143170 100644
--- a/include/misc/ocxl-config.h
+++ b/include/misc/ocxl-config.h
@@ -10,10 +10,6 @@
  * It follows the specification for opencapi 3.0
  */
 
-#define OCXL_EXT_CAP_ID_DVSEC                 0x23
-
-#define OCXL_DVSEC_VENDOR_OFFSET              0x4
-#define OCXL_DVSEC_ID_OFFSET                  0x8
 #define OCXL_DVSEC_TL_ID                      0xF000
 #define   OCXL_DVSEC_TL_BACKOFF_TIMERS          0x10
 #define   OCXL_DVSEC_TL_RECV_CAP                0x18
-- 
2.20.1

