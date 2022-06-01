Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665653A7F1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:04:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrVx3CxMz3f1h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:04:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uOOJeQQt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uOOJeQQt;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrLm42tnz3f2t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:57:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 82EF7CE1C2F;
	Wed,  1 Jun 2022 13:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA32C34119;
	Wed,  1 Jun 2022 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091855;
	bh=ynjdX7sqIzj3XGbBUvL+J2pZWNuexzQpo7a/4F/yD1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOOJeQQtulqsZ/hjs0NwuVi4i4tQ5A4nH09sw7anAEOYAFUuWw4UZI4X6JOTR5rKS
	 MQjz0dL4rXnLzBY4IE/PW8YTcHdriqzXiGeN0mdkBKhQSnv39cJlXZ+bRI+Trp7irr
	 cYJwZhpuhOfXlqhdSCSQHopOcWKBbGZ16l0hfMz44qT0/t38NIdhW6WNH+1W+9eY4D
	 W5/6/Nvx7QRRX05Yh1YjZPXCRcKe+iQky6e9QPgRQxgGvnDeLhZN5gCbiZ2ijFA/2+
	 lVC25raEjFIHkhLQLEmGwQtYjigPLEQb7GhX9mQBWhBsJXjp3hHFa7oiWzsRNbdXcP
	 BIZjjSvBh+P4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 29/37] powerpc/powernv/vas: Assign real address to rx_fifo in vas_rx_win_attr
Date: Wed,  1 Jun 2022 09:56:14 -0400
Message-Id: <20220601135622.2003939-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135622.2003939-1-sashal@kernel.org>
References: <20220601135622.2003939-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Haren Myneni <haren@linux.ibm.com>

[ Upstream commit c127d130f6d59fa81701f6b04023cf7cd1972fb3 ]

In init_winctx_regs(), __pa() is called on winctx->rx_fifo and this
function is called to initialize registers for receive and fault
windows. But the real address is passed in winctx->rx_fifo for
receive windows and the virtual address for fault windows which
causes errors with DEBUG_VIRTUAL enabled. Fixes this issue by
assigning only real address to rx_fifo in vas_rx_win_attr struct
for both receive and fault windows.

Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/338e958c7ab8f3b266fa794a1f80f99b9671829e.camel@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/vas.h              | 2 +-
 arch/powerpc/platforms/powernv/vas-fault.c  | 2 +-
 arch/powerpc/platforms/powernv/vas-window.c | 4 ++--
 arch/powerpc/platforms/powernv/vas.h        | 2 +-
 drivers/crypto/nx/nx-common-powernv.c       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 57573d9c1e09..56834a8a1465 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -112,7 +112,7 @@ static inline void vas_user_win_add_mm_context(struct vas_user_win_ref *ref)
  * Receive window attributes specified by the (in-kernel) owner of window.
  */
 struct vas_rx_win_attr {
-	void *rx_fifo;
+	u64 rx_fifo;
 	int rx_fifo_size;
 	int wcreds_max;
 
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index a7aabc18039e..c1bfad56447d 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -216,7 +216,7 @@ int vas_setup_fault_window(struct vas_instance *vinst)
 	vas_init_rx_win_attr(&attr, VAS_COP_TYPE_FAULT);
 
 	attr.rx_fifo_size = vinst->fault_fifo_size;
-	attr.rx_fifo = vinst->fault_fifo;
+	attr.rx_fifo = __pa(vinst->fault_fifo);
 
 	/*
 	 * Max creds is based on number of CRBs can fit in the FIFO.
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 0f8d39fbf2b2..0072682531d8 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -404,7 +404,7 @@ static void init_winctx_regs(struct pnv_vas_window *window,
 	 *
 	 * See also: Design note in function header.
 	 */
-	val = __pa(winctx->rx_fifo);
+	val = winctx->rx_fifo;
 	val = SET_FIELD(VAS_PAGE_MIGRATION_SELECT, val, 0);
 	write_hvwc_reg(window, VREG(LFIFO_BAR), val);
 
@@ -739,7 +739,7 @@ static void init_winctx_for_rxwin(struct pnv_vas_window *rxwin,
 		 */
 		winctx->fifo_disable = true;
 		winctx->intr_disable = true;
-		winctx->rx_fifo = NULL;
+		winctx->rx_fifo = 0;
 	}
 
 	winctx->lnotify_lpid = rxattr->lnotify_lpid;
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 8bb08e395de0..08d9d3d5a22b 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -376,7 +376,7 @@ struct pnv_vas_window {
  * is a container for the register fields in the window context.
  */
 struct vas_winctx {
-	void *rx_fifo;
+	u64 rx_fifo;
 	int rx_fifo_size;
 	int wcreds_max;
 	int rsvd_txbuf_count;
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 32a036ada5d0..f418817c0f43 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -827,7 +827,7 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 		goto err_out;
 
 	vas_init_rx_win_attr(&rxattr, coproc->ct);
-	rxattr.rx_fifo = (void *)rx_fifo;
+	rxattr.rx_fifo = rx_fifo;
 	rxattr.rx_fifo_size = fifo_size;
 	rxattr.lnotify_lpid = lpid;
 	rxattr.lnotify_pid = pid;
-- 
2.35.1

