Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD8312067
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 00:12:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DY7Mx2sLXzDwlV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 10:11:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bL14WlfB; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DY7575MqnzDwj2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 09:59:02 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id a8so16266847lfi.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Feb 2021 14:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqb4s2Ei4nQ5JzQuxmamKDisIzQOM+m6EVfsBNYONRE=;
 b=bL14WlfBBkJuhiBNnv/jm9VeZsNQgSgO4Ppp/WZu8TftLEV1sdk+caORZ0FCmCnnw3
 Et0YIFiWjG8KdbWmh8bspRSwDc8FHwKSjXG1nOPId+yGNsSMJA2WZL3P6I1J8f0e03qU
 eECUlBLhHzZjp27Zpu4HmWimtaRxtbi98cfhW212apL+lh2bcaB1lJmEBfZxQee6tSpZ
 2tjCIfmE0ka0BkmKU4eQ1ENF8FUURcKOxiBF8pkfFCvWcHJ1YPpXbnkL8k9wHQEh7w8w
 cyQ39TX+AAy94TQfGNQnClNQXhfTvV3V+hDCmBQ98tdnTkeu5f/zXJIZcFXNxTQXeEx8
 Wdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqb4s2Ei4nQ5JzQuxmamKDisIzQOM+m6EVfsBNYONRE=;
 b=fgNNrW7Y6ANm5tCN5Sfp4Bvys/Ztx+9liV4BGCBNrGb0w9zeGl8oHsN+c/UTIDiZMO
 bxxLZJjnMCnGez0N4PNNOJRqcTjh2uNwsKo8X814iW+1q4iANiajIeuoq20gDc62wR1Z
 QX6OFHPStvNXJ1lSYWFFrIaB4Qx29JLbFAWbRtvdCFwzR194Pjn5ve5PJ0P6p10osec2
 6T9ca3o3D62pgJ1rbcZQbOgbyhKlxtsWrz7NArIj0ynHgRh1chp8mEBnDm34A9dQ+im7
 fqaboUc165mAt+snAEC19rOhTX8on7/+HBWNsLPprHvdtvhbs/ui7UVHzlsA7nbBHpuG
 aENg==
X-Gm-Message-State: AOAM5308/v70KwHJzxNYm3Zhs2tMMUluXy17Z9vWO+aAgjNCuutandtD
 c13F710Bo/2JRZWI2eo3xIs=
X-Google-Smtp-Source: ABdhPJw/YnVxaE3qbFOm+hUdBcFziMPiJkNg5hDiTQSDVPpUFCjZV4Fl7/pjyIWIu+JMzLyzIrii9A==
X-Received: by 2002:a19:4c02:: with SMTP id z2mr5912641lfa.590.1612652335311; 
 Sat, 06 Feb 2021 14:58:55 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id c20sm1467081lfh.275.2021.02.06.14.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 14:58:54 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl: constify static snd_soc_dai_ops structs
Date: Sat,  6 Feb 2021 23:58:49 +0100
Message-Id: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 07 Feb 2021 10:10:25 +1100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only usage of these is to assign their address to the 'ops' field in
the snd_soc_dai_driver struct, which is a pointer to const. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/fsl/fsl_easrc.c  | 2 +-
 sound/soc/fsl/fsl_micfil.c | 2 +-
 sound/soc/fsl/fsl_xcvr.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 60951a8aabd3..636a702f37a6 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1530,7 +1530,7 @@ static int fsl_easrc_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_dai_ops fsl_easrc_dai_ops = {
+static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
 	.startup = fsl_easrc_startup,
 	.trigger = fsl_easrc_trigger,
 	.hw_params = fsl_easrc_hw_params,
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 8aedf6590b28..5935af2e5ff4 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -381,7 +381,7 @@ static int fsl_micfil_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
-static struct snd_soc_dai_ops fsl_micfil_dai_ops = {
+static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 	.startup = fsl_micfil_startup,
 	.trigger = fsl_micfil_trigger,
 	.hw_params = fsl_micfil_hw_params,
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index dd228b421e2c..6dd0a5fcd455 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -857,7 +857,7 @@ static struct snd_kcontrol_new fsl_xcvr_tx_ctls[] = {
 	},
 };
 
-static struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
+static const struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
 	.prepare = fsl_xcvr_prepare,
 	.startup = fsl_xcvr_startup,
 	.shutdown = fsl_xcvr_shutdown,
-- 
2.30.0

