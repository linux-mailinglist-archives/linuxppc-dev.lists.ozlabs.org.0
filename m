Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F4216FA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 17:06:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Qkj1RGlzDq9S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 01:06:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U4icUTAi; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5m2XpHzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:38:04 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id j4so42987339wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YsokizqvcQrYmRK4XFUw9AfpZPmtx9CnTkzjsD5Kh2w=;
 b=U4icUTAip9+fVemfIStmlUm+NwJ6HLWkl2RVpVYHUx/CKlpWCnzwXVC3CzO6ZJxzhS
 2A1u3oeiQiRbLQzl0ReMEMvLcVbjfBld3DOsbinq/HDwtkUHvTpoWwmwIW3JsgEKydrN
 sT3Mcd7tmzyJB7ZIkVdXvVfah2S5RNbEIcqZBCMnb6IrgPpJML1ZcTZMJjZpFjGT9bwX
 KFw/rVo796NGAFlBcF22gotYI6DwHJNR9jKSzyYFD5cOe2ZDQ9Y6jIASEoBUkL5rLH3v
 YxlY2MQtb7I3y0oBmo4AzeIL57N0+DjNcvsd9DRoEZo+/djPEr+HoSNOmqkrC0YQRMhu
 DvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YsokizqvcQrYmRK4XFUw9AfpZPmtx9CnTkzjsD5Kh2w=;
 b=Reijzd8kMTF6qDaOIwpkS6zPK8AH+sDsUfRoBCfIex4hbBUK1woAqsmcqBk72CkiaF
 JwV0XzMKE0QYgwp7NBQKpAxmFTZDBGGKMgLEX0rGNh1y+rPZkxcHv+7BB44Vnuz+BKpc
 T9+l9mFAwqqSireFDl/Ye/65+AMT3dFO6MHdnkXuYrcSeCTDdsH+9AlW7utoAgukStgx
 Yp31YEEYz2juAbM3pjPXH9SV/FSoEho3i60CM35jy+7k/X/zp9QbSEwvQrW8zYkbWjiH
 ib0RsHQv/C3J9vtmOvSP4sBRO8zKWa/eUjNyrpOyNqr0MY1ZEaVKyaqRaQ2tO1xljfKB
 q15Q==
X-Gm-Message-State: AOAM533NqU9t0eD1lLW/OJWKXuCKFsoihmVfQxXF1kEuD7k5KWl+o0V5
 AdW5xt1ygJUFcKe2DqBa/p9hmw==
X-Google-Smtp-Source: ABdhPJyQQtUDPp475nOrZE1vXhOfcyykGtayzQzLC4nanwruesoW0y74DEzt0XwmDnl//B05KWRVDw==
X-Received: by 2002:a5d:6990:: with SMTP id g16mr45394243wru.131.1594132681537; 
 Tue, 07 Jul 2020 07:38:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 09/28] ASoC: fsl: fsl_esai: Fix a bunch of kerneldoc issues
Date: Tue,  7 Jul 2020 15:37:23 +0100
Message-Id: <20200707143742.2959960-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Struct headers require a 'struct $NAME' title, all function parameters
require a description and need to be in the format '@.*:', else the
checker gets confused.  Also demote one kerneldoc header where no effort
was made to document any of the function's params.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_esai.c:30: warning: cannot understand function prototype: 'struct fsl_esai_soc_data '
 sound/soc/fsl/fsl_esai.c:61: warning: cannot understand function prototype: 'struct fsl_esai '
 sound/soc/fsl/fsl_esai.c:170: warning: Function parameter or member 'dai' not described in 'fsl_esai_divisor_cal'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'dai' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'clk_id' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'freq' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'dir' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Excess function parameter 'Parameters' description in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:364: warning: Function parameter or member 'dai' not described in 'fsl_esai_set_bclk'
 sound/soc/fsl/fsl_esai.c:364: warning: Function parameter or member 'tx' not described in 'fsl_esai_set_bclk'
 sound/soc/fsl/fsl_esai.c:364: warning: Function parameter or member 'freq' not described in 'fsl_esai_set_bclk'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_esai.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cbcb70d6f8c83..bb3c405df623c 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -22,7 +22,7 @@
 				SNDRV_PCM_FMTBIT_S24_LE)
 
 /**
- * fsl_esai_soc_data: soc specific data
+ * struct fsl_esai_soc_data - soc specific data
  *
  * @imx: for imx platform
  * @reset_at_xrun: flags for enable reset operaton
@@ -33,7 +33,7 @@ struct fsl_esai_soc_data {
 };
 
 /**
- * fsl_esai: ESAI private data
+ * struct fsl_esai - ESAI private data
  *
  * @dma_params_rx: DMA parameters for receive channel
  * @dma_params_tx: DMA parameters for transmit channel
@@ -160,10 +160,11 @@ static irqreturn_t esai_isr(int irq, void *devid)
  * This function is used to calculate the divisors of psr, pm, fp and it is
  * supposed to be called in set_dai_sysclk() and set_bclk().
  *
+ * @dai: SoC DAI
+ * @tx: current setting is for playback or capture
  * @ratio: desired overall ratio for the paticipating dividers
  * @usefp: for HCK setting, there is no need to set fp divider
  * @fp: bypass other dividers by setting fp directly if fp != 0
- * @tx: current setting is for playback or capture
  */
 static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 				bool usefp, u32 fp)
@@ -252,11 +253,11 @@ static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 /**
  * This function mainly configures the clock frequency of MCLK (HCKT/HCKR)
  *
- * @Parameters:
- * clk_id: The clock source of HCKT/HCKR
+ * @dai: SoC DAI
+ * @clk_id: The clock source of HCKT/HCKR
  *	  (Input from outside; output from inside, FSYS or EXTAL)
- * freq: The required clock rate of HCKT/HCKR
- * dir: The clock direction of HCKT/HCKR
+ * @freq: The required clock rate of HCKT/HCKR
+ * @dir: The clock direction of HCKT/HCKR
  *
  * Note: If the direction is input, we do not care about clk_id.
  */
@@ -357,7 +358,7 @@ static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
-/**
+/*
  * This function configures the related dividers according to the bclk rate
  */
 static int fsl_esai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
-- 
2.25.1

