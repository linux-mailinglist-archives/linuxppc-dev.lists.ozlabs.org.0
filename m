Return-Path: <linuxppc-dev+bounces-6393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BEA40BE8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 23:46:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0hvD4kbNz2yyT;
	Sun, 23 Feb 2025 09:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740231880;
	cv=none; b=g9R3QVOJGki4dPizo6igN4HIWV6IIjPUW/JEBSr2gfoAW8xfSMeM5wOpezXfGro+V9O9uQ1UH2ozt9EuATRiBELRWHvRW9UkcmHsd32xtuGPbwr8kAFfFwqDZoF9iS2OFb23oLvkZbYMfnCk0GLftPg5UFOMcq933+9d9zzW9a5/yoGmpm9qg6FXEcoNuwOhZOzCWlXUAzMWJyopecKTPXXu7eAmx95RvA8OB/mcYAzyhs9AmOHy6ZkHQUoXsmkXL6IiitMuXe3zZfb8s/GHKr+Yywsap4FHvbQl5Age7tRcc4O0YRlvEIaYIdNeoqjzYFjsoBVQuAXQW6RAYl6P9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740231880; c=relaxed/relaxed;
	bh=SO0Fk6BtwRVGlHqt3kYa0/V5Y1iTIzUN0pe77N3ab/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEQtGzw0wnyfOTmm4t7aZPL0zywK4xXAL/cQLefZBwkZRogwlvA4Oke7HLfOQJRog+mhpCuORKkrXra9hGDMFeHpaoNgrjYM4jmJ0QiJtwsq8tGP/+KcuEdB7KF+TNj2/tBD2lLa2ENx63A6ntrddiUJRCJwGSy4A2ejUkACd2+E907T6bXo0+2JUmcry5DHonrxZjx/D962sqiOEXONw7+022GBU79eMiLTu8MgoNZPutuOfR9QBELgv/hS/j70xHmaeqcout7VyfScAD0N7Z5k+sZJaaCDSbCPWMmerivcTjvIOkaYIem/v+Uk3zGALpmY0QB05aqWj7x76osukA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4q+Ybtj; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4q+Ybtj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0Ssh0rjJz2ywM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2025 00:44:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAC2861159;
	Sat, 22 Feb 2025 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D15FC4CEEA;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=3b399MgkPbalzkt0UKL/iAOTcLxAkop81OzJJhuZ+Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s4q+Ybtj7eNZQ0gHWEM4mrhT5OZ5IHP4VQg29ucZqQ7rG2UtOHhHajlwxnaesYENz
	 NoQogjKJVa3BpJPJFh7YkRsv4WhDpiMXmGZPRMGFwCbNd8+zgBf6wfERZ1itsxyXQ0
	 XFnKFUrhnGHqb0Z1/FcjlQOkXZkTcz8LmRrlxzqccHYi9ZBrA0YNZGPr6TW2kJgGbD
	 Esm97bCU05N+ABKPtOl10s3g/kmWCg9bmi1Urpm0+XWXrnGU/46ZVMRHI15JVwIWVl
	 XilqBoMGVdrBNkHE0xllGmfOY/M26Kkg1UDXHSf214+hRcSCALiYdMqz8zogTOvt7f
	 8/RJZgv2qb8lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60716C021BB;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:35 +0000
Subject: [PATCH 3/4] i2c: pasemi: Enable the unjam machine
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
Message-Id: <20250222-pasemi-fixes-v1-3-d7ea33d50c5e@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=2vIJw3C8UuzlR0vDYIDEMzK/yjJe3TCpkfiUQCAlb68=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy3GzHj/dEP3xtk/58bMGC1Ys+l3dfPtjVbnC09wJz
 A+sr00M6ChlYRDjYJAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBMpPMyI8OxM6p5HBcKLa7/
 X7/syeXHrYtiGiofibCW1W198dqFXfQ5w19Z0ZporoRI5wvvvpebbs1Z9PQ7Z0SBR/BzDuu5TXW
 zL3ABAA==
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

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 770b86b92a10..8f0ba975172f 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -73,7 +73,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



