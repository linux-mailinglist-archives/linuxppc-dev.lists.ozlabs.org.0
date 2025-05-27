Return-Path: <linuxppc-dev+bounces-8951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC6AC4A38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 May 2025 10:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b65M13yrXz2xKh;
	Tue, 27 May 2025 18:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748334381;
	cv=none; b=Rj7bYioa0WO02EhHiRCBG/Ax8ST4bAYq8H/kcuCMCHNgx0FFFehFbTzjI3DOfsuqBZlh0VBZQLNBgA+LdsenabmC2wTDiJAUxgiMf/nwIOCTTiCiOkmhAQVVrDeZEBkrtp1rZt2BXxIxlpfxQsNBLnfPbGwswPg+FnzFxzbauzHx+/KHNc301F/NGx1fMsiU15KKIvabTE2fTVjnc1T31wpmZuPtGyklcyp/cpxYJ/i1/Yjubhw+Z4BfTQNowSKScW1zK+Di3dZgE+4mX+zpD1HCqUlzgTL7oGrFUPipx8tn8rgVQxcvauKhXDzCzWZ5Lef75pqMU3MU2/hJ6Cb5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748334381; c=relaxed/relaxed;
	bh=+cEf943uTSdmXiSmhyGvjDeygM3UufmyUR7yv0s1mf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuiWr8fkrPixyswRg8I5qVRdmJSCilGw+CgHyM4MGwQnWwfs10pOAk75n4X4XvkhoJ2rVosyXITq8WAsI7ir6Vi52JJZ9+7+YpyXWZBJdWBHYuFmX538viPnUofLGvWXnxt7hKgicBR6/xDL4tX/On6USbH1aAAP9JCqKEm0Bh0WzpvhZFfC7/kFbPPG4h/X/zx2Tm3j8U+UV56id3PTM1yDORCCxJ6sT9t/JAfPeHtZVPh/V4wfdqsNbnya4/VGQA1fLtVi1HNNmlIzfQw0UyH2flCsTjSYTkjbrt8hbIz1+knd520Vh9BXZ7aaJ1Kq9OGPkobiUcgZfeDGoulgvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b65M012Mzz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 18:26:19 +1000 (AEST)
X-UUID: 19fda2543ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:5288ef3e-1cc9-479a-bf8b-78673f6d54d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:aba3c0aaf0b316ece59aa04ed4255f45,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19fda2543ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2003112057; Tue, 27 May 2025 16:25:09 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id D729716001F49;
	Tue, 27 May 2025 16:25:08 +0800 (CST)
X-ns-mid: postfix-683576E4-6788702683
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 572B316001F55;
	Tue, 27 May 2025 08:25:05 +0000 (UTC)
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
Subject: [PATCH v3 1/6] ALSA: ppc: Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:41 +0800
Message-ID: <20250527082446.2265500-2-aichao@kylinos.cn>
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
clean-up functionality to put the device_node automatically, and
as such, there is no need to call of_node_put() directly.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/ppc/tumbler.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 3c09660e1522..b81d0789b9fb 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1343,7 +1343,7 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	int i, err;
 	struct pmac_tumbler *mix;
 	const u32 *paddr;
-	struct device_node *tas_node, *np;
+	struct device_node *tas_node;
 	char *chipname;
=20
 	request_module("i2c-powermac");
@@ -1358,13 +1358,12 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	mix->anded_reset =3D 0;
 	mix->reset_on_sleep =3D 1;
=20
-	for_each_child_of_node(chip->node, np) {
+	for_each_child_of_node_scoped(chip->node, np) {
 		if (of_node_name_eq(np, "sound")) {
 			if (of_property_read_bool(np, "has-anded-reset"))
 				mix->anded_reset =3D 1;
 			if (of_property_present(np, "layout-id"))
 				mix->reset_on_sleep =3D 0;
-			of_node_put(np);
 			break;
 		}
 	}
--=20
2.47.1


