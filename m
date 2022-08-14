Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE95920FA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 17:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5LyH04vLz3bly
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 01:32:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nY0kgGKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nY0kgGKT;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5Lxh6BSJz2xHD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 01:32:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 140B060C05;
	Sun, 14 Aug 2022 15:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B9C43142;
	Sun, 14 Aug 2022 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660491126;
	bh=g97XD/pgPbqJ4VwO4uV+VBUuGwCDEvgLc1WAUiTfTeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nY0kgGKTzImmryas4nlg75cGBt4h6fi0HhAWwxt7z2pvLKhoxLVRTECZw0ZRU4g2n
	 nPmK7gzyhvSp9UzQEushcbB7cRuv1+bSPXDpdxGEZcj5UQxXr0dw9uKRw8Mqyd4QTJ
	 69MBpFimqPIqY2rSqdph+bhFThGpqvRYPN2DonY18ZGTbkAp86vNaKmSQJgyt53QYz
	 lL92Z0QZohUbHqALOBA/EWQY2kIwNFuro+eDysW9CHYXh/ekcShiAykLp27NRzKFB5
	 0sYmpyoLAWfqCpCxy1KS91gcscf8yUBvG0cOqAdsxtE8UWuocbrxVDn4ebhYuaXpxL
	 4UdvAAddxxSsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 36/56] cxl: Fix a memory leak in an error handling path
Date: Sun, 14 Aug 2022 11:30:06 -0400
Message-Id: <20220814153026.2377377-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153026.2377377-1-sashal@kernel.org>
References: <20220814153026.2377377-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 3a15b45b5454da862376b5d69a4967f5c6fa1368 ]

A bitmap_zalloc() must be balanced by a corresponding bitmap_free() in the
error handling path of afu_allocate_irqs().

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/ce5869418f5838187946eb6b11a52715a93ece3d.1657566849.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/misc/cxl/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/cxl/irq.c b/drivers/misc/cxl/irq.c
index 4cb829d5d873..2e4dcfebf19a 100644
--- a/drivers/misc/cxl/irq.c
+++ b/drivers/misc/cxl/irq.c
@@ -349,6 +349,7 @@ int afu_allocate_irqs(struct cxl_context *ctx, u32 count)
 
 out:
 	cxl_ops->release_irq_ranges(&ctx->irqs, ctx->afu->adapter);
+	bitmap_free(ctx->irq_bitmap);
 	afu_irq_name_free(ctx);
 	return -ENOMEM;
 }
-- 
2.35.1

