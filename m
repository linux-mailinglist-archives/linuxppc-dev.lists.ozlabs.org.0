Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4B570C2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 22:52:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhbgL5Zs3z3c2s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 06:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.22; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 5405 seconds by postgrey-1.36 at boromir; Tue, 12 Jul 2022 06:52:25 AEST
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhbfx0xVcz3c1s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 06:52:22 +1000 (AEST)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id AyrgoNRqsm7vsAyrhoPkTU; Mon, 11 Jul 2022 21:14:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 11 Jul 2022 21:14:42 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] cxl: Use the bitmap API to allocate bitmaps
Date: Mon, 11 Jul 2022 21:14:38 +0200
Message-Id: <59010cc7c62443030c69cb1ce0b2b62c5d47e064.1657566849.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/cxl/context.c | 2 +-
 drivers/misc/cxl/guest.c   | 2 +-
 drivers/misc/cxl/irq.c     | 3 +--
 drivers/misc/cxl/of.c      | 5 ++---
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/cxl/context.c b/drivers/misc/cxl/context.c
index e627b4056623..acaa44809c58 100644
--- a/drivers/misc/cxl/context.c
+++ b/drivers/misc/cxl/context.c
@@ -331,7 +331,7 @@ static void reclaim_ctx(struct rcu_head *rcu)
 		__free_page(ctx->ff_page);
 	ctx->sstp = NULL;
 
-	kfree(ctx->irq_bitmap);
+	bitmap_free(ctx->irq_bitmap);
 
 	/* Drop ref to the afu device taken during cxl_context_init */
 	cxl_afu_put(ctx->afu);
diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
index 3321c014913c..375f692ae9d6 100644
--- a/drivers/misc/cxl/guest.c
+++ b/drivers/misc/cxl/guest.c
@@ -1053,7 +1053,7 @@ static void free_adapter(struct cxl *adapter)
 		if (adapter->guest->irq_avail) {
 			for (i = 0; i < adapter->guest->irq_nranges; i++) {
 				cur = &adapter->guest->irq_avail[i];
-				kfree(cur->bitmap);
+				bitmap_free(cur->bitmap);
 			}
 			kfree(adapter->guest->irq_avail);
 		}
diff --git a/drivers/misc/cxl/irq.c b/drivers/misc/cxl/irq.c
index 5f0e2dcebb34..0ce91d99aead 100644
--- a/drivers/misc/cxl/irq.c
+++ b/drivers/misc/cxl/irq.c
@@ -319,8 +319,7 @@ int afu_allocate_irqs(struct cxl_context *ctx, u32 count)
 	}
 
 	ctx->irq_count = count;
-	ctx->irq_bitmap = kcalloc(BITS_TO_LONGS(count),
-				  sizeof(*ctx->irq_bitmap), GFP_KERNEL);
+	ctx->irq_bitmap = bitmap_zalloc(count, GFP_KERNEL);
 	if (!ctx->irq_bitmap)
 		goto out;
 
diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index 1cfecba42d01..25ce725035e7 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -308,8 +308,7 @@ static int read_adapter_irq_config(struct cxl *adapter, struct device_node *np)
 		cur = &adapter->guest->irq_avail[i];
 		cur->offset = be32_to_cpu(ranges[i * 2]);
 		cur->range  = be32_to_cpu(ranges[i * 2 + 1]);
-		cur->bitmap = kcalloc(BITS_TO_LONGS(cur->range),
-				sizeof(*cur->bitmap), GFP_KERNEL);
+		cur->bitmap = bitmap_zalloc(cur->range, GFP_KERNEL);
 		if (cur->bitmap == NULL)
 			goto err;
 		if (cur->offset < adapter->guest->irq_base_offset)
@@ -326,7 +325,7 @@ static int read_adapter_irq_config(struct cxl *adapter, struct device_node *np)
 err:
 	for (i--; i >= 0; i--) {
 		cur = &adapter->guest->irq_avail[i];
-		kfree(cur->bitmap);
+		bitmap_free(cur->bitmap);
 	}
 	kfree(adapter->guest->irq_avail);
 	adapter->guest->irq_avail = NULL;
-- 
2.34.1

