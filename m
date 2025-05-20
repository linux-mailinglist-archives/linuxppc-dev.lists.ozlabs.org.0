Return-Path: <linuxppc-dev+bounces-8734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8FABD63F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:10:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sKS2Mskz3bl6;
	Tue, 20 May 2025 21:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747736231;
	cv=none; b=F+kBjXdFE2/X4SjbGDDmyOeYc0ScKzdG6FDKcmoWYhEFfp2evmzEu+H2qKtj9a367ol9qqrMHddpuMVgLnvOjmowT7AKoNypTq78F4OgoUZBiIanDTwCEF6IJfzC4W3jWO+T3Qg6SmjuTM4PA5C8Hnh++EC715PQzNkH3ppyu082W7gEczRDLBqGrAd0o39dT8Sm/MbELEgBp0IXpnyIncj816igum7pCLNGbC8aClv7Llr2LjLP2jMVjt5uz8grMLdZDNvGNLlzjSTx74sUosOWTDAkFKvqiVXMx3B7WyPD8rJh8wTyxUnTuKkuR+hnBZAQpXyixLwKXNyIQmmf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747736231; c=relaxed/relaxed;
	bh=qPUCXsPGc+4erH3P3HSqGBpkg4cLX1U7TN5xq7voaMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dv33UdizStrnUYSgrPt3HcJrsppBCdAb3T23buZ9sKRPHRaFOV3yQYaAKdX69wQ7Uejn5is3Nj8PqJQF3cueemgst0uXpwP+tCrZZfubr3d0R6uSqE/4Em+svZcZ+xdw32GjvDiWk1m+l/UQnZmCrTZfshgcIFveF8+a5cNQoEy/voaVQXwLdOfDaeYNVe77pjBZDe+67OcqA12db5DFj/vAwXpURkOXJ85pjH8U5MNdvcglxIFI0uC9Mw4wKeiOydYXRDeh/s3wfKuu4o5XNXJVKOwVweJ1aPuyEjo0n+RRHAYwMKQhZQ0KgTMWuEDSqFyntN9T3K258aVEWIgTQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1r861zK9z2xZh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:17:09 +1000 (AEST)
X-UUID: 80c4e580355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c6c50a9b-851b-47c0-8a23-cef2bbc22566,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d6772785fdb69d0add419fa33b60654c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 80c4e580355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1683691209; Tue, 20 May 2025 17:12:07 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id E7D3A16003840;
	Tue, 20 May 2025 17:12:06 +0800 (CST)
X-ns-mid: postfix-682C4766-7593491691
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 3CA4216001CC7;
	Tue, 20 May 2025 09:12:04 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	srinivas.kandagatla@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org,
	ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com,
	alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 6/6] ASoC: qcom: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:31 +0800
Message-ID: <20250520091131.4150248-7-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520091131.4150248-1-aichao@kylinos.cn>
References: <20250520091131.4150248-1-aichao@kylinos.cn>
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


