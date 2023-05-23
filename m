Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C25D70D824
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQSv20nzRz3f6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 18:59:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XwdERH7E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XwdERH7E;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQSt95vvVz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 18:59:12 +1000 (AEST)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id B3B311C000C;
	Tue, 23 May 2023 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684832350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfY/8yJ+Azw862bqGkzmouL5hoaQtAS7JukLHLhERIU=;
	b=XwdERH7EssnlbUs+m58TkAsn2oRyXQOf7VZcLrzW4lZWaJAvcIxV7ZfLvk84g7W/zOyWHt
	Y00z3DmLYmckKS8j+9aGAhxHRhgc8Rwvvj+34kaih0d+eTClL+Q4PalqvA2fLM58/hKNL7
	Beta149CMiYDuaen0Hd76jS1cTjYF2JS4/NKuNoOXsLdR1UVyRl/LrFHyRsO2+L0Il/48g
	tLr5Vp7J3AUZWv9q0vwVFwqkivivIOHmMT1p9S1UXQA4uFC7E1zxMdo74i6PW/nnETe4sq
	KVPOP3JYPXFJH2xwpOjMb4BZEpVvxo3vAh8oHVvGmG647F8emBr3mW3qJB8ALg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 1/2] soc: fsl: cpm1: Fix TSA and QMC dependencies in case of COMPILE_TEST
Date: Tue, 23 May 2023 10:59:01 +0200
Message-Id: <20230523085902.75837-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523085902.75837-1-herve.codina@bootlin.com>
References: <20230523085902.75837-1-herve.codina@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to compile tsa.c and qmc.c, CONFIG_CPM must be set.

Without this dependency, the linker fails with some missing
symbols for COMPILE_TEST configurations that need QMC without
enabling CPM.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/
---
 drivers/soc/fsl/qe/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index 7268c2fbcbc1..e0d096607fef 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -36,7 +36,7 @@ config UCC
 config CPM_TSA
 	tristate "CPM TSA support"
 	depends on OF && HAS_IOMEM
-	depends on CPM1 || COMPILE_TEST
+	depends on CPM1 || (CPM && COMPILE_TEST)
 	help
 	  Freescale CPM Time Slot Assigner (TSA)
 	  controller.
@@ -47,7 +47,7 @@ config CPM_TSA
 config CPM_QMC
 	tristate "CPM QMC support"
 	depends on OF && HAS_IOMEM
-	depends on CPM1 || (FSL_SOC && COMPILE_TEST)
+	depends on CPM1 || (FSL_SOC && CPM && COMPILE_TEST)
 	depends on CPM_TSA
 	help
 	  Freescale CPM QUICC Multichannel Controller
-- 
2.40.1

