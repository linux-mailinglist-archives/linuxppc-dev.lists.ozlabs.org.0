Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B07ADF2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWwY4WFhz3hbw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWhZ5Fdcz3dVF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgP2zhyz9tlk;
	Mon, 25 Sep 2023 20:32:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyCSMTZh-3Qo; Mon, 25 Sep 2023 20:32:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg51s0Kz9v8B;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B2DE8B763;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZkekK_SlgARD; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A0BC8B78C;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVZNv1499228
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:35 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVZT31499227;
	Mon, 25 Sep 2023 20:31:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 24/37] powerpc: Rely on address instead of pte_user()
Date: Mon, 25 Sep 2023 20:31:38 +0200
Message-ID: <c778dad89fad07727c31717a9c62f45357c29ebc.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666675; l=6826; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AG/C1wK4MgYRRJL1LBTuq/tg9aJmNrUXNeX46APsBrs=; b=7AXFVSitzYUSzUC90v1Ln68vJ1sBzKXZAqD1n4fere9XxzSE6HGOdk6TY70KTosm8DRwmdYY2 E60cZe0Uw90DcY96vaZCbFVo95QjdNagUvnSeVFkk+rWnO9qAZ+hH9O
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

pte_user() may return 'false' when a user page is PAGE_NONE.

In that case it is still a user page and needs to be handled
as such. So use is_kernel_addr() instead.

And remove "user" text from ptdump as ptdump only dumps
kernel tables.

Note: no change done for book3s/64 which still has it
'priviledge' bit.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/pgtable.h |  2 +-
 arch/powerpc/mm/book3s32/mmu.c            |  4 ++--
 arch/powerpc/mm/nohash/e500.c             |  2 +-
 arch/powerpc/mm/pgtable.c                 | 22 +++++++++++-----------
 arch/powerpc/mm/ptdump/8xx.c              |  5 -----
 arch/powerpc/mm/ptdump/shared.c           |  5 -----
 6 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 9619beae4454..200f2dbf48e2 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -58,7 +58,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 
 	*p = __pte(new);
 
-	if (IS_ENABLED(CONFIG_44x) && (old & _PAGE_USER) && (old & _PAGE_EXEC))
+	if (IS_ENABLED(CONFIG_44x) && !is_kernel_addr(addr) && (old & _PAGE_EXEC))
 		icache_44x_need_flush = 1;
 
 	/* huge pages use the old page table lock */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 850783cfa9c7..d1041c946ce2 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -127,7 +127,7 @@ static void setibat(int index, unsigned long virt, phys_addr_t phys,
 	wimgxpp = (flags & _PAGE_COHERENT) | (_PAGE_EXEC ? BPP_RX : BPP_XX);
 	bat[0].batu = virt | (bl << 2) | 2; /* Vs=1, Vp=0 */
 	bat[0].batl = BAT_PHYS_ADDR(phys) | wimgxpp;
-	if (flags & _PAGE_USER)
+	if (!is_kernel_addr(virt))
 		bat[0].batu |= 1;	/* Vp = 1 */
 }
 
@@ -280,7 +280,7 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 	wimgxpp |= (flags & _PAGE_RW)? BPP_RW: BPP_RX;
 	bat[1].batu = virt | (bl << 2) | 2; /* Vs=1, Vp=0 */
 	bat[1].batl = BAT_PHYS_ADDR(phys) | wimgxpp;
