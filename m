Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1C3991C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 00:49:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LHkz1k9xzDr3B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 08:48:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZLv6Z5QL"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LHj73JVyzDr0Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 08:47:23 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q10so1944635pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ICW3GL2Jj3l3TI0uaeVmL4hkLsOez9fNWXiS/c/eQfY=;
 b=ZLv6Z5QLrJ+vdWNUCHtqlqCZG0PHFSaqt+Py5Y89czZ4uyL/hKmWBXnoebJ3oaJi2z
 fNsp68F8q2R9N96Bd9A/jI8d3QiZw8dMUUbqt6I47PD341BnMyAh7g7AHqEGCO2357IC
 CNMz4FlFehqaX9xTiVgvKTM+1QSBUuGtarJE+wv+JrlMPcZulqB+f1XYstR1FktPqjMR
 /lUqqQ+RIogrZ2xOFaoX85DHtBzOfnEWeK8DbD9KKBh2VlKWSEuOVRTez+2Z7ahvASP1
 9yI02X006pLDHxGt7czFz+UL2a2a6OFZ56XtvR2B4GWpYPikdJVhqV2yYSE3I7xSwHso
 8F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ICW3GL2Jj3l3TI0uaeVmL4hkLsOez9fNWXiS/c/eQfY=;
 b=VHktPQMk7I3Oj+Lr2uNeKFoN9hzb12pes2MrPMjx7gyWkEnZTSNPn2ErUxLWFRGDQY
 3f57ptgfFyYsgBd1rb+CdsEqKxQyW+LMkm4DJmPGN1HPMexlBTEV0YVqphY4JfNaMzuH
 2o4krvlAqOw7Z0JfH/kdGCnnxUG5bdqRpdDWZjahLTPIH7IIlCgxSOhD8/v/8uIFhReB
 ubdO+LYpP3ijhRSbDnawqbj5wao+EvOy6XP6xgNZeMGiZ1so91c5RcoFzmwOUy5sFGKm
 Yf+sJUXKrwceD+pNPemf8C7oHe54bK9Vb5lI5LAuI5RLKuGk0EI8nCzv1j92N3wB0Lkd
 w5hQ==
X-Gm-Message-State: APjAAAXOyoj+trmF8J0vHCJDLRYMIqeFcQkTOayli/BNaa/HLt3Ele/1
 0M4Ez4k+PrgZVSj1o1Q1O68=
X-Google-Smtp-Source: APXvYqx0Kqdu7J8mgnnETb2JJBsOuRoR+vWceEaG9gGl0GEJ6BSdxg5yX5SJDiBQSiluCmXucSjmXQ==
X-Received: by 2002:a62:4d03:: with SMTP id a3mr62510491pfb.2.1559947640754;
 Fri, 07 Jun 2019 15:47:20 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id o70sm3684607pfo.33.2019.06.07.15.47.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 15:47:20 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com,
	broonie@kernel.org
Subject: [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR and TX0~5 registers
 are non volatile"
Date: Fri,  7 Jun 2019 15:47:14 -0700
Message-Id: <20190607224714.13933-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, timur@kernel.org, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 perex@perex.cz, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 8973112aa41b ("ASoC: fsl_esai: ETDR and TX0~5 registers are
non volatile") removed TX data registers from the volatile_reg list
and appended default values for them. However, being data registers
of TX, they should not have been removed from the list because they
should not be cached -- see the following reason.

When doing regcache_sync(), this operation might accidentally write
some dirty data to these registers, in case that cached data happen
to be different from the default ones, which might also result in a
channel shift or swap situation, since the number of write-via-sync
operations at ETDR would very unlikely match the channel number.

So this patch reverts the original commit to keep TX data registers
in volatile_reg list in order to prevent them from being written by
regcache_sync().

Note: this revert is not a complete revert as it keeps those macros
of registers remaining in the default value list while the original
commit also changed other entries in the list. And this patch isn't
very necessary to Cc stable tree since there has been always a FIFO
reset operation around the regcache_sync() call, even prior to this
reverted commit.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Hi Mark,
In case there's no objection against the patch, I'd still like to
wait for a Tested-by from NXP folks before submitting it. Thanks!

Changelog
v1->v2
 * Fixed subject by following subsystem format.
 * Revised commit message to emphasize the real issue.

 sound/soc/fsl/fsl_esai.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 10d2210c91ef..8f0a86335f73 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -652,16 +652,9 @@ static const struct snd_soc_component_driver fsl_esai_component = {
 };
 
 static const struct reg_default fsl_esai_reg_defaults[] = {
-	{REG_ESAI_ETDR,	 0x00000000},
 	{REG_ESAI_ECR,	 0x00000000},
 	{REG_ESAI_TFCR,	 0x00000000},
 	{REG_ESAI_RFCR,	 0x00000000},
-	{REG_ESAI_TX0,	 0x00000000},
-	{REG_ESAI_TX1,	 0x00000000},
-	{REG_ESAI_TX2,	 0x00000000},
-	{REG_ESAI_TX3,	 0x00000000},
-	{REG_ESAI_TX4,	 0x00000000},
-	{REG_ESAI_TX5,	 0x00000000},
 	{REG_ESAI_TSR,	 0x00000000},
 	{REG_ESAI_SAICR, 0x00000000},
 	{REG_ESAI_TCR,	 0x00000000},
@@ -711,10 +704,17 @@ static bool fsl_esai_readable_reg(struct device *dev, unsigned int reg)
 static bool fsl_esai_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case REG_ESAI_ETDR:
 	case REG_ESAI_ERDR:
 	case REG_ESAI_ESR:
 	case REG_ESAI_TFSR:
 	case REG_ESAI_RFSR:
+	case REG_ESAI_TX0:
+	case REG_ESAI_TX1:
+	case REG_ESAI_TX2:
+	case REG_ESAI_TX3:
+	case REG_ESAI_TX4:
+	case REG_ESAI_TX5:
 	case REG_ESAI_RX0:
 	case REG_ESAI_RX1:
 	case REG_ESAI_RX2:
-- 
2.17.1

