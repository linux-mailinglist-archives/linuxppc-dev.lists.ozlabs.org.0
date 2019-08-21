Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A728E973CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 09:47:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D0BY3vQVzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 17:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D08p0hVgzDr6Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 17:46:15 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9760FDF27863EA7C08B9;
 Wed, 21 Aug 2019 15:46:10 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 15:46:02 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <leoyang.li@nxp.com>, <roy.pledge@nxp.com>,
 <linuxppc-dev@lists.ozlabs.org>, <madalin.bucur@nxp.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] soc/fsl/qbman: fix return value error in bm_shutdown_pool()
Date: Wed, 21 Aug 2019 16:06:49 +0800
Message-ID: <20190821080649.34133-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
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
Cc: Jason Yan <yanaijie@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 0505d00c8dba ("soc/fsl/qbman: Cleanup buffer pools if BMan was
initialized prior to bootup") defined a new variable to store the return
error, but forgot to return this value at the end of the function.

Fixes: 0505d00c8dba ("soc/fsl/qbman: Cleanup buffer pools if BMan was initialized prior to bootup")
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/soc/fsl/qbman/bman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/bman.c b/drivers/soc/fsl/qbman/bman.c
index f4fb527d8301..c5dd026fe889 100644
--- a/drivers/soc/fsl/qbman/bman.c
+++ b/drivers/soc/fsl/qbman/bman.c
@@ -660,7 +660,7 @@ int bm_shutdown_pool(u32 bpid)
 	}
 done:
 	put_affine_portal();
-	return 0;
+	return err;
 }
 
 struct gen_pool *bm_bpalloc;
-- 
2.17.2

