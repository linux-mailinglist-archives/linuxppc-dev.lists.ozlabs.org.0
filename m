Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82D24C979
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 03:12:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXk5x4NjnzDr34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 11:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=anastas.io (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.a=rsa-sha256
 header.s=mail header.b=aWasZZ0z; dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXk1p2n2mzDr3h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 11:09:18 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 7B0E57ECD2;
 Thu, 20 Aug 2020 20:08:45 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1597972125; bh=zR7X2sl1K9DTWVhZyFU2Nmli0g0Exysvij/iRYynmoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aWasZZ0zbsyPUiT/juRyC6AJK4Ki35QBPDOSDa/93vJpXXQ8CefL2N/wo/OkuXbCS
 JghbYbeLbUNUEGltyJLYfHHZ1oG1nPjU+ijRbh9bZDLhz+zuwH/yn+YV89gSp7YI36
 o4kVME9b1/5/22xjIeeSKpx7F9ghgt34vo8dFCC3ZzoWSbYwjKv7QlsueoIsO9Svu4
 rmMtcvkp2QaqQJb2NZoY4zejG3/oiZHWPPFTAp4vf1YtRi17p5OXzi0x5sjYu71VAu
 6jfUjt6RYpQT9x1pfCVuggsu9qMfcgsvPrWtTFQD0OFaVCBva1PJuPci6jLkype9if
 kLwj6S7ka1znA==
From: Shawn Anastasio <shawn@anastas.io>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] Revert "powerpc/64s: Remove PROT_SAO support"
Date: Thu, 20 Aug 2020 20:08:36 -0500
Message-Id: <20200821010837.4079-2-shawn@anastas.io>
In-Reply-To: <20200821010837.4079-1-shawn@anastas.io>
References: <20200821010837.4079-1-shawn@anastas.io>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 5c9fa16e8abd342ce04dc830c1ebb2a03abf6c05.

Since PROT_SAO can still be useful for certain classes of software,
reintroduce it. Concerns about guest migration for LPARs using SAO
will be addressed next.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  8 ++--
 arch/powerpc/include/asm/cputable.h           | 10 ++---
 arch/powerpc/include/asm/mman.h               | 26 ++++++++++--
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  2 +
 arch/powerpc/include/uapi/asm/mman.h          |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  2 +
 include/linux/mm.h                            |  2 +
 include/trace/events/mmflags.h                |  2 +
 mm/ksm.c                                      |  4 ++
 tools/testing/selftests/powerpc/mm/.gitignore |  1 +
 tools/testing/selftests/powerpc/mm/Makefile   |  4 +-
 tools/testing/selftests/powerpc/mm/prot_sao.c | 42 +++++++++++++++++++
 13 files changed, 90 insertions(+), 17 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/prot_sao.c

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 6de56c3b33c4..495fc0ccb453 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -20,13 +20,9 @@
 #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
 #define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
-
-#define _PAGE_CACHE_CTL		0x00030 /* Bits for the folowing cache modes */
-			/*	No bits set is normal cacheable memory */
-			/*	0x00010 unused, is SAO bit on radix POWER9 */
+#define _PAGE_SAO		0x00010 /* Strong access order */
 #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
 #define _PAGE_TOLERANT		0x00030 /* tolerant memory, cache inhibited */
-
 #define _PAGE_DIRTY		0x00080 /* C: page changed */
 #define _PAGE_ACCESSED		0x00100 /* R: page referenced */
 /*
@@ -828,6 +824,8 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
 }
 
+#define _PAGE_CACHE_CTL	(_PAGE_SAO | _PAGE_NON_IDEMPOTENT | _PAGE_TOLERANT)
+
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t prot)
 {
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index fdddb822d564..f89205eff691 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -191,7 +191,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_SPURR			LONG_ASM_CONST(0x0000000001000000)
 #define CPU_FTR_DSCR			LONG_ASM_CONST(0x0000000002000000)
 #define CPU_FTR_VSX			LONG_ASM_CONST(0x0000000004000000)
-// Free					LONG_ASM_CONST(0x0000000008000000)
+#define CPU_FTR_SAO			LONG_ASM_CONST(0x0000000008000000)
 #define CPU_FTR_CP_USE_DCBTZ		LONG_ASM_CONST(0x0000000010000000)
 #define CPU_FTR_UNALIGNED_LD_STD	LONG_ASM_CONST(0x0000000020000000)
 #define CPU_FTR_ASYM_SMT		LONG_ASM_CONST(0x0000000040000000)
@@ -436,7 +436,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_ASYM_SMT | \
+	    CPU_FTR_DSCR | CPU_FTR_SAO  | CPU_FTR_ASYM_SMT | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | \
 	    CPU_FTR_VMX_COPY | CPU_FTR_HAS_PPR | CPU_FTR_DABRX )
@@ -445,7 +445,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | \
+	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_DAWR | \
@@ -456,7 +456,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | \
+	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
@@ -474,7 +474,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | \
+	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index 7c07728af300..4ba303ea27f5 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -13,20 +13,38 @@
 #include <linux/pkeys.h>
 #include <asm/cpu_has_feature.h>
 
-#ifdef CONFIG_PPC_MEM_KEYS
 static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
 		unsigned long pkey)
 {
-	return pkey_to_vmflag_bits(pkey);
+#ifdef CONFIG_PPC_MEM_KEYS
+	return (((prot & PROT_SAO) ? VM_SAO : 0) | pkey_to_vmflag_bits(pkey));
+#else
+	return ((prot & PROT_SAO) ? VM_SAO : 0);
+#endif
 }
 #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
 
 static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
 {
-	return __pgprot(vmflag_to_pte_pkey_bits(vm_flags));
+#ifdef CONFIG_PPC_MEM_KEYS
+	return (vm_flags & VM_SAO) ?
+		__pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
+		__pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
+#else
+	return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
+#endif
 }
 #define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
-#endif
+
+static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
+{
+	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
+		return false;
+	if ((prot & PROT_SAO) && !cpu_has_feature(CPU_FTR_SAO))
+		return false;
+	return true;
+}
+#define arch_validate_prot arch_validate_prot
 
 #endif /* CONFIG_PPC64 */
 #endif	/* _ASM_POWERPC_MMAN_H */
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 59ee9fa4ae09..6cb8aa357191 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -82,6 +82,8 @@
  */
 #include <asm/nohash/pte-book3e.h>
 
