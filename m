Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F264126F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 21:40:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCvzs72VRz2yJV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 05:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z27HSHOX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Z27HSHOX; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCvzF1gtnz2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 05:40:06 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id i25so72869230lfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0d+1u0/MGOf1Q+rRJjNzrlBMOxR6V08d5yL0PRRuFjk=;
 b=Z27HSHOXeONBAxoy541SkWEavFdL299blXuqc2n5ujiwo7gG80cp8+qYAGh1PzTLb+
 f1D74ClKDHTv+VFv1IgQbF9kOYYPrg8ok2OnadReIJlKhVlN5AJv1Ab9aakm5RA6DB+u
 25Hgq7Qaj11btnrGSzWCi3PdFes+eWMGo5CWJ9rR8fnAeltDP4NffLDjv9NbnQeisFu8
 TH7U86NaUg3q/hLUOoxnXUZfBk23sEjy9c1uaFLcQ4JY7VWeHNBD2J2VZ6UHy4WyFTmZ
 FIru+MgsMYPAx9e7JVmxk2COcGnYkK/9RXdjoimhDOO76gKDZOLWvfQIKehOGJTPtqNo
 t74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0d+1u0/MGOf1Q+rRJjNzrlBMOxR6V08d5yL0PRRuFjk=;
 b=VUuDZ3ABX+VfkKNM1lsp82EYE6cUKNoCdYxjC/G95CkKquM3VvE0LLUxTRZL9+1LW6
 3pjxtuYTgb+xHHxp++AxjMvSrSdaXbDN+MhtIO8vzYMxVuhi5IBUCqcLtdYbfM/mRoZJ
 6T1exnzfMotex7AYIB55SXWGJ8L+i4mLWFoZRPuzdOVZW0Mx/eVbLPg+XpKWnWOf0F0a
 9+m39fP8wQ16l5+yaapCCOzq2lVGzSbpmtmdqU5rTyTguxMfVcNzaux51kmOZ/ISeVLp
 19vxNnq6TZVlna6vwnp2JCmVBbJDHMqLMwmtEHag4CJRKdqVXWYfGS1z8xaYw03dd2+Z
 OlXQ==
X-Gm-Message-State: AOAM533x2eypq3PCdycbGPXDQtOB7TYNz1h6Ex7w1Ciu1pqyC8wxhFK3
 7bakfUDOCFr3ORR5++xYNJo=
X-Google-Smtp-Source: ABdhPJxkMxrniDwwp6a9hFc5k/MvdsynqXqzCzYiuyoNQHhMjqhkhBiYHRLG4GrNFJMcpZTnzrtiTw==
X-Received: by 2002:a2e:bd8b:: with SMTP id o11mr14743218ljq.321.1632166802693; 
 Mon, 20 Sep 2021 12:40:02 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id y11sm475899lfs.135.2021.09.20.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:40:02 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ASoC: fsl: Constify static snd_soc_ops
Date: Mon, 20 Sep 2021 21:39:47 +0200
Message-Id: <20210920193947.10237-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
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
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are only assigned to the ops field in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/fsl/imx-audmix.c | 4 ++--
 sound/soc/fsl/imx-card.c   | 4 ++--
 sound/soc/fsl/imx-hdmi.c   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index a364e2415de0..0d637929bfef 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -132,12 +132,12 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops imx_audmix_fe_ops = {
+static const struct snd_soc_ops imx_audmix_fe_ops = {
 	.startup = imx_audmix_fe_startup,
 	.hw_params = imx_audmix_fe_hw_params,
 };
 
-static struct snd_soc_ops imx_audmix_be_ops = {
+static const struct snd_soc_ops imx_audmix_be_ops = {
 	.hw_params = imx_audmix_be_hw_params,
 };
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 58fd0639a069..05dff2dc1d19 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -442,12 +442,12 @@ static int imx_aif_startup(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static struct snd_soc_ops imx_aif_ops = {
+static const struct snd_soc_ops imx_aif_ops = {
 	.hw_params = imx_aif_hw_params,
 	.startup = imx_aif_startup,
 };
 
-static struct snd_soc_ops imx_aif_ops_be = {
+static const struct snd_soc_ops imx_aif_ops_be = {
 	.hw_params = imx_aif_hw_params,
 };
 
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 34a0dceae621..2b663c39edb2 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -59,7 +59,7 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops imx_hdmi_ops = {
+static const struct snd_soc_ops imx_hdmi_ops = {
 	.hw_params = imx_hdmi_hw_params,
 };
 
-- 
2.33.0

