Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F593F88B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:46:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=VipG2C4a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXh4t077rz3ckk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=VipG2C4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXX6lbHz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:48 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 83FC524000A;
	Mon, 29 Jul 2024 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrvHrWOWhKVyILAF7ZtiWAvLgdtBWWhrCvOa0CPkMcA=;
	b=VipG2C4ag8eBoUEcumbokRh8d6rRhS28xNhPp+JpNLbQYtW5LOFPNeRyI7iQsNlhjP9eGR
	Ewvs29hsUc5dCXEdCLQ3SK80TQU0ufXG5gcxO+jdgCmoCxogP9eyhqbz0dU8dXGivstNgt
	4N0KC4DjyoYD46ICcEZRJtF5XzxPx9trAzpWxDDz9fKcecDeXfmakB7wkjp8MFEn5mkmFZ
	x8d30d+Lu4M/DDjZ0mKsoRGkOALpCloml+7sEYW2Fpf2ZnMtxsST0/V2KPjWmCzIfZJMot
	371knE/l6MAi229RPMmtXe5EoCItJpUoU7UQNRZDOadpH+yKXL3IP3VrSgGTMA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 22/36] soc: fsl: cpm1: qmc: Add missing spinlock comment
Date: Mon, 29 Jul 2024 16:20:51 +0200
Message-ID: <20240729142107.104574-23-herve.codina@bootlin.com>
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

