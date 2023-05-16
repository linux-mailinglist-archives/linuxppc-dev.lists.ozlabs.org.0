Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F57705828
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 21:59:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLRsK3cRQz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 05:59:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BOqU+Ti0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BOqU+Ti0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLRrT4BRhz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 05:58:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A094462CEE;
	Tue, 16 May 2023 19:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB60C433AA;
	Tue, 16 May 2023 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684267126;
	bh=xc18BzdyEBvkv9q714vehn9HK+Lcx4FXD845Ti/vhSs=;
	h=From:To:Cc:Subject:Date:From;
	b=BOqU+Ti0UooqqPQiNy+cEs7ojWA6srPcBXzScAld2/LM/flNge0wEJQ1IDViuzpk8
	 JFqXrVUteaLPL3MK4aUhli2xC3CY0v65zf/k2y9AB7g3Uui7Ri+9R1k0Y3YSFQbrkY
	 rXn4S2QZwF850darHW8kivTUZPDgtYyYAH2jCchPbbvn5SFWjbMySlgk/ZpkjxLwOT
	 dZRw3AboHiPlHtskv9wpSENZDBYKiq21KCJK1q3VxEVbJ3numV5C0ebXww9nU4qP3O
	 63KmTxzjAarWjUokVC72OOBrS5hxQAcQBUCEk89HPrQZJsIfTywAE+H1VKKSqagjVX
	 smEY2U2R/5+gg==
From: Arnd Bergmann <arnd@kernel.org>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Subject: [PATCH] procfs: consolidate arch_report_meminfo declaration
Date: Tue, 16 May 2023 21:57:29 +0200
Message-Id: <20230516195834.551901-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The arch_report_meminfo() function is provided by four architectures,
with a __weak fallback in procfs itself. On architectures that don't
have a custom version, the __weak version causes a warning because
of the missing prototype.

Remove the architecture specific prototypes and instead add one
in linux/proc_fs.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/asm/pgtable.h    | 3 ---
 arch/powerpc/include/asm/pgtable.h   | 3 ---
 arch/s390/include/asm/pgtable.h      | 3 ---
 arch/s390/mm/pageattr.c              | 1 +
 arch/x86/include/asm/pgtable.h       | 1 +
 arch/x86/include/asm/pgtable_types.h | 3 ---
 arch/x86/mm/pat/set_memory.c         | 1 +
 include/linux/proc_fs.h              | 2 ++
 8 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index e715df5385d6..5656395c95ee 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -472,9 +472,6 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
 
-struct seq_file;
-extern void arch_report_meminfo(struct seq_file *m);
-
 #endif /* !__ASSEMBLY__ */
 
 
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 9972626ddaf6..6a88bfdaa69b 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -165,9 +165,6 @@ static inline bool is_ioremap_addr(const void *x)
 
 	return addr >= IOREMAP_BASE && addr < IOREMAP_END;
 }
-
-struct seq_file;
-void arch_report_meminfo(struct seq_file *m);
 #endif /* CONFIG_PPC64 */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 6822a11c2c8a..c55f3c3365af 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -42,9 +42,6 @@ static inline void update_page_count(int level, long count)
 		atomic_long_add(count, &direct_pages_count[level]);
 }
 
-struct seq_file;
-void arch_report_meminfo(struct seq_file *m);
-
 /*
  * The S390 doesn't have any external MMU info: the kernel page
  * tables contain all the necessary information.
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 5ba3bd8a7b12..ca5a418c58a8 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -4,6 +4,7 @@
  * Author(s): Jan Glauber <jang@linux.vnet.ibm.com>
  */
 #include <linux/hugetlb.h>
+#include <linux/proc_fs.h>
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 15ae4d6ba476..5700bb337987 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -27,6 +27,7 @@
 extern pgd_t early_top_pgt[PTRS_PER_PGD];
 bool __init __early_make_pgtable(unsigned long address, pmdval_t pmd);
 
+struct seq_file;
 void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm);
 void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
 				   bool user);
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 447d4bee25c4..ba3e2554799a 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -513,9 +513,6 @@ extern void native_pagetable_init(void);
 #define native_pagetable_init        paging_init
 #endif
 
-struct seq_file;
-extern void arch_report_meminfo(struct seq_file *m);
-
 enum pg_level {
 	PG_LEVEL_NONE,
 	PG_LEVEL_4K,
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 7159cf787613..d1515756e369 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -9,6 +9,7 @@
 #include <linux/mm.h>
 #include <linux/interrupt.h>
 #include <linux/seq_file.h>
+#include <linux/proc_fs.h>
 #include <linux/debugfs.h>
 #include <linux/pfn.h>
 #include <linux/percpu.h>
diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
index 0260f5ea98fe..e981ef830252 100644
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -158,6 +158,8 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
 			struct pid *pid, struct task_struct *task);
 #endif /* CONFIG_PROC_PID_ARCH_STATUS */
 
+extern void arch_report_meminfo(struct seq_file *m);
+
 #else /* CONFIG_PROC_FS */
 
 static inline void proc_root_init(void)
-- 
2.39.2

