Return-Path: <linuxppc-dev+bounces-7665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB284A8A2E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 17:37:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcSvj4dDrz2xd4;
	Wed, 16 Apr 2025 01:37:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744731441;
	cv=none; b=lrNM6QaGIsJz3cGr1y+1tk0zIbKehzsXtCxQ9o4yHCMYvyS/Q1yTdamc7RqLkRzFih2YrNB5oEU09NGCmRvTEEtuUTdKnsS9NXx2BkdD3xQ1rPG0JTM72mmO+aUcffkFkjNPoO0OPDgWKmXqTPWsyqvTFb3pmo2qk8vDxEHhWPEYomdNjbArH4ONeCoGr9YzU88PcNGjV4HMTpbeBJQuDzcdm/A1GZllDeXW3Iq1yTuOZ96J//xFt853b/Nf1uil0vYzhczpUsca7MMiabFWX9BTbIgfJ7to4yWXqzDMA8KsZXSEa8RzzcUpVntzTEqxPy+wEmsaTfgRY5FCq5QxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744731441; c=relaxed/relaxed;
	bh=xKmkMPmEcJmaMes/os9PPE/5CFS9MZHaaET8Nf0gww0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMglcV0XJgmG5ektlUWubBnav9spzPL325HoF+YBgRYD1PHyDHupnmX2J1JX5hCCtnuRwMqCVOtQczDmrunbtYMtLhq3CQMa5iCzJnev3L1XEXe7wSVBCxD9F5j9TRVyaLjhbI5ZyCnBXLArW01pm6wrg1bD3INOd5mjQfnym7CRhRVoDe5FIZG5eN5B7F+8C2+0mgOGJda/IoQv2AjyVbTmacxOllCZkRhl4n3DOs1xecoZtedoyWUVPO/w5KBhnvLSoyU0gl94zONp5hlQwBtEVayWT/LTuW8m2ZTqGFCSwdIJcSHQJK+drk7fhyhnv8jZnn+897XtWaFKkr/u9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nBdxMbZs; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nBdxMbZs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcSvh1KYPz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 01:37:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81EAB4A2DD;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 541E0C4CEF1;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=F6ydi+3Kh9gLpG3MhIJVGmiYu4P4h2LRSPQzIzRGasg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nBdxMbZseuEol55Y1Ny/cpNeEYq7uiD50JIs/gwKO1Foa2wPiCEWrc90lL1haY55m
	 1U/Avo4ZIeTMGB3B0hc8RtHCP+fUz1bh2A2nXzqENOb+2WfvRXprDXBqeNLCoJuZLD
	 zEBzma6f58T7jbVHsEsmRO/7k15L34RmCdGfwwtOcxHX2/PGwMxk0Rl2AUyFdDAssB
	 m1CvNeYIsiA8Aek7Vq8uG2im5lz8Ku3au63TEM2C6vbDxZy5V1Zeq34gNfiIOXXi7b
	 +Ckbnl3Dd3I78yvbAcdPdFDJ24wap6NTAymjMZa8wXc2v/uNtLmmcjAZd5/3bavVVv
	 hOwn1ihr8SoqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457E4C369BA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:57 +0000
Subject: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
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
Message-Id: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=pieYM48LE5ENsb4OlGmWM38fJJzel5K/67CDk0KItDE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WvWKcJ/Ij8b3P05fYM58StKf7c2kj6UO6rKVr2u/R
 bN/jY3vKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExk7yWG/w5Skwunb99z8fBu
 o7eC/youx5b+YzCc+W/XoprbuSEdnPcZGU4/lzac0t5wuYzjwwGL5tcNvtVFW7/VPLu1Y0rwgYr
 9DAwA
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

From: Sven Peter <sven@svenpeter.dev>

Add proper timeout handling for the interrupt path.
Previously, this was only correctly done for the polling path.
Note that we drop reg_write(smbus, REG_SMSTA, status) here which
will be done anyway whenever the next transaction starts via
pasemi_smb_clear.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..9b611dbdfef23e78a4ea75ac0311938d52b6ba96 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -91,32 +91,42 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
 	int timeout = 100;
+	int ret;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
 		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
+
+		if (ret < 0) {
+			dev_err(smbus->dev,
+				"Completion wait failed with %d, status 0x%08x\n",
+				ret, status);
+			return ret;
+		} else if (ret == 0) {
+			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	} else {
 		status = reg_read(smbus, REG_SMSTA);
 		while (!(status & SMSTA_XEN) && timeout--) {
 			msleep(1);
 			status = reg_read(smbus, REG_SMSTA);
 		}
+
+		if (timeout < 0) {
+			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	}
 
 	/* Got NACK? */
 	if (status & SMSTA_MTN)
 		return -ENXIO;
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
-		return -ETIME;
-	}
-
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 

-- 
2.34.1



