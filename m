Return-Path: <linuxppc-dev+bounces-7667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45375A8A2EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 17:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcSvl2rB7z2xVq;
	Wed, 16 Apr 2025 01:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744731443;
	cv=none; b=WXOBvWH2sylI8Kg2NyjAX8uNPf4OFIAKL/t6dsVGRVZRv9tlPCbsP1YCqi+a2LvkXkOd/qK0HHSklDjl0q+orp7FNW1qRqAA8qWy4ak1usl9hcLd3F7sHxYzcNRmF9Q7dKOHW+Xp6SZ7xGH56Vj1rtyGr7olzMiQJgcAl1D+gJ/qGWtBX1TXhg3J8ezlAsJqv/nrt+fBapbd6L64AmF1D1JFpawJkfH0wm9tRiUIV01iNCeayrvlJJLq9nBCFcyE5QlHnb+tm/5gEqhA+BvYQGPaopTWZd0J9QFINKQmDR3bLgKH+jlboyMEfOiM3GiRyfmU3H1S465to5Y3aNL73A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744731443; c=relaxed/relaxed;
	bh=aWGrnOqysJizSR01smsSWh2TP1Mi7MZUbGBVnPLFD8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zmz/MjSBwMNxNURTRbDmsZdFlxSJ7m9KdusCV8yL3sKchS+COhyvd7GnRqOs27Rn6Sz2Xnd4bBYMaFOi13s18fiD1QV1Ix8Dht+GT68e6aLI/NJCtlUX1aQ8elwvXuL9nyoTdg2Fe/ZL0FPJ6bLu8rZLYJrd8q3tjvg0eNzLT1GCS+Ql4z8rXSWzixwXobaBvh0QKIq2IAxY6b4LUtGrdhUzi7+o5ulYSHGHJ18dij3eecbXIt1iTwizZqONiMsrVCKVtIBdZpGlTNXPJtq7rCxaLaw3hxleHxM4PEHsofKiyRQL4qypmllMTvd8OVceYvF7NDl9gR72gdH1sNc74A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TSKpof01; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TSKpof01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcSvk3YKqz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 01:37:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A55744A347;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA19C4CEF6;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=NZgmwCPRLWI3kpiACRhVK8RgHlS1bLhmnT/HYgkFGdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TSKpof01gBcDIqp1QhNNuavMJvKiQDekMhNXaX1zqpSboLdMZt2sYK64S6kK0yoTR
	 LTpr9IzVoTwInti3CLtqjFiBpJkfUGK8MhvbOt0AbXjUMvLTuAjrHJg0vPyQ/KX+7k
	 cukVgT0d2r99Tro+Av5nrtkIWP7a8irZ06tj6nDyHxm2cx+QO8g4ZdpaRCoK8Br/nv
	 Utq0cRG96+rjcwCiEa2j/KTBEzkc4dkkwPSPCDwMQpY/E/pUJkltn6+ceJlhBZW1F4
	 rfDqV0kct4pAWX6u+H4Dr08bpjttADS/WZY7LGZynCuFhZTkG3sBicTH2id5NbxwqT
	 n9vXb2FCIxmJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB67C369BD;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:59 +0000
Subject: [PATCH v2 5/6] i2c: pasemi: Enable the unjam machine
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
Message-Id: <20250415-pasemi-fixes-v2-5-c543bf53151a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=avtSs0p55pNQJTNl3swTi6LwCmUmFUOOKuZ3dOr9VMk=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/Ws2ndfPmtB3bbO2jqvDW5Ev4LGcDy+r+knvZS59Pe
 X71jezqjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEbHkZGU6nTbw1R/BPS4jk
 jcyrs3Uk5026L3Qj8fylVBc5TZurXrMYGd5u+bD78K+fK15NMFWyPLghsbbqqc4xs/jri+yaTOL
 5uXgB
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
index 2f31f039bedfd7f78d6572fe925125b1a6d0724b..41db38d82fe62c73614b8fafe4cb73c7d1a24762 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -78,7 +78,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



