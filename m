Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBED8285E5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 13:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8VKC0djVz3dVw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 23:16:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8VHf17Ttz3bXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 23:15:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4T8VHT5y4Kz9v6s;
	Tue,  9 Jan 2024 13:15:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MdGbzyeBSEE; Tue,  9 Jan 2024 13:15:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4T8VHT4pzsz9v2V;
	Tue,  9 Jan 2024 13:15:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BC028B77D;
	Tue,  9 Jan 2024 13:15:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uBzJP-3JQq-L; Tue,  9 Jan 2024 13:15:01 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.126])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 053088B77E;
	Tue,  9 Jan 2024 13:14:59 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linux-hardening@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH 2/4] arm64, powerpc, riscv, s390, x86: Refactor CONFIG_DEBUG_WX
Date: Tue,  9 Jan 2024 13:14:36 +0100
Message-ID: <b1e2171587806648500fd305918bc7e90abdeeb5.1704800524.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1704800524.git.christophe.leroy@csgroup.eu>
References: <cover.1704800524.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704802473; l=11315; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/7r2fv5UgWErZwlk5FNzmu53iFGklb0c7kTSXPgGEHM=; b=01YQqBwyJGJIDGN7KSgjPDE5jKTdPTeM7uAcHq541R/m2p25Tc/MpyxpccE0H4QHv8KYbJfkg EJojygb2mj9BPwL+zk+tkKOnjeyHzNiyrBGrSuwP4HGM+3QWJJwAGnV
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
Cc: mark.rutland@arm.com, linux-s390@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>, Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org, steven.price@arm.com, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All architectures using the core ptdump functionality also implement
CONFIG_DEBUG_WX, and they all do it more or less the same way, with a
function called debug_checkwx() that is called by mark_rodata_ro(),
which is a substitute to ptdump_check_wx() when CONFIG_DEBUG_WX is
set and a no-op otherwise.

Refactor by centraly defining debug_checkwx() in linux/ptdump.h and
call debug_checkwx() immediately after calling mark_rodata_ro()
instead of calling it at the end of every mark_rodata_ro().

On x86_32, mark_rodata_ro() first checks __supported_pte_mask has
_PAGE_NX before calling debug_checkwx(). Now the check is inside the
callee ptdump_walk_pgd_level_checkwx().

On powerpc_64, mark_rodata_ro() bails out early before calling
ptdump_check_wx() when the MMU doesn't have KERNEL_RO feature. The
check is now also done in ptdump_check_wx() as it is called outside
mark_rodata_ro().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/arm64/include/asm/ptdump.h |  7 -------
 arch/arm64/mm/mmu.c             |  2 --
 arch/powerpc/mm/mmu_decl.h      |  6 ------
 arch/powerpc/mm/pgtable_32.c    |  4 ----
 arch/powerpc/mm/pgtable_64.c    |  3 ---
 arch/powerpc/mm/ptdump/ptdump.c |  3 +++
 arch/riscv/include/asm/ptdump.h | 22 ----------------------
 arch/riscv/mm/init.c            |  3 ---
 arch/riscv/mm/ptdump.c          |  1 -
 arch/s390/include/asm/ptdump.h  | 14 --------------
 arch/s390/mm/dump_pagetables.c  |  1 -
 arch/s390/mm/init.c             |  2 --
 arch/x86/include/asm/pgtable.h  |  3 +--
 arch/x86/mm/dump_pagetables.c   |  3 +++
 arch/x86/mm/init_32.c           |  2 --
 arch/x86/mm/init_64.c           |  2 --
 include/linux/ptdump.h          |  7 +++++++
 init/main.c                     |  2 ++
 18 files changed, 16 insertions(+), 71 deletions(-)
 delete mode 100644 arch/riscv/include/asm/ptdump.h
 delete mode 100644 arch/s390/include/asm/ptdump.h

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 581caac525b0..5b1701c76d1c 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -29,13 +29,6 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
 static inline void ptdump_debugfs_register(struct ptdump_info *info,
 					   const char *name) { }
 #endif
-void ptdump_check_wx(void);
 #endif /* CONFIG_PTDUMP_CORE */
 
