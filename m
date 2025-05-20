Return-Path: <linuxppc-dev+bounces-8741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C6ABD66A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sPJ3RV5z3bmL;
	Tue, 20 May 2025 21:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747736036;
	cv=none; b=LKjjuaaki25r82bJpSMeB9tRf/eID9YPhv/xWiyUBYNTkTqNGlxLQXxLSerB8HOCrAc8dkvJmHqDLFj8ktmtAuqR+ws0wklKBzHDdmZ2NPdJJUUAby00nYKeRD7Umju/eQgGVDSltlal1Y7Xk7G+9iSDy96IOkjwBiFu3Ja5utXiCO5T853VcCoeBtL8ig8atfd1xrTVK7HGjiGe8sdfidhQH8YgeJsJgtCEKKHVLV8G09imkD/tL+iqgkbCf1eq7kN8ZAsrmFeB7IACBRdruyC0phBHFEN1v4vrJK5/zf69o2CItaKQb7D3wNIGMjgIm7Hz3KYOgQ2wUReck/+9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747736036; c=relaxed/relaxed;
	bh=+vyHqfvJMdPZSvnBXgnotVQJXD2MFxQpA1yjMUhFKPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDt8IwCqOsxZbYPVXvqe0+crCr1ugixAAEv607eRXZBVNJMrPn+6TKdvz9DSd3NJgelMFyl5q1B1aqDk2pq6YPgLEwBEZ5BzVws4z/icy7EssFhTfbfYA4RL05ngzoVCIM1UILF4MzeaP8OE2aP3XLbXgtS6eiCvDw7TUAbRL+dXIhHXrA9Ddg4qzpnb0ESZo+bXtvvUN84aDTKILxd5eV1GZ9gYtuuLkBCDNl1Xw2HlVhJU58El7f8XqpqG3+RsFv+vwbSAwThCI12Y5HGK/gSSz8EHKkANw2MZoiBEIFAbQAoT2zhpBGPEENq3Z//HXZRAQ5E5WQ2c9BsM1sa+7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 3657 seconds by postgrey-1.37 at boromir; Tue, 20 May 2025 20:13:53 AEST
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1r4K4jFNz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:13:52 +1000 (AEST)
X-UUID: 7a4c6412355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8745d1f4-da4d-4ceb-bfc3-3a09a4665725,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c2908c26c1e01d52e48c54d251f30c6f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7a4c6412355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1520759550; Tue, 20 May 2025 17:11:56 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 0994A16003840;
	Tue, 20 May 2025 17:11:56 +0800 (CST)
X-ns-mid: postfix-682C475B-7025291688
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 2E98C16001CC7;
	Tue, 20 May 2025 09:11:53 +0000 (UTC)
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
Subject: [PATCH 3/6] ASoC: renesas: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:28 +0800
Message-ID: <20250520091131.4150248-4-aichao@kylinos.cn>
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
 sound/soc/renesas/rcar/core.c | 39 ++++++++++++-----------------------
 sound/soc/renesas/rcar/ctu.c  |  8 ++-----
 sound/soc/renesas/rcar/dma.c  |  4 +---
 sound/soc/renesas/rcar/dvc.c  |  8 ++-----
 sound/soc/renesas/rcar/mix.c  |  8 ++-----
 sound/soc/renesas/rcar/src.c  | 10 ++-------
 sound/soc/renesas/rcar/ssi.c  | 18 +++++-----------
 sound/soc/renesas/rcar/ssiu.c |  7 ++-----
 8 files changed, 29 insertions(+), 73 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.=
