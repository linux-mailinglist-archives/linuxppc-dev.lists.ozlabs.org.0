Return-Path: <linuxppc-dev+bounces-1634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70398988036
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 10:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFNlB0zF0z30Ff;
	Fri, 27 Sep 2024 18:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727425397;
	cv=none; b=gsGJA5apQrI7WS9cDrjWzjm4QDy2O+/ORLVNaFEmq3fg5wVAMrZcgQEWMpndTNJcoTZjaMpMOTBYq+mvF/J1yQRosEF8602tFON9tHENPlQ++6AXqu5GjWql+5VKoFoJQNuFvG19zxP9cvwHmnNeBRHtHJw5+LJQhDduCWqxw6pJlv5hIuinWmwtmKHCxrljptmhAxw0Dipbnc+nQajaYk5KxLmYTPqC6FxJTxulqhyTDFxDAVYRq8ggiWBlI4+xVSNXiIDC/zpV66G211JFpdgRuHzvQyhucXtha8QlMbnxLRr+WEVAeNMQxwpqKdwr8PfcnFQGoFBPtuqQuH2qZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727425397; c=relaxed/relaxed;
	bh=24AHjAPjY71MyVZJfqx8c7+014LjVVxlLL22jxWua54=;
	h=From:To:Subject:Date:Message-Id; b=GF8erawab5uspJhWTukIv9AJK0CI/lLpFeY4yo0CrzClQEq/m/DoJ1EFBNt98P4yF4INhbQbwO+K+N9cC/B8/lsZ9i/8+0+rqtBMD3ej/wWEACIc3FHDueBbS4LjroHvXcRidc6ZcTMYAnp4v+Gixx4VpEk2QUcRMDL9tWa0KAGMd+/62LS9VL27rlBD7HQ7Wo3z/3Kh9OjvL5C/jq8cvn8rixxuGw6mTAJpZ1Isf9CaJdIutS8uUur7ERh0kffHucOhUwsyrh9vSLRlst4iLEBv24qzEW15GiOKpbPbxtx/kgfNwdNNGkVjYlwlGNy7iJNYNpC3wY/8cr3btDR2fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFNl93Fhsz2yyq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 18:23:16 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 82269201A43;
	Fri, 27 Sep 2024 10:23:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4764F201A16;
	Fri, 27 Sep 2024 10:23:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 92B6E183DC02;
	Fri, 27 Sep 2024 16:23:10 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: fsl_micfil: fix and improvement
Date: Fri, 27 Sep 2024 16:00:28 +0800
Message-Id: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Fix the usage of regmap_write_bits().
Move mclk clock enablement to late stage.
Enable the micfil error interrupt.

Shengjiu Wang (3):
  ASoC: fsl_micfil: fix regmap_write_bits usage
  ASoC: fsl_micfil: Add mclk enable flag
  ASoC: fsl_micfil: Enable micfil error interrupt

 sound/soc/fsl/fsl_micfil.c | 49 ++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

-- 
2.34.1


