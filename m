Return-Path: <linuxppc-dev+bounces-8057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B4A9E2C3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 13:31:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlkt745yPz2yxN;
	Sun, 27 Apr 2025 21:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745753471;
	cv=none; b=W68T5NVG9mHjmC6BhUNkTPYl24Gwyuy/Aa1gyULg4GEYVr+1n/vydhRUb4pH83OKBepyOgU1jxAPFT8mUbFWAtVQSQfgsB/WWmMqqKjbM52YYsxLVWVUAvzNqguvhoY0Jxdx6VnMiJYU82Ad2U7ilFDr+reZlN0Akkip9Vpi8wTmZE6rsr3s+xQrNBkom+E+NOURPBPiYAIq1ezYSG1/W4S3zOMJNt8x4VAOwllcucTsHKtsQmqs6z9vmwbAjoI9Qdcdx+nWIsmWJJAV9n+7Xk5T6+xz4rQWvjvR6bVZhKN4UnmwVhm0r9VSdC4G7XTOZMqadP/Yyi1aXfpRNhXceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745753471; c=relaxed/relaxed;
	bh=7G1hVkGcH/CVwZUqITWBWEMBFZr9TFGzQGp36jVQQkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIgFILQtIVWe9uQxDggZH3dBVNoeS2oLocPXrtIqGYFphh6j61hANID/kaN55s8pzOxqF9QVAydhZIQWxla463lwpVrGxGu8avHOPM//RSFhJm8+cRpEXPatY0iz9qwQKjEWvtAHGUVLyzcZRC+xbh0evQFacvuXkVHReoX3BnkzLxxpmjJI1cVvCJPhqCNNVBT75HUqkq1m0V292q26YX80Q/I8ns5d5G2LWIMGotX3asC7trU2thQE8j2BYIf768JXfyJxvLCxxobW9WpIoa9BI+OGAZ1RF0hnpp7P4BJa2WHayErVX9j92xlR2PCO9iEVsRfOfUpIhpHF+PtnIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hEgItdNt; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hEgItdNt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlkt456sMz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 21:31:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47FE46116E;
	Sun, 27 Apr 2025 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995F0C4CEED;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=R6oSEObaTaH0Rzyp6urqUx5bFx9N32/+kpJdZz3z61A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hEgItdNtoXNGeDRKKF2+f7EaObMTpIzx34T5OV3ZjtkWF4JNLx467w/QJLmcgdYoj
	 XQqQNZ1vEuM0zUtdIkZVdapJNARIMy2Fy4zoWfqvYzAms5cn9UM+ZHNvMYqHHcVmhD
	 RivTJNiyy32UlHGta0qh5ssW3bvB+XsnISPikcMrVUoTY0CR6/5PFjAN6y1xFF8TUj
	 UPvFrniZoXqAsIKi/gW7VJAG3iiZoLyJ+QEMNIeKlg6ha7/dW0DAplpSrTuAb3NTQQ
	 r/s5RlpICdjqMIqJrF/S/gd3yZ8Rhyt9piPaDaD1J9i13FCmY5VUZESpZTAQOyBwwX
	 /urBMdP1lcn6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B3CC369D3;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:43 +0000
Subject: [PATCH v3 1/4] i2c: pasemi: Enable the unjam machine
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
Message-Id: <20250427-pasemi-fixes-v3-1-af28568296c0@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=9e+uBDc/DvIOiwP1SNDeg2HD118JGZSQxiaK6ReJfNw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaFHGRN/pm9qYmMSf79lsPWPLjOhVt4wOceQ6n+U6Z
 LZbUCq7o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRX2EM/8y3Nq/qURNX6vr1
 sGbbZH5LpeNrftl+MbQvP/deIjIrgJ/hr0jOQpE37RWKl0sn5OmuliuMVPZ7Gtx7OeSad/zkPvP
 PDAA=
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

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..3f5571a90c1d268ea2a9d95285f1a5e47f0481ff 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -71,7 +71,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



