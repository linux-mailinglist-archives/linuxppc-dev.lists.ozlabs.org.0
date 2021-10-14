Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F072642D646
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 11:41:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVPXp3jxnz2ywp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 20:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=KS4WlTHZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
 envelope-from=agust@denx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=KS4WlTHZ; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVPX62Lmwz2xtV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 20:40:20 +1100 (AEDT)
Received: from crub.agik.hopto.org (pd95f1d7c.dip0.t-ipconnect.de
 [217.95.29.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DDF88832F6;
 Thu, 14 Oct 2021 11:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634204413;
 bh=CfXKgUAUqbW22i5vzoFFXyGwzGH9oURGql0RQvjX8VE=;
 h=From:To:Cc:Subject:Date:From;
 b=KS4WlTHZE/8YhMVCY61Danoh4/nblIIis/y0MwLGBeHZJXR0iuB7bECY+Y1CPyBfE
 8z1ZRkrF4tnOOClzITl7lkbqEOg79AtfRK6+felcaWiLTgctv4bTnjbRHrnAnvt15D
 6W0KCT7p7FhaxuXLPyyEsBoRzzeYH99rfZNLuon3WryW2WAvlOpzo3CmgQueuSm2Ox
 0b1O7+gZ55mPhohQQY/yl9CAH+k8qAbhqERSLru87zg7pSlecLve7PT5HJcd4ngyyd
 uUjqOZfQUXmgZTcDVIkaJIhaCvw1CAsnNwhEl0NEneUgOPCemiYf3nt2cv7+6dyE2S
 Vd3BI/k3Hx1EQ==
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] dmaengine: bestcomm: fix system boot lockups
Date: Thu, 14 Oct 2021 11:40:12 +0200
Message-Id: <20211014094012.21286-1-agust@denx.de>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memset() and memcpy() on an MMIO region like here results in a
lockup at startup on mpc5200 platform (since this first happens
during probing of the ATA and Ethernet drivers). Use memset_io()
and memcpy_toio() instead.

Fixes: 2f9ea1bde0d1 ("bestcomm: core bestcomm support for Freescale MPC5200")
Cc: stable@vger.kernel.org # v5.14+
Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/dma/bestcomm/ata.c      |  2 +-
 drivers/dma/bestcomm/bestcomm.c | 22 +++++++++++-----------
 drivers/dma/bestcomm/fec.c      |  4 ++--
 drivers/dma/bestcomm/gen_bd.c   |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
index 2fd87f83cf90..e169f18da551 100644
--- a/drivers/dma/bestcomm/ata.c
+++ b/drivers/dma/bestcomm/ata.c
@@ -133,7 +133,7 @@ void bcom_ata_reset_bd(struct bcom_task *tsk)
 	struct bcom_ata_var *var;
 
 	/* Reset all BD */
-	memset(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
+	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
 
 	tsk->index = 0;
 	tsk->outdex = 0;
diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index d91cbbe7a48f..8c42e5ca00a9 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -95,7 +95,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 		tsk->bd = bcom_sram_alloc(bd_count * bd_size, 4, &tsk->bd_pa);
 		if (!tsk->bd)
 			goto error;
-		memset(tsk->bd, 0x00, bd_count * bd_size);
+		memset_io(tsk->bd, 0x00, bd_count * bd_size);
 
 		tsk->num_bd = bd_count;
 		tsk->bd_size = bd_size;
@@ -186,16 +186,16 @@ bcom_load_image(int task, u32 *task_image)
 	inc = bcom_task_inc(task);
 
 	/* Clear & copy */
-	memset(var, 0x00, BCOM_VAR_SIZE);
-	memset(inc, 0x00, BCOM_INC_SIZE);
+	memset_io(var, 0x00, BCOM_VAR_SIZE);
+	memset_io(inc, 0x00, BCOM_INC_SIZE);
 
 	desc_src = (u32 *)(hdr + 1);
 	var_src = desc_src + hdr->desc_size;
 	inc_src = var_src + hdr->var_size;
 
-	memcpy(desc, desc_src, hdr->desc_size * sizeof(u32));
-	memcpy(var + hdr->first_var, var_src, hdr->var_size * sizeof(u32));
-	memcpy(inc, inc_src, hdr->inc_size * sizeof(u32));
+	memcpy_toio(desc, desc_src, hdr->desc_size * sizeof(u32));
+	memcpy_toio(var + hdr->first_var, var_src, hdr->var_size * sizeof(u32));
+	memcpy_toio(inc, inc_src, hdr->inc_size * sizeof(u32));
 
 	return 0;
 }
@@ -302,13 +302,13 @@ static int bcom_engine_init(void)
 		return -ENOMEM;
 	}
 
-	memset(bcom_eng->tdt, 0x00, tdt_size);
-	memset(bcom_eng->ctx, 0x00, ctx_size);
-	memset(bcom_eng->var, 0x00, var_size);
-	memset(bcom_eng->fdt, 0x00, fdt_size);
+	memset_io(bcom_eng->tdt, 0x00, tdt_size);
+	memset_io(bcom_eng->ctx, 0x00, ctx_size);
+	memset_io(bcom_eng->var, 0x00, var_size);
+	memset_io(bcom_eng->fdt, 0x00, fdt_size);
 
 	/* Copy the FDT for the EU#3 */
-	memcpy(&bcom_eng->fdt[48], fdt_ops, sizeof(fdt_ops));
+	memcpy_toio(&bcom_eng->fdt[48], fdt_ops, sizeof(fdt_ops));
 
 	/* Initialize Task base structure */
 	for (task=0; task<BCOM_MAX_TASKS; task++)
diff --git a/drivers/dma/bestcomm/fec.c b/drivers/dma/bestcomm/fec.c
index 7f1fb1c999e4..d203618ac11f 100644
--- a/drivers/dma/bestcomm/fec.c
+++ b/drivers/dma/bestcomm/fec.c
@@ -140,7 +140,7 @@ bcom_fec_rx_reset(struct bcom_task *tsk)
 	tsk->index = 0;
 	tsk->outdex = 0;
 
-	memset(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
+	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
 
 	/* Configure some stuff */
 	bcom_set_task_pragma(tsk->tasknum, BCOM_FEC_RX_BD_PRAGMA);
@@ -241,7 +241,7 @@ bcom_fec_tx_reset(struct bcom_task *tsk)
 	tsk->index = 0;
 	tsk->outdex = 0;
 
-	memset(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
+	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
 
 	/* Configure some stuff */
 	bcom_set_task_pragma(tsk->tasknum, BCOM_FEC_TX_BD_PRAGMA);
diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 906ddba6a6f5..8a24a5cbc263 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -142,7 +142,7 @@ bcom_gen_bd_rx_reset(struct bcom_task *tsk)
 	tsk->index = 0;
 	tsk->outdex = 0;
 
-	memset(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
+	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
 
 	/* Configure some stuff */
 	bcom_set_task_pragma(tsk->tasknum, BCOM_GEN_RX_BD_PRAGMA);
@@ -226,7 +226,7 @@ bcom_gen_bd_tx_reset(struct bcom_task *tsk)
 	tsk->index = 0;
 	tsk->outdex = 0;
 
-	memset(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
+	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
 
 	/* Configure some stuff */
 	bcom_set_task_pragma(tsk->tasknum, BCOM_GEN_TX_BD_PRAGMA);
-- 
2.17.1

