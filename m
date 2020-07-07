Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0E216A65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:34:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Jj44DpNzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 20:34:48 +1000 (AEST)
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
 header.s=google header.b=qrsas+PZ; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1JJZ1Dy5zDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 20:17:01 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id j4so42132002wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HXwAK5e9O3NfsiXPR7kk8AeqU5Nw2ls4PmOWf/vu7lg=;
 b=qrsas+PZEhVKEED/gwuG+M3fvZFc9iTyVZ9kC/kfAQJtySYFhAXFVpKKKmyVPzJsef
 fCJFw/7CBzrR/D0H4Ibl8ook5vPEI7nkN6UMPeetQWBt4M+Kx0Tquh3FeHQKe+00wO+m
 GqDseXgUs910Lbr6v6S1qDkgnl8n1Y7UIIuytj30iKNt1AOZABZ9LymxXsaWj6zDFYGe
 XI8qHYoQ/wOSdxtGcESFe8ZYMktICg66e53gTSweXye36XFgFl6kw5awQcpN8EpYSN23
 8sMm+Tp30g9gUcdoX30JFTNJlS2oJp3wB6d8NA/Z4UGG+OpYufSxlq2WEns0mrZb6qvR
 vMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HXwAK5e9O3NfsiXPR7kk8AeqU5Nw2ls4PmOWf/vu7lg=;
 b=FjnMyySAqPDduOoc8VrxZzF/AWLuDeqR8zdU+IrP6fkJ0aR/XScFccchHfmKWw/Gra
 u1eeLiPQkcq0tPN+IFVRI8jU7Qf5pF1sy70W+kCsderByJ1J+YsRWP+nuiApfriQ5gFK
 T3f8wiYXC8G7saGB5XYxvVYQxgylih763546sbl+i3QNcMkK2kdfDRq9ON6laTWQ/w/l
 x9LsWityifw7NJ03PFsJxvo8n2zNUheuWNvoqkyjBdYvayHdMG0PSKTdLkbFMrZBH/jP
 /+9wTVUqOczVTmmh6vGwb+T/+dfzGotNgjlNlCuP57m/EvwDXJoWorte5EUJzn6CVssT
 wGcw==
X-Gm-Message-State: AOAM530lpirxDppakyQkNLrcl4Sz3n+sUmaHMEF1sPIV5nPgKeozLK+r
 qLT/76qCCj9FJBVx8zxD+mHP2g==
X-Google-Smtp-Source: ABdhPJw+rbiTfjvaZjvfOEvXP2PwVD2bXCDT7mTpQWEQuNXSkRYtQLVPb8Dx6k7fktqcFGcvxY+9RA==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr51092373wru.88.1594117018607; 
 Tue, 07 Jul 2020 03:16:58 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 08/28] ASoC: fsl: fsl_spdif: Update 'struct fsl_spdif_priv's
 descriptions
Date: Tue,  7 Jul 2020 11:16:22 +0100
Message-Id: <20200707101642.1747944-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
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
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two descriptions for 'soc' and 'regcache_srpc' were missing.  Add them.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_spdif.c:125: warning: Function parameter or member 'soc' not described in 'fsl_spdif_priv'
 sound/soc/fsl/fsl_spdif.c:125: warning: Function parameter or member 'regcache_srpc' not described in 'fsl_spdif_priv'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_spdif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7aa3bdec5b6b5..f0b2375a9246f 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -83,6 +83,7 @@ struct spdif_mixer_control {
 /**
  * struct fsl_spdif_priv - Freescale SPDIF private data
  *
+ * @soc: SoC specific data
  * @fsl_spdif_control: SPDIF control data
  * @cpu_dai_drv: cpu dai driver
  * @pdev: platform device pointer
@@ -100,6 +101,7 @@ struct spdif_mixer_control {
  * @spbaclk: SPBA clock (optional, depending on SoC design)
  * @dma_params_tx: DMA parameters for transmit channel
  * @dma_params_rx: DMA parameters for receive channel
+ * @regcache_srpc: regcache for SRPC
  */
 struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
@@ -120,7 +122,6 @@ struct fsl_spdif_priv {
 	struct clk *spbaclk;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
-	/* regcache for SRPC */
 	u32 regcache_srpc;
 };
 
-- 
2.25.1

