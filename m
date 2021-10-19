Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DC432FA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:36:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQXF405bz3fQv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:35:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQQZ6z9zz3dZ7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:31:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPT1bhwz9sSy;
 Tue, 19 Oct 2021 09:30:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpZCWy4vA14R; Tue, 19 Oct 2021 09:30:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP76jrzz9sT5;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D89788B77A;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id geo6tS1kxhkX; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49C4D8B775;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TexR3188474
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:41 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TenP3188473;
 Tue, 19 Oct 2021 09:29:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 19/22] powerpc/kuap: Wire-up KUAP on 40x
Date: Tue, 19 Oct 2021 09:29:30 +0200
Message-Id: <aaefa91897ddc42ac11019dc0e1d1a525bd08e90.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628571; l=2653; s=20211009;
 h=from:subject:message-id; bh=lokrLs3DZDqJaYcqtprZW1ISKkGum5yW6sw3BWrgy7s=;
 b=+QZqSDpvSNmtGimfYAfH/kpLL/FdrUbaLObbbdD+Px9juRcFRY7ppsYvnKwWn1rzi7wGOetm305n
 9AmtxPYqAro3vaOLyuQLK1AYNTLRY3vW0s3Ic8emKPEoJ6G3rF8w
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds KUAP support to 40x. This is done by checking
the content of SPRN_PID at the time user pgtable is loaded.

40x doesn't have KUEP, but KUAP implies KUEP because when the
PID doesn't match the page's PID, the page cannot be read nor
executed.

So KUEP is now automatically selected when KUAP is selected and
disabled when KUAP is disabled.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_40x.S         | 8 ++++++++
 arch/powerpc/mm/nohash/kup.c           | 2 ++
 arch/powerpc/platforms/Kconfig.cputype | 7 +++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 7d72ee5ab387..87d322dbed94 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -297,6 +297,10 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 3:
 	mfspr	r11,SPRN_SPRG_THREAD
 	lwz	r11,PGDIR(r11)
+#ifdef CONFIG_PPC_KUAP
+	rlwinm.	r9, r9, 0, 0xff
+	beq	5f			/* Kuap fault */
+#endif
 4:
 	tophys(r11, r11)
 	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
@@ -377,6 +381,10 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 3:
 	mfspr	r11,SPRN_SPRG_THREAD
 	lwz	r11,PGDIR(r11)
+#ifdef CONFIG_PPC_KUAP
+	rlwinm.	r9, r9, 0, 0xff
+	beq	5f			/* Kuap fault */
+#endif
 4:
 	tophys(r11, r11)
 	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index eaea52231dd6..552becf90e97 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -19,6 +19,8 @@ EXPORT_SYMBOL(disable_kuap_key);
 void setup_kuap(bool disabled)
 {
 	if (disabled) {
+		if (IS_ENABLED(CONFIG_40x))
+			disable_kuep = true;
 		if (smp_processor_id() == boot_cpuid)
 			static_branch_enable(&disable_kuap_key);
 		return;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index e989eeca4c7e..3ea415bcf9b8 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -54,6 +54,9 @@ config 40x
 	select PPC_UDBG_16550
 	select 4xx_SOC
 	select HAVE_PCI
+	select PPC_HAVE_KUAP
+	select PPC_HAVE_KUEP
+	select PPC_KUEP if PPC_KUAP
 
 config 44x
 	bool "AMCC 44x, 46x or 47x"
@@ -401,9 +404,9 @@ config PPC_HAVE_KUEP
 	bool
 
 config PPC_KUEP
-	bool "Kernel Userspace Execution Prevention"
+	bool "Kernel Userspace Execution Prevention" if !40x
 	depends on PPC_HAVE_KUEP
-	default y
+	default y if !40x
 	help
 	  Enable support for Kernel Userspace Execution Prevention (KUEP)
 
-- 
2.31.1

