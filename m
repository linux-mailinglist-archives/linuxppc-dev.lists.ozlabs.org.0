Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7184217B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 11:38:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPM8S4M8Yz3d8d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:38:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPM6R3lpYz3cW5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 21:36:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TPM690vRLz9sp5;
	Tue, 30 Jan 2024 11:36:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RmxGCjSdPIg; Tue, 30 Jan 2024 11:36:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TPM4Y51gtz9vFt;
	Tue, 30 Jan 2024 11:35:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A2FC98B76D;
	Tue, 30 Jan 2024 11:35:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Hkm5tK1ClKmR; Tue, 30 Jan 2024 11:35:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.134])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CC148B763;
	Tue, 30 Jan 2024 11:35:08 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 4/5] mm: ptdump: Have ptdump_check_wx() return bool
Date: Tue, 30 Jan 2024 11:34:35 +0100
Message-ID: <7943149fe955458cb7b57cd483bf41a3aad94684.1706610398.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706610398.git.christophe.leroy@csgroup.eu>
References: <cover.1706610398.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706610876; l=6707; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=FTFidrXgf6G5wpsCm7CSR5IvUV3DEKzEtlamq4cQhnQ=; b=wGNH2T535TYTvUQeSskxrWyrJRXqsGtZy+vQWpWP51v64OntuIFbCp49iBw3ko+SlFf63k3hP IiQrlTOE2mHDM+8Nsn87P/DCk9MOGdm+yeb+NWTiayEcedadB7jEM1c
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
Cc: mark.rutland@arm.com, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, steven.price@arm.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <greg@kroah.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linu
 x-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Have ptdump_check_wx() return true when the check is successful
or false otherwise.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New
---
 arch/arm64/mm/ptdump.c          | 11 ++++++++---
 arch/powerpc/mm/ptdump/ptdump.c | 13 +++++++++----
 arch/riscv/mm/ptdump.c          | 11 ++++++++---
 arch/s390/mm/dump_pagetables.c  | 13 +++++++++----
 arch/x86/include/asm/pgtable.h  |  2 +-
 arch/x86/mm/dump_pagetables.c   | 19 ++++++++++++-------
 include/linux/ptdump.h          |  2 +-
 7 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index e305b6593c4e..696822f75582 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -345,7 +345,7 @@ static struct ptdump_info kernel_ptdump_info = {
 	.base_addr	= PAGE_OFFSET,
 };
 
-void ptdump_check_wx(void)
+bool ptdump_check_wx(void)
 {
 	struct pg_state st = {
 		.seq = NULL,
@@ -366,11 +366,16 @@ void ptdump_check_wx(void)
 
 	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 
-	if (st.wx_pages || st.uxn_pages)
+	if (st.wx_pages || st.uxn_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
 			st.wx_pages, st.uxn_pages);
-	else
+
+		return false;
+	} else {
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
+
+		return true;
+	}
 }
 
 static int __init ptdump_init(void)
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index b835c80371cd..9dc239967b77 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -327,7 +327,7 @@ static void __init build_pgtable_complete_mask(void)
 				pg_level[i].mask |= pg_level[i].flag[j].mask;
 }
 
-void ptdump_check_wx(void)
+bool ptdump_check_wx(void)
 {
 	struct pg_state st = {
 		.seq = NULL,
@@ -344,15 +344,20 @@ void ptdump_check_wx(void)
 	};
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !mmu_has_feature(MMU_FTR_KERNEL_RO))
-		return;
+		return true;
 
 	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 
-	if (st.wx_pages)
+	if (st.wx_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found\n",
 			st.wx_pages);
-	else
+
+		return false;
+	} else {
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
+
+		return true;
+	}
 }
 
 static int __init ptdump_init(void)
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 075265603313..1289cc6d3700 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -335,7 +335,7 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 	ptdump_walk_pgd(&st.ptdump, pinfo->mm, NULL);
 }
 
-void ptdump_check_wx(void)
+bool ptdump_check_wx(void)
 {
 	struct pg_state st = {
 		.seq = NULL,
@@ -356,11 +356,16 @@ void ptdump_check_wx(void)
 
 	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 
-	if (st.wx_pages)
+	if (st.wx_pages) {
 		pr_warn("Checked W+X mappings: failed, %lu W+X pages found\n",
 			st.wx_pages);
-	else
+
+		return false;
+	} else {
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
+
+		return true;
+	}
 }
 
 static int ptdump_show(struct seq_file *m, void *v)
diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index 99da5a5602a8..ffd07ed7b4af 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -192,7 +192,7 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	}
 }
 
-void ptdump_check_wx(void)
+bool ptdump_check_wx(void)
 {
 	struct pg_state st = {
 		.ptdump = {
@@ -215,14 +215,19 @@ void ptdump_check_wx(void)
 	};
 
 	if (!MACHINE_HAS_NX)
-		return;
+		return true;
 	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
-	if (st.wx_pages)
+	if (st.wx_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found\n", st.wx_pages);
-	else
+
+		return false;
+	} else {
 		pr_info("Checked W+X mappings: passed, no %sW+X pages found\n",
 			(nospec_uses_trampoline() || !static_key_enabled(&cpu_has_bear)) ?
 			"unexpected " : "");
+
+		return true;
+	}
 }
 
 #ifdef CONFIG_PTDUMP_DEBUGFS
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 6c979028e521..b50b2ef63672 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -31,7 +31,7 @@ struct seq_file;
 void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm);
 void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
 				   bool user);
-void ptdump_walk_pgd_level_checkwx(void);
+bool ptdump_walk_pgd_level_checkwx(void);
 #define ptdump_check_wx ptdump_walk_pgd_level_checkwx
 void ptdump_walk_user_pgd_level_checkwx(void);
 
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 0008524eebe9..c58c01f560fd 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -362,7 +362,7 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	}
 }
 
-static void ptdump_walk_pgd_level_core(struct seq_file *m,
+bool void ptdump_walk_pgd_level_core(struct seq_file *m,
 				       struct mm_struct *mm, pgd_t *pgd,
 				       bool checkwx, bool dmesg)
 {
@@ -391,12 +391,17 @@ static void ptdump_walk_pgd_level_core(struct seq_file *m,
 	ptdump_walk_pgd(&st.ptdump, mm, pgd);
 
 	if (!checkwx)
-		return;
-	if (st.wx_pages)
+		return true;
+	if (st.wx_pages) {
 		pr_info("x86/mm: Checked W+X mappings: FAILED, %lu W+X pages found.\n",
 			st.wx_pages);
-	else
+
+		return false;
+	} else {
 		pr_info("x86/mm: Checked W+X mappings: passed, no W+X pages found.\n");
+
+		return true;
+	}
 }
 
 void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm)
@@ -431,12 +436,12 @@ void ptdump_walk_user_pgd_level_checkwx(void)
 #endif
 }
 
-void ptdump_walk_pgd_level_checkwx(void)
+bool ptdump_walk_pgd_level_checkwx(void)
 {
 	if (!(__supported_pte_mask & _PAGE_NX))
-		return;
+		return true;
 
-	ptdump_walk_pgd_level_core(NULL, &init_mm, INIT_PGD, true, false);
+	return ptdump_walk_pgd_level_core(NULL, &init_mm, INIT_PGD, true, false);
 }
 
 static int __init pt_dump_init(void)
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index c10513739bf9..953b61696ccf 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -19,7 +19,7 @@ struct ptdump_state {
 };
 
 void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd);
-void ptdump_check_wx(void);
+bool ptdump_check_wx(void);
 
 static inline void debug_checkwx(void)
 {
-- 
2.43.0