-#ifdef CONFIG_DEBUG_WX
-#define debug_checkwx()	ptdump_check_wx()
-#else
-#define debug_checkwx()	do { } while (0)
-#endif
-
 #endif /* __ASM_PTDUMP_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 15f6347d23b6..e011beb2e5e3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -635,8 +635,6 @@ void mark_rodata_ro(void)
 	section_size = (unsigned long)__init_begin - (unsigned long)__start_rodata;
 	update_mapping_prot(__pa_symbol(__start_rodata), (unsigned long)__start_rodata,
 			    section_size, PAGE_KERNEL_RO);
-
-	debug_checkwx();
 }
 
 static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 72341b9fb552..90dcc2844056 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -171,12 +171,6 @@ static inline void mmu_mark_rodata_ro(void) { }
 void __init mmu_mapin_immr(void);
 #endif
 
-#ifdef CONFIG_DEBUG_WX
-void ptdump_check_wx(void);
-#else
-static inline void ptdump_check_wx(void) { }
-#endif
-
 static inline bool debug_pagealloc_enabled_or_kfence(void)
 {
 	return IS_ENABLED(CONFIG_KFENCE) || debug_pagealloc_enabled();
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5c02fd08d61e..12498017da8e 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -153,7 +153,6 @@ void mark_rodata_ro(void)
 
 	if (v_block_mapped((unsigned long)_stext + 1)) {
 		mmu_mark_rodata_ro();
-		ptdump_check_wx();
 		return;
 	}
 
@@ -166,9 +165,6 @@ void mark_rodata_ro(void)
 		   PFN_DOWN((unsigned long)_stext);
 
 	set_memory_ro((unsigned long)_stext, numpages);
-
-	// mark_initmem_nx() should have already run by now
-	ptdump_check_wx();
 }
 #endif
 
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 5ac1fd30341b..1b366526f4f2 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -150,9 +150,6 @@ void mark_rodata_ro(void)
 		radix__mark_rodata_ro();
 	else
 		hash__mark_rodata_ro();
-
-	// mark_initmem_nx() should have already run by now
-	ptdump_check_wx();
 }
 
 void mark_initmem_nx(void)
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 2313053fe679..620d4917ebe8 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -343,6 +343,9 @@ void ptdump_check_wx(void)
 		}
 	};
 
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !mmu_has_feature(MMU_FTR_KERNEL_RO))
+		return;
+
 	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 
 	if (st.wx_pages)
diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
deleted file mode 100644
index 3c9ea6dd5af7..000000000000
--- a/arch/riscv/include/asm/ptdump.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2019 SiFive
- */
-
-#ifndef _ASM_RISCV_PTDUMP_H
-#define _ASM_RISCV_PTDUMP_H
-
-void ptdump_check_wx(void);
-
-#ifdef CONFIG_DEBUG_WX
-static inline void debug_checkwx(void)
-{
-	ptdump_check_wx();
-}
-#else
-static inline void debug_checkwx(void)
-{
-}
-#endif
-
-#endif /* _ASM_RISCV_PTDUMP_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2e011cbddf3a..55c4deb1b332 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -29,7 +29,6 @@
 #include <asm/io.h>
 #include <asm/numa.h>
 #include <asm/pgtable.h>
-#include <asm/ptdump.h>
 #include <asm/sections.h>
 #include <asm/soc.h>
 #include <asm/tlbflush.h>
@@ -720,8 +719,6 @@ void mark_rodata_ro(void)
 	if (IS_ENABLED(CONFIG_64BIT))
 		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
 				  set_memory_ro);
-
-	debug_checkwx();
 }
 #else
 static __init pgprot_t pgprot_from_va(uintptr_t va)
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 657c27bc07a7..075265603313 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -9,7 +9,6 @@
 #include <linux/seq_file.h>
 #include <linux/ptdump.h>
 
-#include <asm/ptdump.h>
 #include <linux/pgtable.h>
 #include <asm/kasan.h>
 
diff --git a/arch/s390/include/asm/ptdump.h b/arch/s390/include/asm/ptdump.h
deleted file mode 100644
index f960b2896606..000000000000
--- a/arch/s390/include/asm/ptdump.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_S390_PTDUMP_H
-#define _ASM_S390_PTDUMP_H
-
-void ptdump_check_wx(void);
-
-static inline void debug_checkwx(void)
-{
-	if (IS_ENABLED(CONFIG_DEBUG_WX))
-		ptdump_check_wx();
-}
-
-#endif /* _ASM_S390_PTDUMP_H */
diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index d37a8f607b71..8dcb4e0c71bd 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -6,7 +6,6 @@
 #include <linux/mm.h>
 #include <linux/kfence.h>
 #include <linux/kasan.h>
