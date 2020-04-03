Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63619D529
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:41:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48txLQ1wKmzDrQM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:41:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=zhengyongjun3@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 1309 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 18:57:32 AEDT
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tsjS0ZdpzDr7s
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:57:27 +1100 (AEDT)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 458DD3DE9BAFA430ADE7;
 Fri,  3 Apr 2020 15:35:35 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Apr 2020 15:35:27 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <leoyang.li@nxp.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] qbman: Remove set but not used variable 'err'
Date: Fri, 3 Apr 2020 15:35:27 +0800
Message-ID: <1585899327-2690-1-git-send-email-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Apr 2020 21:39:51 +1100
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>, network <network@ubuntu.network>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: network <network@ubuntu.network>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/soc/fsl/qbman/bman.c:640:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]
  int err = 0;
      ^~~
err is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
Signed-off-by: network <network@ubuntu.network>
---
 drivers/soc/fsl/qbman/bman.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/fsl/qbman/bman.c b/drivers/soc/fsl/qbman/bman.c
index f4fb527..0a24433 100644
--- a/drivers/soc/fsl/qbman/bman.c
+++ b/drivers/soc/fsl/qbman/bman.c
@@ -637,7 +637,6 @@ int bman_p_irqsource_add(struct bman_portal *p, u32 bits)
 
 int bm_shutdown_pool(u32 bpid)
 {
-	int err = 0;
 	struct bm_mc_command *bm_cmd;
 	union bm_mc_result *bm_res;
 
@@ -650,7 +649,6 @@ int bm_shutdown_pool(u32 bpid)
 		bm_mc_commit(&p->p, BM_MCC_VERB_CMD_ACQUIRE | 1);
 		if (!bm_mc_result_timeout(&p->p, &bm_res)) {
 			pr_crit("BMan Acquire Command timedout\n");
-			err = -ETIMEDOUT;
 			goto done;
 		}
 		if (!(bm_res->verb & BM_MCR_VERB_ACQUIRE_BUFCOUNT)) {
-- 
2.7.4

