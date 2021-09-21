Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A302A413C3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:18:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ6B4dfnz3dbY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:18:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mr0Guyef;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mr0Guyef; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyd3rKWz300x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F5E561183;
 Tue, 21 Sep 2021 21:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258712;
 bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mr0GuyefhvVeR0nM8SDDyk4j159FtxaSTcHgqy1M4EDxjYhWtE+5Bs47ooBDhfnbV
 7LjvmK+ro766qUGNErxhYcg62nEOIa+vt1jxMldHIFjT9VigTmMwPQyD0l1sNp/We0
 15r+Jef08ki9QMUtmJnuG8ynU9NtF52iVX8p4z64T2CA0iu6G2ehjf8sQj8d68TMvx
 cbUGVU5YAkaZdAugEudmqO/kglPId6ji6SzEltQ4IbUgQL+pfEOF7U0bsZCncDfQIe
 /aJpVs5r422fu9gBQntTIy2NtJ/06NPcYnQQH50Z6yYiC9t5hMmMI27HL/HqSG+CBy
 te4tW+OVitLjA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 11/16] ASoC: imx-hdmi: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:35 +0100
Message-Id: <20210921211040.11624-11-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; h=from:subject;
 bh=ZYj9NVMXeaIG3c9cdYAHfhF0zFKiS0Xyjbv1Scqzlvo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknjtcMsmrJyiDMZhALEfCUW3kcme+k7rrv2Ads1
 L4E5sfqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ4wAKCRAk1otyXVSH0O9iB/
 9pRzQxjZIl3Fc/XKPL64rTxsLnj3IYHpU9Q0CsfSx1HxH+0qkGfXnIbmMBfDYzzle6NYJUqQ3Q5tZj
 g4CN92av9QbHJaGCqx2Aior8veJkxcTsnCIQeyxBbR8F4bf6V7z/wAVKh2WUPCqiCproI5tdwI0pCH
 /8fHRv94b7Ft9Xm8wZZTJhOT0G1EUzSlrar9thdh11xpnUY+VfHK3SjjfaC0QU2amIElZXIHI2bfEw
 FNQEugAPmY8eqVYYEfrIam60yiqJ7j4QwM8ewqkInYdAZmui1asHk+nlmB/LFH+kDqw5uXVhg0VqOG
 Qm6bP2TDDCbTh5eeVd4BZH7NZq5H4T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of moving to remove the old style defines for the bus clocks update
the imx-hdmi driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 34a0dceae621..c15e930fa2a6 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -171,7 +171,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 		data->dai.codecs->name = "hdmi-audio-codec.1";
 		data->dai.dai_fmt = data->dai_fmt |
 				    SND_SOC_DAIFMT_NB_NF |
-				    SND_SOC_DAIFMT_CBS_CFS;
+				    SND_SOC_DAIFMT_CBC_CFC;
 	}
 
 	if (hdmi_in) {
@@ -181,7 +181,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 		data->dai.codecs->name = "hdmi-audio-codec.2";
 		data->dai.dai_fmt = data->dai_fmt |
 				    SND_SOC_DAIFMT_NB_NF |
-				    SND_SOC_DAIFMT_CBM_CFM;
+				    SND_SOC_DAIFMT_CBP_CFP;
 	}
 
 	data->card.dapm_widgets = imx_hdmi_widgets;
-- 
2.20.1

