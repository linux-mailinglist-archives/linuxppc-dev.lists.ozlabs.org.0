Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A766083A6F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 11:39:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=f5xXN+hf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKgSW3KWnz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 21:39:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=f5xXN+hf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKgRg389pz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 21:38:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1706092735; x=1737628735;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZHAby7cD7PMq0P+q1/GjggviwD+0cQAXXFSp7X8XpCU=;
  b=f5xXN+hf6/bjM9W0c0KXTh55RVXQv4cMofd+16XP0SLsByf3pkjgEh6o
   U+OvVGayNXd4hgsCf14kdS2sKcSADSq+jK/F/WHAARLKxDLLlBNrsjzmN
   1QQ9j4pFBeigBe6ueUI+d+2h/vNS/UoErnMLhb+FYKR2Xr9c1Ki1DNeCI
   e9vU9dRC0qnaDX4NE/P0jecCFtBtBFQ3CLymXI9cVc4GBIHF4mYFMDlDN
   S2JHN/v0PQIyUc3tjKXX5QreDhYoiqmph6MR5n71T+dm+chu4RuybiqxW
   JBqQESR3zcaXWpXauv78NwjvocCiqz/UL/Iig7HW0S1kXt6jgpuKmej+j
   g==;
X-IronPort-AV: E=Sophos;i="6.05,216,1701126000"; 
   d="scan'208";a="35052514"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2024 11:38:49 +0100
Received: from schifferm-ubuntu.tq-net.de (SCHIFFERM-M3.tq-net.de [10.121.49.135])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 159E2280075;
	Wed, 24 Jan 2024 11:38:49 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc/6xx: set High BAT Enable flag on G2_LE cores
Date: Wed, 24 Jan 2024 11:38:38 +0100
Message-ID: <20240124103838.43675-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MMU_FTR_USE_HIGH_BATS is set for G2_LE cores and derivatives like e300cX,
but the high BATs need to be enabled in HID2 to work. Add register
definitions and add the needed setup to __setup_cpu_603.

This fixes boot on CPUs like the MPC5200B with STRICT_KERNEL_RWX enabled
on systems where the flag has not been set by the bootloader already.

Fixes: e4d6654ebe6e ("powerpc/mm/32s: rework mmu_mapin_ram()")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- Use the G2_LE name for cores that have this HID2 register
- Extend __setup_cpu_603 instead of introducing a new setup function


 arch/powerpc/include/asm/reg.h      |  2 ++
 arch/powerpc/kernel/cpu_setup_6xx.S | 20 +++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 4ae4ab9090a2..ade5f094dbd2 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -617,6 +617,8 @@
 #endif
 #define SPRN_HID2	0x3F8		/* Hardware Implementation Register 2 */
 #define SPRN_HID2_GEKKO	0x398		/* Gekko HID2 Register */
+#define SPRN_HID2_G2_LE	0x3F3		/* G2_LE HID2 Register */
+#define  HID2_G2_LE_HBE	(1<<18)		/* High BAT Enable (G2_LE) */
 #define SPRN_IABR	0x3F2	/* Instruction Address Breakpoint Register */
 #define SPRN_IABR2	0x3FA		/* 83xx */
 #define SPRN_IBCR	0x135		/* 83xx Insn Breakpoint Control Reg */
diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/cpu_setup_6xx.S
index f29ce3dd6140..bfd3f442e5eb 100644
--- a/arch/powerpc/kernel/cpu_setup_6xx.S
+++ b/arch/powerpc/kernel/cpu_setup_6xx.S
@@ -26,6 +26,15 @@ BEGIN_FTR_SECTION
 	bl	__init_fpu_registers
 END_FTR_SECTION_IFCLR(CPU_FTR_FPU_UNAVAILABLE)
 	bl	setup_common_caches
+
+	/*
+	 * This assumes that all cores using __setup_cpu_603 with
+	 * MMU_FTR_USE_HIGH_BATS are G2_LE compatible
+	 */
+BEGIN_MMU_FTR_SECTION
+	bl      setup_g2_le_hid2
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
+
 	mtlr	r5
 	blr
 _GLOBAL(__setup_cpu_604)
@@ -115,6 +124,16 @@ SYM_FUNC_START_LOCAL(setup_604_hid0)
 	blr
 SYM_FUNC_END(setup_604_hid0)
 
+/* Enable high BATs for G2_LE and derivatives like e300cX */
+SYM_FUNC_START_LOCAL(setup_g2_le_hid2)
+	mfspr	r11,SPRN_HID2_G2_LE
+	oris	r11,r11,HID2_G2_LE_HBE@h
+	mtspr	SPRN_HID2_G2_LE,r11
+	sync
+	isync
+	blr
+SYM_FUNC_END(setup_g2_le_hid2)
+
 /* 7400 <= rev 2.7 and 7410 rev = 1.0 suffer from some
  * erratas we work around here.
  * Moto MPC710CE.pdf describes them, those are errata
@@ -495,4 +514,3 @@ _GLOBAL(__restore_cpu_setup)
 	mtcr	r7
 	blr
 _ASM_NOKPROBE_SYMBOL(__restore_cpu_setup)
-
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

