Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51479637B87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 15:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJ0tt1Dfsz3f44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 01:36:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJ0tG4Fxgz3cMx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 01:36:22 +1100 (AEDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJ0n11Vq6zqScT;
	Thu, 24 Nov 2022 22:31:49 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 22:35:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 24 Nov
 2022 22:35:45 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>
Subject: [PATCH v3] powerpc/fsl_rio: add missing of_node_put() in fsl_rio_setup()
Date: Thu, 24 Nov 2022 22:33:57 +0800
Message-ID: <20221124143357.569310-1-yangyingliang@huawei.com>
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
Cc: yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of node returned by of_find_compatible_node() with refcount
decremented, of_node_put() need be called after using it to avoid
refcount leak.

Fixes: abc3aeae3aaa ("fsl-rio: Add two ports and rapidio message units support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2 -> v3:
  drop of_node_put() in loop for_each_child_of_node(), it's not needed.

v1 -> v2:
  Add fix tag.

v1 patch link:
  https://lore.kernel.org/lkml/20220615032137.1878219-1-yangyingliang@huawei.com/
---
 arch/powerpc/sysdev/fsl_rio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index c8f044d62fe2..1ad962d3060e 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -550,12 +550,13 @@ int fsl_rio_setup(struct platform_device *dev)
 	if (!dt_range) {
 		pr_err("%pOF: unable to find 'reg' property\n",
 			np);
 		rc = -ENOMEM;
 		goto err_pw;
 	}
+	of_node_put(np);
 	range_start = of_read_number(dt_range, aw);
 	dbell->dbell_regs = (struct rio_dbell_regs *)(rmu_regs_win +
 				(u32)range_start);
 
 	/*set up port write node*/
 	np = of_find_compatible_node(NULL, NULL, "fsl,srio-port-write-unit");
@@ -578,12 +579,13 @@ int fsl_rio_setup(struct platform_device *dev)
 	if (!dt_range) {
 		pr_err("%pOF: unable to find 'reg' property\n",
 			np);
 		rc = -ENOMEM;
 		goto err;
 	}
+	of_node_put(np);
 	range_start = of_read_number(dt_range, aw);
 	pw->pw_regs = (struct rio_pw_regs *)(rmu_regs_win + (u32)range_start);
 
 	/*set up ports node*/
 	for_each_child_of_node(dev->dev.of_node, np) {
 		port_index = of_get_property(np, "cell-index", NULL);
@@ -760,12 +762,13 @@ int fsl_rio_setup(struct platform_device *dev)
 err_pw:
 	kfree(dbell);
 	dbell = NULL;
 err_dbell:
 	iounmap(rmu_regs_win);
 	rmu_regs_win = NULL;
+	of_node_put(np);
 err_rmu:
 	kfree(ops);
 err_ops:
 	iounmap(rio_regs_win);
 	rio_regs_win = NULL;
 err_rio_regs:
-- 
2.25.1