-	if (flags & _PAGE_USER)
+	if (!is_kernel_addr(virt))
 		bat[1].batu |= 1; 	/* Vp = 1 */
 	if (flags & _PAGE_GUARDED) {
 		/* G bit must be zero in IBATs */
diff --git a/arch/powerpc/mm/nohash/e500.c b/arch/powerpc/mm/nohash/e500.c
index 40a4e69ae1a9..5b7d7a932bfd 100644
--- a/arch/powerpc/mm/nohash/e500.c
+++ b/arch/powerpc/mm/nohash/e500.c
@@ -122,7 +122,7 @@ static void settlbcam(int index, unsigned long virt, phys_addr_t phys,
 		TLBCAM[index].MAS7 = (u64)phys >> 32;
 
 	/* Below is unlikely -- only for large user pages or similar */
-	if (pte_user(__pte(flags))) {
+	if (!is_kernel_addr(virt)) {
 		TLBCAM[index].MAS3 |= MAS3_UR;
 		TLBCAM[index].MAS3 |= (flags & _PAGE_EXEC) ? MAS3_UX : 0;
 		TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_UW : 0;
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3f86fd217690..781a68c69c2f 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -46,13 +46,13 @@ static inline int is_exec_fault(void)
  * and we avoid _PAGE_SPECIAL and cache inhibited pte. We also only do that
  * on userspace PTEs
  */
-static inline int pte_looks_normal(pte_t pte)
+static inline int pte_looks_normal(pte_t pte, unsigned long addr)
 {
 
 	if (pte_present(pte) && !pte_special(pte)) {
 		if (pte_ci(pte))
 			return 0;
-		if (pte_user(pte))
+		if (!is_kernel_addr(addr))
 			return 1;
 	}
 	return 0;
@@ -79,11 +79,11 @@ static struct folio *maybe_pte_to_folio(pte_t pte)
  * support falls into the same category.
  */
 
-static pte_t set_pte_filter_hash(pte_t pte)
+static pte_t set_pte_filter_hash(pte_t pte, unsigned long addr)
 {
 	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
-	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
-				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
+	if (pte_looks_normal(pte, addr) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
+					     cpu_has_feature(CPU_FTR_NOEXECUTE))) {
 		struct folio *folio = maybe_pte_to_folio(pte);
 		if (!folio)
 			return pte;
@@ -97,7 +97,7 @@ static pte_t set_pte_filter_hash(pte_t pte)
 
 #else /* CONFIG_PPC_BOOK3S */
 
-static pte_t set_pte_filter_hash(pte_t pte) { return pte; }
+static pte_t set_pte_filter_hash(pte_t pte, unsigned long addr) { return pte; }
 
 #endif /* CONFIG_PPC_BOOK3S */
 
@@ -105,7 +105,7 @@ static pte_t set_pte_filter_hash(pte_t pte) { return pte; }
  * as we don't have two bits to spare for _PAGE_EXEC and _PAGE_HWEXEC so
  * instead we "filter out" the exec permission for non clean pages.
  */
-static inline pte_t set_pte_filter(pte_t pte)
+static inline pte_t set_pte_filter(pte_t pte, unsigned long addr)
 {
 	struct folio *folio;
 
@@ -113,10 +113,10 @@ static inline pte_t set_pte_filter(pte_t pte)
 		return pte;
 
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
-		return set_pte_filter_hash(pte);
+		return set_pte_filter_hash(pte, addr);
 
 	/* No exec permission in the first place, move on */
-	if (!pte_exec(pte) || !pte_looks_normal(pte))
+	if (!pte_exec(pte) || !pte_looks_normal(pte, addr))
 		return pte;
 
 	/* If you set _PAGE_EXEC on weird pages you're on your own */
@@ -200,7 +200,7 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	 * this context might not have been activated yet when this
 	 * is called.
 	 */
-	pte = set_pte_filter(pte);
+	pte = set_pte_filter(pte, addr);
 
 	/* Perform the setting of the PTE */
 	arch_enter_lazy_mmu_mode();
@@ -301,7 +301,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
 	 */
 	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
-	pte = set_pte_filter(pte);
+	pte = set_pte_filter(pte, addr);
 
 	val = pte_val(pte);
 
diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index fac932eb8f9a..b5c79b11ea3c 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -20,11 +20,6 @@ static const struct flag_info flag_array[] = {
 #endif
 		.set	= "huge",
 		.clear	= "    ",
-	}, {
-		.mask	= _PAGE_SH,
-		.val	= 0,
-		.set	= "user",
-		.clear	= "    ",
 	}, {
 		.mask	= _PAGE_RO | _PAGE_NA,
 		.val	= 0,
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index f884760ca5cf..5ff101654c45 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -11,11 +11,6 @@
 
 static const struct flag_info flag_array[] = {
 	{
-		.mask	= _PAGE_USER,
-		.val	= _PAGE_USER,
-		.set	= "user",
-		.clear	= "    ",
-	}, {
 		.mask	= _PAGE_RW,
 		.val	= 0,
 		.set	= "r ",
-- 
2.41.0

