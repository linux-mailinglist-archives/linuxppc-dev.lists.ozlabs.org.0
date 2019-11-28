Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745C10CD3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:51:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3ZM0qWqzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:51:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="GU+FHdBJ"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13D52x2zDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:00 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id l18so2230384lfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=72sEWcRrZShV6+ZtrbY8IpuEizwarRLNFp/8lkLUzfY=;
 b=GU+FHdBJRYkw5UkPWN7s3g70/83WQOEmISQwX9qSdRVD3WHOUaGAFdBUx3Sme7fjHL
 /Z+7qlogtJH6EcMtuHnCJMLrZd5CaVdwbfAxgYfHduzeaVVIkMdpB925f242Mn00PfSy
 RuXGBWmdfSaOhpduQ3XxsbwxqdAElKPZlwwik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=72sEWcRrZShV6+ZtrbY8IpuEizwarRLNFp/8lkLUzfY=;
 b=OdQ0aiaN12qVjS2f/br2X3ybEe0UehNuO+zeCbZ1CgZskEuLrRQhyz8xB4udxeW6OI
 rzh//SlzZwJdTFLm8qlv3LOi1ze3VjYQjqpcx2Jf8Qkq4Fu+crGFp1qB043rw58YlbuB
 VwyMraiQnwOan3sIG+zCLV9Pi841SAOuqVmnBYWEl/452V5uBA+PeOuDHYl/Q2vCZhYq
 5KRUgFuYG6b6xGHRPE4sGJ/eETiGoxFLE2xSQ4NFjLjb+M1Y/qqrtf5Vp+XUkdP80Gg+
 xYrbvlAnSnhiP8PGjuEAftW4uGCuTbvttGiZxWUe2ntE/8ZJ1yp2scAiNlFlxMTlS3GS
 qizA==
X-Gm-Message-State: APjAAAUYIQTOmJD6nmGeJtQh+8xwoOrQaXKZ/w6ok5XCWqCTWb4fMG6M
 xMnnHCHpKF6oWaQ45KLKWq8CMA==
X-Google-Smtp-Source: APXvYqz02uT5YFaXnAxzTLioQmYffM+bBn/MgPobmwNavfJAST5FVWoxj4QiDIoEsaR5yWe6ky9XnQ==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr33009525lfa.10.1574953077507; 
 Thu, 28 Nov 2019 06:57:57 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:57 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 40/49] soc: fsl: qe: avoid IS_ERR_VALUE in ucc_slow.c
Date: Thu, 28 Nov 2019 15:55:45 +0100
Message-Id: <20191128145554.1297-41-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When trying to build this for a 64-bit platform, one gets warnings
from using IS_ERR_VALUE on something which is not sizeof(long).

Instead, change the various *_offset fields to store a signed integer,
and simply check for a negative return from qe_muram_alloc(). Since
qe_muram_free() now accepts and ignores a negative argument, we only
need to make sure these fields are initialized with -1, and we can
just unconditionally call qe_muram_free() in ucc_slow_free().

Note that the error case for us_pram_offset failed to set that field
to 0 (which, as noted earlier, is anyway a bogus sentinel value).

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/ucc_slow.c | 22 +++++++++-------------
 include/soc/fsl/qe/ucc_slow.h |  6 +++---
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/fsl/qe/ucc_slow.c b/drivers/soc/fsl/qe/ucc_slow.c
index 9b55fd0f50c6..274d34449846 100644
--- a/drivers/soc/fsl/qe/ucc_slow.c
+++ b/drivers/soc/fsl/qe/ucc_slow.c
@@ -154,6 +154,9 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 			__func__);
 		return -ENOMEM;
 	}
+	uccs->rx_base_offset = -1;
+	uccs->tx_base_offset = -1;
+	uccs->us_pram_offset = -1;
 
 	/* Fill slow UCC structure */
 	uccs->us_info = us_info;
@@ -179,7 +182,7 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	/* Get PRAM base */
 	uccs->us_pram_offset =
 		qe_muram_alloc(UCC_SLOW_PRAM_SIZE, ALIGNMENT_OF_UCC_SLOW_PRAM);
