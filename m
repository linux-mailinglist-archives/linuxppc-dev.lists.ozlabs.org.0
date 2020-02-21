Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 976841678D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 09:56:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P50w647kzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 19:56:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48P4xd6GTgzDqDG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 19:53:35 +1100 (AEDT)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C9E63AF9379C8FF77510;
 Fri, 21 Feb 2020 16:37:15 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Fri, 21 Feb 2020
 16:37:07 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Roy.Pledge@nxp.com>, <leoyang.li@nxp.com>, <youri.querry_1@nxp.com>
Subject: [PATCH -next] soc: fsl: dpio: remove set but not used variable
 'addr_cena'
Date: Fri, 21 Feb 2020 16:36:37 +0800
Message-ID: <20200221083637.13392-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
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

commit 3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array
mode with ring mode enqueue") introduced this, but not
used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 740ee0d..350de56 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -658,7 +658,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 	const uint32_t *cl = (uint32_t *)d;
 	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
 	int i, num_enqueued = 0;
-	uint64_t addr_cena;
 
 	spin_lock(&s->access_spinlock);
 	half_mask = (s->eqcr.pi_ci_mask>>1);
@@ -711,7 +710,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 
 	/* Flush all the cacheline without load/store in between */
 	eqcr_pi = s->eqcr.pi;
-	addr_cena = (size_t)s->addr_cena;
 	for (i = 0; i < num_enqueued; i++)
 		eqcr_pi++;
 	s->eqcr.pi = eqcr_pi & full_mask;
@@ -822,7 +820,6 @@ int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
 	const uint32_t *cl;
 	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
 	int i, num_enqueued = 0;
-	uint64_t addr_cena;
 
 	half_mask = (s->eqcr.pi_ci_mask>>1);
 	full_mask = s->eqcr.pi_ci_mask;
@@ -866,7 +863,6 @@ int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
 
 	/* Flush all the cacheline without load/store in between */
 	eqcr_pi = s->eqcr.pi;
-	addr_cena = (uint64_t)s->addr_cena;
 	for (i = 0; i < num_enqueued; i++)
 		eqcr_pi++;
 	s->eqcr.pi = eqcr_pi & full_mask;
-- 
2.7.4


