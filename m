Return-Path: <linuxppc-dev+bounces-8740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D87ABD664
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sP36Fdgz3bmN;
	Tue, 20 May 2025 21:13:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747736151;
	cv=none; b=RlUPZCfXkrYw/9DqiXzyoE6uG5JBA2yKJ+Dw6CCIhP9RK359U+EUGqwqcJtiPv49gHJS3+H1e7INJVUN1ee/z4kz9lG/60kTYE3DHscf6BhTFxTs1rjvodUI8jo5lkZtZJU7w4InvsHu5K/aIJSd0VyGzKivmBH373Yce7KiVhLE5Irhwe74iMHjVD1mzqGRde5C7epcLlaDDR0Qs5oFm0SK/V6sOQTavdBP1NzylKdaageYc6i/+lckZRFHbPIVCyLyZi1pFoG+8fzgJqwGtAAnvXR/krAuJsFtkLctMsB3rKdpgDvMRXptgSCXniOYpXOq6oyYJsWPbiBqcYQYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747736151; c=relaxed/relaxed;
	bh=EfgYTeaEkInZ8yuRR7COPm0veovOX3dMCy9L15rBT00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzvCUApjFHwrwSCo4MJmc5ARZSqqZ/98Zaoxktmeg4vISy6ikikb5dKzq/Xar5TtcaE6LvnqkCgiswXkWTc7MGZHcrTSCGhUweMy5rVwBEefmGIzwshwrw1abZPUYmZCfglMihHnX9J7D3ODM3aqcVhlC4fC6L+P2PthF46S8wp0bjyL19lBV/KK52ZNDv6P7P1A2xRdu8yD7dsZ2c+vVE37UF/TUuLtIWqCEomuOxM8aO1chZqkX9cq8n0s+9GV4VOz477o58m82DwfY+0T2pI1SlfJZ4/PmG5TyJfj5S1woIeFBB/PMdlEGN+8UoMAtS6jgvmrDauTR8n1Sr3w7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1r6Z2k1Bz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:15:49 +1000 (AEST)
X-UUID: 725ad2b6355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:87f64f3f-8ff6-4a5d-836f-e892fc7371f5,IP:0,U
	RL:0,TC:0,Content:39,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:39
X-CID-META: VersionHash:6493067,CLOUDID:fd4d755d8717728699b6f10f854a64c4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 725ad2b6355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1902263896; Tue, 20 May 2025 17:11:43 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id A477B16003840;
	Tue, 20 May 2025 17:11:42 +0800 (CST)
X-ns-mid: postfix-682C474E-846621685
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 3F67B16001CC7;
	Tue, 20 May 2025 09:11:36 +0000 (UTC)
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
Subject: [PATCH 0/6] Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:25 +0800
Message-ID: <20250520091131.4150248-1-aichao@kylinos.cn>
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

This patch series introduces wrapper functions
for_each_child_of_node_scoped().=20

The for_each_child_of_node_scoped() helper provides a scope-based clean-u=
p
functionality to put the device_node automatically, and as such, there is
no need to call of_node_put() directly.

Thus, use this helper to simplify the code.

Summary:

 - Patch 1 ASoC: ppc: Use helper function for_each_child_of_node_scoped()

 - Patch 2 ASoC: aoa: Use helper function for_each_child_of_node_scoped()

 - Patch 3 ASoC: renesas: Use helper function for_each_child_of_node_scop=
ed()

 - Patch 4 ASoC: meson: Use helper function for_each_child_of_node_scoped=
()

 - Patch 5 ASoC: imx-card: Use helper function for_each_child_of_node_sco=
ped()

 - Patch 6 ASoC: qcom: Use helper function for_each_child_of_node_scoped(=
)

 sound/aoa/soundbus/i2sbus/core.c   |  5 ++--
 sound/ppc/tumbler.c                |  5 ++--
 sound/soc/fsl/imx-card.c           | 13 ++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 14 +++--------
 sound/soc/qcom/lpass-cpu.c         |  3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c   |  3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c   |  4 +--
 sound/soc/renesas/rcar/core.c      | 39 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++----
 sound/soc/renesas/rcar/dma.c       |  4 +--
 sound/soc/renesas/rcar/dvc.c       |  8 ++----
 sound/soc/renesas/rcar/mix.c       |  8 ++----
 sound/soc/renesas/rcar/src.c       | 10 ++------
 sound/soc/renesas/rcar/ssi.c       | 18 ++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 16 files changed, 47 insertions(+), 105 deletions(-)

--=20
2.47.1


