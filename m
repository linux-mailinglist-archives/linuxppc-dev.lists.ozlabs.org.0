Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 967651CB23F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:47:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JY8M0Kf2zDqgs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 00:47:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JY5L6LKTzDqDG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 00:44:53 +1000 (AEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5CB18DFBFAE8AAA0CC89;
 Fri,  8 May 2020 22:09:24 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 22:09:15 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <leoyang.li@nxp.com>, <roy.pledge@nxp.com>
Subject: [PATCH -next] soc: fsl: qbman: Remove unused inline function
 qm_eqcr_get_ci_stashing
Date: Fri, 8 May 2020 22:08:46 +0800
Message-ID: <20200508140846.47608-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.166.215.154]
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no callers in-tree anymore.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/fsl/qbman/qman.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 1e164e03410a..9888a7061873 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -449,11 +449,6 @@ static inline int qm_eqcr_init(struct qm_portal *portal,
 	return 0;
 }
 
-static inline unsigned int qm_eqcr_get_ci_stashing(struct qm_portal *portal)
-{
-	return (qm_in(portal, QM_REG_CFG) >> 28) & 0x7;
-}
-
 static inline void qm_eqcr_finish(struct qm_portal *portal)
 {
 	struct qm_eqcr *eqcr = &portal->eqcr;
-- 
2.17.1


