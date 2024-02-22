Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74734860593
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 23:20:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YcIIOTCs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgndL2fmqz3dW2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 09:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YcIIOTCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgncX4r1xz3cb5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 09:19:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98375CE28BD;
	Thu, 22 Feb 2024 22:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0BA1C433F1;
	Thu, 22 Feb 2024 22:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708640360;
	bh=NI7zQTk513arbEk34dSwLfykYV+WkJGJ0cVI/ha6fok=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YcIIOTCsNJZ1MoOnwAs0dN3kTL+1+uOKYsuEx8bzmbwVyCp7drSsUm8V3TAi5+h3Q
	 ZBmNtZ/bxDIdxmfgIBUXqRGgtyo3g/USfgWac+R1gfwNPykDRz5jK1LxIIGyFh/t25
	 BKw6YVJs9AxE+SFOB31cmyJmFD8lMNw0hO7yBxc1uhoiscxhaOcc4oeveeYxc0gYST
	 pgT7S5Bik4gUUh5ZjqXZo4s31UV1aPzlzwUO+ghAsRL73L3LLTar2aedyXhBKdfRpK
	 pubfXbPtKhlEohDoxNTt7qesek4AHSDhvfoUsj5mTADvPL7hnPyfVLIx2Qjd+OzWXV
	 NmMYVPFgO1v6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAB5C5478C;
	Thu, 22 Feb 2024 22:19:20 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 22 Feb 2024 16:19:14 -0600
Subject: [PATCH] powerpc/rtas: use correct function name for resetting TCE
 tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240222-rtas-fix-ibm-reset-pe-dma-window-v1-1-7aaf235ac63c@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAGHI12UC/x2NQQrCUAwFr1Ky9kF/qCheRVx8TdQs+luSYoXSu
 xtcDgwzG4W6adCl28j1Y2FTSyiHjh7v2l4Kk2TinoeemeFLDTztC7uPcA1dMCtkrFitybTiNBx
 Fyjn1Uigzs2vq/8X1tu8/aDe7LnIAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708640360; l=4584;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=BfV+jHCvDs2FuYu/IFjfmREm6RrDgEy35K5MlxEWdgI=;
 b=L7H7lySU0gQuGBEXKqo0Q/wPikh41NbCXKvuCXN33+k+f3PgFytQMTxe2ZgPCy3knnJWZoe1M
 j0Xm7VqmHWuC6tH4TlZZSyRG1smRl2+1W63DLMePalLWYfzZMbtAoFC
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The PAPR spec spells the function name as

  "ibm,reset-pe-dma-windows"

but in practice firmware uses the singular form:

  "ibm,reset-pe-dma-window"

in the device tree. Since we have the wrong spelling in the RTAS
function table, reverse lookups (token -> name) fail and warn:

  unexpected failed lookup for token 86
  WARNING: CPU: 1 PID: 545 at arch/powerpc/kernel/rtas.c:659 __do_enter_rtas_trace+0x2a4/0x2b4
  CPU: 1 PID: 545 Comm: systemd-udevd Not tainted 6.8.0-rc4 #30
  Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NL1060_028) hv:phyp pSeries
  NIP [c0000000000417f0] __do_enter_rtas_trace+0x2a4/0x2b4
  LR [c0000000000417ec] __do_enter_rtas_trace+0x2a0/0x2b4
  Call Trace:
   __do_enter_rtas_trace+0x2a0/0x2b4 (unreliable)
   rtas_call+0x1f8/0x3e0
   enable_ddw.constprop.0+0x4d0/0xc84
   dma_iommu_dma_supported+0xe8/0x24c
   dma_set_mask+0x5c/0xd8
   mlx5_pci_init.constprop.0+0xf0/0x46c [mlx5_core]
   probe_one+0xfc/0x32c [mlx5_core]
   local_pci_probe+0x68/0x12c
   pci_call_probe+0x68/0x1ec
   pci_device_probe+0xbc/0x1a8
   really_probe+0x104/0x570
   __driver_probe_device+0xb8/0x224
   driver_probe_device+0x54/0x130
   __driver_attach+0x158/0x2b0
   bus_for_each_dev+0xa8/0x120
   driver_attach+0x34/0x48
   bus_add_driver+0x174/0x304
   driver_register+0x8c/0x1c4
   __pci_register_driver+0x68/0x7c
   mlx5_init+0xb8/0x118 [mlx5_core]
   do_one_initcall+0x60/0x388
   do_init_module+0x7c/0x2a4
   init_module_from_file+0xb4/0x108
   idempotent_init_module+0x184/0x34c
   sys_finit_module+0x90/0x114

And oopses are possible when lockdep is enabled or the RTAS
tracepoints are active, since those paths dereference the result of
the lookup.

Use the correct spelling to match firmware's behavior, adjusting the
related constants to match.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: Gaurav Batra <gbatra@linux.ibm.com>
Fixes: 8252b88294d2 ("powerpc/rtas: improve function information lookups")
---
 arch/powerpc/include/asm/rtas.h | 4 ++--
 arch/powerpc/kernel/rtas.c      | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 9bb2210c8d44..065ffd1b2f8a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -69,7 +69,7 @@ enum rtas_function_index {
 	RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE,
 	RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2,
 	RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW,
-	RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOWS,
+	RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW,
 	RTAS_FNIDX__IBM_SCAN_LOG_DUMP,
 	RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR,
 	RTAS_FNIDX__IBM_SET_EEH_OPTION,
@@ -164,7 +164,7 @@ typedef struct {
 #define RTAS_FN_IBM_READ_SLOT_RESET_STATE         rtas_fn_handle(RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE)
 #define RTAS_FN_IBM_READ_SLOT_RESET_STATE2        rtas_fn_handle(RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2)
 #define RTAS_FN_IBM_REMOVE_PE_DMA_WINDOW          rtas_fn_handle(RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW)
-#define RTAS_FN_IBM_RESET_PE_DMA_WINDOWS          rtas_fn_handle(RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOWS)
+#define RTAS_FN_IBM_RESET_PE_DMA_WINDOW           rtas_fn_handle(RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW)
 #define RTAS_FN_IBM_SCAN_LOG_DUMP                 rtas_fn_handle(RTAS_FNIDX__IBM_SCAN_LOG_DUMP)
 #define RTAS_FN_IBM_SET_DYNAMIC_INDICATOR         rtas_fn_handle(RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR)
 #define RTAS_FN_IBM_SET_EEH_OPTION                rtas_fn_handle(RTAS_FNIDX__IBM_SET_EEH_OPTION)
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 7e793b503e29..8064d9c3de86 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -375,8 +375,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW] = {
 		.name = "ibm,remove-pe-dma-window",
 	},
-	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOWS] = {
-		.name = "ibm,reset-pe-dma-windows",
+	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW] = {
+		/*
+		 * Note: PAPR+ v2.13 7.3.31.4.1 spells this as
+		 * "ibm,reset-pe-dma-windows" (plural), but RTAS
+		 * implementations use the singular form in practice.
+		 */
+		.name = "ibm,reset-pe-dma-window",
 	},
 	[RTAS_FNIDX__IBM_SCAN_LOG_DUMP] = {
 		.name = "ibm,scan-log-dump",

---
base-commit: b22ea627225b53ec7ce25c19d6df9fa8217d1643
change-id: 20240222-rtas-fix-ibm-reset-pe-dma-window-745dd1824011

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

