Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B3855A895
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 11:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVTtk6TWBz3cfM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 19:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.128; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr [80.12.242.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVTtL0JZdz3bm7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 19:57:11 +1000 (AEST)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 52Q2oyvoAP8Ap52Q2oqOnW; Sat, 25 Jun 2022 11:49:36 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 25 Jun 2022 11:49:36 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] powerpc/xive: Fix some incorrect memory allocation
Date: Sat, 25 Jun 2022 11:49:31 +0200
Message-Id: <2ebb28e9de76d35b75c137f9944c2dfd893d34fa.1656150559.git.christophe.jaillet@wanadoo.fr>
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

'xibm->count' really looks like a number of bits (see how it is used in
__xive_irq_bitmap_alloc()), so use the bitmap API to allocate and free this
bitmap.

This improves semantic and potentially avoids some over memory allocation.

Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I don't cross compile, so this patch is NOT compile-tested.
---
 arch/powerpc/sysdev/xive/spapr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 7d5128676e83..fdbebb14b7de 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -57,7 +57,7 @@ static int __init xive_irq_bitmap_add(int base, int count)
 	spin_lock_init(&xibm->lock);
 	xibm->base = base;
 	xibm->count = count;
-	xibm->bitmap = kzalloc(xibm->count, GFP_KERNEL);
+	xibm->bitmap = bitmap_zalloc(xibm->count, GFP_KERNEL);
 	if (!xibm->bitmap) {
 		kfree(xibm);
 		return -ENOMEM;
@@ -75,7 +75,7 @@ static void xive_irq_bitmap_remove_all(void)
 
 	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
 		list_del(&xibm->list);
-		kfree(xibm->bitmap);
+		bitmap_free(xibm->bitmap);
 		kfree(xibm);
 	}
 }
-- 
2.34.1

