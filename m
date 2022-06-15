Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769AB54C003
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 05:12:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN9Mc1sJrz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 13:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LN9M81GpYz3035
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 13:11:44 +1000 (AEST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LN9H90T2wzRjYq;
	Wed, 15 Jun 2022 11:08:21 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 11:11:23 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 15 Jun
 2022 11:11:22 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next] powerpc/fsl_rio: add missing of_node_put() in fsl_rio_setup()
Date: Wed, 15 Jun 2022 11:21:37 +0800
Message-ID: <20220615032137.1878219-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_compatible_node() and for_each_child_of_node() will increase
the refcount of 'np', so add of_node_put() after using it to avoid
refcount leak.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 arch/powerpc/sysdev/fsl_rio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 1bfc9afa8a1a..97bbecb259dc 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -542,9 +542,11 @@ int fsl_rio_setup(struct platform_device *dev)
 	if (!dt_range) {
 		pr_err("%pOF: unable to find 'reg' property\n",
 			np);
+		of_node_put(np);
 		rc = -ENOMEM;
 		goto err_pw;
 	}
+	of_node_put(np);
 	range_start = of_read_number(dt_range, aw);
 	dbell->dbell_regs = (struct rio_dbell_regs *)(rmu_regs_win +
 				(u32)range_start);
@@ -570,9 +572,11 @@ int fsl_rio_setup(struct platform_device *dev)
 	if (!dt_range) {
 		pr_err("%pOF: unable to find 'reg' property\n",
 			np);
+		of_node_put(np);
 		rc = -ENOMEM;
 		goto err;
 	}
+	of_node_put(np);
 	range_start = of_read_number(dt_range, aw);
 	pw->pw_regs = (struct rio_pw_regs *)(rmu_regs_win + (u32)range_start);
 
@@ -582,6 +586,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		if (!port_index) {
 			dev_err(&dev->dev, "Can't get %pOF property 'cell-index'\n",
 					np);
+			of_node_put(np);
 			continue;
 		}
 
@@ -589,6 +594,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		if (!dt_range) {
 			dev_err(&dev->dev, "Can't get %pOF property 'ranges'\n",
 					np);
+			of_node_put(np);
 			continue;
 		}
 
@@ -611,6 +617,7 @@ int fsl_rio_setup(struct platform_device *dev)
 
 		dev_info(&dev->dev, "%pOF: LAW start 0x%016llx, size 0x%016llx.\n",
 				np, range_start, range_size);
+		of_node_put(np);
 
 		port = kzalloc(sizeof(struct rio_mport), GFP_KERNEL);
 		if (!port)
-- 
2.25.1

