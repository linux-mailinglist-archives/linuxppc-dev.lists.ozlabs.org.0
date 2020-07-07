Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE9216F62
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:53:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1QRY0mBtzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r7HP2Um+; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5c42nmzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:37:55 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id s10so45356807wrw.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZEmbLq4aOW35ukJy4E78RGy/Qq2YYTCi7Pk4jUv8mI=;
 b=r7HP2Um+H6XCeOCwBS1DBw/EpzOzSEUJxkM7XgIIthlv05WGzKRkQ47pQ5X6uXP71A
 ypKrE22POdbeeY2SYiKSYp+0bJM2G6LOu9Dhs/bmlribcY4bzFgu7o+yV8JJ1bah0Cmm
 vjw1YoTgK8XPGVKhIsOn3V/N1oz2oFLm/oHVLgziX0DwQ8CdqxFfgL6ALRVzgTO4P6Tt
 xX3V0IQI2zKjmknDKyitCn9H5JH9/EXp82c5+d5fYQ/fnculdyIiuPEba2AJqLmP5Vfq
 yGRj5ztTcdY0SkIGgsfknmzhmUZaXDqsSN8eHFfj1uI+qfFkB1Z6HNymxFIc/yDJ7YWa
 dKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZEmbLq4aOW35ukJy4E78RGy/Qq2YYTCi7Pk4jUv8mI=;
 b=RgyeA/T1qXCjDtesTFiuAeGdDWac2Jc6stlMdEMCsnvEKUg4FLBdJv4YhMBEoBviRp
 +52QDZP6van5cqj07S8+VOQx6jQe3c14pn22eHiw72ezwpM4Uve2zdcS0eA8VFbNXDQJ
 +aa7Td67GOoYtgUJBqjMC103gI8bx+KNlbPsthbD+TZ9MTmdYn7e2dzeu59x4YasPdOa
 Byc7eYryeWv7arAyie030+jthe+ZMOUX1o8cHujoydzF6oLJloXWzVYGHE7JJm+1jDUl
 J2mqofjD7scJf+iVjZZMw8g43uwKYOjMurJF4Iq3XluwS+z5i05gwBnKyYa+fl47SLxu
 EKPg==
X-Gm-Message-State: AOAM5323h51UVnIuGXYBuka4BdAULGTp2Frljfuga+tx4zf4MVZB0m3y
 bG8Q1t4CsqnSG/BE6XyTI9SE4w==
X-Google-Smtp-Source: ABdhPJynxRPirdpdNBTzvVN+pt31jUrDR2b6WfGgXqiarIs1KwfdT8fa7FwWITRji5KKCJTycFwC3A==
X-Received: by 2002:a05:6000:128e:: with SMTP id
 f14mr58976062wrx.276.1594132671960; 
 Tue, 07 Jul 2020 07:37:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 05/28] ASoC: fsl: fsl_ssi: Demote obvious misuse of
 kerneldoc to standard comment blocks
Date: Tue,  7 Jul 2020 15:37:19 +0100
Message-Id: <20200707143742.2959960-6-lee.jones@linaro.org>
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

 sound/soc/fsl/fsl_ssi.c:380: warning: Function parameter or member 'irq' not described in 'fsl_ssi_isr'
 sound/soc/fsl/fsl_ssi.c:380: warning: Function parameter or member 'dev_id' not described in 'fsl_ssi_isr'
 sound/soc/fsl/fsl_ssi.c:406: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_config_enable'
 sound/soc/fsl/fsl_ssi.c:406: warning: Function parameter or member 'tx' not described in 'fsl_ssi_config_enable'
 sound/soc/fsl/fsl_ssi.c:506: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_config_disable'
 sound/soc/fsl/fsl_ssi.c:506: warning: Function parameter or member 'tx' not described in 'fsl_ssi_config_disable'
 sound/soc/fsl/fsl_ssi.c:583: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_setup_regvals'
 sound/soc/fsl/fsl_ssi.c:675: warning: Function parameter or member 'substream' not described in 'fsl_ssi_set_bclk'
 sound/soc/fsl/fsl_ssi.c:675: warning: Function parameter or member 'dai' not described in 'fsl_ssi_set_bclk'
 sound/soc/fsl/fsl_ssi.c:675: warning: Function parameter or member 'hw_params' not described in 'fsl_ssi_set_bclk'
 sound/soc/fsl/fsl_ssi.c:798: warning: Function parameter or member 'substream' not described in 'fsl_ssi_hw_params'
 sound/soc/fsl/fsl_ssi.c:798: warning: Function parameter or member 'hw_params' not described in 'fsl_ssi_hw_params'
 sound/soc/fsl/fsl_ssi.c:798: warning: Function parameter or member 'dai' not described in 'fsl_ssi_hw_params'
 sound/soc/fsl/fsl_ssi.c:1003: warning: Function parameter or member 'dai' not described in 'fsl_ssi_set_dai_fmt'
 sound/soc/fsl/fsl_ssi.c:1003: warning: Function parameter or member 'fmt' not described in 'fsl_ssi_set_dai_fmt'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'dai' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'tx_mask' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'rx_mask' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'slots' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'slot_width' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1065: warning: Function parameter or member 'substream' not described in 'fsl_ssi_trigger'
 sound/soc/fsl/fsl_ssi.c:1065: warning: Function parameter or member 'cmd' not described in 'fsl_ssi_trigger'
 sound/soc/fsl/fsl_ssi.c:1065: warning: Function parameter or member 'dai' not described in 'fsl_ssi_trigger'
 sound/soc/fsl/fsl_ssi.c:1245: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_hw_init'
 sound/soc/fsl/fsl_ssi.c:1274: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_hw_clean'
 sound/soc/fsl/fsl_ssi.c:1292: warning: Function parameter or member 's' not described in 'make_lowercase'

