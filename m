Return-Path: <linuxppc-dev+bounces-8055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827EFA9E2BA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 13:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlkt63775z2xHT;
	Sun, 27 Apr 2025 21:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745753470;
	cv=none; b=NibCbisgI+AI2CHIZmKMMOmAFYsc1t+9AloTzijHoCWEWHA4bOgkGsQQM3oQV58sE/4Tc4DOr54XgTTEU9PaOaKUm6GqIRIvwjmh3jL/zXBLwCaixmm8JMDuKxooAz4fYvpCCLlZ/FCqrDkEtmKNa+cWFM9E4kKeRBwV00PdvGMqJD1iRGJ0UDCxqa3tvIF6+QoWcu5xKXErLeqzHWxw1POL27h/k/zDo5St0RSVBxiguro4locuQL4I3dhdvSjAjWMJ7/AgFsgk0FVvjeoK2DAC0pnrVT41ETrz8Istfsc9cfxe912dQUEVDD2EDOQSyk4HtmOzBg9RREhQtFLAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745753470; c=relaxed/relaxed;
	bh=2CQIYKRgSF4RFgldc6fEZrCFAkkpPEe7pUCqBuW5v2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+U2lQmkFD9w8/flUIZTjq1NAMTACjjoAExXEFjhwBJ1Jn/ixs9/pU1ZmbPnlzbYV7dlDxb3cJGkrCkhRUlstZPUlKR+BZKKDGLhCiHhM5eJ1hYEcv407SRsw02bnT1ALPm2YohjD/gInZWQM2aShsJTKqWeKF9OFh45Uo+aooI9G2+SPy9bN9KZlRKeYU1JnSEtY11ulolBS4s7BqxHn7RY6gAVLN6VZawHpAXWP9wI2/cRYm8FaSxWWO9xFeBC8W6MUVmx7xIlWUizKmm1IdLI0BklF2X/7xeVYIK5Bq6kZ0abi33juX1dbkHJ5mZqdqk4/BPYM33bKS+SvnccEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qfaV6dGI; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qfaV6dGI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlkt44BpVz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 21:31:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 765ED68444;
	Sun, 27 Apr 2025 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF2E5C4AF0C;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=jlJuPXHBo4V6kE+SAD+mznONPEWYXzJs3olM8EU6rcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qfaV6dGI2WDYnpHvfNWbbQPBT7ZfegJjbadpA2H4Cw2OdIzGpRNF3zSoG6w3TVYE1
	 kEgCj2kimyUIdFI4mMtgayVuwe1IA567FoRR7DOqlHQL0ct+Zc7jQSn8XiwbF/6Kwr
	 CUc62jd7aNVfx1NCXrSUZLib7BNx9cssTu3fv2ADWsuPTBydgHZuWhA3Ep7f4rzQHg
	 WLrQeMECdTmXwLSWD3wlcjy1BkDRR6FJ7330Qa2p00ciHHrsBnM/3oTG09BpPJQfRL
	 Ou5v1at6TS9MobPnlJwH4/g/E9LOYLHn/Xt5SIFOH4YIuG9RUT4B2qolUoIKuHER2Q
	 JL9Cc5CJjJeng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29C6C3ABA1;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:46 +0000
Subject: [PATCH v3 4/4] i2c: pasemi: Log bus reset causes
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
Message-Id: <20250427-pasemi-fixes-v3-4-af28568296c0@svenpeter.dev>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=nRlmnXOqgPKLCOyL2YLd20qO5WoVbBnMs4FETTpxuT0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaNkZs3Xm+Uc2HqnaujX3wlmuf03pS3wKklQ7jgs8V
 BEKbgzuKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEwkSoCRoe3lrfgzK9alnTzR
 d2rmUuMbDCpCXdXT70tf3vTUUX9q0yxGhlNHouR9UuSX7eNuUgib6ON3wELfcflEo8f23nPvry0
 9wAAA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
 drivers/i2c/busses/i2c-pasemi-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index dad20ee0c6689eda309cb0374aa75b42669cbcdc..f4eca44ed18395331a366537bd06f2eb3ba08e21 100644
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
@@ -99,14 +100,18 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 				 USEC_PER_MSEC * PASEMI_TRANSFER_TIMEOUT_MS);
 
 	if (ret < 0) {
-		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, reg_read(smbus, REG_XFSTA));
 		return -EIO;
 	}
 
 	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
 	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
-	    !(status & SMSTA_MTE))
+	    !(status & SMSTA_MTE)) {
+		dev_warn(smbus->dev, "Issuing reset due to status 0x%08x (xfstatus 0x%08x)\n",
+			 status, reg_read(smbus, REG_XFSTA));
 		pasemi_reset(smbus);
+	}
 
 	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);

-- 
2.34.1



