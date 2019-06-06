Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298138181
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 01:02:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kh590lYXzDqrn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 09:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AReiaJER"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Kh3f5lQLzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 09:01:17 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id x7so19520plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=12La436VbNM+cCSd7W2kZMhljrLWHemPkQdkpyh82vY=;
 b=AReiaJERh9zfxRcBRKv/f5ZBzgNxQuBHCtL/MVHd7MWiPpVT1CnFdhZULF9v76DzvI
 APLMydZtIIGHUOF8LV9te1yum4VCqoO+JJo8fP8KQK3tcqsZVLtZjJU3eGYyNSQ1T8Sj
 dPbD4GyBcbK8B2wpKq2m7HnmayAH2ojTkHIhzVJydEe23H3GiltSObE8Vmsh3WBHMTsL
 UCc6dTDfvgdqwHalbqqL7ixq6ZcHpMDgN7SMcCwQBeJVfHPuhsJfCgSUruUu+0Q9Eubl
 Yq1eOLubJF54PHrSBAmTqhrTv0L+bf5qtlvG89eMew8LVYpvRULeTKj6Hwc7A8tWVUFH
 9V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=12La436VbNM+cCSd7W2kZMhljrLWHemPkQdkpyh82vY=;
 b=DsBopydapMEtaIr4X7yTEUy/hfeJImwojJVdmIex09cuHmNm9Cn979ImByxpqPOi2M
 CxXeZQx3QTGBUmBGc/d2Ovrk9/jDvfDZwfl+esQBvTpfGklvJrjOx2NCl9mRwXgrQnWy
 my5WQArdflQvUxcJsJhe7Wvna/1ARQWsybbqzACFiayYjF1M8QIPYiFl96fYrOKo5B8d
 1RrrLgvNli2/xUtOWSTpPTk2O1W0LuAT/cwpqZbQs+SRIwMG0dH7w8CRlfdEtAYy2xkA
 mh5KlCXUQMVXEzVsBYiY/aZ6Amt32fQcDWK36uRrEteT3R95aL+94lcD2POq1d1M3Q4/
 2hVw==
X-Gm-Message-State: APjAAAXkNiUClPzvQaBegZPYVoaxfI0Q0ICaboeiMStI3ax4iRf5Ileh
 KJisjCl9r8LxpGfKqkstc74=
X-Google-Smtp-Source: APXvYqyJRnNHG/xd1j5UBLUN+f975Gpvky3R4SP3NlglwXTBLeJVJJ23pdeMLMfwRDTHpYXKxwk0/Q==
X-Received: by 2002:a17:902:694b:: with SMTP id
 k11mr38505043plt.307.1559862071919; 
 Thu, 06 Jun 2019 16:01:11 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w190sm198049pgw.51.2019.06.06.16.01.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 16:01:11 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com,
	broonie@kernel.org
Subject: [RFC/RFT PATCH] Revert "ASoC: fsl_esai: ETDR and TX0~5 registers are
 non volatile"
Date: Thu,  6 Jun 2019 16:01:05 -0700
Message-Id: <20190606230105.4385-1-nicoleotsuka@gmail.com>
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

This reverts commit 8973112aa41b8ad956a5b47f2fe17bc2a5cf2645.

ETDR and TX0~5 are TX data registers. There are a couple of reasons
to revert the change:
1) Though ETDR and TX0~5 are not volatile but write-only registers,
   they should not be cached either. According to the definition of
   "volatile_reg", one should be put in the volatile list if it can
   not be cached.
2) When doing regcache_sync(), the operation may accidentally write
   some "dirty" data into these registers, in case that cached data
   happen to be different from the default ones. It may also result
   in a channel shift/swap situation since the number of write-via-
   sync operations at ETDR would unlikely match the channel number.

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

