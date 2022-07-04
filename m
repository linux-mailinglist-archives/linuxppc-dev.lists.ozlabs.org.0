Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B85658FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 16:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8296fRDz3bkH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 00:53:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=GxMiFbAL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=GxMiFbAL;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc81X74yKz2ywJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 00:53:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xT7hX
	8rnhUkoYm1cCSs0PcxKO1+TWyDDq30ShnXKxVM=; b=GxMiFbAL58JqpgYrzgwWT
	Un/C4LrFUQNAIeSpYbBAMxDiFF4rsxlwcY+Iv8ScsVxK5QXvUlCg3DCaTGbdWHoy
	TFHwSFltWMeFKaZpPmKLfpJzv5zJoP4bbb9aBUC1ooV/0SDM4n034tFdgPf2TQhJ
	oAjDyfYdbYsAd1HzalfldA=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgAXdXGy_sJiCs7cHA--.24990S2;
	Mon, 04 Jul 2022 22:52:34 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com,
	linmq006@gmail.com
Subject: [PATCH] powerpc: sysdev: fsl_msi: Add missing of_node_put() for of_parse_phandle()
Date: Mon,  4 Jul 2022 22:52:33 +0800
Message-Id: <20220704145233.278539-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgAXdXGy_sJiCs7cHA--.24990S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy5GF15XFyDArWxKFyxAFb_yoWkCrXEy3
	4fuFnrZF4kGw48uFZ3CFZxGwnxWw4jqrWagwnFqa9Fga4YvryDJFsrX3y5Xry5ZrW0krZ5
	GFn8ArsYyw409jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_znQ7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhI0F18RPbfxxQAAsP
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

In fsl_setup_msi_irqs(), we should use of_node_put() for the
refernece 'np' returned by of_parse_phandle() which increases
the refcount.

Fixes: 895d603f945ba ("powerpc/fsl_msi: add support for the fsl, msi property in PCI nodes")
Co-authored-by: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Liang He <windhl@126.com>
---

 There is an incomplete fix: 
 https://lore.kernel.org/all/20220526010935.32138-1-zhengyongjun3@huawei.com/

 We should call of_node_put() both in fail path and normal path.

 arch/powerpc/sysdev/fsl_msi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index ef9a5999fa93..73c2d70706c0 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -209,8 +209,10 @@ static int fsl_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 			dev_err(&pdev->dev,
 				"node %pOF has an invalid fsl,msi phandle %u\n",
 				hose->dn, np->phandle);
+			of_node_put(np);
 			return -EINVAL;
 		}
+		of_node_put(np);
 	}
 
 	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_NOTASSOCIATED) {
-- 
2.25.1

