Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D70183CB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:42:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dkNV0vdMzDqht
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:42:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk503VKgzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:52 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D5CA81A11C3;
 Thu, 12 Mar 2020 23:28:41 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B22C1A11CD;
 Thu, 12 Mar 2020 23:28:41 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 C104A40A63; Thu, 12 Mar 2020 15:28:40 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 6/6] soc: fsl: qe: fix sparse warnings for ucc_slow.c
Date: Thu, 12 Mar 2020 17:28:27 -0500
Message-Id: <20200312222827.17409-7-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
In-Reply-To: <20200312222827.17409-1-leoyang.li@nxp.com>
References: <20200312222827.17409-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following sparse warnings:

drivers/soc/fsl/qe/ucc_slow.c:78:17: warning: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:78:17:    expected struct ucc_slow *us_regs
drivers/soc/fsl/qe/ucc_slow.c:78:17:    got struct ucc_slow [noderef] <asn:2> *us_regs
drivers/soc/fsl/qe/ucc_slow.c:81:18: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:81:18:    expected void const volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:81:18:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:90:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:90:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:90:9:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:99:17: warning: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:99:17:    expected struct ucc_slow *us_regs
drivers/soc/fsl/qe/ucc_slow.c:99:17:    got struct ucc_slow [noderef] <asn:2> *us_regs
drivers/soc/fsl/qe/ucc_slow.c:102:18: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:102:18:    expected void const volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:102:18:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:111:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:111:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:111:9:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:172:28: warning: Using plain integer as NULL pointer
drivers/soc/fsl/qe/ucc_slow.c:174:25: warning: cast removes address space '<asn:2>' of expression
drivers/soc/fsl/qe/ucc_slow.c:175:25: warning: cast removes address space '<asn:2>' of expression
drivers/soc/fsl/qe/ucc_slow.c:194:23: warning: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:194:23:    expected struct ucc_slow_pram *us_pram
drivers/soc/fsl/qe/ucc_slow.c:194:23:    got void [noderef] <asn:2> *
drivers/soc/fsl/qe/ucc_slow.c:204:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:204:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:204:9:    got restricted __be16 *
drivers/soc/fsl/qe/ucc_slow.c:229:41: warning: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:229:41:    expected struct qe_bd *tx_bd
drivers/soc/fsl/qe/ucc_slow.c:229:41:    got void [noderef] <asn:2> *
drivers/soc/fsl/qe/ucc_slow.c:232:17: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:232:17:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:232:17:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:234:17: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:234:17:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:234:17:    got unsigned int [usertype] *
drivers/soc/fsl/qe/ucc_slow.c:238:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:238:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:238:9:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:239:9: warning: cast from restricted __be32
drivers/soc/fsl/qe/ucc_slow.c:239:9: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/ucc_slow.c:239:9:    expected unsigned int [usertype] val
drivers/soc/fsl/qe/ucc_slow.c:239:9:    got restricted __be32 [usertype]
drivers/soc/fsl/qe/ucc_slow.c:239:9: warning: cast from restricted __be32
drivers/soc/fsl/qe/ucc_slow.c:239:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:239:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:239:9:    got unsigned int [usertype] *
drivers/soc/fsl/qe/ucc_slow.c:242:26: warning: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:242:26:    expected struct qe_bd *rx_bd
drivers/soc/fsl/qe/ucc_slow.c:242:26:    got void [noderef] <asn:2> *
drivers/soc/fsl/qe/ucc_slow.c:245:17: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:245:17:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:245:17:    got unsigned int [usertype] *
drivers/soc/fsl/qe/ucc_slow.c:247:17: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:247:17:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:247:17:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:251:9: warning: cast from restricted __be32
drivers/soc/fsl/qe/ucc_slow.c:251:9: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/ucc_slow.c:251:9:    expected unsigned int [usertype] val
drivers/soc/fsl/qe/ucc_slow.c:251:9:    got restricted __be32 [usertype]
drivers/soc/fsl/qe/ucc_slow.c:251:9: warning: cast from restricted __be32
drivers/soc/fsl/qe/ucc_slow.c:251:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:251:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:251:9:    got unsigned int [usertype] *
drivers/soc/fsl/qe/ucc_slow.c:252:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:252:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:252:9:    got restricted __be32 *
drivers/soc/fsl/qe/ucc_slow.c:276:39: warning: mixing different enum types:
drivers/soc/fsl/qe/ucc_slow.c:276:39:    unsigned int enum ucc_slow_tx_oversampling_rate
drivers/soc/fsl/qe/ucc_slow.c:276:39:    unsigned int enum ucc_slow_rx_oversampling_rate
drivers/soc/fsl/qe/ucc_slow.c:296:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:296:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:296:9:    got restricted __be16 *
drivers/soc/fsl/qe/ucc_slow.c:297:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc_slow.c:297:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc_slow.c:297:9:    got restricted __be16 *

