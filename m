Return-Path: <linuxppc-dev+bounces-6394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709EA40BEB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 23:47:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0hvj1QC0z2yy9;
	Sun, 23 Feb 2025 09:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740231881;
	cv=none; b=EQ1Y3DT/l71A31lU0bioo4ItYc3o1rNrSxYAB0XiFxOQCRC7oT89CRWKYIHSahmlSC9kWgVvZw70kcL9Bgt3C2/sHEWYRIH70IN/Dsi9OWKV2idIONxAUme7WiV4aJ1WOImE9ENtq+3rO4UCKbOx+LvLKm0YX11ON+GT1FZ6RuR6ssM+5ctraGnrXadx9EQNj0lXe2XQC4x/POLOQoFwMLQ7+gyY9k/InqDFc/+3BRQ71q1RaNbyaY8nChVB9rBKkyRV14urArulAI5+TndT+i03N0oI2UE6Fo7iIRxigRCEqAniE3U4AmF9yjVDVhkkGjXiZZgFmfSzY98ZMpAklg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740231881; c=relaxed/relaxed;
	bh=s168HX2y2tjF7cTtvq4FItoQMlDg2AHXO+wYtF4ZRYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf5BvyQIhpzXGBnyaUhw2e4mFcD4U84tr0YC0pZrP7IwkIz/ht1wlBO+VUnS3rwNq9sJdgGyd8gyuHaFYf1+o2PO/Tn/D8XFdFWJc9/Qi8G1TLHvdMQYQ1tY1rjnCv1SQmOA3Y/nN9arCE450sKAsxrlJe2Isa66pcb5oEpFEVLS42tQli1YEaD69LbeVdSsQB+f4oUnnWTpP8mqZg4WoZJGsd3IT3UU1xY1FBz0enS0R/spoB40RkCj48ZoO6ccsPiwKA/OhyNnLqIiVe4pJd7p1FPov6OTdE/GHjQ7q0p/gdIJn+FlFER4S1ubRekXCFuxDgzXKotbo7sRkd7bBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nC6VFvdj; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nC6VFvdj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 353 seconds by postgrey-1.37 at boromir; Sun, 23 Feb 2025 00:44:39 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0Ssg6xplz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2025 00:44:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDA736115C;
	Sat, 22 Feb 2025 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F325C4CEEC;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=8Zkxgch9g5+DTeW63q//4eNTvjzsWBLujizGZ2Rb/XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nC6VFvdjzBsZDWH5RX70Kx6s9SAooZ8ghZyHjSSeXQPwlCjS5qFhlH+WnzNANaYf6
	 26OHYklHnhoasCg2j2Xx4DwkpoQ4kRotv7CQN0HcWZlH/uW+sBDpPha0+8nQAq5V2X
	 RXy6gk8iE0C66rvbffgrw0PaKw0/NJXk5og/r2Zfx7c7JYCy4mpXOz13sP0J23+5sT
	 SjGYQolx0YS0O61HXeHM/9FKywwA+0L4fY4V5MaV7YzoTNxc77PoXffOUcznP+T5PS
	 goPAwG3EU+EHSPGsqBz0ghfJqPn3OsxAm7n0kfTOlFpDL1QDtA97eP3lgyj37g7N/u
	 bC5UMNCWiD2hA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74951C021B8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:36 +0000
Subject: [PATCH 4/4] i2c: pasemi: Log bus reset causes
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
Message-Id: <20250222-pasemi-fixes-v1-4-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Jxw9FakomFtq1Asfv39ujqR2viJkk3GlzvSkFwhw82g=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy/G9bPs878o/+CTRkbdfmm/Lhezdx5g13m4KbKiT/
 8G38L5BRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiGxQZ/qnyVAicXbnM/M1T
 hl+P9OxCS5f+WvFccDXf9t2Pfm+YK5DG8D+rcuO/gvTpxdKxP2UqBZRYb+95m3Jgi/zta3tq3zI
 JZbIAAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_XBL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Hector Martin <marcan@marcan.st>

This ensures we get all information we need to debug issues when users
forward us their logs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 8f0ba975172f..ae0181a76470 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -21,6 +21,7 @@
 /* Register offsets */
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
+#define REG_XFSTA	0x0c
 #define REG_SMSTA	0x14
 #define REG_IMASK	0x18
 #define REG_CTL		0x1c
@@ -84,7 +85,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
-	unsigned int status;
+	unsigned int status, xfstatus;
 	int timeout = TRANSFER_TIMEOUT_MS;
 
 	status = reg_read(smbus, REG_SMSTA);
@@ -95,15 +96,21 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 		status = reg_read(smbus, REG_SMSTA);
 	}
 
+	xfstatus = reg_read(smbus, REG_XFSTA);
+
 	if (timeout < 0) {
-		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		return -EIO;
 	}
 
 	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
 	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
-		!(status & SMSTA_MTE))
+		!(status & SMSTA_MTE)) {
+		dev_warn(smbus->dev, "Issuing reset due to status 0x%08x (xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		pasemi_reset(smbus);
+	}
 
 	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);

-- 
2.34.1



