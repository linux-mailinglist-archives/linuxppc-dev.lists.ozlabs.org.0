Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C96F4FCF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:35:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478kqH3m3xzF694
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:35:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="OMJjEfRd"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gR40bZtzF6qp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:24 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id d6so4019196lfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKxtxAnStDtPqjNJxBgJ+/b3/LBB3oZn+H7vofIc/Cg=;
 b=OMJjEfRd48l9yUpyE2357XcIsRJLdOdGu6cqnnbciUlwZHeZovkZpyp0t0N/AXUB0G
 mmPymXL+MPaOrKkaQbKIZvzq8vi1p6BeMnR73GkDYliRrt73eSaJgjoKJvIjcrt4ppVh
 teAlmhXN/Smyo6qtACnfhoCrC+ohYMOVNT7Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKxtxAnStDtPqjNJxBgJ+/b3/LBB3oZn+H7vofIc/Cg=;
 b=bWhPSciw/V2IqipO3ZWwWQOaYRk3rOO7T9qSSNeWqsKxGkM4FEoX2dOQGVB7R4FFxv
 HG9tAPKagje7VTtdOyOJ8GWOG0LEhk4fegqWOCfm0jdN9Bhp+fKWPyOuSg7Yi2sEDd2c
 YPnPrAc7mTNZnxjT7mpjnVQE/z7EM+vDLP/Sg8dbwk+GUNoRO/gj9R+5sk+94g5MkAiB
 V1HyOvhtjHjPN9Rj2efqInbWypLSHjsEomOYwZeGti6cFnlIVmFjXzRaEfrLxilPL/z1
 RB9N8faV71xisZo8z/euapXfcG3w4B2mGj0UaRZ1zvHrtoq6xCyZLy76srwDRpMnMc3r
 B8qA==
X-Gm-Message-State: APjAAAX5vByQge/xwXZxYTO6iyevZCgVTJwkVdoTOLYleq+4EaynvVNh
 rM/tUQS/JqMZ54Xe4C17t/Dnqw==
X-Google-Smtp-Source: APXvYqzW9GccVQq0zDWdsR9ctlnzwu1b/T1nps4OEjOIXr9eNiXW/Fjo4xt7Q+aH6wPhZ4yaknWlsg==
X-Received: by 2002:a19:706:: with SMTP id 6mr1175198lfh.93.1573218140577;
 Fri, 08 Nov 2019 05:02:20 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:20 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 42/47] soc: fsl: qe: avoid IS_ERR_VALUE in ucc_fast.c
Date: Fri,  8 Nov 2019 14:01:18 +0100
Message-Id: <20191108130123.6839-43-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