Also removed the unneccessary clearing for kzalloc'ed structure.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/soc/fsl/qe/ucc_slow.c | 33 +++++++++++++--------------------
 include/soc/fsl/qe/ucc_slow.h | 13 ++++++-------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/fsl/qe/ucc_slow.c b/drivers/soc/fsl/qe/ucc_slow.c
index 274d34449846..7e11be41ab62 100644
--- a/drivers/soc/fsl/qe/ucc_slow.c
+++ b/drivers/soc/fsl/qe/ucc_slow.c
@@ -72,7 +72,7 @@ EXPORT_SYMBOL(ucc_slow_restart_tx);
 
 void ucc_slow_enable(struct ucc_slow_private * uccs, enum comm_dir mode)
 {
-	struct ucc_slow *us_regs;
+	struct ucc_slow __iomem *us_regs;
 	u32 gumr_l;
 
 	us_regs = uccs->us_regs;
@@ -93,7 +93,7 @@ EXPORT_SYMBOL(ucc_slow_enable);
 
 void ucc_slow_disable(struct ucc_slow_private * uccs, enum comm_dir mode)
 {
-	struct ucc_slow *us_regs;
+	struct ucc_slow __iomem *us_regs;
 	u32 gumr_l;
 
 	us_regs = uccs->us_regs;
@@ -122,7 +122,7 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	u32 i;
 	struct ucc_slow __iomem *us_regs;
 	u32 gumr;
-	struct qe_bd *bd;
+	struct qe_bd __iomem *bd;
 	u32 id;
 	u32 command;
 	int ret = 0;
@@ -168,16 +168,9 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 		return -ENOMEM;
 	}
 
-	uccs->saved_uccm = 0;
-	uccs->p_rx_frame = 0;
 	us_regs = uccs->us_regs;
-	uccs->p_ucce = (u16 *) & (us_regs->ucce);
-	uccs->p_uccm = (u16 *) & (us_regs->uccm);
-#ifdef STATISTICS
-	uccs->rx_frames = 0;
-	uccs->tx_frames = 0;
-	uccs->rx_discarded = 0;
-#endif				/* STATISTICS */
+	uccs->p_ucce = &us_regs->ucce;
+	uccs->p_uccm = &us_regs->uccm;
 
 	/* Get PRAM base */
 	uccs->us_pram_offset =
@@ -231,24 +224,24 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 		/* clear bd buffer */
 		qe_iowrite32be(0, &bd->buf);
 		/* set bd status and length */
-		qe_iowrite32be(0, (u32 *)bd);
+		qe_iowrite32be(0, (u32 __iomem *)bd);
 		bd++;
 	}
 	/* for last BD set Wrap bit */
 	qe_iowrite32be(0, &bd->buf);
-	qe_iowrite32be(cpu_to_be32(T_W), (u32 *)bd);
+	qe_iowrite32be(T_W, (u32 __iomem *)bd);
 
 	/* Init Rx bds */
 	bd = uccs->rx_bd = qe_muram_addr(uccs->rx_base_offset);
 	for (i = 0; i < us_info->rx_bd_ring_len - 1; i++) {
 		/* set bd status and length */
-		qe_iowrite32be(0, (u32 *)bd);
+		qe_iowrite32be(0, (u32 __iomem *)bd);
 		/* clear bd buffer */
 		qe_iowrite32be(0, &bd->buf);
 		bd++;
 	}
 	/* for last BD set Wrap bit */
