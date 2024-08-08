Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F694B7DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:28:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pLVpExoq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdv51lqzz3dRD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pLVpExoq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWy1wMvz3dXj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:57 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id DE0C6C000C;
	Thu,  8 Aug 2024 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrvHrWOWhKVyILAF7ZtiWAvLgdtBWWhrCvOa0CPkMcA=;
	b=pLVpExoquveiObLx7pXqXamoPmD5qsxOVt+baRDmQ3WMIPIPIQlXwgVvk+Cd7L9ZG3FEz7
	3M/+QVlLK74DGYEguG9P1I2ZEujHl55qJTIf5pm1SreHGEM698cGEWdmU9WOPj6efQzIBT
	2FdyDD22xMUJYiPe0e0AfzEUH+XMb++6CRfAs8g6f1VvIy4KBzWt9srW0EyaBEgl9v42Zo
	yqAUX5CJFvDHQwh+NIVbfq65q3gm+8/DAQOz6tqvR5vy51g6x3HkN77NnXoBjPn8MD2VDX
	ZhjuZPo5WUaT33A3JcUDnak0i4dNHmoy+ow7mnr1K2KWH5o/ubFcuPYGO4bm1w==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 22/36] soc: fsl: cpm1: qmc: Add missing spinlock comment
Date: Thu,  8 Aug 2024 09:11:15 +0200
Message-ID: <20240808071132.149251-23-herve.codina@bootlin.com>
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

checkpatch.pl raises the following issue
  CHECK: spinlock_t definition without comment

Add the missing comments.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 2d54d7400d2d..3736a8e4575e 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -196,7 +196,7 @@ struct qmc_chan {
 	u64	rx_ts_mask;
 	bool is_reverse_data;
 
-	spinlock_t	tx_lock;
+	spinlock_t	tx_lock; /* Protect Tx related data */
 	cbd_t __iomem *txbds;
 	cbd_t __iomem *txbd_free;
 	cbd_t __iomem *txbd_done;
@@ -204,7 +204,7 @@ struct qmc_chan {
 	u64	nb_tx_underrun;
 	bool	is_tx_stopped;
 
-	spinlock_t	rx_lock;
+	spinlock_t	rx_lock; /* Protect Rx related data */
 	cbd_t __iomem *rxbds;
 	cbd_t __iomem *rxbd_free;
 	cbd_t __iomem *rxbd_done;
-- 
2.45.0