c
index 30afc942d381..91f84495e7b2 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1075,7 +1075,6 @@ static void rsnd_parse_tdm_split_mode(struct rsnd_p=
riv *priv,
 {
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct device_node *ssiu_np =3D rsnd_ssiu_of_node(priv);
-	struct device_node *np;
 	int is_play =3D rsnd_io_is_play(io);
 	int i;
=20
@@ -1094,7 +1093,7 @@ static void rsnd_parse_tdm_split_mode(struct rsnd_p=
riv *priv,
 		if (!node)
 			break;
=20
-		for_each_child_of_node(ssiu_np, np) {
+		for_each_child_of_node_scoped(ssiu_np, np) {
 			if (np =3D=3D node) {
 				rsnd_flags_set(io, RSND_STREAM_TDM_SPLIT);
 				dev_dbg(dev, "%s is part of TDM Split\n", io->name);
@@ -1154,21 +1153,18 @@ void rsnd_parse_connect_common(struct rsnd_dai *r=
dai, char *name,
 {
 	struct rsnd_priv *priv =3D rsnd_rdai_to_priv(rdai);
 	struct device *dev =3D rsnd_priv_to_dev(priv);
-	struct device_node *np;
 	int i;
=20
 	if (!node)
 		return;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		struct rsnd_mod *mod;
=20
 		i =3D rsnd_node_fixed_index(dev, np, name, i);
-		if (i < 0) {
-			of_node_put(np);
+		if (i < 0)
 			break;
-		}
=20
 		mod =3D mod_get(priv, i);
=20
@@ -1217,16 +1213,13 @@ int rsnd_node_fixed_index(struct device *dev, str=
uct device_node *node, char *na
 int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, ch=
ar *name)
 {
 	struct device *dev =3D rsnd_priv_to_dev(priv);
-	struct device_node *np;
 	int i;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		i =3D rsnd_node_fixed_index(dev, np, name, i);
-		if (i < 0) {
-			of_node_put(np);
+		if (i < 0)
 			return 0;
-		}
 		i++;
 	}
=20
@@ -1250,7 +1243,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv,=
 int *is_graph)
 {
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct device_node *np =3D dev->of_node;
-	struct device_node *ports, *node;
+	struct device_node *node;
 	int nr =3D 0;
 	int i =3D 0;
=20
@@ -1270,16 +1263,15 @@ static int rsnd_dai_of_node(struct rsnd_priv *pri=
v, int *is_graph)
=20
 	of_node_put(node);
=20
-	for_each_child_of_node(np, node) {
-		if (!of_node_name_eq(node, RSND_NODE_DAI))
+	for_each_child_of_node_scoped(np, ports) {
+		if (!of_node_name_eq(ports, RSND_NODE_DAI))
 			continue;
=20
-		priv->component_dais[i] =3D of_get_child_count(node);
+		priv->component_dais[i] =3D of_get_child_count(ports);
 		nr +=3D priv->component_dais[i];
 		i++;
 		if (i >=3D RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
-			of_node_put(node);
 			break;
 		}
 	}
@@ -1290,7 +1282,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv,=
 int *is_graph)
 	/*
 	 * Audio-Graph-Card
 	 */
-	for_each_child_of_node(np, ports) {
+	for_each_child_of_node_scoped(np, ports) {
 		node =3D rsnd_pick_endpoint_node_for_ports(ports, np);
 		if (!node)
 			continue;
@@ -1299,7 +1291,6 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv,=
 int *is_graph)
 		i++;
 		if (i >=3D RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
-			of_node_put(ports);
 			break;
 		}
 	}
@@ -1500,10 +1491,9 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	dai_i =3D 0;
 	if (is_graph) {
 		struct device_node *dai_np_port;
-		struct device_node *ports;
 		struct device_node *dai_np;
=20
-		for_each_child_of_node(np, ports) {
+		for_each_child_of_node_scoped(np, ports) {
 			dai_np_port =3D rsnd_pick_endpoint_node_for_ports(ports, np);
 			if (!dai_np_port)
 				continue;
@@ -1520,14 +1510,11 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 			}
 		}
 	} else {
-		struct device_node *node;
-		struct device_node *dai_np;
-
-		for_each_child_of_node(np, node) {
+		for_each_child_of_node_scoped(np, node) {
 			if (!of_node_name_eq(node, RSND_NODE_DAI))
 				continue;
=20
-			for_each_child_of_node(node, dai_np) {
+			for_each_child_of_node_scoped(node, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, np, dai_i, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai =3D rsnd_rdai_get(priv, dai_i);
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index a26ec7b780cd..bd4c61f9fb3c 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -316,7 +316,6 @@ struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *p=
riv, int id)
 int rsnd_ctu_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
-	struct device_node *np;
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct rsnd_ctu *ctu;
 	struct clk *clk;
@@ -344,7 +343,7 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
=20
 	i =3D 0;
 	ret =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		ctu =3D rsnd_ctu_get(priv, i);
=20
 		/*
@@ -357,16 +356,13 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 		clk =3D devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret =3D PTR_ERR(clk);
-			of_node_put(np);
 			goto rsnd_ctu_probe_done;
 		}
=20
 		ret =3D rsnd_mod_init(priv, rsnd_mod_get(ctu), &rsnd_ctu_ops,
 				    clk, RSND_MOD_CTU, i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto rsnd_ctu_probe_done;
-		}
=20
 		i++;
 	}
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 2342bbb6fe92..2035ce06fe4c 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -194,14 +194,12 @@ struct dma_chan *rsnd_dma_request_channel(struct de=
vice_node *of_node, char *nam
 	struct rsnd_priv *priv =3D rsnd_mod_to_priv(mod);
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct dma_chan *chan =3D NULL;
-	struct device_node *np;
 	int i =3D 0;
=20
-	for_each_child_of_node(of_node, np) {
+	for_each_child_of_node_scoped(of_node, np) {
 		i =3D rsnd_node_fixed_index(dev, np, name, i);
 		if (i < 0) {
 			chan =3D NULL;
-			of_node_put(np);
 			break;
 		}
=20
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index da91dd301aab..988cbddbc611 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -324,7 +324,6 @@ struct rsnd_mod *rsnd_dvc_mod_get(struct rsnd_priv *p=
riv, int id)
 int rsnd_dvc_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
-	struct device_node *np;
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct rsnd_dvc *dvc;
 	struct clk *clk;
@@ -352,7 +351,7 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
=20
 	i =3D 0;
 	ret =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		dvc =3D rsnd_dvc_get(priv, i);
=20
 		snprintf(name, RSND_DVC_NAME_SIZE, "%s.%d",
@@ -361,16 +360,13 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 		clk =3D devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret =3D PTR_ERR(clk);
-			of_node_put(np);
 			goto rsnd_dvc_probe_done;
 		}
=20
 		ret =3D rsnd_mod_init(priv, rsnd_mod_get(dvc), &rsnd_dvc_ops,
 				    clk, RSND_MOD_DVC, i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto rsnd_dvc_probe_done;
-		}
=20
 		i++;
 	}
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index 024d91cc8748..aea74e703305 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -288,7 +288,6 @@ struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *p=
riv, int id)
 int rsnd_mix_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
-	struct device_node *np;
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct rsnd_mix *mix;
 	struct clk *clk;
@@ -316,7 +315,7 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
=20
 	i =3D 0;
 	ret =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		mix =3D rsnd_mix_get(priv, i);
=20
 		snprintf(name, MIX_NAME_SIZE, "%s.%d",
@@ -325,16 +324,13 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 		clk =3D devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret =3D PTR_ERR(clk);
-			of_node_put(np);
 			goto rsnd_mix_probe_done;
 		}
=20
 		ret =3D rsnd_mod_init(priv, rsnd_mod_get(mix), &rsnd_mix_ops,
 				    clk, RSND_MOD_MIX, i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto rsnd_mix_probe_done;
-		}
=20
 		i++;
 	}
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 7d73b183bda6..f47bf38c2f94 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -715,7 +715,6 @@ struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *p=
riv, int id)
 int rsnd_src_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
-	struct device_node *np;
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct rsnd_src *src;
 	struct clk *clk;
@@ -742,14 +741,13 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 	priv->src	=3D src;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		if (!of_device_is_available(np))
 			goto skip;
=20
 		i =3D rsnd_node_fixed_index(dev, np, SRC_NAME, i);
 		if (i < 0) {
 			ret =3D -EINVAL;
-			of_node_put(np);
 			goto rsnd_src_probe_done;
 		}
=20
@@ -761,23 +759,19 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		src->irq =3D irq_of_parse_and_map(np, 0);
 		if (!src->irq) {
 			ret =3D -EINVAL;
-			of_node_put(np);
 			goto rsnd_src_probe_done;
 		}
=20
 		clk =3D devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret =3D PTR_ERR(clk);
-			of_node_put(np);
 			goto rsnd_src_probe_done;
 		}
=20
 		ret =3D rsnd_mod_init(priv, rsnd_mod_get(src),
 				    &rsnd_src_ops, clk, RSND_MOD_SRC, i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto rsnd_src_probe_done;
-		}
=20
 skip:
 		i++;
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index 0c6424a1fcac..d52056caa3ec 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1115,7 +1115,6 @@ void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 	struct rsnd_priv *priv =3D rsnd_rdai_to_priv(rdai);
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct device_node *node;
-	struct device_node *np;
 	int i;
=20
 	node =3D rsnd_ssi_of_node(priv);
@@ -1123,14 +1122,12 @@ void rsnd_parse_connect_ssi(struct rsnd_dai *rdai=
,
 		return;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		struct rsnd_mod *mod;
=20
 		i =3D rsnd_node_fixed_index(dev, np, SSI_NAME, i);
-		if (i < 0) {
-			of_node_put(np);
+		if (i < 0)
 			break;
-		}
=20
 		mod =3D rsnd_ssi_mod_get(priv, i);
=20
@@ -1163,7 +1160,6 @@ int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod)
 int rsnd_ssi_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
-	struct device_node *np;
 	struct device *dev =3D rsnd_priv_to_dev(priv);
 	struct rsnd_mod_ops *ops;
 	struct clk *clk;
@@ -1191,14 +1187,13 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 	priv->ssi_nr	=3D nr;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		if (!of_device_is_available(np))
 			goto skip;
=20
 		i =3D rsnd_node_fixed_index(dev, np, SSI_NAME, i);
 		if (i < 0) {
 			ret =3D -EINVAL;
-			of_node_put(np);
 			goto rsnd_ssi_probe_done;
 		}
=20
@@ -1210,7 +1205,6 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 		clk =3D devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret =3D PTR_ERR(clk);
-			of_node_put(np);
 			goto rsnd_ssi_probe_done;
 		}
=20
@@ -1223,7 +1217,6 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 		ssi->irq =3D irq_of_parse_and_map(np, 0);
 		if (!ssi->irq) {
 			ret =3D -EINVAL;
-			of_node_put(np);
 			goto rsnd_ssi_probe_done;
 		}
=20
@@ -1234,10 +1227,9 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
=20
 		ret =3D rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
 				    RSND_MOD_SSI, i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto rsnd_ssi_probe_done;
-		}
+
 skip:
 		i++;
 	}
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.=
c
index 665e8b2db579..faf351126d57 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -478,17 +478,14 @@ void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
=20
 	/* use rcar_sound,ssiu if exist */
 	if (node) {
-		struct device_node *np;
 		int i =3D 0;
=20
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			struct rsnd_mod *mod;
=20
 			i =3D rsnd_node_fixed_index(dev, np, SSIU_NAME, i);
-			if (i < 0) {
-				of_node_put(np);
+			if (i < 0)
 				break;
-			}
=20
 			mod =3D rsnd_ssiu_mod_get(priv, i);
=20
--=20
2.47.1


