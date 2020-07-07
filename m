Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AA216F35
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:47:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1QJz0dyNzDqV5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fOdzTEcf; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5c41D6zDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:37:55 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id w3so34316699wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDb2cHewYsZWIM9X5BweTMn+o+Wme2rV/mNBj7f6Kc0=;
 b=fOdzTEcfqDWXHHGsK3RSk6klgVeOq4kKl1yqa8GPt8rsKxfPxvACiPgftfArSdTfkn
 +bQP4l0HPEwtB2OpMJKUC/eVmcBLrAEqMXMmhXguk81lmiE8Y52qpuOWTZsCHqU7hg7w
 mZFrHdufwhigmefa9nvoXDFxevuX0x3LowKfRY2BwYO3xmos96rbsa3JWfwZj03d9zhO
 3WB9PjUPT/yWwNWC4Tb0zonDWluOEIN5raUub5n3CcGXhPTUBpA1xb8+4p5wOKWpGZBO
 Rh+Arwk0kubZqjIDBZJbBFATGww6GSpX81zAvCfNfFEq2bSBtDks044WHz4zpeln4+mm
 C7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDb2cHewYsZWIM9X5BweTMn+o+Wme2rV/mNBj7f6Kc0=;
 b=Jbm6hzyV9UvLPcqucwxu+F8ejeIJvvCC4HEmluuMzh7LafGhFBGPgLCL7ZZHP1dfdK
 AUK5pC6eJEgvXFe7xvkAa4nW+R1cVrXIhS+9c6hCWQ4UqCgT+vRnR6C3NjpWtxZuo4Zl
 RGnU4T1oBaAM3tPmyp8D2rNIWUhoLfHs4EWFk+QsRPDvWvXh+o0U70c2z5WMZPTKhCQ4
 wfo7zPsL218HuX4BSGaMXobWEGHwFKggJxTJtat2OhAqK2BVX/xLtNsm4bsaps2EA+wU
 N2bdcoDLusf/YIZD7DigC2q/6gHEB0U0vmcHanlz2MLahg/AGxBcehoSbkZvpn353r4q
 rZug==
X-Gm-Message-State: AOAM533ZnNRmS2A2WN3SEVpXbqZ0VXZ9G5lt9/dynGHSj+FukARw8viH
 AGwGNWOCrQaBFkWofZMibKz19Q==
X-Google-Smtp-Source: ABdhPJzv0lUCdAZV7Tzonh9ODAAoKJ3ODB1Ka6SB0h4CZrG5qt7dZrtoXm09LT11yngBdC4AIyvYEw==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr4794988wmj.31.1594132669656; 
 Tue, 07 Jul 2020 07:37:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 03/28] ASoC: fsl: fsl-asoc-card: Use correct format when
 providing struct documentation
Date: Tue,  7 Jul 2020 15:37:17 +0100
Message-Id: <20200707143742.2959960-4-lee.jones@linaro.org>
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

Struct kerneldoc headers need to be prefixed with 'struct $NAME', else
the checker gets confused.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl-asoc-card.c:43: warning: cannot understand function prototype: 'struct codec_priv '
 sound/soc/fsl/fsl-asoc-card.c:60: warning: cannot understand function prototype: 'struct cpu_priv '
 sound/soc/fsl/fsl-asoc-card.c:83: warning: cannot understand function prototype: 'struct fsl_asoc_card_priv '
 sound/soc/fsl/fsl-asoc-card.c:104: warning: cannot understand function prototype: 'const struct snd_soc_dapm_route audio_map[] = '

Also the size of the struct does not belong in the description:

 sound/soc/fsl/fsl-asoc-card.c:65: warning: Function parameter or member 'sysclk_freq' not described in 'cpu_priv'
 sound/soc/fsl/fsl-asoc-card.c:65: warning: Function parameter or member 'sysclk_dir' not described in 'cpu_priv'
 sound/soc/fsl/fsl-asoc-card.c:65: warning: Function parameter or member 'sysclk_id' not described in 'cpu_priv'
 sound/soc/fsl/fsl-asoc-card.c:95: warning: Function parameter or member 'dai_link' not described in 'fsl_asoc_card_priv'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 57ea1b072326b..3b1fd8c9316d8 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -33,7 +33,7 @@
 #define DAI_FMT_BASE (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF)
 
 /**
- * CODEC private data
+ * struct codec_priv - CODEC private data
  *
  * @mclk_freq: Clock rate of MCLK
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
@@ -48,11 +48,11 @@ struct codec_priv {
 };
 
 /**
- * CPU private data
+ * struct cpu_priv - CPU private data
  *
- * @sysclk_freq[2]: SYSCLK rates for set_sysclk()
- * @sysclk_dir[2]: SYSCLK directions for set_sysclk()
- * @sysclk_id[2]: SYSCLK ids for set_sysclk()
+ * @sysclk_freq: SYSCLK rates for set_sysclk()
+ * @sysclk_dir: SYSCLK directions for set_sysclk()
+ * @sysclk_id: SYSCLK ids for set_sysclk()
  * @slot_width: Slot width of each frame
  *
  * Note: [1] for tx and [0] for rx
@@ -65,9 +65,9 @@ struct cpu_priv {
 };
 
 /**
- * Freescale Generic ASOC card private data
+ * struct fsl_asoc_card_priv - Freescale Generic ASOC card private data
  *
- * @dai_link[3]: DAI link structure including normal one and DPCM link
+ * @dai_link: DAI link structure including normal one and DPCM link
  * @pdev: platform device pointer
  * @codec_priv: CODEC private data
  * @cpu_priv: CPU private data
@@ -94,7 +94,7 @@ struct fsl_asoc_card_priv {
 	char name[32];
 };
 
-/**
+/*
  * This dapm route map exsits for DPCM link only.
  * The other routes shall go through Device Tree.
  *
-- 
2.25.1

