Return-Path: <linuxppc-dev+bounces-8861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82EAC03BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 07:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2x6S5dZgz3c4V;
	Thu, 22 May 2025 15:04:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747890272;
	cv=none; b=L/4m5HQ9g1/1QJN/6SRnwnGXJ1K2hvTYRk0FB0IpWUJpqPrvLi8TKHVGzLLJayQ+fV/y+NRPCZbw4iJawlVXwAR8Uz5lsn6j7qEsdWYU/lDkxaZJK9hLdecuQLNQvIZEa9/a8txxedC63ebDj8qaURiZMQO8rAutx1j+GL8RKxoQuGWxFSBnjJ7KZCqygPUQ6K1t1u1qmM3SW2iGMGaxpouoV7MCpxuDPF3RyFqSNCLo9yKfuvvKG1p0pMiivY6GdD5RyqYLkxV0aietsPPjoWQw/2CuOnq8EOkq8WWIQoJueZYtkzw9Hkh9ZAM/zAKETzHHhPZzuot20Y6EfmgZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747890272; c=relaxed/relaxed;
	bh=tsR6mYUtq2XfOzUIFlgh+/rijlI9v7OFnIcx2nltOu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mx6lBwx3OU+x1yoeZD5pfIj/hLp85Idp/XFzZlIWgMGfwaUpgZRqACtp37KFclmH/tqbTvGl1PjPGHhzoB+O/+TZlMy+v6TKKUdM8VJcUtAjKEUkdZmS79/n823TEn0ZeAzLzKRTqpIfWpvLgw2ILsz6LejmuiygdBYCVjhW7H3+24w7nohz/YPBEbkgtkKa9Wnzx8N3Lee3SQbWZGfU9NdiD1HcndEhHTyDSm5vo7x4SdBqyRHROB04E2aWnkRFjok8rdI7eUlI2sfGOwgbJxwQ42l4A1B2gHSF6GRf4g5zGMhJz+Q+9GQZPMr0wfcBd8xxuNu74WhNqj/diX1aXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2x6R2yLSz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 15:04:31 +1000 (AEST)
X-UUID: 159fb13836ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7f164c9f-baa5-4d50-a339-21cb64697b9b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:321115aeff15446721dda91ee448727e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 159fb13836ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 85146597; Thu, 22 May 2025 13:03:22 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id ECF8B16003840;
	Thu, 22 May 2025 13:03:21 +0800 (CST)
X-ns-mid: postfix-682EB019-81249130
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id BBAE216001CC7;
	Thu, 22 May 2025 05:03:19 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v2 2/6] ASoC: aoa: Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:55 +0800
Message-ID: <20250522050300.519244-3-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522050300.519244-1-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The for_each_child_of_node_scoped() helper provides a scope-based
clean-up functionality to put the device_node automatically, and
as such, there is no need to call of_node_put() directly.

Thus, use this helper to simplify the code.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/aoa/soundbus/i2sbus/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus=
/core.c
index ce84288168e4..20a4c5891afc 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -207,6 +207,8 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 			}
 		}
 	}
+	of_node_put(sound);
+
 	/* for the time being, until we can handle non-layout-id
 	 * things in some fabric, refuse to attach if there is no
 	 * layout-id property or we haven't been forced to attach.
@@ -335,7 +337,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
=20
 static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id=
 *match)
 {
-	struct device_node *np;
 	int got =3D 0, err;
 	struct i2sbus_control *control =3D NULL;
=20
@@ -347,7 +348,7 @@ static int i2sbus_probe(struct macio_dev* dev, const =
struct of_device_id *match)
 		return -ENODEV;
 	}
=20
-	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
+	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
 		if (of_device_is_compatible(np, "i2sbus") ||
 		    of_device_is_compatible(np, "i2s-modem")) {
 			got +=3D i2sbus_add_dev(dev, control, np);
--=20
2.47.1