+#define _PAGE_SAO	0
+
 #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
 
 /*
diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index 3a700351feca..c0c737215b00 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -11,7 +11,7 @@
 #include <asm-generic/mman-common.h>
 
 
-#define PROT_SAO	0x10		/* Unsupported since v5.9 */
+#define PROT_SAO	0x10		/* Strong Access Ordering */
 
 #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
 #define MAP_NORESERVE   0x40            /* don't reserve swap pages */
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 6f8c0c6b937a..231f92248140 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -657,7 +657,7 @@ static struct dt_cpu_feature_match __initdata
 	{"processor-control-facility-v3", feat_enable_dbell, CPU_FTR_DBELL},
 	{"processor-utilization-of-resources-register", feat_enable_purr, 0},
 	{"no-execute", feat_enable, 0},
-	/* strong-access-ordering is unused */
+	{"strong-access-ordering", feat_enable, CPU_FTR_SAO},
 	{"cache-inhibited-large-page", feat_enable_large_ci, 0},
 	{"coprocessor-icswx", feat_enable, 0},
 	{"hypervisor-virtualization-interrupt", feat_enable_hvi, 0},
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1da9dbba9217..c1ea93b368b6 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -232,6 +232,8 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags)
 		rflags |= HPTE_R_I;
 	else if ((pteflags & _PAGE_CACHE_CTL) == _PAGE_NON_IDEMPOTENT)
 		rflags |= (HPTE_R_I | HPTE_R_G);
+	else if ((pteflags & _PAGE_CACHE_CTL) == _PAGE_SAO)
+		rflags |= (HPTE_R_W | HPTE_R_I | HPTE_R_M);
 	else
 		/*
 		 * Add memory coherence if cache inhibited is not set
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1983e08f5906..5abe6df4247e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -321,6 +321,8 @@ extern unsigned int kobjsize(const void *objp);
 
 #if defined(CONFIG_X86)
 # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
+#elif defined(CONFIG_PPC)
+# define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
 # define VM_GROWSUP	VM_ARCH_1
 #elif defined(CONFIG_IA64)
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 939092dbcb8b..5fb752034386 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -114,6 +114,8 @@ IF_HAVE_PG_IDLE(PG_idle,		"idle"		)
 
 #if defined(CONFIG_X86)
 #define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
+#elif defined(CONFIG_PPC)
+#define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
 #elif defined(CONFIG_PARISC) || defined(CONFIG_IA64)
 #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
 #elif !defined(CONFIG_MMU)
diff --git a/mm/ksm.c b/mm/ksm.c
index 0aa2247bddd7..90a625b02a1d 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2453,6 +2453,10 @@ int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		if (vma_is_dax(vma))
 			return 0;
 
+#ifdef VM_SAO
+		if (*vm_flags & VM_SAO)
+			return 0;
+#endif
 #ifdef VM_SPARC_ADI
 		if (*vm_flags & VM_SPARC_ADI)
 			return 0;
diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index 91c775c23c66..aac4a59f9e28 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -2,6 +2,7 @@
 hugetlb_vs_thp_test
 subpage_prot
 tempfile
+prot_sao
 segv_errors
 wild_bctr
 large_vm_fork_separation
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index 250ce172e0da..defe488d6bf1 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -2,7 +2,7 @@
 noarg:
 	$(MAKE) -C ../
 
-TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot segv_errors wild_bctr \
+TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
 		  large_vm_fork_separation bad_accesses pkey_exec_prot \
 		  pkey_siginfo stack_expansion_signal stack_expansion_ldst
 
@@ -14,6 +14,8 @@ include ../../lib.mk
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c
 
+$(OUTPUT)/prot_sao: ../utils.c
+
 $(OUTPUT)/wild_bctr: CFLAGS += -m64
 $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
 $(OUTPUT)/bad_accesses: CFLAGS += -m64
diff --git a/tools/testing/selftests/powerpc/mm/prot_sao.c b/tools/testing/selftests/powerpc/mm/prot_sao.c
new file mode 100644
index 000000000000..e2eed65b7735
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/prot_sao.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2016, Michael Ellerman, IBM Corp.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#include <asm/cputable.h>
+
+#include "utils.h"
+
+#define SIZE (64 * 1024)
+
+int test_prot_sao(void)
+{
+	char *p;
+
+	/* 2.06 or later should support SAO */
+	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
+
+	/*
+	 * Ensure we can ask for PROT_SAO.
+	 * We can't really verify that it does the right thing, but at least we
+	 * confirm the kernel will accept it.
+	 */
+	p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE | PROT_SAO,
+		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	FAIL_IF(p == MAP_FAILED);
+
+	/* Write to the mapping, to at least cause a fault */
+	memset(p, 0xaa, SIZE);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_prot_sao, "prot-sao");
+}
-- 
2.28.0

