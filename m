Return-Path: <linuxppc-dev+bounces-1568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD398471F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 15:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XChKw6h4sz2yDg;
	Tue, 24 Sep 2024 23:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727186340;
	cv=none; b=T/eoPpv4iAd0f3ijC7GfoBuL2NOY7G9SyzFu8h29MMpoEz5JVEUFUaNPyuTGp2CZmBStDxu1cX1tVkBUZztCpOwdJOrfxErXE60laX1fGQEDyLBLf6vvZCDNk3YMX/IxgVhzjOyBZqXwD5pdj41Bxm1kVAOdqpVm+GK/dBgHPswZM7mHWLx8aJF77Z5iI5swA/JQ1MT18dHdhoRcEfouQfJ4GAda1wkLTEtvIvQerDAzcyaONhsEBSwIBAIdRJKMdB8pUVOC1XXcTDo7Rpe1Dvishgn9U3wKoF6TKz9fqbHgkRaWooTZnVaAD1KyXXdwiubGSVfaK1EvBiUbo021Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727186340; c=relaxed/relaxed;
	bh=yAqkOLAgUNaaUJIMNp41gL87Gh3nd+TY+aWhdRDfJHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VuIVRk8S1QS/dks9YhjCrE40RWkmHNyObRFdcagv7aK11tc/38occ3OUvrYiAimK+KdRNmgmsTJNbaEXY3sSGKhUdygirJpyzGkBNWD1M67MgGgvaBRHMnY9oVLFhuzYJc3zqtI65mVz99+JgPYgfnPV3suYyIae18Z9ctYNrDGpbqDFO8Eccttw4P/4/kQVI7CCr0Xn2UhAGeAEm6v72F+8/JMedVVAWm8zt6flAmUjxQTGUe5j0l461oZ3jMx7Z8sBK/qqV9JoDbtkviJ9Un8cBf0Uy00tUH267O3QVbZIrkJlsWxVHYlxM6UuTefEY34OYdv9Pi5kZRmP9oY0OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=All2FbVc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=All2FbVc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XChKw3Jpkz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 23:59:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A55A1A4262C;
	Tue, 24 Sep 2024 13:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559DFC4CEC4;
	Tue, 24 Sep 2024 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727186336;
	bh=mjhiOE9V8C0wheS1juQW7ZKGUKe/JAeKebRmNOKIqcw=;
	h=From:Date:Subject:To:Cc:From;
	b=All2FbVcWFNLYtOWd6MNxS8+ns5KImufaT1QWO2L4rVHlbDFZTmSSIWWRPdsXdKYg
	 sBF566Q7uEP3XsHBRQ/UxX7dQFIiRwaEfD0kAdY3BovKUc+BU6jcdeQBg3Hd1ArWqY
	 th9YOVQLK2fxetYSs0PbL04TLmgbZeietNRr581BtizZ2CuV5GMiLhku6ohIK1ixmo
	 s0OtDPXWvKz5gPMKQNtOzczCCr7g91mn8WxSV+tE8sZHomZqa+CVi8IVOlqt8QbQ66
	 vguVMh37+APeuCyNYYOtOUQp4lgUlBxQw6cN+CvFN86tA97v+a1iIOvF8b4EQp71WU
	 U9WHab0Hm5tlA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 24 Sep 2024 15:58:42 +0200
Subject: [PATCH] ASoC: fsl: Use maple tree register cache
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJHF8mYC/x3MQQqAIBBA0avErBswtaCuEi2sxhrIFIUQwrsnL
 d/i/xcSRaYEU/NCpIcT+7uiaxvYTnMfhLxXgxRSi1FqNMlvyC6jM+EiNOs6SCs61SsFNQqRLOd
 /OC+lfFn+chxgAAAA
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mjhiOE9V8C0wheS1juQW7ZKGUKe/JAeKebRmNOKIqcw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm8sWbwQST/kxv3i8Ph3uEZVQrfduRFkYXJARJE
 KW6TgYDGS2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvLFmwAKCRAk1otyXVSH
 0CjdB/4rV/vNLoIQlMxXHFZ4x4LcvAMLcjwL+UyIwkYLlta2CtJ13XQ7X970VpWE6B52CvaiCOn
 IggNAH8UGfac37XRrwHWX+UC3eqTDA3uPuZH+czaw7gfp7JAKrW+7g8qByTREF1KYhuu1xW46gx
 klfDKmUsYceDDkgdCCxb2wpLuZSAfkMfeqXeGdtLO9ahdLSjk7mlT9lTnGyqMnvS0tX2TaTlNmj
 6s5+f29U1sU8dZDLHv7OVwUtRIgY9gIaL5l1xeokNiZi9V5zA78bwEwD8ESpXauWrDBudyflyEC
 h0by4V+2DeSgErLCjUlyflJ6nt7Mg+JmRdRr0Rx7Mv8340Wj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Several of the NXP drivers use regmaps with a rbtree register cache. Since
the maple tree cache is uisng a generally more modern data structure which
makes implementation choices more suitable for modern systems let's convert
these drivers to it. This should have no practical impact.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_aud2htx.c | 2 +-
 sound/soc/fsl/fsl_easrc.c   | 2 +-
 sound/soc/fsl/fsl_micfil.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index a6cbaa6364c7..910b4ce7671c 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -169,7 +169,7 @@ static const struct regmap_config fsl_aud2htx_regmap_config = {
 	.readable_reg = fsl_aud2htx_readable_reg,
 	.volatile_reg = fsl_aud2htx_volatile_reg,
 	.writeable_reg = fsl_aud2htx_writeable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const struct of_device_id fsl_aud2htx_dt_ids[] = {
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 962f30912091..5149e732f763 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1748,7 +1748,7 @@ static const struct regmap_config fsl_easrc_regmap_config = {
 	.rd_table = &fsl_easrc_readable_table,
 	.wr_table = &fsl_easrc_writeable_table,
 	.volatile_table = &fsl_easrc_volatileable_table,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #ifdef DEBUG
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 22b240a70ad4..c0dc9bebb77b 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -955,7 +955,7 @@ static const struct regmap_config fsl_micfil_regmap_config = {
 	.readable_reg = fsl_micfil_readable_reg,
 	.volatile_reg = fsl_micfil_volatile_reg,
 	.writeable_reg = fsl_micfil_writeable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 /* END OF REGMAP */

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240924-asoc-imx-maple-abb62f013533

Best regards,
-- 
Mark Brown <broonie@kernel.org>


