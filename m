Return-Path: <linuxppc-dev+bounces-8952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B8AC4A3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 May 2025 10:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b65M42H2Xz2yds;
	Tue, 27 May 2025 18:26:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748334384;
	cv=none; b=GQwC/A5DBhoMk36KL3PPP8K/7+nsSx+afWVQRRpolarkuI9951dPq/c1ncKHHP0el7V02HCPM5PryxtbBbsY1NDu68Yq87kXh2Hrt7OWXTA4aKh7YUAbY9r8fTxqJgpyF40TMwXpROK6yXKE/Zulz3y/BWSVS6oRreBK8qPZzpsTwtsAiJA3qFHVR1XX0iNT1R6K/0UNHT4lmsH2fHfv7kQ1j6DcqBVdo4tQtafxVuDILBynElZE0GIGC+yVKhzMOm+94XYghZYnhWJYhMg7hdegk1HlLmI3SWWP4Dj6sbb9yN9So/kRvzPkO0SYiwIxcT7c37KsHXF9EfkOyiXn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748334384; c=relaxed/relaxed;
	bh=fS3kmzhNEoRkhRtbQWk1eTg0NiNX9cwe2tb51MDl6Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9jSCD563mYfyqPBzlhs6elswb+2s5vERjWXkT3M+NCUYCJLntVMcPahMJ2g8dtVSXznsfS7Mp7Z1cdpW3YiCXUuR8eGwDVEYbtyIUhkNoKVZ+HruEd55ze1Z6gC9+Y60D3+wiPaJRo30lRZyLysW+dwtmA65phaeAlkxJpKxE/mnccjMn8ak0RDGkqnmgLbGUmghAT27DqJUkeJsm9HpcC2iP5Q8kY5XzZcVqv1Yvt97qtEgHOM5u9f3WiCA+leSgLPz7aL1yXsHdX5pFGL9KQkEd8EaBhxGwN3Yfnj9u8khqcxSux0+ajibq4DBKgUC+P5lXFUMUZ6WLMO51TV+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b65M30JHRz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 18:26:22 +1000 (AEST)
X-UUID: 1be07e0c3ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d92f471f-a90a-48cf-9ece-d16b7edd8a45,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:ccf9f53adcad70a7c340a906c6d1460f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1be07e0c3ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 974318342; Tue, 27 May 2025 16:25:12 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 124C916001F52;
	Tue, 27 May 2025 16:25:12 +0800 (CST)
X-ns-mid: postfix-683576E7-8481202684
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id AC60716001F49;
	Tue, 27 May 2025 08:25:09 +0000 (UTC)
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
Subject: [PATCH v3 2/6] ALSA: aoa: Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:42 +0800
Message-ID: <20250527082446.2265500-3-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527082446.2265500-1-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
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
clean-up functionality to put the device_node automatically.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/aoa/soundbus/i2sbus/core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus=
/core.c
index ce84288168e4..c1bd0565fc51 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -155,7 +155,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 			  struct device_node *np)
 {
 	struct i2sbus_dev *dev;
-	struct device_node *child, *sound =3D NULL;
+	struct device_node *sound =3D NULL;
 	struct resource *r;
 	int i, layout =3D 0, rlen, ok =3D force;
 	char node_name[8];
@@ -178,7 +178,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 		return 0;
=20
 	i =3D 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_node_name_eq(child, "sound")) {
 			i++;
 			sound =3D child;
@@ -335,7 +335,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
=20
 static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id=
 *match)
 {
-	struct device_node *np;
 	int got =3D 0, err;
 	struct i2sbus_control *control =3D NULL;
=20
@@ -347,7 +346,7 @@ static int i2sbus_probe(struct macio_dev* dev, const =
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


