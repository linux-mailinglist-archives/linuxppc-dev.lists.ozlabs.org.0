Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADB10065E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:22:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GqPL6slXzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 00:22:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="NuF6g6Vb"; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GmnX3R8nzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:32 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id r10so18999737wrx.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKxtxAnStDtPqjNJxBgJ+/b3/LBB3oZn+H7vofIc/Cg=;
 b=NuF6g6Vb4k/CBHwgQMTRCPWUyppGLXXzJJrSR0zVUvLxiQR1nRY9DKLq70mCasT6Al
 7rfz9gRm6WljzG6dwWznDRmRdGvZEVbisM1Jz02mnmvaK0pbSX+Z8Frz4u37kqObghY1
 AhV0Y/f08FM1NloVf5IHo2bFKTtyn/SU0k6Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKxtxAnStDtPqjNJxBgJ+/b3/LBB3oZn+H7vofIc/Cg=;
 b=BKzqNp3z+YctNM2JO2jkaMShDY1Lfuo2gMHIXU/bWAcqmNBmYQ1nBD+I+ZZC10civr
 40F6If/AZGMTTlMdfY2nhZMwGHQDf3wDzJWvl4Tp3rvhtKxzW2DVT8KFRZChqU9IiR96
 +Ksn+st47ArUT3FOO84HlQhLXgppxS656ehRR0dRv15fPeJN52ohq2asHmFG7dFixmcx
 F4FaVcP/IX+iMrSBmzDZhDz91SM3zWRhtvIAqknwyjdl6H7fjWRpv8KsJwtNLexpKIl2
 o13UbJIerbzi95RkU6kRLhjmpMCWqHNzgTM6guTa/EMSip/HbVd79Cd9k8E3/X0SFjHR
 E8BA==
X-Gm-Message-State: APjAAAWA0PtKUgsGEzSrQLweqnOZczioW1fSORkyp27xeGosaLlRxUKS
 giRdS8bLbHgN0HgNbmqk6huc8Q==
X-Google-Smtp-Source: APXvYqxpW6w95kYRF9FIjVS9xnuXp9jE3D8Zuacookj/+v+EKqwQ8bCni2kQvGlSsvZBkEGhQ7vKTg==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr16431672wrq.301.1574076268431; 
 Mon, 18 Nov 2019 03:24:28 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:27 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 43/48] soc: fsl: qe: avoid IS_ERR_VALUE in ucc_fast.c
Date: Mon, 18 Nov 2019 12:23:19 +0100
Message-Id: <20191118112324.22725-44-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
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

When building this on a 64-bit platform gcc rightly warns that the
error checking is broken (-ENOMEM stored in an u32 does not compare
greater than (unsigned long)-MAX_ERRNO). Instead, change the
ucc_fast_[tr]x_virtual_fifo_base_offset members to s32 and use an
ordinary check-for-negative. Also, this avoids treating 0 as "this
cannot have been returned from qe_muram_alloc() so don't free it".

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/ucc_fast.c | 15 ++++++---------
 include/soc/fsl/qe/ucc_fast.h |  4 ++--
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/ucc_fast.c b/drivers/soc/fsl/qe/ucc_fast.c
index ca0452497a20..ad6193ea4597 100644
--- a/drivers/soc/fsl/qe/ucc_fast.c
+++ b/drivers/soc/fsl/qe/ucc_fast.c
@@ -197,6 +197,8 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 			__func__);
 		return -ENOMEM;
 	}
+	uccf->ucc_fast_tx_virtual_fifo_base_offset = -1;
+	uccf->ucc_fast_rx_virtual_fifo_base_offset = -1;
 
 	/* Fill fast UCC structure */
 	uccf->uf_info = uf_info;
@@ -265,10 +267,9 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 	/* Allocate memory for Tx Virtual Fifo */
 	uccf->ucc_fast_tx_virtual_fifo_base_offset =
 	    qe_muram_alloc(uf_info->utfs, UCC_FAST_VIRT_FIFO_REGS_ALIGNMENT);
-	if (IS_ERR_VALUE(uccf->ucc_fast_tx_virtual_fifo_base_offset)) {
+	if (uccf->ucc_fast_tx_virtual_fifo_base_offset < 0) {
 		printk(KERN_ERR "%s: cannot allocate MURAM for TX FIFO\n",
 			__func__);
-		uccf->ucc_fast_tx_virtual_fifo_base_offset = 0;
 		ucc_fast_free(uccf);
 		return -ENOMEM;
 	}
@@ -278,10 +279,9 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 		qe_muram_alloc(uf_info->urfs +
 			   UCC_FAST_RECEIVE_VIRTUAL_FIFO_SIZE_FUDGE_FACTOR,
 			   UCC_FAST_VIRT_FIFO_REGS_ALIGNMENT);
-	if (IS_ERR_VALUE(uccf->ucc_fast_rx_virtual_fifo_base_offset)) {
+	if (uccf->ucc_fast_rx_virtual_fifo_base_offset < 0) {
 		printk(KERN_ERR "%s: cannot allocate MURAM for RX FIFO\n",
 			__func__);
-		uccf->ucc_fast_rx_virtual_fifo_base_offset = 0;
 		ucc_fast_free(uccf);
 		return -ENOMEM;
 	}
@@ -384,11 +384,8 @@ void ucc_fast_free(struct ucc_fast_private * uccf)
 	if (!uccf)
 		return;
 
-	if (uccf->ucc_fast_tx_virtual_fifo_base_offset)
-		qe_muram_free(uccf->ucc_fast_tx_virtual_fifo_base_offset);
-
-	if (uccf->ucc_fast_rx_virtual_fifo_base_offset)
-		qe_muram_free(uccf->ucc_fast_rx_virtual_fifo_base_offset);
+	qe_muram_free(uccf->ucc_fast_tx_virtual_fifo_base_offset);
+	qe_muram_free(uccf->ucc_fast_rx_virtual_fifo_base_offset);
 
 	if (uccf->uf_regs)
 		iounmap(uccf->uf_regs);
diff --git a/include/soc/fsl/qe/ucc_fast.h b/include/soc/fsl/qe/ucc_fast.h
index e9cc46042a83..ba0e838f962a 100644
--- a/include/soc/fsl/qe/ucc_fast.h
+++ b/include/soc/fsl/qe/ucc_fast.h
@@ -188,9 +188,9 @@ struct ucc_fast_private {
 	int stopped_tx;		/* Whether channel has been stopped for Tx
 				   (STOP_TX, etc.) */
 	int stopped_rx;		/* Whether channel has been stopped for Rx */
-	u32 ucc_fast_tx_virtual_fifo_base_offset;/* pointer to base of Tx
+	s32 ucc_fast_tx_virtual_fifo_base_offset;/* pointer to base of Tx
 						    virtual fifo */
-	u32 ucc_fast_rx_virtual_fifo_base_offset;/* pointer to base of Rx
+	s32 ucc_fast_rx_virtual_fifo_base_offset;/* pointer to base of Rx
 						    virtual fifo */
 #ifdef STATISTICS
 	u32 tx_frames;		/* Transmitted frames counter. */
-- 
2.23.0