-	qe_iowrite32be(cpu_to_be32(R_W), (u32 *)bd);
+	qe_iowrite32be(R_W, (u32 __iomem *)bd);
 	qe_iowrite32be(0, &bd->buf);
 
 	/* Set GUMR (For more details see the hardware spec.). */
@@ -273,8 +266,8 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	qe_iowrite32be(gumr, &us_regs->gumr_h);
 
 	/* gumr_l */
-	gumr = us_info->tdcr | us_info->rdcr | us_info->tenc | us_info->renc |
-		us_info->diag | us_info->mode;
+	gumr = (u32)us_info->tdcr | (u32)us_info->rdcr | (u32)us_info->tenc |
+	       (u32)us_info->renc | (u32)us_info->diag | (u32)us_info->mode;
 	if (us_info->tci)
 		gumr |= UCC_SLOW_GUMR_L_TCI;
 	if (us_info->rinv)
@@ -289,8 +282,8 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 
 	/* if the data is in cachable memory, the 'global' */
 	/* in the function code should be set. */
-	uccs->us_pram->tbmr = UCC_BMR_BO_BE;
-	uccs->us_pram->rbmr = UCC_BMR_BO_BE;
+	qe_iowrite8(UCC_BMR_BO_BE, &uccs->us_pram->tbmr);
+	qe_iowrite8(UCC_BMR_BO_BE, &uccs->us_pram->rbmr);
 
 	/* rbase, tbase are offsets from MURAM base */
 	qe_iowrite16be(uccs->rx_base_offset, &uccs->us_pram->rbase);
diff --git a/include/soc/fsl/qe/ucc_slow.h b/include/soc/fsl/qe/ucc_slow.h
index d187a6be83bc..11a216e4e919 100644
--- a/include/soc/fsl/qe/ucc_slow.h
+++ b/include/soc/fsl/qe/ucc_slow.h
@@ -184,7 +184,7 @@ struct ucc_slow_info {
 struct ucc_slow_private {
 	struct ucc_slow_info *us_info;
 	struct ucc_slow __iomem *us_regs; /* Ptr to memory map of UCC regs */
-	struct ucc_slow_pram *us_pram;	/* a pointer to the parameter RAM */
+	struct ucc_slow_pram __iomem *us_pram;	/* a pointer to the parameter RAM */
 	s32 us_pram_offset;
 	int enabled_tx;		/* Whether channel is enabled for Tx (ENT) */
 	int enabled_rx;		/* Whether channel is enabled for Rx (ENR) */
@@ -196,13 +196,12 @@ struct ucc_slow_private {
 				   and length for first BD in a frame */
 	s32 tx_base_offset;	/* first BD in Tx BD table offset (In MURAM) */
 	s32 rx_base_offset;	/* first BD in Rx BD table offset (In MURAM) */
-	struct qe_bd *confBd;	/* next BD for confirm after Tx */
-	struct qe_bd *tx_bd;	/* next BD for new Tx request */
-	struct qe_bd *rx_bd;	/* next BD to collect after Rx */
+	struct qe_bd __iomem *confBd;	/* next BD for confirm after Tx */
+	struct qe_bd __iomem *tx_bd;	/* next BD for new Tx request */
+	struct qe_bd __iomem *rx_bd;	/* next BD to collect after Rx */
 	void *p_rx_frame;	/* accumulating receive frame */
-	u16 *p_ucce;		/* a pointer to the event register in memory.
-				 */
-	u16 *p_uccm;		/* a pointer to the mask register in memory */
+	__be16 __iomem *p_ucce;	/* a pointer to the event register in memory */
+	__be16 __iomem *p_uccm;	/* a pointer to the mask register in memory */
 	u16 saved_uccm;		/* a saved mask for the RX Interrupt bits */
 #ifdef STATISTICS
 	u32 tx_frames;		/* Transmitted frames counters */
-- 
2.17.1

