Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EF216F0E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:43:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1QCX4RCBzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:43:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e8UZedaL; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5c3zQSzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:37:55 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id q15so43529394wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WA9dG36UknQVCp/Rfsks+W3xsfkt4WlYU9zyAfbsCgQ=;
 b=e8UZedaLC/b7LICkDSQc2DDmIu2zA5B7w9bun1l9DVnAJtIVMl/823pw/IseRZm8Lf
 9d4IjtTJfah6OY8MykIHz2YrsaRApIraOX7TdG2d8hbZhJ+PZnADf45ZU7yBS5dwNOmH
 TuITPaHJpZuLam+omGcBbi7cG6g37+9aI9i3HNWXlYIgEmdzX3wPYI8yFS6XPAngLrwy
 CVO5ycmhUfRUnC8i0StYi7v6fuPuqMU7CtD1W8IYk6Pn2UoAFNAphetI9euRPJdy3D0M
 cDJTbtWEPbg+E65BTnqBfEY3kYYDECSWO8pCXjmJzhYt1ZNKTJ9prlXAjN9wFHrLhkQ+
 EUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WA9dG36UknQVCp/Rfsks+W3xsfkt4WlYU9zyAfbsCgQ=;
 b=FU27g6gwXm5hmzJVGWV3GfYiAc5YXHh7n3njpYmhGQGV0RzkV5vErxdALTT3w968Nd
 ZBp4bmBD6uWCE8fdCUByRFYkdjRMlVYeRfm+KThtwPVltHyGx1rkHpYrFcYIQzDxU+44
 eB6Mtkt19EyYVrArOU8l5AIwt5ZAoA+FcCqy+xoNYUovxwYXv2/niLwI48AVjS6LDfVi
 B++EbBMd2t2eElZPVMQMFIpHiCb/WSwgin1sQmiYQZIOj4E1/mOcMdZPFmUGhaBzDPN/
 aMaSI33udookNfOQG275mqfL3eDRB9Bs481INDtdYvKwkAGEtTSfqptucHGbGYkCpWQB
 qwvQ==
X-Gm-Message-State: AOAM531FBvG2ZdYw5NtObiLeNz4LMtCosuObh8EH3QXLThvVLlNLVfe+
 3NLQ3efd0i8RuVfohCL866wfZw==
X-Google-Smtp-Source: ABdhPJz0hM/mZ52e8GW2OdluzvMHfohOQqKcuaIX2M8lgi/HJbk9NYK0v9wDJlnCtP947+e55/mAHQ==
X-Received: by 2002:a1c:2503:: with SMTP id l3mr4470950wml.188.1594132670740; 
 Tue, 07 Jul 2020 07:37:50 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 04/28] ASoC: fsl: fsl_asrc: Demote obvious misuse of
 kerneldoc to standard comment blocks
Date: Tue,  7 Jul 2020 15:37:18 +0100
Message-Id: <20200707143742.2959960-5-lee.jones@linaro.org>
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

No attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_asrc.c:44: warning: cannot understand function prototype: 'unsigned char input_clk_map_imx35[ASRC_CLK_MAP_LEN] = '
 sound/soc/fsl/fsl_asrc.c:78: warning: cannot understand function prototype: 'unsigned char clk_map_imx8qm[2][ASRC_CLK_MAP_LEN] = '
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'inrate' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'outrate' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'pre_proc' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'post_proc' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:158: warning: Function parameter or member 'channels' not described in 'fsl_asrc_request_pair'
 sound/soc/fsl/fsl_asrc.c:158: warning: Function parameter or member 'pair' not described in 'fsl_asrc_request_pair'
 sound/soc/fsl/fsl_asrc.c:201: warning: Function parameter or member 'pair' not described in 'fsl_asrc_release_pair'
 sound/soc/fsl/fsl_asrc.c:223: warning: Function parameter or member 'pair' not described in 'fsl_asrc_set_watermarks'
 sound/soc/fsl/fsl_asrc.c:223: warning: Function parameter or member 'in' not described in 'fsl_asrc_set_watermarks'
 sound/soc/fsl/fsl_asrc.c:223: warning: Function parameter or member 'out' not described in 'fsl_asrc_set_watermarks'
 sound/soc/fsl/fsl_asrc.c:242: warning: Function parameter or member 'pair' not described in 'fsl_asrc_cal_asrck_divisor'
 sound/soc/fsl/fsl_asrc.c:242: warning: Function parameter or member 'div' not described in 'fsl_asrc_cal_asrck_divisor'
 sound/soc/fsl/fsl_asrc.c:259: warning: Function parameter or member 'pair' not described in 'fsl_asrc_set_ideal_ratio'
 sound/soc/fsl/fsl_asrc.c:259: warning: Function parameter or member 'inrate' not described in 'fsl_asrc_set_ideal_ratio'
 sound/soc/fsl/fsl_asrc.c:259: warning: Function parameter or member 'outrate' not described in 'fsl_asrc_set_ideal_ratio'
 sound/soc/fsl/fsl_asrc.c:310: warning: Function parameter or member 'pair' not described in 'fsl_asrc_config_pair'
 sound/soc/fsl/fsl_asrc.c:310: warning: Function parameter or member 'use_ideal_rate' not described in 'fsl_asrc_config_pair'
 sound/soc/fsl/fsl_asrc.c:516: warning: Function parameter or member 'pair' not described in 'fsl_asrc_start_pair'
 sound/soc/fsl/fsl_asrc.c:545: warning: Function parameter or member 'pair' not described in 'fsl_asrc_stop_pair'
 sound/soc/fsl/fsl_asrc.c:559: warning: Function parameter or member 'pair' not described in 'fsl_asrc_get_dma_channel'
 sound/soc/fsl/fsl_asrc.c:559: warning: Function parameter or member 'dir' not described in 'fsl_asrc_get_dma_channel'
 sound/soc/fsl/fsl_asrc.c:902: warning: Function parameter or member 'asrc' not described in 'fsl_asrc_init'
 sound/soc/fsl/fsl_asrc.c:936: warning: Function parameter or member 'irq' not described in 'fsl_asrc_isr'
 sound/soc/fsl/fsl_asrc.c:936: warning: Function parameter or member 'dev_id' not described in 'fsl_asrc_isr'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_asrc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 462ce9f9ab488..209bf80dc3670 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -37,7 +37,7 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
 	.list = supported_asrc_rate,
 };
 
