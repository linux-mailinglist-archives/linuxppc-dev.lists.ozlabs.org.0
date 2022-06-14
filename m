Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263F54AE65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 12:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMlD1658Xz3dvm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 20:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMlBp0wftz3bsk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 20:33:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LMlBY4xxqz9tNV;
	Tue, 14 Jun 2022 12:32:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 739G6TW791JM; Tue, 14 Jun 2022 12:32:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LMlBW0LqHz9tNb;
	Tue, 14 Jun 2022 12:32:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB258B766;
	Tue, 14 Jun 2022 12:32:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kBMfXW1hW2PA; Tue, 14 Jun 2022 12:32:50 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8901D8B763;
	Tue, 14 Jun 2022 12:32:50 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25EAWadQ197829
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 12:32:36 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25EAWXIO197826;
	Tue, 14 Jun 2022 12:32:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc/32: Remove the 'nobats' kernel parameter
Date: Tue, 14 Jun 2022 12:32:23 +0200
Message-Id: <6977314c823cfb728bc0273cea634b41807bfb64.1655202721.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655202743; l=3841; s=20211009; h=from:subject:message-id; bh=IiaF52/FDSDDBtd97L//SRzTyeW6WkyJUVTUP66wmv0=; b=/ykhu+crlrXjZrZ3viYs2Rbz6JWrH9qomYmJt7dM6AaRcP4jDWyUo7GRZoqQRNRwL74IWPkFFcuL Ny2WqnexBIZ1paRBSuXmTMi3U42pNBZCKMvufm6FpacgjSGujI40
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mapping without BATs doesn't bring any added value to the user.

Remove that option.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ---
 arch/powerpc/mm/book3s32/mmu.c                  |  2 +-
 arch/powerpc/mm/init_32.c                       | 11 -----------
 arch/powerpc/mm/mmu_decl.h                      |  1 -
 arch/powerpc/platforms/83xx/misc.c              | 14 ++++++--------
 5 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8090130b544b..96de3f1ece00 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3495,9 +3495,6 @@
 
 	noautogroup	Disable scheduler automatic task group creation.
 
-	nobats		[PPC] Do not use BATs for mapping kernel lowmem
-			on "Classic" PPC cores.
-
 	nocache		[ARM]
 
 	nodsp		[SH] Disable hardware DSP at boot time.
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 49a737fbbd18..1794132db31e 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -161,7 +161,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
 
 
-	if (debug_pagealloc_enabled_or_kfence() || __map_without_bats) {
+	if (debug_pagealloc_enabled_or_kfence()) {
 		pr_debug_once("Read-Write memory mapped without BATs\n");
 		if (base >= border)
 			return base;
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 693a3a7a9463..321794747ea1 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -69,12 +69,6 @@ EXPORT_SYMBOL(agp_special_page);
 
 void MMU_init(void);
 
-/*
- * this tells the system to map all of ram with the segregs
- * (i.e. page tables) instead of the bats.
- * -- Cort
- */
-int __map_without_bats;
 int __map_without_ltlbs;
 
 /* max amount of low RAM to map in */
@@ -85,11 +79,6 @@ unsigned long __max_low_memory = MAX_LOW_MEM;
  */
 static void __init MMU_setup(void)
 {
-	/* Check for nobats option (used in mapin_ram). */
-	if (strstr(boot_command_line, "nobats")) {
-		__map_without_bats = 1;
-	}
-
 	if (strstr(boot_command_line, "noltlbs")) {
 		__map_without_ltlbs = 1;
 	}
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 63c4b1a4d435..229c72e49198 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -92,7 +92,6 @@ extern void mapin_ram(void);
 extern void setbat(int index, unsigned long virt, phys_addr_t phys,
 		   unsigned int size, pgprot_t prot);
 
-extern int __map_without_bats;
 extern unsigned int rtas_data, rtas_size;
 
 struct hash_pte;
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 3285dabcf923..2fb2a85d131f 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -121,17 +121,15 @@ void __init mpc83xx_setup_pci(void)
 
 void __init mpc83xx_setup_arch(void)
 {
+	phys_addr_t immrbase = get_immrbase();
+	int immrsize = IS_ALIGNED(immrbase, SZ_2M) ? SZ_2M : SZ_1M;
+	unsigned long va = fix_to_virt(FIX_IMMR_BASE);
+
 	if (ppc_md.progress)
 		ppc_md.progress("mpc83xx_setup_arch()", 0);
 
-	if (!__map_without_bats) {
-		phys_addr_t immrbase = get_immrbase();
-		int immrsize = IS_ALIGNED(immrbase, SZ_2M) ? SZ_2M : SZ_1M;
-		unsigned long va = fix_to_virt(FIX_IMMR_BASE);
-
-		setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
-		update_bats();
-	}
+	setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
+	update_bats();
 }
 
 int machine_check_83xx(struct pt_regs *regs)
-- 
2.36.1

