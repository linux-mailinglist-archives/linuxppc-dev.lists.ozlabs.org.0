Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7F1CB190
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:18:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JXVk4C8LzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 00:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JXKR0JSLzDr7x
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 00:10:16 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EC0DB1A56182C8F5F6C2;
 Fri,  8 May 2020 22:10:00 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 22:09:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Roy.Pledge@nxp.com>, <leoyang.li@nxp.com>, <youri.querry_1@nxp.com>
Subject: [PATCH -next] soc: fsl: dpio: Remove unused inline function
 qbman_write_eqcr_am_rt_register
Date: Fri, 8 May 2020 22:09:47 +0800
Message-ID: <20200508140947.28712-1-yuehaibing@huawei.com>
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

There's no callers in-tree anymore since commit
3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array mode with ring mode enqueue")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 804b8ba9bf5c..e2e9fbb58a72 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -572,18 +572,6 @@ void qbman_eq_desc_set_qd(struct qbman_eq_desc *d, u32 qdid,
 #define EQAR_VB(eqar)      ((eqar) & 0x80)
 #define EQAR_SUCCESS(eqar) ((eqar) & 0x100)
 
-static inline void qbman_write_eqcr_am_rt_register(struct qbman_swp *p,
-						   u8 idx)
-{
-	if (idx < 16)
-		qbman_write_register(p, QBMAN_CINH_SWP_EQCR_AM_RT + idx * 4,
-				     QMAN_RT_MODE);
-	else
-		qbman_write_register(p, QBMAN_CINH_SWP_EQCR_AM_RT2 +
-				     (idx - 16) * 4,
-				     QMAN_RT_MODE);
-}
-
 #define QB_RT_BIT ((u32)0x100)
 /**
  * qbman_swp_enqueue_direct() - Issue an enqueue command
-- 
2.17.1


