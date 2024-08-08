Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F264694B7BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:23:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=g9ATk1Bs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdnN690sz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=g9ATk1Bs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWr5thjz3dVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:52 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7BBCEC0005;
	Thu,  8 Aug 2024 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaXjEZNpUJnLB3rQBWEOUhhIwVLHy+ulcMNJJs5r5ug=;
	b=g9ATk1Bs2ojL25FopiaM3g7t9TI2JwBUFa+NxdUaLGSfjtYYTjRsCGvIBl7RN0rA+ljzVX
	OjyWp7YNEB4d9BP5RY6fXB2l8AsCAPEd9UwH78kLvhlzaoc4ZMLgNd5aN4CPFSJe8Ad4cJ
	wmnjn8WGtEPqC0rERCquPHCoDsL49LrR+/L0uK0LFA/yu72Vog7Zj5aw5JAX+f07cxcbs/
	T1XZxs0QlxefuZcqos86CWmFGSM7XQd472pF89C1m6XZkAVdRdmV914aRNmoobq0tN3RPu
	5u/Q8pNX1SGzVjOpdzvRpGzKpR3GGKZ9LwRASnv2QbEU0Y3S0Qj/aVsetw1Hcw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 15/36] MAINTAINERS: Add QE files related to the Freescale TSA controller
Date: Thu,  8 Aug 2024 09:11:08 +0200
Message-ID: <20240808071132.149251-16-herve.codina@bootlin.com>
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

The Freescale TSA controller driver supports both QE and CPM1.

Add the newly introduced QE files to the existing entry.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..1d32d38f2247 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9011,9 +9011,11 @@ M:	Herve Codina <herve.codina@bootlin.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
+F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
 F:	drivers/soc/fsl/qe/tsa.c
 F:	drivers/soc/fsl/qe/tsa.h
 F:	include/dt-bindings/soc/cpm1-fsl,tsa.h
+F:	include/dt-bindings/soc/qe-fsl,tsa.h
 
 FREESCALE QUICC ENGINE UCC ETHERNET DRIVER
 L:	netdev@vger.kernel.org
-- 
2.45.0

