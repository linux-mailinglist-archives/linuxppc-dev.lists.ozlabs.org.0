Return-Path: <linuxppc-dev+bounces-14793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460DCC1A68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 09:50:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVrH2129dz2yDY;
	Tue, 16 Dec 2025 19:50:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.134.236 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765875022;
	cv=pass; b=SlzyJ0JflOIK4CShLscMcUNtn8pMKF0Szo9jFEm7IN8qDw18t2apprc2bH3txkRYZDb+5r8E6lYB4II79MjiKbcqDIhtvl8WC1e/G+SFh+KfG5yQqw04Uj7nh1oK/96+dmTYmncKxM+o/0Q6uB77ZaY2b4KStlLlx9ceV6vj9+wkvNlPGm3FMl7Uoxi9RUPHPdU22XF7Me9BvmRFeUtOrlvBxNmQkvoPnY3h2C59JN0RmuhIZ34Md/kq43HS4zunuuMG1kdSsjSs+p7KOc3cLeWqA9nxBjKHpOiZXTq33SLS0mk4PXxhg85a+G684/oFb3kO/ERxY8SYAx3HDP2lOA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765875022; c=relaxed/relaxed;
	bh=1a6xjISC3MIH58rXlm9v0g3mrLOoKxEiged5KmR+apQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmNU46Det28s71ogTk0CTf9a7yjMcmeLpfCnOx8SGoPZWFS4y+GITGoLSrR3lv5i4+wfhvtjx1tI9eSntd/VYh7wT79Ai+jAS5Yepyt0F9cFUlAEgFzWJkBVRB4s8ojWbxtYM63kNsurlAHBzoboZYhAO8oFWCWPjxzFZNYts1Ljor1itKU+j2VHQIKV85zjupIPWPlDVbXcPe7XZnUGe3SVUMpVS0TatKaRo5BY9iz/fBsThUF3JdJGhuq84NgB1GIOy36tNtDSL00Po7MTo4VeVAG2R77i0zPC3Qf0ootp5svf4sRqUMbadykwShxGWJJnVeTZ4kTgR2lXyqHOYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=p+ho725N; dkim-atps=neutral; spf=pass (client-ip=94.100.134.236; helo=mx-relay47-hz3.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=p+ho725N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.134.236; helo=mx-relay47-hz3.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVrGy2qWlz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 19:50:11 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1a6xjISC3MIH58rXlm9v0g3mrLOoKxEiged5KmR+apQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765874991;
 b=NEuHMRxo36A+UwHm+vEIw3MUXjNQdj3CrYfB+AN4EB6vYAvqnhqE4eLfXArsjfIn5eqtv1PT
 lArFfPLgAI0CfRAuh7+b3JMVYGA/M4e9TgfE4xxsdaPjBL4XWVSVFzsrMVRP4KGrqAwT7aS1fVc
 L98a3foomi4+Kl+P4NfQNJ+t8naQURptiLeDL93EOuTmrhO0TEUJZLsO/24ZY7PZOryE2cV70O+
 lrFAXy26L5xaun2W5cXWcxJTFIQGvMMhIXGBOHpfywM1hHmjpCuVl7quzLSnTvjFG3GM5p9rCOV
 ct6zvpCBj66SA+GDc76o6POzMfabV+C5C7RUfmORRJqJg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765874991;
 b=rtbwAZfsfLPKHmdDr+tziO+HXIEZumsG+upRcEn630g+GMbosVk9DebbGoyLDKczRNjn9LVL
 g+JLJVG4b7shcgd0qOeMbl57Db4z3Dec0HkgmVrK/JHrutBKxp2A34FlO8dhbd95TkjgK0LTWjM
 7faRuV4O1DePbmbmNsLVi88qEQaNbp1HrgJjS+q07b7JSqtk1Fn2Q6DSwKI8ctXDTRmQ0kEGRSu
 2Dn/QJav6VZtdHyr6FhO97YPHAW38pqsj/We5zNPPvJrOM59g7nvzyLakszoyMWAHltrkeR7HAn
 bAw0FiyPuhRXW0vzCNjS9nyWFOgtA/NRtEi0EIMGkzd3A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 16 Dec 2025 09:49:51 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D8815A4079E;
	Tue, 16 Dec 2025 09:49:36 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: fsl_xcvr: provide regmap names
Date: Tue, 16 Dec 2025 09:49:30 +0100
Message-ID: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linuxppc-dev@lists.ozlabs.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dVrG94N62z4MVKN
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:027bbd810df21f0f4fe38bf7871a09bb
X-cloud-security:scantime:2.241
DKIM-Signature: a=rsa-sha256;
 bh=1a6xjISC3MIH58rXlm9v0g3mrLOoKxEiged5KmR+apQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765874991; v=1;
 b=p+ho725N6H2GbbdydpYzwrJeTD2I0+NFaVKN5vAcotD/fN5P+a9i3S2ms/WVUW+OEQ7adj+7
 sXbupqJihi5LbPjwvCdp+Ldpc3/ezn7GcUChh86liWHamDEL0EdmO4ApzruOOwwm+5VI5hrPnSr
 x54Ir/NsYtZNk+yYlSJ7GCCNHPnONxpkQOKs1W8w05zIKcxb/zIhXaAegAbS5Gs9fIv32RzxSm/
 g2gbZiW6gG6afCxjzv04SjtghApycBvw8XGBUp1481eiCKyxC8XxUT+mYGHsECOduzEHRhL8ceL
 655YR72HwIg4egLZ+CgPlCk+erKSnwzaKjJd4UbhccvGg==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '30cc0000.xcvr' already exists in 'regmap'
Fix this by adding a name for the non-core regmap configurations.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 06434b2c9a0fb..a268fb81a2f86 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1323,6 +1323,7 @@ static const struct reg_default fsl_xcvr_phy_reg_defaults[] = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
+	.name = "phy",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1335,6 +1336,7 @@ static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
+	.name = "pllv0",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1345,6 +1347,7 @@ static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_pllv1_cfg = {
+	.name = "pllv1",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
2.43.0


