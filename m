Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A32EF413C4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ9r4HB0z3dsn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPw3Keic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WPw3Keic; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyv01Htz30Qv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:12:06 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C5F461183;
 Tue, 21 Sep 2021 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258725;
 bh=9kvioNqkIrsS8HBoj2GlyRdysXDxOgoRAuVJFCeoBUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WPw3Keicx/StpuJlgsVRUIJ3NBGqv79ilvarBKprCu4aQnxZHRvO9uX5h4hWF84OV
 WYaZQQZIFtsfpUEXvoMbchL4i04fTMfp6+bb3QdCW/x9cgag11vqJQPhxiEqppLpNq
 1E75jCj5dxnDW+YR3wD/kVZa+CAaf4H1uuVZl4xsQJ23XPxYx6Uiq7kPNso8ueHpCf
 ypi0EV40iFgMLF1pn8ItgYJATkQv5OwV93+jEhhT57zcUG8ud2yKERWboU67GY+7DA
 YyjZfO6IyxzSn8uDauvhHi82c9pHTCFdkObHmcrWJrme63JgdfehFmOdxZirNSVtI8
 zzgrklEjf9njg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 16/16] ASoC: pl1022_rdk: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:40 +0100
Message-Id: <20210921211040.11624-16-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; h=from:subject;
 bh=9kvioNqkIrsS8HBoj2GlyRdysXDxOgoRAuVJFCeoBUo=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhkQvz+fzJiz+8G4yz8z3wT4qpw/5756dzCET0Tgpv2e/4fV9
 Vx5kdjIaszAwcjHIiimyrH2WsSo9XGLr/EfzX8EMYmUCmcLAxSkAE9HKZf+nei/3FOehZZfurE7rj2
 yaEbR45RUGY4tE8w9z01p+93ktEom584Z//oo/1ffzBbQ8daeZ2cxwLXRqcFuremvhKV0PuZb4dZX5
 qWyVk+9dPKDSah/+snj7Ite/Pi3fko81JOyP5FNqSDq4/3KdWL861z+lA7XVJjUX+YQKXzROnegrdn
 uyxXnj4kylrccS9FZml8vO3cTndVzfty+w0XJ797/bqebLr2lKzLRQqNeXYIwK+eS6Ii8t/jBjUZNj
 kNDrRT4l7ov2rWfefsH3V4oGd81Fsf4k0b6IqIO25vezAnmLWBVNf27xPZ7PPPe/2qYvU6x0el9VcU
 axHnK9UiCRrxX+ZeZTp/abPCfqAA==
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
the pl1022_rdk driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/p1022_rdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index 714515b8081f..b395adabe823 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -265,7 +265,7 @@ static int p1022_rdk_probe(struct platform_device *pdev)
 	 * only one way to configure the SSI.
 	 */
 	mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM;
+		SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP;
 	mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 	mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 
-- 
2.20.1

