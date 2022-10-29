Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90866122EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 14:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzzFs3XhTz3dsd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 23:27:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzzFG0Xhcz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 23:27:08 +1100 (AEDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mzz9m4bD7zFq5Z;
	Sat, 29 Oct 2022 20:24:12 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 20:27:02 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 20:27:01 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2] powerpc/fsl_rio: add missing of_node_put() in fsl_rio_setup()
Date: Sat, 29 Oct 2022 20:26:00 +0800
Message-ID: <20221029122600.1514280-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: b24347@freescale.com, yangyingliang@huawei.com, npiggin@gmail.com, alexandre.bounine@idt.com, Gang.Liu@freescale.com, alak@kernel.crashing.org, leoli@freescale.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of node returned by of_find_compatible_node() or for_each_child_of_node()
with refcount decremented, of_node_put() need be called after using it to avoid
refcount leak.

Fixes: abc3aeae3aaa ("fsl-rio: Add two ports and rapidio message units support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Add fix tag.
v1 patch link:
  https://lore.kernel.org/lkml/20220615032137.1878219-1-yangyingliang@huawei.com/
---
 arch/powerpc/sysdev/fsl_rio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index c8f044d62fe2..1b0be4931f18 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -553,6 +553,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		rc = -ENOMEM;
 		goto err_pw;
 	}
+	of_node_put(np);
 	range_start = of_read_number(dt_range, aw);
 	dbell->dbell_regs = (struct rio_dbell_regs *)(rmu_regs_win +
 				(u32)range_start);
@@ -581,6 +582,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		rc = -ENOMEM;
 		goto err;
 	}
+	of_node_put(np);
 	range_start = of_read_number(dt_range, aw);
 	pw->pw_regs = (struct rio_pw_regs *)(rmu_regs_win + (u32)range_start);
 
@@ -590,6 +592,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		if (!port_index) {
 			dev_err(&dev->dev, "Can't get %pOF property 'cell-index'\n",
 					np);
+			of_node_put(np);
 			continue;
 		}
 
@@ -597,6 +600,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		if (!dt_range) {
 			dev_err(&dev->dev, "Can't get %pOF property 'ranges'\n",
 					np);
+			of_node_put(np);
 			continue;
 		}
 
@@ -619,6 +623,7 @@ int fsl_rio_setup(struct platform_device *dev)
 
 		dev_info(&dev->dev, "%pOF: LAW start 0x%016llx, size 0x%016llx.\n",
 				np, range_start, range_size);
+		of_node_put(np);
 
 		port = kzalloc(sizeof(struct rio_mport), GFP_KERNEL);
 		if (!port)
@@ -763,6 +768,7 @@ int fsl_rio_setup(struct platform_device *dev)
 err_dbell:
 	iounmap(rmu_regs_win);
 	rmu_regs_win = NULL;
+	of_node_put(np);
 err_rmu:
 	kfree(ops);
 err_ops:
-- 
2.25.1

