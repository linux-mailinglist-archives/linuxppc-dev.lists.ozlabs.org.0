Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C202970B79E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 10:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPrGB5Fqsz3f7h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 18:29:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PKX9WkgO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PKX9WkgO;
	dkim-atps=neutral
X-Greylist: delayed 441 seconds by postgrey-1.36 at boromir; Mon, 22 May 2023 18:28:35 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPrFH1LCDz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 18:28:34 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 28990C8F05
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 08:21:18 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id EDB4E20014;
	Mon, 22 May 2023 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684743667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfY/8yJ+Azw862bqGkzmouL5hoaQtAS7JukLHLhERIU=;
	b=PKX9WkgOCtI/v41y5mz/oaICybLUofd8JsTID+WdCi80oUwt50SxLj1GxXIIjkcWuKzQg7
	OxFSVGCWD8G9bTKz3HpMdHfgFZoWAaH/P4peD+0KIIlrqP9mAtIlqI8oJC3zk2wxoAbo/7
	ORvwUHPYcVEBR2iT4ku4h3GcEasA8ffCJUg+hqr6f/wlPLUUhnHOcvrzl3oNURKB2yQWtZ
	O/fUAlMzDBfah0CMImToWfJH0Xwam5Ft71KLEiqhm9noF1gJst4fdx0Qjfq/Ndg25by60F
	PKwK3eF/wULEC+Kqfr2OfUhUhMfCkFexeBS73bo1332R+6TxU6Sw0d04jyjZkg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 1/2] soc: fsl: cpm1: Fix TSA and QMC dependencies in case of COMPILE_TEST
Date: Mon, 22 May 2023 10:20:47 +0200
Message-Id: <20230522082048.21216-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522082048.21216-1-herve.codina@bootlin.com>
References: <20230522082048.21216-1-herve.codina@bootlin.com>
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

