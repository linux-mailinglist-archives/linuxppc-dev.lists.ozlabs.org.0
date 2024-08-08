Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7E594B7EB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:33:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hvepbCkQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wff0N5MKKz3dXh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:33:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hvepbCkQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdX46sCQz3dVm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:12:04 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id C75C6C000A;
	Thu,  8 Aug 2024 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IzmZXaq6Zk77+veQvHZ6jM6c509VDBLoarFwqEQ1ao=;
	b=hvepbCkQ7oSGTEO6ZfBdodE0nTf1EG9o6FhSpQ51QNEexBTTr8ecNc5g4LeZW7iAeJ4yWO
	qqkvmgYp/ZKhOM62AoFx206ThnIh4QGGJQv3tY4BPIVroO9jsD3mSSk2uVr4t83XNoYCtS
	muCHNFWKkDKfBsus/Yk/ZDvfSQM+jfcoK/mpcVFE5A2Y+TCklXdtepGsjFnkUaPDeDA8JX
	MTI+vM+GaYhOlhSzJqqtTV4/UkoTsaWLVj3Q2i2dUwXKi0rOJJZMiSy51IhtxULcKi3LQj
	DKmG9e/LwaAmqvrAbVTdIsltx48oGdeD+duhYMk4ca9HAxGfMwax72B2hVgaSQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 31/36] soc: fsl: cpm1: qmc: Introduce qmc_version
Date: Thu,  8 Aug 2024 09:11:24 +0200
Message-ID: <20240808071132.149251-32-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240808071132.149251-1-herve.codina@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current code handles the CPM1 version of QMC.

In order to prepare the support for the QUICC Engine (QE) version of
QMC, introduce qmc_version to identify versions. This will enable the
code to make the distinction between several QMC implementations.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 062477b7426e..8ff7eaaa4c50 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -215,7 +215,12 @@ struct qmc_chan {
 	bool	is_rx_stopped;
 };
 
+enum qmc_version {
+	QMC_CPM1,
+};
+
 struct qmc_data {
+	enum qmc_version version;
 	u32 tstate; /* Initial TSTATE value */
 	u32 rstate; /* Initial RSTATE value */
 	u32 zistate; /* Initial ZISTATE value */
@@ -1811,6 +1816,7 @@ static void qmc_remove(struct platform_device *pdev)
 }
 
 static const struct qmc_data qmc_data_cpm1 = {
+	.version = QMC_CPM1,
 	.tstate = 0x30000000,
 	.rstate = 0x31000000,
 	.zistate = 0x00000100,
-- 
2.45.0

