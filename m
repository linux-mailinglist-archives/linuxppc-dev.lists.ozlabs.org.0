Return-Path: <linuxppc-dev+bounces-2875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE9E9BCFDA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 15:57:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjWdS6Wt0z2xGr;
	Wed,  6 Nov 2024 01:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.194
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730818620;
	cv=none; b=Gl+ZUwTPxW3Gv3vfvZkGzC0f+/47cslWm6b84Mj5yODX04qquz5TYchUzUEEdV4ewH+nYwXaYGXOiP6w/LOokrh12O0C/ccFbrzqBmC6YFyw0C9gZReYfh0w2ydY85fepMsCa1WqzUElD+FJYwiXxwiPpow1nUo+/pxKouv8anWJ/bX8i+w9bqfO2y9anoK1Ja0kPliST71Kx1YuUZvk/6Q1VDcw4R+WET3z6SrVq6AQRv+KgErVZX0aci7iapFztHA8oTXdP6QHUysILRJ9sCa7XoN7xhCY66nx2LAaBzRSqPeYoWDlfp4N5kSjcZBzFRES0zAh1QFremeyn8+hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730818620; c=relaxed/relaxed;
	bh=QA9Z6DlABQAh/zHFAwCMIMgA9gtG670bOQgehg6enAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LsqhLhVXyFJX/aKiekKhU9UMZv17UxUchMDYZWkwJ06S9l02vF3IYMK143PsfIAwRfJcltrO79uBPV1yDOSW8IBptgt162mPsrZv9fXR41nMRABA0XFhxLsKLlHDEzugS8BbGcDUWJTfH56AaK2MajBHyY/mc/9GSp3y6TlC4y+ZYDX+lOR5V0LKPVfSorqpULgx5cShSt6gfsqSsoXQULwCqtFEzU3dnpiWLn6dMcAR69KnXv5fKt/w37jHzb9r5wL5VmgkhhmC7cIlEu4hn6trDRDc4TTtsOJlcRn/8n9aYENnmWHM5IHYEsbcAw6KSUn+0/Ao3kHRZr6Y3yHjzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KWaTZyu3; dkim-atps=neutral; spf=pass (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KWaTZyu3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjWdR2nn4z2xBm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 01:56:56 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 200CE40010;
	Tue,  5 Nov 2024 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730818609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QA9Z6DlABQAh/zHFAwCMIMgA9gtG670bOQgehg6enAk=;
	b=KWaTZyu3vLcDyz9FWyowSmBHC3XiZrmKJULGPtt9hzaqj0+xJODq0QR1ihReN61VqnwxCk
	cyoakzjNknp34vXM3mBZCHBYo0gmRejGd4PWdqrQoDSwYqgeQGazh5ofxOpKDGc6x7zm8X
	kSgyKuZ0UDNSmVFqo+CFEGNa+MY+IsX8tKInCVCBVJh6Y73IoUTL2hHCZUv5yZeg+3gDmY
	CP5ktynlkskg3ruNt8nCELLrlhibV7PF6UGal945LwEqulLbG5vGsWom8qQx5vINJf/c9s
	QAXF8i1kCKMsokbKbWKwXiIEQqqY6emQ3dSvWkcVoiJ0juZ/S7e689/sACCY+g==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mark Brown <broonie@kernel.org>,
	Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: fsl: cpm1: qmc: Set the ret error code on platform_get_irq() failure
Date: Tue,  5 Nov 2024 15:56:23 +0100
Message-ID: <20241105145623.401528-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A kernel test robot detected a missing error code:
   qmc.c:1942 qmc_probe() warn: missing error code 'ret'

Indeed, the error returned by platform_get_irq() is checked and the
operation is aborted in case of failure but the ret error code is
not set in that case.

Set the ret error code.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/
Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 19cc581b06d0..b3f773e135fd 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -2004,8 +2004,10 @@ static int qmc_probe(struct platform_device *pdev)
 
 	/* Set the irq handler */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto err_exit_xcc;
+	}
 	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
 	if (ret < 0)
 		goto err_exit_xcc;
-- 
2.46.2


