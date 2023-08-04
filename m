Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7776FBA9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 10:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHJGT5wQ5z3cYV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 18:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangxiongfeng2@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHJFy2r1yz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 18:06:42 +1000 (AEST)
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHHkY4StdzrS9C;
	Fri,  4 Aug 2023 15:43:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 15:44:06 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
Subject: [RFC PATCH] cxl: Use pci_find_vsec_capability() to simplify the code
Date: Fri, 4 Aug 2023 15:56:30 +0800
Message-ID: <20230804075630.186054-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linuxppc-dev@lists.ozlabs.org, wangxiongfeng2@huawei.com, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI core add pci_find_vsec_capability() to query VSEC. We can use that
core API to simplify the code.

The only logical change is that pci_find_vsec_capability check the
Vendor ID before finding the VSEC.

PCI spec rev 5.0 says in 7.9.5.2 Vendor-Specific Header:
  VSEC ID - This field is a vendor-defined ID number that indicates the
  nature and format of the VSEC structure
  Software must qualify the Vendor ID before interpreting this field.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/misc/cxl/pci.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
index 0ff944860dda..f3108977755d 100644
--- a/drivers/misc/cxl/pci.c
+++ b/drivers/misc/cxl/pci.c
@@ -150,16 +150,8 @@ static inline resource_size_t p2_size(struct pci_dev *dev)
 
 static int find_cxl_vsec(struct pci_dev *dev)
 {
-	int vsec = 0;
-	u16 val;
-
-	while ((vsec = pci_find_next_ext_capability(dev, vsec, PCI_EXT_CAP_ID_VNDR))) {
-		pci_read_config_word(dev, vsec + 0x4, &val);
-		if (val == CXL_PCI_VSEC_ID)
-			return vsec;
-	}
-	return 0;
-
+	return pci_find_vsec_capability(dev, PCI_VENDOR_ID_IBM,
+					CXL_PCI_VSEC_ID);
 }
 
 static void dump_cxl_config_space(struct pci_dev *dev)
-- 
2.20.1

