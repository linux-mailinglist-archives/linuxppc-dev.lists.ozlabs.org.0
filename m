Return-Path: <linuxppc-dev+bounces-8865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F329AC03C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 07:05:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2x6n6z1dz3c7S;
	Thu, 22 May 2025 15:04:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747890289;
	cv=none; b=XxyEmQe28xTUbQoApuFOfjb1yf+vfkNpkprhj2MzDqkPlL2rr0B2hyR1DuSryTghmb4e2P2JjwfgpkLuH6klDIz8yHrLCg7yClXShvG6ckvCoC8V9lnyX0vkzCveXAsnfqMZLzleiNu3NbvaqByLbsdHov8arq5oTPVE1R+z62BCZSnva7QeCyyR3TFSIHy91WJ8Yf0287JjwCrl0fs9ovp/slECNvVMaf7lDD+O5ObDxt3Tx13PceeXI8hvrdgg8mY8w/oU1NMG9x+eyqR0NW3THIS+RSvAvynNY7Hlj062SAj6qGG7+SG4zAD0fUuL+HeJsXqXVeYrxAEYvfYOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747890289; c=relaxed/relaxed;
	bh=qPUCXsPGc+4erH3P3HSqGBpkg4cLX1U7TN5xq7voaMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C60dTQkb8xijGxGhFXHIZUuWWoUc30YJZ5Cyw5qOc+OFlIE6dxpuTELEDbqX5f2z1vXWFajaO52ogdIuBzUE4TTRRMVhDABt+nDAj/hbbj13GiWOw4VU2HT4a/lotJeZBHlJJbkYmZzbjMw4VJ/PBGngeyZBCxS6WZZkGVl05283VNvAMvaF3S5RjGZmwj3YuV4V0jCqmQYO0lFX3ZD54TWlURpzjyDfzx/9bjdxA2eCEzgDUGHM6nQZ6AdhuE4oX9u6Be/ipHbuGtXCVj1zs4Tllgh2vZ34sLRBmz3VR4+vt7TAxB/oYGPHziuaJzRtQKO52ZPpiMeTjjpwskx00g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2x6m3hwMz3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 15:04:48 +1000 (AEST)
X-UUID: 1e8158ce36ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ea555cc8-6fa9-4a34-abf1-8b3b44eadeba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c89aa460ca0e367d394d49b188629272,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e8158ce36ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 960776778; Thu, 22 May 2025 13:03:37 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id DF9AE16003840;
	Thu, 22 May 2025 13:03:36 +0800 (CST)
X-ns-mid: postfix-682EB028-75871135
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id B9FFF16001CC7;
	Thu, 22 May 2025 05:03:34 +0000 (UTC)
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
Subject: [PATCH v2 6/6] ASoC: qcom: Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:59 +0800
Message-ID: <20250522050300.519244-7-aichao@kylinos.cn>
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
 sound/soc/qcom/lpass-cpu.c       | 3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..62f49fe46273 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1046,7 +1046,6 @@ static unsigned int of_lpass_cpu_parse_sd_lines(str=
uct device *dev,
 static void of_lpass_cpu_parse_dai_data(struct device *dev,
 					struct lpass_data *data)
 {
-	struct device_node *node;
 	int ret, i, id;
=20
 	/* Allow all channels by default for backwards compatibility */
@@ -1056,7 +1055,7 @@ static void of_lpass_cpu_parse_dai_data(struct devi=
ce *dev,
 		data->mi2s_capture_sd_mode[id] =3D LPAIF_I2SCTL_MODE_8CH;
 	}
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret =3D of_property_read_u32(node, "reg", &id);
 		if (ret || id < 0) {
 			dev_err(dev, "valid dai id not found: %d\n", ret);
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6af=
e-dai.c
index 7d9628cda875..64735f2adf8f 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -962,10 +962,9 @@ static const struct snd_soc_component_driver q6afe_d=
ai_component =3D {
 static void of_q6afe_parse_dai_data(struct device *dev,
 				    struct q6afe_dai_data *data)
 {
-	struct device_node *node;
 	int ret;
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		unsigned int lines[Q6AFE_MAX_MI2S_LINES];
 		struct q6afe_dai_priv_data *priv;
 		int id, i, num_lines;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6as=
m-dai.c
index a400c9a31fea..d7680dd3a3bb 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1236,10 +1236,8 @@ static int of_q6asm_parse_dai_data(struct device *=
dev,
 {
 	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_pcm_stream empty_stream;
-	struct device_node *node;
 	int ret, id, dir, idx =3D 0;
=20
-
 	pdata->num_dais =3D of_get_child_count(dev->of_node);
 	if (!pdata->num_dais) {
 		dev_err(dev, "No dais found in DT\n");
@@ -1253,7 +1251,7 @@ static int of_q6asm_parse_dai_data(struct device *d=
ev,
=20
 	memset(&empty_stream, 0, sizeof(empty_stream));
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret =3D of_property_read_u32(node, "reg", &id);
 		if (ret || id >=3D MAX_SESSIONS || id < 0) {
 			dev_err(dev, "valid dai id not found:%d\n", ret);
--=20
2.47.1


