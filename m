Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50643DC6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfyTJ5r0xz2yPP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 18:52:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=cuibixuan@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Thu, 28 Oct 2021 18:33:47 AEDT
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfy3b3XzSz2yHq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 18:33:46 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=cuibixuan@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0UtytgLk_1635406102; 
Received: from VM20210331-25.tbsite.net(mailfrom:cuibixuan@linux.alibaba.com
 fp:SMTPD_---0UtytgLk_1635406102) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 28 Oct 2021 15:28:27 +0800
From: Bixuan Cui <cuibixuan@linux.alibaba.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -next] powerpc/44x/fsp2: add missing of_node_put
Date: Thu, 28 Oct 2021 15:28:22 +0800
Message-Id: <1635406102-88719-1-git-send-email-cuibixuan@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 28 Oct 2021 18:51:39 +1100
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
Cc: cuibixuan@linux.alibaba.com, ivan@de.ibm.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Early exits from for_each_compatible_node() should decrement the
node reference counter.  Reported by Coccinelle:

./arch/powerpc/platforms/44x/fsp2.c:206:1-25: WARNING: Function
"for_each_compatible_node" should have of_node_put() before return
around line 218.

Fixes: 7813043e1bbc ("powerpc/44x/fsp2: Add irq error handlers")
Signed-off-by: Bixuan Cui <cuibixuan@linux.alibaba.com>
---
 arch/powerpc/platforms/44x/fsp2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index b299e43..823397c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -208,6 +208,7 @@ static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
 		if (irq == NO_IRQ) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
+			of_node_put(np);
 			return;
 		}
 
@@ -215,6 +216,7 @@ static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
+			of_node_put(np);
 			return;
 		}
 	}
-- 
1.8.3.1

