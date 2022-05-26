Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C22AE53482B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7r3d5fx5z3bkZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 11:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhengyongjun3@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 932 seconds by postgrey-1.36 at boromir; Thu, 26 May 2022 11:30:16 AEST
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7r3D2h1qz2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 11:30:11 +1000 (AEST)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L7qj23hMwzDqQZ;
	Thu, 26 May 2022 09:14:30 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 09:14:34 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] powerpc: Fix refcount leak in fsl_setup_msi_irqs
Date: Thu, 26 May 2022 01:09:35 +0000
Message-ID: <20220526010935.32138-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500013.china.huawei.com (7.221.188.120)
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
Cc: paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_parse_phandle() returns a node pointer with refcount incremented,
we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 895d603f945ba ("powerpc/fsl_msi: add support for the fsl, msi property in PCI nodes")
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 arch/powerpc/sysdev/fsl_msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index b3475ae9f236..dcc6c8997b09 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -207,6 +207,7 @@ static int fsl_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 			dev_err(&pdev->dev,
 				"node %pOF has an invalid fsl,msi phandle %u\n",
 				hose->dn, np->phandle);
+			of_node_put(np);
 			return -EINVAL;
 		}
 	}
-- 
2.17.1

