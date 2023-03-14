Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EC6B8D29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:23:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbRNh0Xzcz3cF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=SsBxU8L2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=SsBxU8L2;
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbRMl75Kxz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:22:10 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id B544760003;
	Tue, 14 Mar 2023 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678782121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qs6UFeINzkIgSkEf14pHIAxamvFd4hhdhkcCNjbLS7g=;
	b=SsBxU8L2E6rui0OxPks3Vm12YbtJekvqPcAzczY4R2qW4Y3IcCgHI5EN9RlZOznXvotR5A
	HGyrgBtXK7K7KJ1DAhJF/WvD/E6xesC11vlVfq6TcB+C12G/LyWR12Bjz+DBXvDMiZDZPm
	52ucVhxNjMj0ErGZCutqomlkGkPbd2I8qKhlGY4cdOHJf+i9s3ACePT/XtE1aIB5fVD1ls
	I64ONP2jnIgTrVCvqdg/aSdT0Cyw7rYoqIxcydLedHTHSK8QZ6YrqCUNj/71CEfS1GuJf8
	LDNTrNczxV06b4DIEjUxSn7jO++tG9jRxh8I+7rCxFiaQNYw/WxbReW42VaG3Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mark Brown <broonie@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] soc: fsl: cpm1: qmc: Fix test dependency
Date: Tue, 14 Mar 2023 09:21:57 +0100
Message-Id: <20230314082157.137176-1-herve.codina@bootlin.com>
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC depends on (SOC_FSL && COMPILE_TEST). SOC_FSL does not exist.

Fix the dependency using the correct one: FSL_SOC.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index f90cfdf0c763..7268c2fbcbc1 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -47,7 +47,7 @@ config CPM_TSA
 config CPM_QMC
 	tristate "CPM QMC support"
 	depends on OF && HAS_IOMEM
-	depends on CPM1 || (SOC_FSL && COMPILE_TEST)
+	depends on CPM1 || (FSL_SOC && COMPILE_TEST)
 	depends on CPM_TSA
 	help
 	  Freescale CPM QUICC Multichannel Controller
-- 
2.39.2

