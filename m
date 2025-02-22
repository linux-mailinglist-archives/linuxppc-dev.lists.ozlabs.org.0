Return-Path: <linuxppc-dev+bounces-6392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C9A40BE7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 23:46:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0htq1xhrz300B;
	Sun, 23 Feb 2025 09:46:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740231527;
	cv=none; b=a2BrwcJGFQbwMw8hK7YqsiqrOP4hXfqsco7dmrlz3e5toCK6DsKu0ICVwKOuVW2BTlZm5YoT3F7KoPlfKOgMc/mFAuCwdY33yTQiS2baNSLYKIyitgKutcmhIE+LTFM9gzZcSiaHbpbVfaWWkPOlmK2MVaOCEn2nHdJAJSrkmO3Q7SPDRC1AWT67ADqkXGszoDKV4aQ5fiF/qgLDvs2eJ9retfU7JsWXCY6rCYYpnMD95tL0YIynAR+QSTjXWZmQ42zdoAP/HhHx92OoNwJPmEyyQn7bGVaW7gRoKvG6nMV/7SOJB0IS3nVdTucP9xogoH5Yc9ulGmIaKpX+xO9n1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740231527; c=relaxed/relaxed;
	bh=cOb/dTldwv6tPq64op0KZoctOHrwNAzf2iqB8SOD9Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGKYkTtG4LPOzLCzE7wqHwnVc6bvGpSJwiv20pB7CRV0AIViMaEFsOfii0PhiGnKDJYaNN0r7l9F0y+UgJjkpb8Mz0YwKldHMJwP2hh/BPWStEwmMF3mXoiAkkiq5Wlw9v+RmwnOCnayBD5gtnO8oVnnwo+ruN0UydWVslqbi1IWm1zgA+T5Js8Z/MT+j1+tv+L9PgOWrsdaflp+a5+6O5341imMjHMf28lt+nSXK5ZavV1sKtasAYW8D93EYKlJJCWSQUKKceOscpLaz9R3/U4vt0XCEQVN2VMNx5zNL2Vn6Fbmsu3XG+uLhIZWoBspM3lexOMaTBVzgt7S3xZMyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VjRifRoV; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VjRifRoV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0Skt1L70z2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2025 00:38:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE81E5C57DB;
	Sat, 22 Feb 2025 13:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52C26C4CEE6;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=yyBin1h0CvRmrVfUw16qTKb6+CAFkoi2GN8BdSp/Ys8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VjRifRoVnEdkqsIkzS09ngJyZvwcXIhzH8fD8rpVNqvwfgo+/OAFnvqAIobNA7Lzc
	 dOjmyZYGlVO6Ose1Q/bpG7kM0bSZwWuY7WKdKCEUVutmqzbxmsiaRxzs0q7wnN6iRw
	 yLnbdQ4QSOqmf0TkuLPcDbx8LJWhkNux6am4+UggTR4VOK67gyBGTKc7MRwP1zElgT
	 gohHB+4lSJHlDabiStl/6aSAm/bdEcwYnSwtseqKloM5FfYW+CVUmPXwaqA06s3Ktr
	 pDKuL+jdnErsTjrfnwOa++w77PJw7j1VlLt524UGxtgO1nM9dUXUE9d9EE2y2eWkAf
	 JxWVvmBlLy86A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41204C021B8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:33 +0000
Subject: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
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
Message-Id: <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=iPv0XjpNaU2PSc1JHoHKcgCr0CRP3yf1b4EAPEcXwng=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy9ESFaHHtpUbMr91cTRekSrY3mPm4vwl4djZsz+Kw
 0rCA+o7SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABPpSWZk+Okau99t7x9PDrd7
 Bewzl0+r1NyzLGjKtR6F2u6Y5ZpbHzIyzBb9undnbnzudPf6usJzQa0X5xRkCsf4CkWc3b3xodM
 7JgA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Sven Peter <sven@svenpeter.dev>

Add the missing register bits to the defines and also switch
those to use the BIT macro which is much more readable than
using hardcoded masks

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 40 ++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index dac694a9d781..bd128ab2e2eb 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -5,6 +5,7 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>
@@ -26,21 +27,30 @@
 #define REG_REV		0x28
 
 /* Register defs */
-#define MTXFIFO_READ	0x00000400
-#define MTXFIFO_STOP	0x00000200
-#define MTXFIFO_START	0x00000100
-#define MTXFIFO_DATA_M	0x000000ff
-
-#define MRXFIFO_EMPTY	0x00000100
-#define MRXFIFO_DATA_M	0x000000ff
-
-#define SMSTA_XEN	0x08000000
-#define SMSTA_MTN	0x00200000
-
-#define CTL_MRR		0x00000400
-#define CTL_MTR		0x00000200
-#define CTL_EN		0x00000800
-#define CTL_CLK_M	0x000000ff
+#define MTXFIFO_READ	BIT(10)
+#define MTXFIFO_STOP	BIT(9)
+#define MTXFIFO_START	BIT(8)
+#define MTXFIFO_DATA_M	GENMASK(7, 0)
+
+#define MRXFIFO_EMPTY	BIT(8)
+#define MRXFIFO_DATA_M	GENMASK(7, 0)
+
+#define SMSTA_XIP	BIT(28)
+#define SMSTA_XEN	BIT(27)
+#define SMSTA_JMD	BIT(25)
+#define SMSTA_JAM	BIT(24)
+#define SMSTA_MTO	BIT(23)
+#define SMSTA_MTA	BIT(22)
+#define SMSTA_MTN	BIT(21)
+#define SMSTA_MRNE	BIT(19)
+#define SMSTA_MTE	BIT(16)
+#define SMSTA_TOM	BIT(6)
+
+#define CTL_EN		BIT(11)
+#define CTL_MRR		BIT(10)
+#define CTL_MTR		BIT(9)
+#define CTL_UJM		BIT(8)
+#define CTL_CLK_M	GENMASK(7, 0)
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {

-- 
2.34.1