-/**
+/*
  * The following tables map the relationship between asrc_inclk/asrc_outclk in
  * fsl_asrc.h and the registers of ASRCSR
  */
@@ -68,7 +68,7 @@ static unsigned char output_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-/**
+/*
  * i.MX8QM/i.MX8QXP uses the same map for input and output.
  * clk_map_imx8qm[0] is for i.MX8QM asrc0
  * clk_map_imx8qm[1] is for i.MX8QM asrc1
@@ -101,7 +101,7 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
-/**
+/*
  * Select the pre-processing and post-processing options
  * Make sure to exclude following unsupported cases before
  * calling this function:
@@ -147,7 +147,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
 		*post_proc = 1;
 }
 
-/**
+/*
  * Request ASRC pair
  *
  * It assigns pair by the order of A->C->B because allocation of pair B,
@@ -192,7 +192,7 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	return ret;
 }
 
-/**
+/*
  * Release ASRC pair
  *
  * It clears the resource from asrc and releases the occupied channels.
@@ -216,7 +216,7 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
-/**
+/*
  * Configure input and output thresholds
  */
 static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
@@ -233,7 +233,7 @@ static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 			   ASRMCRi_OUTFIFO_THRESHOLD(out));
 }
 
-/**
+/*
  * Calculate the total divisor between asrck clock rate and sample rate
  *
  * It follows the formula clk_rate = samplerate * (2 ^ prescaler) * divider
@@ -249,7 +249,7 @@ static u32 fsl_asrc_cal_asrck_divisor(struct fsl_asrc_pair *pair, u32 div)
 	return ((div - 1) << ASRCDRi_AxCPi_WIDTH) | ps;
 }
 
-/**
+/*
  * Calculate and set the ratio for Ideal Ratio mode only
  *
  * The ratio is a 32-bit fixed point value with 26 fractional bits.
@@ -292,7 +292,7 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 	return 0;
 }
 
-/**
+/*
  * Configure the assigned ASRC pair
  *
  * It configures those ASRC registers according to a configuration instance
@@ -507,7 +507,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	return fsl_asrc_set_ideal_ratio(pair, inrate, outrate);
 }
 
-/**
+/*
  * Start the assigned ASRC pair
  *
  * It enables the assigned pair and makes it stopped at the stall level.
@@ -538,7 +538,7 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 	regmap_write(asrc->regmap, REG_ASRIER, ASRIER_AOLIE);
 }
 
-/**
+/*
  * Stop the assigned ASRC pair
  */
 static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
@@ -551,7 +551,7 @@ static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 			   ASRCTR_ASRCEi_MASK(index), 0);
 }
 
-/**
+/*
  * Get DMA channel according to the pair and direction.
  */
 static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
@@ -895,7 +895,7 @@ static const struct regmap_config fsl_asrc_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
-/**
+/*
  * Initialize ASRC registers with a default configurations
  */
 static int fsl_asrc_init(struct fsl_asrc *asrc)
@@ -929,7 +929,7 @@ static int fsl_asrc_init(struct fsl_asrc *asrc)
 	return regmap_write(asrc->regmap, REG_ASR56K, ipg_rate / 56000);
 }
 
-/**
+/*
  * Interrupt handler for ASRC
  */
 static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
-- 
2.25.1