-	if (IS_ERR_VALUE(uccs->us_pram_offset)) {
+	if (uccs->us_pram_offset < 0) {
 		printk(KERN_ERR "%s: cannot allocate MURAM for PRAM", __func__);
 		ucc_slow_free(uccs);
 		return -ENOMEM;
@@ -206,10 +209,9 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	uccs->rx_base_offset =
 		qe_muram_alloc(us_info->rx_bd_ring_len * sizeof(struct qe_bd),
 				QE_ALIGNMENT_OF_BD);
-	if (IS_ERR_VALUE(uccs->rx_base_offset)) {
+	if (uccs->rx_base_offset < 0) {
 		printk(KERN_ERR "%s: cannot allocate %u RX BDs\n", __func__,
 			us_info->rx_bd_ring_len);
-		uccs->rx_base_offset = 0;
 		ucc_slow_free(uccs);
 		return -ENOMEM;
 	}
@@ -217,9 +219,8 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	uccs->tx_base_offset =
 		qe_muram_alloc(us_info->tx_bd_ring_len * sizeof(struct qe_bd),
 			QE_ALIGNMENT_OF_BD);
-	if (IS_ERR_VALUE(uccs->tx_base_offset)) {
+	if (uccs->tx_base_offset < 0) {
 		printk(KERN_ERR "%s: cannot allocate TX BDs", __func__);
-		uccs->tx_base_offset = 0;
 		ucc_slow_free(uccs);
 		return -ENOMEM;
 	}
@@ -352,14 +353,9 @@ void ucc_slow_free(struct ucc_slow_private * uccs)
 	if (!uccs)
 		return;
 
-	if (uccs->rx_base_offset)
-		qe_muram_free(uccs->rx_base_offset);
-
-	if (uccs->tx_base_offset)
-		qe_muram_free(uccs->tx_base_offset);
-
-	if (uccs->us_pram)
-		qe_muram_free(uccs->us_pram_offset);
+	qe_muram_free(uccs->rx_base_offset);
+	qe_muram_free(uccs->tx_base_offset);
+	qe_muram_free(uccs->us_pram_offset);
 
 	if (uccs->us_regs)
 		iounmap(uccs->us_regs);
diff --git a/include/soc/fsl/qe/ucc_slow.h b/include/soc/fsl/qe/ucc_slow.h
index 8696fdea2ae9..d187a6be83bc 100644
--- a/include/soc/fsl/qe/ucc_slow.h
+++ b/include/soc/fsl/qe/ucc_slow.h
@@ -185,7 +185,7 @@ struct ucc_slow_private {
 	struct ucc_slow_info *us_info;
 	struct ucc_slow __iomem *us_regs; /* Ptr to memory map of UCC regs */
 	struct ucc_slow_pram *us_pram;	/* a pointer to the parameter RAM */
-	u32 us_pram_offset;
+	s32 us_pram_offset;
 	int enabled_tx;		/* Whether channel is enabled for Tx (ENT) */
 	int enabled_rx;		/* Whether channel is enabled for Rx (ENR) */
 	int stopped_tx;		/* Whether channel has been stopped for Tx
@@ -194,8 +194,8 @@ struct ucc_slow_private {
 	struct list_head confQ;	/* frames passed to chip waiting for tx */
 	u32 first_tx_bd_mask;	/* mask is used in Tx routine to save status
 				   and length for first BD in a frame */
-	u32 tx_base_offset;	/* first BD in Tx BD table offset (In MURAM) */
-	u32 rx_base_offset;	/* first BD in Rx BD table offset (In MURAM) */
+	s32 tx_base_offset;	/* first BD in Tx BD table offset (In MURAM) */
+	s32 rx_base_offset;	/* first BD in Rx BD table offset (In MURAM) */
 	struct qe_bd *confBd;	/* next BD for confirm after Tx */
 	struct qe_bd *tx_bd;	/* next BD for new Tx request */
 	struct qe_bd *rx_bd;	/* next BD to collect after Rx */
-- 
2.23.0

