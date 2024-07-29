Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2B93F78E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:22:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pKDlayyG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgYY56JSz3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:22:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pKDlayyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX36Vc6z2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:21 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2BBED24000D;
	Mon, 29 Jul 2024 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECDVzrgNjvjBjKFw+cXG3YV6tgCkVLoJ7Bm/DlpwBr8=;
	b=pKDlayyGCNuipek/kjpn+jCxN8qmz8EcVHCDoY3r3CGlQQ+eoIVlDPtx04fRNgOFFQSIEL
	LCVnP4qJiblflp8QcG4tEj1P2M+79+DOWMRBOwmcaB+T3MTGOi+mUlgc+DytXIxXsUUvP6
	AR+2Xmg3lK/pT4p34lFerag5mmsjkGaKxnXIhkXEowhfnkt+2LRoxNVgDvBPJap34/Jk4L
	N+ZNWEwFuc6VxjBzdyRuZtbJJQ5SjvVGFs/y9wg5W/KwfLQGpgChWXcNqelejWlBo6zfpu
	5LbzNqHovj+ehvwVHTrpzyZimWG8cdcokgcGd1pAzFUNo3qs2f993yeGom+G5Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 03/36] soc: fsl: cpm1: tsa: Fix tsa_write8()
Date: Mon, 29 Jul 2024 16:20:32 +0200
Message-ID: <20240729142107.104574-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729142107.104574-1-herve.codina@bootlin.com>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The tsa_write8() parameter is an u32 value. This is not consistent with
the function itself. Indeed, tsa_write8() writes an 8bits value.

Be consistent and use an u8 parameter value.

Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 6c5741cf5e9d..53968ea84c88 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -140,7 +140,7 @@ static inline void tsa_write32(void __iomem *addr, u32 val)
 	iowrite32be(val, addr);
 }
 
-static inline void tsa_write8(void __iomem *addr, u32 val)
+static inline void tsa_write8(void __iomem *addr, u8 val)
 {
 	iowrite8(val, addr);
 }
-- 
2.45.0

