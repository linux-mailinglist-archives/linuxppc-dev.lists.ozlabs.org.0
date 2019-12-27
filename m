Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA712B7BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2019 18:51:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47kvWg6KLvzDqF6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2019 04:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRtqvqAk"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47kvL90v0JzDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2019 04:42:57 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55E132173E;
 Fri, 27 Dec 2019 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577468575;
 bh=kZlyWVfDQ/Il/ZTXyaCcECiQi49gcTd2X7UKT7IULYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bRtqvqAktjBMPULcz8XwlXizIn2F5J7R7PXoVf6msmzZ/Ru6ysn9W2gKJwtst4Vqe
 bpmj2pEUpFS6iwgNgKjH55AAT3L33tCji8raOKo9SDciJK/o5t1TnUxFBotxLZ4gDS
 BcxEMRBLUsgbuoZd+Zo/5N/Wf1nkOPGimJ8lRIVY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 099/187] ocxl: Fix potential memory leak on
 context creation
Date: Fri, 27 Dec 2019 12:39:27 -0500
Message-Id: <20191227174055.4923-99-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

[ Upstream commit 913e73c77d48aeeb50c16450a653dca9c71ae2e2 ]

If we couldn't fully init a context, we were leaking memory.

Fixes: b9721d275cc2 ("ocxl: Allow external drivers to use OpenCAPI contexts")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191209105513.8566-1-fbarrat@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/misc/ocxl/context.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
index 994563a078eb..de8a66b9d76b 100644
--- a/drivers/misc/ocxl/context.c
+++ b/drivers/misc/ocxl/context.c
@@ -10,18 +10,17 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
 	int pasid;
 	struct ocxl_context *ctx;
 
-	*context = kzalloc(sizeof(struct ocxl_context), GFP_KERNEL);
-	if (!*context)
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
 		return -ENOMEM;
 
-	ctx = *context;
-
 	ctx->afu = afu;
 	mutex_lock(&afu->contexts_lock);
 	pasid = idr_alloc(&afu->contexts_idr, ctx, afu->pasid_base,
 			afu->pasid_base + afu->pasid_max, GFP_KERNEL);
 	if (pasid < 0) {
 		mutex_unlock(&afu->contexts_lock);
+		kfree(ctx);
 		return pasid;
 	}
 	afu->pasid_count++;
@@ -43,6 +42,7 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
 	 * duration of the life of the context
 	 */
 	ocxl_afu_get(afu);
+	*context = ctx;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ocxl_context_alloc);
-- 
2.20.1

