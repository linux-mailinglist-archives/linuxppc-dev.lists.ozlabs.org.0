Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B493F7A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:24:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HFG/IGQG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgbv3qhYz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HFG/IGQG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX40Ks2z2y8q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:23 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8D29924000B;
	Mon, 29 Jul 2024 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8PJVZbpZeHvhUUqQp4BvbX25vcoHX3SZ5FqCu0M2s8=;
	b=HFG/IGQG9+9470K1tbqF3g1O2Ds8KvcaXAFZETTbHZJrlMXT9G0jJy67cmsaIJEgr2doA5
	9tCpTaOQYJLv4l4pIWjnL9jlniU/7ORtcsPikVlGK+dwl962vUIAgbzewsqQd5ZWDK5xj5
	NMpSEeWk+IA9UI1QwOIISHQkND42dtPOQyhe+Bt9r5+uLF95e5HMoGQuZJEVCHQ360qp6J
	/oq79rIwH+3Nw/znhzW4o5rzLeSljaeb3/k94oZS0u43NEBztpSrFNFAmHJV0h6Amz20Ht
	IMG1RhJg0cVuHiUdX7x1TiVFCgIaRk9/B2LIry7raoygBr42Ne9xDzWufjizbA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 08/36] soc: fsl: cpm1: tsa: Remove unused registers offset definition
Date: Mon, 29 Jul 2024 16:20:37 +0200
Message-ID: <20240729142107.104574-9-herve.codina@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SISTR, SICMR and SIRP registers offset definitions are not used.

In order to avoid unneeded code, remove them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index a9d35b44489d..244d521d8780 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -66,12 +66,6 @@
 #define   TSA_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x2)
 #define   TSA_SIGMR_RDM_DYN_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x3)
 
-/* SI status register (8 bits) */
-#define TSA_SISTR	0x06
-
-/* SI command register (8 bits) */
-#define TSA_SICMR	0x07
-
 /* SI clock route register (32 bits) */
 #define TSA_SICR	0x0C
 #define   TSA_SICR_SCC2_MASK		GENMASK(15, 8)
@@ -102,9 +96,6 @@
 #define       TSA_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x6)
 #define       TSA_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x7)
 
-/* Serial interface RAM pointer register (32 bits) */
-#define TSA_SIRP	0x10
-
 struct tsa_entries_area {
 	void __iomem *entries_start;
 	void __iomem *entries_next;
-- 
2.45.0

