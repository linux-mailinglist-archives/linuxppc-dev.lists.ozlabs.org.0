Return-Path: <linuxppc-dev+bounces-7670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35444A8A2F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 17:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcSvn1wPNz3blb;
	Wed, 16 Apr 2025 01:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744731445;
	cv=none; b=IneWFyd60raozJmm/mQL36kVsCH+NdqrANW5rdXdMUGlqXZi92zb7NlJK9IhLyXJM1BGfYtNihvhxC2ZaHiWD4bLaWtO6dqUCjYnfll0dlRvZEEwAghzXRKOOHl5yob8oLBymWcTkhclI7RziHEXiUn2pVEazWle8FlUVXaVqYXn9R8Lb1omdFYEnt19FvGBZp70SyQ5XjFBe0iP57b0kCHm7QrhyWDporDJAG+hgwOsZhx7Cajz9cxg86LrYA//Y21P199938ffAn3QWQYEnHCeT9oVBEqIgPqplpowWfosJ2qbwXvYFLA/XVmyCBM6Bt95zwWMMNw4xAHjiSZJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744731445; c=relaxed/relaxed;
	bh=SPu7srPL9By2zZEVIfL1Lj4E5YPu0Ndbglz1s4g9Cc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meoJdAIPRX3f7NK7NhEBm5ef0AXqy/shMNc9S3Ab8SYsSGl4lDf6gyZCmHOK7khkAt8gQsumV91IHz7Clj8CeUHqtXqz1LhwxOQ0VBehu+5SF6cI7aUbSCin9JJL8Kw1yjK1x5jKiuV6YsBNE8KrWcF/Qzn3fSLCBtDYizCYVMMUlgWbLOpZTOGLPh/cxksrIUY+kWMK6SQMq/nxy5mj/tY0czAFFmsg/p+fwen6L0gLoKMSRg7Dz8d0wKdycItI0tSTtW3psfcpOBeG81I0u7c1fromwRpCxTtNULazvz+Uw1n7oPjggB/j1OWTnZ413B2vuXhZPDp+zpKaTl8hGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JzJSNSwW; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JzJSNSwW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcSvk49tqz3blc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 01:37:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4C964A3F6;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89651C4CEF5;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=BXUeJzaOPu6wdBqkrzRH/yMdh5em9BF7TrNPfXAEkdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JzJSNSwW1P5Il90YgnnI/8kNQAi/MxhGxCnW4IJvmxBzldDz2BxVdp6eFk/VfZkoN
	 0VCZSNOPkpx9267K5Qm/v+ydkhNxlP02vtdxLC/T9tOMbqnbjF7O7LvZVoFM5kssWR
	 gSxDIEVZrhrQqBl0Fdo0nKvGFwIgFS4DkuhIEvPa2jpLoG6I/dIgYQjiK/8PWHEP0q
	 txdISMHQyZ2PK42lt3c3jKdAWRupthIZPbEvlZLQLqbXHL5TnunV6oBqhQO+Ro1pfR
	 7BskaEU0gQHEzcd+qjBJLZlC2/c9V4LdbH8lfVHfFfM5JcND2y9uRoOEl5wnNI8SJt
	 vjMEveyFIGojg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA63C369BA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:37:00 +0000
Subject: [PATCH v2 6/6] i2c: pasemi: Log bus reset causes
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=VA1WhVX4Izvudq5u7eRf2fGXelyMPNY/3NDm2fN5raU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/Wq19l7xza3jP7jSI+u++w+7L/V2srnF6Fyb/Wj4xQ
 Wxp+pKOjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEtjEzMtx+KuJdcOrOkUlJ
 rxm8+9rvPi4Wl21gUd+fq73jnISu6A5GhlebAySynZqu/S4pmjq5XUPuoEygj/TT0tth2o+mXug
 S5AcA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hector Martin <marcan@marcan.st>

This ensures we get all information we need to debug issues when users
forward us their logs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 41db38d82fe62c73614b8fafe4cb73c7d1a24762..e5e8a748638f02e48d6ffa65e49aff5b12f70e06 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -22,6 +22,7 @@
 /* Register offsets */
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
+#define REG_XFSTA	0x0c
 #define REG_SMSTA	0x14
 #define REG_IMASK	0x18
 #define REG_CTL		0x1c
@@ -89,7 +90,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
-	unsigned int status;
+	unsigned int status, xfstatus;
 	int ret;
 
 	/* First wait for the bus to go idle */
@@ -98,7 +99,9 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 				 USEC_PER_MSEC, USEC_PER_MSEC * TRANSFER_TIMEOUT_MS);
 
 	if (ret < 0) {
-		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		xfstatus = reg_read(smbus, REG_XFSTA);
+		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		return -EIO;
 	}
 

-- 
2.34.1



