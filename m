Return-Path: <linuxppc-dev+bounces-8739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFEEABD64E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sLX18Wmz3br7;
	Tue, 20 May 2025 21:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747736153;
	cv=none; b=MqyFmiOb25R5r3ZlDMNAn8PsW/4ufskUSEZUwmdHLxdUWj+iBpKHpAGujGOTrr+KgZVqucU+YhYIUSL0wodwo0i7c7z8Db0UquGsA5CcyceFYsULVW/oYvlzBwJlrhhaFEuUWP+nn+hgSvGSd9GROcQHlpsSRn0tWkhx4sUevUcUVllPneBy3uSTb/ogjkosxyZq1s0Gu+6V6+OirHNMwDg0uixKOFw7BU+FWBiXjbBsZkWZMS9Oen1S2SBamyoxEtJApZ0K+buhvOztllNnkSn93RdhurO+PBBKF+AhL32MN3/ULPH7XL/ac8sAuNGXdUBN2yYORFe4+xbRpceyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747736153; c=relaxed/relaxed;
	bh=n987ckU+cNvJnfzyVBEr3hZ0BVgEPQrbLf/fWgf27iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBOF+ub5NAh8EQquP5F3Xq9JzA+WfyVrH+yZ1UIixwBuKonxDCYmBKCzFKB3YK5co/vfJviwuPuFy20QeBffR0D7nsGNZ02ppT5d0Z2xlxHiBUVaz5HR8zWOm9KdzfJerJGtBB8lviyyS5wImvbpjZBbBq/E6RPy0cmDieBvBfq8eHUb2/7U7S0duEWrgdGdI73O6maszFKeGTBMSoSoMhqHcjW5gyBkgzDpyGN0dZ0iB6z1PZNwW34DPhFS6thu7gVDWEbhgps/t5hW0UDuNvz9bJCe/m7k80ua7lN+NvCJCztVKiHDWHnf9RSxF2EtYVvr264VT1ZZgbirYhXLSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1r6c2P3hz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:15:51 +1000 (AEST)
X-UUID: 757b0272355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:68cf80e9-f6df-4ae8-a4c4-e154af910e76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:10bc6103bf10933b841a276bd851824d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 757b0272355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2001862829; Tue, 20 May 2025 17:11:48 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id E6C5A16003840;
	Tue, 20 May 2025 17:11:47 +0800 (CST)
X-ns-mid: postfix-682C4753-2146811686
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 80A5816001CC7;
	Tue, 20 May 2025 09:11:44 +0000 (UTC)
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
Subject: [PATCH 1/6] ASoC: ppc: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:26 +0800
Message-ID: <20250520091131.4150248-2-aichao@kylinos.cn>
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


