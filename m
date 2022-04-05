Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EF4F3C92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 18:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXt7x6Y2qz3bdP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 02:17:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=afa@pengutronix.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1078 seconds by postgrey-1.36 at boromir;
 Wed, 06 Apr 2022 02:16:37 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXt7T5x5Hz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 02:16:36 +1000 (AEST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1nblZT-0004nd-AF; Tue, 05 Apr 2022 17:58:19 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <afa@pengutronix.de>)
 id 1nblZR-0038Jb-G8; Tue, 05 Apr 2022 17:58:17 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Viorel Suman <viorel.suman@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
Date: Tue,  5 Apr 2022 17:57:31 +0200
Message-Id: <20220405155731.745413-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
 Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
bclk:mclk ratio support") led to the bypass never happening
as (ratio = 1) was caught in the existing if (ratio & 1) continue;
check. The correct check sequence instead is:

 - skip all ratios lower than one and higher than 512
 - skip all odd ratios except for 1:1
 - skip 1:1 ratio if and only if !support_1_1_ratio

And for all others, calculate the appropriate divider. Adjust the
code to facilitate this.

Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index a992d51568cc..50c377f16097 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -372,7 +372,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 			continue;
 		if (ratio == 1 && !support_1_1_ratio)
 			continue;
-		else if (ratio & 1)
+		if ((ratio & 1) && ratio > 1)
 			continue;
 
 		diff = abs((long)clk_rate - ratio * freq);
-- 
2.30.2

