Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6F630E22
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 11:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDr2K2dPHz3f5G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 21:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDr1n2G0hz3bky
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 21:46:50 +1100 (AEDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NDqxv1xhGzFq83;
	Sat, 19 Nov 2022 18:43:31 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 18:46:42 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<peterhuewe@gmx.de>, <jarkko@kernel.org>, <jgg@ziepe.ca>,
	<adlai@linux.vnet.ibm.com>, <key@linux.vnet.ibm.com>,
	<cuigaosheng1@huawei.com>
Subject: [PATCH] tpm: ibmvtpm: free irq on the error path in tpm_ibmvtpm_probe()
Date: Sat, 19 Nov 2022 18:46:42 +0800
Message-ID: <20221119104642.3964551-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In tpm_ibmvtpm_probe(), vio_dev->irq has not been freed on the
init_irq_cleanup error path, we need to free it. Fix it.

Fixes: 132f76294744 ("drivers/char/tpm: Add new device driver to support IBM vTPM")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/char/tpm/tpm_ibmvtpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index d3989b257f42..8c23aabdfc24 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -649,7 +649,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 			 tpm_ibmvtpm_driver_name, ibmvtpm);
 	if (rc) {
 		dev_err(dev, "Error %d register irq 0x%x\n", rc, vio_dev->irq);
-		goto init_irq_cleanup;
+		goto req_irq_cleanup;
 	}
 
 	rc = vio_enable_interrupts(vio_dev);
@@ -702,6 +702,8 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 
 	return tpm_chip_register(chip);
 init_irq_cleanup:
+	free_irq(vio_dev->irq, ibmvtpm);
+req_irq_cleanup:
 	do {
 		rc1 = plpar_hcall_norets(H_FREE_CRQ, vio_dev->unit_address);
 	} while (rc1 == H_BUSY || H_IS_LONG_BUSY(rc1));
-- 
2.25.1

