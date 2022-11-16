Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C662BB76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 12:22:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC0yP042Gz3cLf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 22:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangxiongfeng2@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC0xr71yPz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 22:22:04 +1100 (AEDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NC0rg4lS9zqSQB;
	Wed, 16 Nov 2022 19:17:39 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 19:21:27 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 19:21:26 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <mpe@ellerman.id.au>, <dledford@redhat.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <nick.child@ibm.com>, <olof@lixom.net>,
	<paulus@samba.org>
Subject: [PATCH] arch/powerpc/setup: Fix reference count issue in pas_setup_mce_regs()
Date: Wed, 16 Nov 2022 19:39:44 +0800
Message-ID: <20221116113944.181197-1-wangxiongfeng2@huawei.com>
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

pci_get_device() will increase the reference count for the returned
pci_dev, and also decrease the reference count for the input parameter
*from* if it is not NULL.

In function pas_setup_mce_regs(), after we break out the loop with 'dev'
not NULL, we need to decrease the reference count of 'dev'. Since
pci_dev_put() can handle the NULL input parameter, we can just add
pci_dev_put() after the loop. Also add pci_dev_put() for another two
pci_get_device().

Fixes: cd7834167ffb ("[POWERPC] pasemi: Print more information at machine check")
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 arch/powerpc/platforms/pasemi/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index 2aef49e04dd4..4799b0a7b727 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -167,6 +167,7 @@ static int __init pas_setup_mce_regs(void)
 		dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa00a, dev);
 		reg++;
 	}
+	pci_dev_put(dev);
 
 	dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa001, NULL);
 	if (dev && reg+4 < MAX_MCE_REGS) {
@@ -183,6 +184,7 @@ static int __init pas_setup_mce_regs(void)
 		mce_regs[reg].addr = pasemi_pci_getcfgaddr(dev, 0xc1c);
 		reg++;
 	}
+	pci_dev_put(dev);
 
 	dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa009, NULL);
 	if (dev && reg+2 < MAX_MCE_REGS) {
@@ -193,6 +195,7 @@ static int __init pas_setup_mce_regs(void)
 		mce_regs[reg].addr = pasemi_pci_getcfgaddr(dev, 0x214);
 		reg++;
 	}
+	pci_dev_put(dev);
 
 	num_mce_regs = reg;
 
-- 
2.20.1

