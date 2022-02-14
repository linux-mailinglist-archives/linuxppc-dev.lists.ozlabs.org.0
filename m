Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CE4B3ECE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 02:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxmQS68Ydz3cT0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 12:11:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.90.199.4;
 helo=out199-4.us.a.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Mon, 14 Feb 2022 12:11:19 AEDT
Received: from out199-4.us.a.mail.aliyun.com (out199-4.us.a.mail.aliyun.com
 [47.90.199.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxmPz3C7yz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 12:11:18 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0V4JW9p0_1644800759; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V4JW9p0_1644800759) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 14 Feb 2022 09:06:00 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: benh@kernel.crashing.org
Subject: [PATCH] macintosh: Fix warning comparing pointer to 0
Date: Mon, 14 Feb 2022 09:05:58 +0800
Message-Id: <20220214010558.130201-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following coccicheck warnings:
./drivers/macintosh/via-cuda.c:240:16-17: WARNING comparing pointer to 0
./drivers/macintosh/via-cuda.c:243:16-17: WARNING comparing pointer to
0, suggest !E
./drivers/macintosh/via-cuda.c:521:23-24: WARNING comparing pointer to 0

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/macintosh/via-cuda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 3d0d0b9d471d..a9feb7d5a068 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -237,10 +237,10 @@ int __init find_via_cuda(void)
     const u32 *reg;
     int err;
 
-    if (vias != 0)
+    if (vias)
 	return 1;
     vias = of_find_node_by_name(NULL, "via-cuda");
-    if (vias == 0)
+    if (!vias)
 	return 0;
 
     reg = of_get_property(vias, "reg", NULL);
@@ -518,7 +518,7 @@ cuda_write(struct adb_request *req)
     req->reply_len = 0;
 
     spin_lock_irqsave(&cuda_lock, flags);
-    if (current_req != 0) {
+    if (current_req) {
 	last_req->next = req;
 	last_req = req;
     } else {
-- 
2.20.1.7.g153144c

