Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66D220F16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:21:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6KLv4lYNzDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6KB93vXPzDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:13:52 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D21A1A01F3;
 Wed, 15 Jul 2020 16:13:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E43AF1A0461;
 Wed, 15 Jul 2020 16:13:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 31265402E4;
 Wed, 15 Jul 2020 22:13:38 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com
Subject: [PATCH v2 1/3] ASoC: simple-card-utils: Support configure pin_name
 for asoc_simple_init_jack
Date: Wed, 15 Jul 2020 22:09:37 +0800
Message-Id: <1594822179-1849-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the pin_name is fixed in asoc_simple_init_jack, but some driver
may use a different pin_name. So add a new parameter in
asoc_simple_init_jack for configuring pin_name.

If this parameter is NULL, then the default pin_name is used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 include/sound/simple_card_utils.h     | 6 +++---
 sound/soc/generic/simple-card-utils.c | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index bbdd1542d6f1..86a1e956991e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -12,9 +12,9 @@
 #include <sound/soc.h>
 
 #define asoc_simple_init_hp(card, sjack, prefix) \
-	asoc_simple_init_jack(card, sjack, 1, prefix)
+	asoc_simple_init_jack(card, sjack, 1, prefix, NULL)
 #define asoc_simple_init_mic(card, sjack, prefix) \
-	asoc_simple_init_jack(card, sjack, 0, prefix)
+	asoc_simple_init_jack(card, sjack, 0, prefix, NULL)
 
 struct asoc_simple_dai {
 	const char *name;
@@ -131,7 +131,7 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			       struct asoc_simple_jack *sjack,
-			       int is_hp, char *prefix);
+			       int is_hp, char *prefix, char *pin);
 int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 8c54dc6710fe..b408cb5ed644 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -540,7 +540,8 @@ EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			  struct asoc_simple_jack *sjack,
-			  int is_hp, char *prefix)
+			  int is_hp, char *prefix,
+			  char *pin)
 {
 	struct device *dev = card->dev;
 	enum of_gpio_flags flags;
@@ -557,12 +558,12 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 
 	if (is_hp) {
 		snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
-		pin_name	= "Headphones";
+		pin_name	= pin ? pin : "Headphones";
 		gpio_name	= "Headphone detection";
 		mask		= SND_JACK_HEADPHONE;
 	} else {
 		snprintf(prop, sizeof(prop), "%smic-det-gpio", prefix);
-		pin_name	= "Mic Jack";
+		pin_name	= pin ? pin : "Mic Jack";
 		gpio_name	= "Mic detection";
 		mask		= SND_JACK_MICROPHONE;
 	}
-- 
2.27.0

