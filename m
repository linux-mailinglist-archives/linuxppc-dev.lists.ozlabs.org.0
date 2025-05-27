Return-Path: <linuxppc-dev+bounces-8950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D530AC4A35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 May 2025 10:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b65M03jCSz2yZ8;
	Tue, 27 May 2025 18:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748334380;
	cv=none; b=gm1vI9Pyvl4rdCoTfY/4nlNvU7MhAqTPn1PkUwpefLEAoUEkNQuvNk1Weii5BqIsu6jzn01vNMGt/hlAfO+EVENqtAgjR8ZJElBWl6OX1wLiPn/Iaw1Ap4xUBtzoqmB27A6tHYvpO5KYzWULwDorcRoJGScnZb+cBVZt2BDGhty9ZHc70Ejd9dYVZu98mh3DlGhmkrSZR1Xufa+Z7vwVdfzjfE+MMDul3tBuVD+eTQSd7xCcmjzSQa3h/WSTYT4AzJbesRP4qZBxdHZJy0C76rEfBCX8I6LDZjvCSC+DzAIlRe94dsZOoV6YjjMVzdeM0kw/Gpaxqle/oo+AscXTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748334380; c=relaxed/relaxed;
	bh=NW3nNH80UTKZBRJdor1Rs0Lq1+7xOcIJseCIVdwgQEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7z+MhTHCmSmOEp3GogxWMe/Aj89HY8mKTTSaxZDeDvMOwLpd3h/GiHiywitgFcxv3VceKFN75yt/KD1pRfqcS7Yza7S0IcUKsfENOlw5sfWSBDhdp1ph2YQ3yKoev4bJ/TJ7/dvgz4HLwFojlPg8nXHnCbt7mP/zHjsbSxtMsD0P8896TKxLswC8iZu6O/QWjE/CHo/3IxNDMyOKtotisKPEMmChv8Dh1D/y/9wSaHTMxRN4m3t0x9nTQJpMajoO/jhwBo1w0PjQUDUu83flwdjbPHJRdyS0BEj1D4r3U2Y5d9JgdICM4osrdU3/CQo45+x38JOrsc+waVFM2CfDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b65Ly0RnPz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 18:26:16 +1000 (AEST)
X-UUID: 16b3a29c3ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:52dbf973-d560-4d92-ab36-debd7af511ff,IP:0,U
	RL:0,TC:0,Content:33,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:33
X-CID-META: VersionHash:6493067,CLOUDID:76905b17bcdc2d36468f4541233e31d5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 16b3a29c3ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 756001150; Tue, 27 May 2025 16:25:03 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id F0C9D16001F49;
	Tue, 27 May 2025 16:25:02 +0800 (CST)
X-ns-mid: postfix-683576DD-9767322679
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id F384916001F49;
	Tue, 27 May 2025 08:24:57 +0000 (UTC)
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
Subject: [PATCH v3 0/6] Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:40 +0800
Message-ID: <20250527082446.2265500-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
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

This patch series introduces wrapper functions for_each_child_of_node_sco=
ped().

The for_each_child_of_node_scoped() helper provides a scope-based clean-u=
p
functionality to put the device_node automatically, and as such, there is
no need to call of_node_put() directly.

Summary:

 - Patch 1 ALSA: ppc: Use helper function for_each_child_of_node_scoped()

 - Patch 2 ALSA: aoa: Use helper function for_each_child_of_node_scoped()

 - Patch 3 ASoC: renesas: Use helper function for_each_child_of_node_scop=
ed()

 - Patch 4 ASoC: meson: Use helper function for_each_child_of_node_scoped=
()

 - Patch 5 ASoC: imx-card: Use helper function for_each_child_of_node_sco=
ped()

 - Patch 6 ASoC: qcom: Use helper function for_each_child_of_node_scoped(=
)

---
Changes in v3:
 - Change Patch name ASoC to ALSA for patch 1,2.
 - Change commit message information.
 - for_each_child_of_node_scoped() instead of
   for_each_child_of_node() in i2cbus_add_dev().

Changes in v2:
 - Fix error reported by kernel test rebot
 - Keep "node"
---

 sound/aoa/soundbus/i2sbus/core.c   |  7 +++---
 sound/ppc/tumbler.c                |  5 ++---
 sound/soc/fsl/imx-card.c           | 13 +++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++---------
 sound/soc/qcom/lpass-cpu.c         |  3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c   |  3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c   |  4 +---
 sound/soc/renesas/rcar/core.c      | 35 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++-----
 sound/soc/renesas/rcar/dma.c       |  4 +---
 sound/soc/renesas/rcar/dvc.c       |  8 ++-----
 sound/soc/renesas/rcar/mix.c       |  8 ++-----
 sound/soc/renesas/rcar/src.c       | 10 ++-------
 sound/soc/renesas/rcar/ssi.c       | 18 +++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 16 files changed, 46 insertions(+), 106 deletions(-)

--=20
2.47.1