-#include <asm/ptdump.h>
 #include <asm/kasan.h>
 #include <asm/abs_lowcore.h>
 #include <asm/nospec-branch.h>
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 43e612bc2bcd..d2e5eff9d1de 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -37,7 +37,6 @@
 #include <asm/pgalloc.h>
 #include <asm/ctlreg.h>
 #include <asm/kfence.h>
-#include <asm/ptdump.h>
 #include <asm/dma.h>
 #include <asm/abs_lowcore.h>
 #include <asm/tlb.h>
@@ -109,7 +108,6 @@ void mark_rodata_ro(void)
 
 	__set_memory_ro(__start_ro_after_init, __end_ro_after_init);
 	pr_info("Write protected read-only-after-init data: %luk\n", size >> 10);
-	debug_checkwx();
 }
 
 int set_memory_encrypted(unsigned long vaddr, int numpages)
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 57bab91bbf50..036ce63f3b95 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -32,6 +32,7 @@ void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm);
 void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
 				   bool user);
 void ptdump_walk_pgd_level_checkwx(void);
+#define ptdump_check_wx() ptdump_walk_pgd_level_checkwx()
 void ptdump_walk_user_pgd_level_checkwx(void);
 
 /*
@@ -41,10 +42,8 @@ void ptdump_walk_user_pgd_level_checkwx(void);
 #define pgprot_decrypted(prot)	__pgprot(cc_mkdec(pgprot_val(prot)))
 
 #ifdef CONFIG_DEBUG_WX
-#define debug_checkwx()		ptdump_walk_pgd_level_checkwx()
 #define debug_checkwx_user()	ptdump_walk_user_pgd_level_checkwx()
 #else
-#define debug_checkwx()		do { } while (0)
 #define debug_checkwx_user()	do { } while (0)
 #endif
 
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index e1b599ecbbc2..0008524eebe9 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -433,6 +433,9 @@ void ptdump_walk_user_pgd_level_checkwx(void)
 
 void ptdump_walk_pgd_level_checkwx(void)
 {
+	if (!(__supported_pte_mask & _PAGE_NX))
+		return;
+
 	ptdump_walk_pgd_level_core(NULL, &init_mm, INIT_PGD, true, false);
 }
 
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index b63403d7179d..5c736b707cae 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -800,6 +800,4 @@ void mark_rodata_ro(void)
 	set_pages_ro(virt_to_page(start), size >> PAGE_SHIFT);
 #endif
 	mark_nxdata_nx();
-	if (__supported_pte_mask & _PAGE_NX)
-		debug_checkwx();
 }
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a190aae8ceaf..16e248769338 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1412,8 +1412,6 @@ void mark_rodata_ro(void)
 				(void *)text_end, (void *)rodata_start);
 	free_kernel_image_pages("unused kernel image (rodata/data gap)",
 				(void *)rodata_end, (void *)_sdata);
-
-	debug_checkwx();
 }
 
 /*
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index 2a3a95586425..c10513739bf9 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -19,5 +19,12 @@ struct ptdump_state {
 };
 
 void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd);
+void ptdump_check_wx(void);
+
+static inline void debug_checkwx(void)
+{
+	if (IS_ENABLED(CONFIG_DEBUG_WX))
+		ptdump_check_wx();
+}
 
 #endif /* _LINUX_PTDUMP_H */
diff --git a/init/main.c b/init/main.c
index e24b0780fdff..749a9f8d2c9b 100644
--- a/init/main.c
+++ b/init/main.c
@@ -99,6 +99,7 @@
 #include <linux/init_syscalls.h>
 #include <linux/stackdepot.h>
 #include <linux/randomize_kstack.h>
+#include <linux/ptdump.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1408,6 +1409,7 @@ static void mark_readonly(void)
 		 */
 		rcu_barrier();
 		mark_rodata_ro();
+		debug_checkwx();
 		rodata_test();
 	} else
 		pr_info("Kernel memory protection disabled.\n");
-- 
2.41.0

