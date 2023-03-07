Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B46AE1FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 15:16:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWHYd0r7Xz303P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 01:16:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=N8l72tsW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=N8l72tsW;
	dkim-atps=neutral
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWHXl2Sylz3cM3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 01:15:32 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 1D0CB10001D;
	Tue,  7 Mar 2023 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678198526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TroEz27wSqUZ40T3hjcBwjx8v3Ktx9rBSE/61eZDZtI=;
	b=N8l72tsWCIEJS91MPLTyLmuiZYcZWigc7Rfx1cvouryTxhJusO3Jbv5HS6cmngwWTIZEbR
	QoR1VFWjY8jUsL9fB8o/Oh0g5b0NkRfjO3digjSKxH2YYU7ogl0I6zhLooz5mQEu2TBa+N
	6QT2p1FrxqMPUArCM5CH2488I5tn22EiYWviQho1zO6Edh08YNmqmaIsu5gligNl/M7H2Q
	5VtiC3uRkm5oYj+A0rLJUM5TDFtsUr3lNeCi8X+5LcQnDu49XntlbMEPWNd0eVRXyQQreJ
	8c8gE6fgZM19nfKZgjmJHpClYfae7c5AX/fUASmeH7UTmNiRMj8UcpBTC2eMag==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/3] Fix the PowerQUICC audio support using the QMC
Date: Tue,  7 Mar 2023 15:15:00 +0100
Message-Id: <20230307141503.159766-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A previous series added the PowerQUICC audio support using the QMC.
The v6 version of this previous series was applied but some feedbacks
lead to a v7 version.

The v6 can be found here:
 https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codina@bootlin.com/
and the v7, here:
 https://lore.kernel.org/linux-kernel/20230306161754.89146-1-herve.codina@bootlin.com/

This 'fix' series is the incremental version of v6 -> v7 and can only be
applied on the Marc Brown's tree as the v6 patches it fixes are only
present on this tree.

Regards,
Herve Codina

Herve Codina (3):
  dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Remove unneeded property
  dt-bindings: soc: fsl: cpm_qe: cpm1-tsa: Remove unneeded property
  soc: fsl: cpm1: qmc: Fix assigned timeslot masks

 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 10 ----------
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml          | 10 ----------
 drivers/soc/fsl/qe/qmc.c                               | 10 +++++++---
 3 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.39.2

