Return-Path: <linuxppc-dev+bounces-8859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B09AC03B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 07:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2x6L4pV7z2yfT;
	Thu, 22 May 2025 15:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747890266;
	cv=none; b=QI0C6t58Vme2TUxR1+mElPlQBBrIAJAx60AaYGVsSQ1HLYUsaW65NAw+dpz91QcbsQfA0NalkV97sUZSrYlyWeRPI+Em4M3iVS6PdZ1Bc36D6/b2k2RBgn2VP0qK0fQIzN8if98SbQzO33okncxEH1whAfV7CAn4ow9alBQOJcqNWv4GNjW6WKimCQuOHN0un+THKVLMUVbK6jUYXfLLv1DGfC6EeBS5AGAQ6upSEopbH90y1XXp/w1cRViuJs5OOBBYNSLzccyYNF0K4R7W653+TccUcTIywqPmf7zkK0w7ugx1aMMaLEuQWN0pzT3ZEd5SfKwWVGSOas8zaF9Y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747890266; c=relaxed/relaxed;
	bh=HRymduQvhKNi/uxrAqJFaSambOisWpnPBve8rPSHuJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EkxijDGVPouyBbzF+DBUVe1P2gPIHffYK8uiUzFRQaUHkyReX1/6wh/1f9SLg5C00+3cek8H81QGHJQ7U7VJE3EcJkmZAqKBYXzpTPsaavANi9RxGHF2P4nTJtk3MVKoKUDo6geUlj0MV67VjA+LvqD3rg37qT6eVBKUjGpUBUIghJrSHbN6kCtZNRGrhFTHCumyClsV1pO2PxdiUBGZ9KIHWU3QnioSWzK2QtOqNR34H+5T6YkkQksUPH7gjcq0wFnZdyDrdNe66tnXHqaWmBWFk7cte64G9AgRy/3dlw+qrmKD5/N4IqAzYv+kRrfOAQQeSwgnajW6jsazGe9M0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2x6K0sk6z2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 15:04:24 +1000 (AEST)
X-UUID: 1102de3436ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:caea8ce9-09dd-4521-979d-605f8377a2ce,IP:0,U
	RL:0,TC:0,Content:36,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:36
X-CID-META: VersionHash:6493067,CLOUDID:4791b0832b2718bd027ade75e2fe48ad,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1102de3436ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1157435395; Thu, 22 May 2025 13:03:14 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id DB01116003840;
	Thu, 22 May 2025 13:03:13 +0800 (CST)
X-ns-mid: postfix-682EB011-73870328
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id A87ED16001CC7;
	Thu, 22 May 2025 05:03:08 +0000 (UTC)
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
Subject: [PATCH v2 0/6] Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:53 +0800
Message-ID: <20250522050300.519244-1-aichao@kylinos.cn>
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

---
Changes in v2:
 - Fix error reported by kernel test rebot
 - Keep "node"
---
 sound/aoa/soundbus/i2sbus/core.c   |  5 +++--
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
 16 files changed, 46 insertions(+), 104 deletions(-)

--=20
2.47.1


