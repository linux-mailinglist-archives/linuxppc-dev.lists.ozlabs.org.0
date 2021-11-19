Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207EF457BF0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 07:04:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx30D4Wq3z3cb1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 17:04:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Pb5qrBGK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Pb5qrBGK; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hwgrj1cZyz304v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 02:41:56 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id A9EA01F47557
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336044; bh=+WJq9p/OLtoII51RYDtOsRr+UMSRm2h49gRsaYg7JsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pb5qrBGKnYlPTaj8/1WNQLtWmVOGSRe0E8uRF/0L9bSDi86RKE62N8nlezDZ6KjZm
 8QGaChhOUs/3ViCWVCLMAuMLLd5VmxBQN3eeyKTKn3auz/MFrN7n2jTPCZLakLwYiQ
 IpFAhxk85OJlwcWKrgczYcAxo9+OFpN6qbJZ/ukT2sUHq5EpnunraBlPW+kifS3IxF
 pdXLFIvYDrbit6+9hEGbe4mFbyrMAWoU+iu3altB0Zg/5c9qs8z7sVeM7Jv/t1H8+5
 EWf633L0leIPvqFHsUetfQFCkLZaWafm1Lvje2uBDQMeCH0ent6607df+GR1IUmX7C
 K3jkd4ugUFYng==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 1/5] ASoC: tlv320aic31xx: Fix typo in BCLK clock name
Date: Fri, 19 Nov 2021 12:32:44 -0300
Message-Id: <20211119153248.419802-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 Nov 2021 17:01:52 +1100
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
Cc: bkylerussell@gmail.com, ariel.dalessandro@collabora.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 broonie@kernel.org, michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 sound/soc/codecs/tlv320aic31xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.h b/sound/soc/codecs/tlv320aic31xx.h
index 2513922a0292..80d062578fb5 100644
--- a/sound/soc/codecs/tlv320aic31xx.h
+++ b/sound/soc/codecs/tlv320aic31xx.h
@@ -118,7 +118,7 @@ struct aic31xx_pdata {
 #define AIC31XX_PLL_CLKIN_MASK		GENMASK(3, 2)
 #define AIC31XX_PLL_CLKIN_SHIFT		(2)
 #define AIC31XX_PLL_CLKIN_MCLK		0x00
-#define AIC31XX_PLL_CLKIN_BCKL		0x01
+#define AIC31XX_PLL_CLKIN_BCLK		0x01
 #define AIC31XX_PLL_CLKIN_GPIO1		0x02
 #define AIC31XX_PLL_CLKIN_DIN		0x03
 #define AIC31XX_CODEC_CLKIN_MASK	GENMASK(1, 0)
-- 
2.30.2