Also use correct formatting when documenting structs:

 sound/soc/fsl/fsl_ssi.c:258: warning: cannot understand function prototype: 'struct fsl_ssi '

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_ssi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 1a2fa7f181423..5717d664cde1e 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -203,7 +203,7 @@ struct fsl_ssi_soc_data {
 };
 
 /**
- * fsl_ssi: per-SSI private data
+ * struct fsl_ssi - per-SSI private data
  *
  * @regs: Pointer to the regmap registers
  * @irq: IRQ of this SSI
@@ -373,7 +373,7 @@ static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
 		SND_SOC_DAIFMT_CBM_CFS;
 }
 
-/**
+/*
  * Interrupt handler to gather states
  */
 static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
@@ -394,7 +394,7 @@ static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-/**
+/*
  * Set SCR, SIER, STCR and SRCR registers with cached values in regvals
  *
  * Notes:
@@ -474,7 +474,7 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 	ssi->streams |= BIT(dir);
 }
 
-/**
+/*
  * Exclude bits that are used by the opposite stream
  *
  * When both streams are active, disabling some bits for the current stream
@@ -494,7 +494,7 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 #define ssi_excl_shared_bits(vals, avals, aactive) \
 	((vals) & _ssi_xor_shared_bits(vals, avals, aactive))
 
-/**
+/*
  * Unset SCR, SIER, STCR and SRCR registers with cached values in regvals
  *
  * Notes:
@@ -576,7 +576,7 @@ static void fsl_ssi_tx_ac97_saccst_setup(struct fsl_ssi *ssi)
 	}
 }
 
-/**
+/*
  * Cache critical bits of SIER, SRCR, STCR and SCR to later set them safely
  */
 static void fsl_ssi_setup_regvals(struct fsl_ssi *ssi)
@@ -660,7 +660,7 @@ static void fsl_ssi_shutdown(struct snd_pcm_substream *substream,
 	clk_disable_unprepare(ssi->clk);
 }
 
-/**
+/*
  * Configure Digital Audio Interface bit clock
  *
  * Note: This function can be only called when using SSI as DAI master
@@ -781,7 +781,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/**
+/*
  * Configure SSI based on PCM hardware parameters
  *
  * Notes:
@@ -996,7 +996,7 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 	return 0;
 }
 
-/**
+/*
  * Configure Digital Audio Interface (DAI) Format
  */
 static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -1010,7 +1010,7 @@ static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return _fsl_ssi_set_dai_fmt(ssi, fmt);
 }
 
-/**
+/*
  * Set TDM slot number and slot width
  */
 static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
@@ -1054,7 +1054,7 @@ static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 	return 0;
 }
 
-/**
+/*
  * Start or stop SSI and corresponding DMA transaction.
  *
  * The DMA channel is in external master start and pause mode, which
@@ -1238,7 +1238,7 @@ static struct snd_ac97_bus_ops fsl_ssi_ac97_ops = {
 	.write = fsl_ssi_ac97_write,
 };
 
-/**
+/*
  * Initialize SSI registers
  */
 static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
@@ -1267,7 +1267,7 @@ static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
 	return 0;
 }
 
-/**
+/*
  * Clear SSI registers
  */
 static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
@@ -1285,7 +1285,7 @@ static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
 		regmap_update_bits(ssi->regs, REG_SSI_SCR, SSI_SCR_SSIEN, 0);
 	}
 }
-/**
+/*
  * Make every character in a string lower-case
  */
 static void make_lowercase(char *s)
-- 
2.25.1

