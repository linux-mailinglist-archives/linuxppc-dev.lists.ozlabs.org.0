Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE0106510
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 07:22:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K5tn12S7zDq63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 17:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z6VCLKNs"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5Cg0ZMMzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 16:51:43 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3DFE2071F;
 Fri, 22 Nov 2019 05:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401900;
 bh=/Zi2JJggweyWVP5NRpyxetgFN/YDU6F1gRDEuuhs4u8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z6VCLKNs0o/KiQxK3R1jRksqGfCJGvTS/khvJtN4YveFw09W8EXXDTlPBpkjkrEON
 RMcpxqOLuRiUIYHqgvBw9tEfnwgF9bpt9SK+jupRMv/d39B5iBaAUpFKpF9nDwTuZb
 PP34r20eWszbT7xcdYPAtyAGzP/QZc/ItudNKYfg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 132/219] powerpc/83xx: handle machine check
 caused by watchdog timer
Date: Fri, 22 Nov 2019 00:47:44 -0500
Message-Id: <20191122054911.1750-125-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

[ Upstream commit 0deae39cec6dab3a66794f3e9e83ca4dc30080f1 ]

When the watchdog timer is set in interrupt mode, it causes a
machine check when it times out. The purpose of this mode is to
ease debugging, not to crash the kernel and reboot the machine.

This patch implements a special handling for that, in order to not
crash the kernel if the watchdog times out while in interrupt or
within the idle task.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
[scottwood: added missing #include]
Signed-off-by: Scott Wood <oss@buserror.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/cputable.h |  1 +
 arch/powerpc/include/asm/reg.h      |  2 ++
 arch/powerpc/kernel/cputable.c      | 10 ++++++----
 arch/powerpc/platforms/83xx/misc.c  | 17 +++++++++++++++++
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 3ce690e5f345c..59b35b93eadec 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -44,6 +44,7 @@ extern int machine_check_e500(struct pt_regs *regs);
 extern int machine_check_e200(struct pt_regs *regs);
 extern int machine_check_47x(struct pt_regs *regs);
 int machine_check_8xx(struct pt_regs *regs);
+int machine_check_83xx(struct pt_regs *regs);
 
 extern void cpu_down_flush_e500v2(void);
 extern void cpu_down_flush_e500mc(void);
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 640a4d818772a..af99716615122 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -768,6 +768,8 @@
 #define   SRR1_PROGTRAP		0x00020000 /* Trap */
 #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
 
+#define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interrupt */
+
 #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
 #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
 #define   HSRR1_DENORM		0x00100000 /* Denorm exception */
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 2da01340c84c3..1eab54bc6ee93 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1141,6 +1141,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc603",
 	},
+#ifdef CONFIG_PPC_83xx
 	{	/* e300c1 (a 603e core, plus some) on 83xx */
 		.pvr_mask		= 0x7fff0000,
 		.pvr_value		= 0x00830000,
@@ -1151,7 +1152,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_83xx,
 		.platform		= "ppc603",
 	},
 	{	/* e300c2 (an e300c1 core, plus some, minus FPU) on 83xx */
@@ -1165,7 +1166,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_83xx,
 		.platform		= "ppc603",
 	},
 	{	/* e300c3 (e300c1, plus one IU, half cache size) on 83xx */
@@ -1179,7 +1180,7 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e300",
 		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
@@ -1196,12 +1197,13 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 32,
 		.dcache_bsize		= 32,
 		.cpu_setup		= __setup_cpu_603,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e300",
 		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.platform		= "ppc603",
 	},
+#endif
 	{	/* default match, we assume split I/D cache & TB (non-601)... */
 		.pvr_mask		= 0x00000000,
 		.pvr_value		= 0x00000000,
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index d75c9816a5c92..2b6589fe812dd 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -14,6 +14,7 @@
 #include <linux/of_platform.h>
 #include <linux/pci.h>
 
+#include <asm/debug.h>
 #include <asm/io.h>
 #include <asm/hw_irq.h>
 #include <asm/ipic.h>
@@ -150,3 +151,19 @@ void __init mpc83xx_setup_arch(void)
 
 	mpc83xx_setup_pci();
 }
+
+int machine_check_83xx(struct pt_regs *regs)
+{
+	u32 mask = 1 << (31 - IPIC_MCP_WDT);
+
+	if (!(regs->msr & SRR1_MCE_MCP) || !(ipic_get_mcp_status() & mask))
+		return machine_check_generic(regs);
+	ipic_clear_mcp_status(mask);
+
+	if (debugger_fault_handler(regs))
+		return 1;
+
+	die("Watchdog NMI Reset", regs, 0);
+
+	return 1;
+}
-- 
2.20.1

