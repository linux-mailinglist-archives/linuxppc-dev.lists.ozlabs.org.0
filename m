Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13A1F0B10
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 14:05:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fw7l2MPGzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 22:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vRC5aUD8; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fw4119ghzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jun 2020 22:02:24 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id h95so4805532pje.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Jun 2020 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcLTSRTnUc/dRcq0WL8cfAVTjN+eRh/FlfWbw0l3LfI=;
 b=vRC5aUD8adMANspqdBOppYjFUzKJy1Dm2sZVhy/fKX7x2FLgVsp5uWFcjlYmVNJJtW
 sb0vOb4v/Bu2ASYIu5Vn8zOS/WFUxxgFToiAwXvf0WFUark2YmyRYM8hAUlAqpYrR32s
 hR3Tc4Kl/ZQzteBlTE3YKhT2tFDixIDRxYjPj56X8dtIUGdCqO2gQz7JqCrnxIt0jrcG
 h2P07oiyr75oJVGhqKrUfOee1HdQs+rxd4yKjk/TFyOy780OpD6m/7n3qUvu3KrTgFAl
 R8ytqjFx8f9gASgCz+Rw+zClflLXx07IDC4iUP7IUAQLD+xuQTEFbeFi0yc8sCLOz/0e
 a8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcLTSRTnUc/dRcq0WL8cfAVTjN+eRh/FlfWbw0l3LfI=;
 b=QI1GKOkGhzP+yMAAr0s9QP3JYkuysG3H0+0D7pbDh9H0Y4AJn8iemZBzTbm2I8JVDU
 yze7snGPKz3h/rPJi+n0dU1ADkWKci/P4ZTTZjz8tUXTEdtGEe51moFysuOxomgkchtJ
 wI/p0ZZbcjMhOgnKMcLKat8/uKnmQnxoqHIvlop0++8wFAK+jdXS4BtYersPv9J2o0xh
 3nbEQPfDWRCg9HmEre5Qa3vOb7Uos70DstaHp01YUPF8/2pMIVTUjTYfAhjHYxrKljVN
 gnrAtE8pdBlkdieOb2WODuOl0IwVIeShZIeiHkHETFPRO6PpSRY9dSBJdYTgr4FaTFTO
 M+JQ==
X-Gm-Message-State: AOAM531zWvXyAXG/qT+BlvIhtM+0SlTZtCU2mIx8+xqb9PqTasP+RkLD
 56omd5qVBr611fgzdyt4NaBIMJKi
X-Google-Smtp-Source: ABdhPJyiFgqXSzVB0JS28UjISkHbLnGoMmHLhvVr/qWN2tUc1V4fLXi4RQMIHFJDmP3Ita8zxklv+A==
X-Received: by 2002:a17:90a:234f:: with SMTP id
 f73mr10832981pje.174.1591531340179; 
 Sun, 07 Jun 2020 05:02:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([202.125.31.243])
 by smtp.gmail.com with ESMTPSA id b29sm4411482pfr.159.2020.06.07.05.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 05:02:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s: remove PROT_SAO support
Date: Sun,  7 Jun 2020 22:02:08 +1000
Message-Id: <20200607120209.463501-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v3.1 does not support the SAO storage control attribute required to
implement PROT_SAO. PROT_SAO was used by specialised system software
(Lx86) that has been discontinued for about 7 years, and is not thought
to be used elsewhere, so removal should not cause problems.

We rather remove it than keep support for older processors, because
live migrating guest partitions to newer processors may not be possible
if SAO is in use.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  8 ++--
 arch/powerpc/include/asm/cputable.h           |  9 ++--
 arch/powerpc/include/asm/kvm_book3s_64.h      |  3 +-
 arch/powerpc/include/asm/mman.h               | 24 +++--------
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  2 -
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  2 -
 include/linux/mm.h                            |  2 -
 include/trace/events/mmflags.h                |  2 -
 mm/ksm.c                                      |  4 --
 tools/testing/selftests/powerpc/mm/.gitignore |  1 -
 tools/testing/selftests/powerpc/mm/Makefile   |  4 +-
 tools/testing/selftests/powerpc/mm/prot_sao.c | 42 -------------------
 13 files changed, 18 insertions(+), 87 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/mm/prot_sao.c

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index f17442c3a092..d9e92586f8dc 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -20,9 +20,13 @@
 #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
 #define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
-#define _PAGE_SAO		0x00010 /* Strong access order */
+
+#define _PAGE_CACHE_CTL		0x00030 /* Bits for the folowing cache modes */
+			/*	No bits set is normal cacheable memory */
+			/*	0x00010 unused, is SAO bit on radix POWER9 */
 #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
 #define _PAGE_TOLERANT		0x00030 /* tolerant memory, cache inhibited */
+
 #define _PAGE_DIRTY		0x00080 /* C: page changed */
 #define _PAGE_ACCESSED		0x00100 /* R: page referenced */
 /*
@@ -825,8 +829,6 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
 }
 
-#define _PAGE_CACHE_CTL	(_PAGE_SAO | _PAGE_NON_IDEMPOTENT | _PAGE_TOLERANT)
-
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t prot)
 {
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index bac2252c839e..c7e923b0000a 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -191,7 +191,6 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_SPURR			LONG_ASM_CONST(0x0000000001000000)
 #define CPU_FTR_DSCR			LONG_ASM_CONST(0x0000000002000000)
 #define CPU_FTR_VSX			LONG_ASM_CONST(0x0000000004000000)
-#define CPU_FTR_SAO			LONG_ASM_CONST(0x0000000008000000)
 #define CPU_FTR_CP_USE_DCBTZ		LONG_ASM_CONST(0x0000000010000000)
 #define CPU_FTR_UNALIGNED_LD_STD	LONG_ASM_CONST(0x0000000020000000)
 #define CPU_FTR_ASYM_SMT		LONG_ASM_CONST(0x0000000040000000)
@@ -435,7 +434,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | CPU_FTR_ASYM_SMT | \
+	    CPU_FTR_DSCR | CPU_FTR_ASYM_SMT | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | \
 	    CPU_FTR_VMX_COPY | CPU_FTR_HAS_PPR | CPU_FTR_DABRX | CPU_FTR_PKEY)
@@ -444,7 +443,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_DSCR | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_DAWR | \
@@ -455,7 +454,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_DSCR | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
@@ -473,7 +472,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_DSCR | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 9bb9bb370b53..579c9229124b 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -400,7 +400,8 @@ static inline bool hpte_cache_flags_ok(unsigned long hptel, bool is_ci)
 
 	/* Handle SAO */
 	if (wimg == (HPTE_R_W | HPTE_R_I | HPTE_R_M) &&
-	    cpu_has_feature(CPU_FTR_ARCH_206))
+	    cpu_has_feature(CPU_FTR_ARCH_206) &&
+	    !cpu_has_feature(CPU_FTR_ARCH_31))
 		wimg = HPTE_R_M;
 
 	if (!is_ci)
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index d610c2e07b28..43a62f3e21a0 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -13,38 +13,24 @@
 #include <linux/pkeys.h>
 #include <asm/cpu_has_feature.h>
 
-/*
- * This file is included by linux/mman.h, so we can't use cacl_vm_prot_bits()
- * here.  How important is the optimization?
- */
+#ifdef CONFIG_PPC_MEM_KEYS
 static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
 		unsigned long pkey)
 {
-#ifdef CONFIG_PPC_MEM_KEYS
-	return (((prot & PROT_SAO) ? VM_SAO : 0) | pkey_to_vmflag_bits(pkey));
-#else
-	return ((prot & PROT_SAO) ? VM_SAO : 0);
-#endif
+	return pkey_to_vmflag_bits(pkey);
 }
 #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
 
 static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
 {
-#ifdef CONFIG_PPC_MEM_KEYS
-	return (vm_flags & VM_SAO) ?
-		__pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
-		__pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
-#else
-	return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
-#endif
+	return __pgprot(vmflag_to_pte_pkey_bits(vm_flags));
 }
 #define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
+#endif
 
 static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
 {
-	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
-		return false;
-	if ((prot & PROT_SAO) && !cpu_has_feature(CPU_FTR_SAO))
+	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM))
 		return false;
 	return true;
 }
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 3424381b81da..2fd528ef48e0 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -82,8 +82,6 @@
  */
 #include <asm/nohash/pte-book3e.h>
 
-#define _PAGE_SAO	0
-
 #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
 
 /*
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 3a409517c031..8d2e4043702f 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -622,7 +622,7 @@ static struct dt_cpu_feature_match __initdata
 	{"processor-control-facility-v3", feat_enable_dbell, CPU_FTR_DBELL},
 	{"processor-utilization-of-resources-register", feat_enable_purr, 0},
 	{"no-execute", feat_enable, 0},
-	{"strong-access-ordering", feat_enable, CPU_FTR_SAO},
+	{"strong-access-ordering", feat_enable, 0},
 	{"cache-inhibited-large-page", feat_enable_large_ci, 0},
 	{"coprocessor-icswx", feat_enable, 0},
 	{"hypervisor-virtualization-interrupt", feat_enable_hvi, 0},
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 0124003e60d0..14b6abdc3bd8 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -232,8 +232,6 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags)
 		rflags |= HPTE_R_I;
 	else if ((pteflags & _PAGE_CACHE_CTL) == _PAGE_NON_IDEMPOTENT)
 		rflags |= (HPTE_R_I | HPTE_R_G);
-	else if ((pteflags & _PAGE_CACHE_CTL) == _PAGE_SAO)
-		rflags |= (HPTE_R_W | HPTE_R_I | HPTE_R_M);
 	else
 		/*
 		 * Add memory coherence if cache inhibited is not set
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 86adc71a972f..bdcaae914120 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -316,8 +316,6 @@ extern unsigned int kobjsize(const void *objp);
 
 #if defined(CONFIG_X86)
 # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
-#elif defined(CONFIG_PPC)
-# define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
 # define VM_GROWSUP	VM_ARCH_1
 #elif defined(CONFIG_IA64)
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 5fb752034386..939092dbcb8b 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -114,8 +114,6 @@ IF_HAVE_PG_IDLE(PG_idle,		"idle"		)
 
 #if defined(CONFIG_X86)
 #define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
-#elif defined(CONFIG_PPC)
-#define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
 #elif defined(CONFIG_PARISC) || defined(CONFIG_IA64)
 #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
 #elif !defined(CONFIG_MMU)
diff --git a/mm/ksm.c b/mm/ksm.c
index 18c5d005bd01..b225b0e16111 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2452,10 +2452,6 @@ int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		if (vma_is_dax(vma))
 			return 0;
 
-#ifdef VM_SAO
-		if (*vm_flags & VM_SAO)
-			return 0;
-#endif
 #ifdef VM_SPARC_ADI
 		if (*vm_flags & VM_SPARC_ADI)
 			return 0;
diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index 2ca523255b1b..ff296c94f627 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -2,7 +2,6 @@
 hugetlb_vs_thp_test
 subpage_prot
 tempfile
-prot_sao
 segv_errors
 wild_bctr
 large_vm_fork_separation
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index b9103c4bb414..9b8a7b3069c5 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -2,7 +2,7 @@
 noarg:
 	$(MAKE) -C ../
 
-TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
+TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot segv_errors wild_bctr \
 		  large_vm_fork_separation bad_accesses
 TEST_GEN_PROGS_EXTENDED := tlbie_test
 TEST_GEN_FILES := tempfile
@@ -12,8 +12,6 @@ include ../../lib.mk
 
 $(TEST_GEN_PROGS): ../harness.c
 
-$(OUTPUT)/prot_sao: ../utils.c
-
 $(OUTPUT)/wild_bctr: CFLAGS += -m64
 $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
 $(OUTPUT)/bad_accesses: CFLAGS += -m64
diff --git a/tools/testing/selftests/powerpc/mm/prot_sao.c b/tools/testing/selftests/powerpc/mm/prot_sao.c
deleted file mode 100644
index e2eed65b7735..000000000000
--- a/tools/testing/selftests/powerpc/mm/prot_sao.c
+++ /dev/null
@@ -1,42 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright 2016, Michael Ellerman, IBM Corp.
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/mman.h>
-
-#include <asm/cputable.h>
-
-#include "utils.h"
-
-#define SIZE (64 * 1024)
-
-int test_prot_sao(void)
-{
-	char *p;
-
-	/* 2.06 or later should support SAO */
-	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
-
-	/*
-	 * Ensure we can ask for PROT_SAO.
-	 * We can't really verify that it does the right thing, but at least we
-	 * confirm the kernel will accept it.
-	 */
-	p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE | PROT_SAO,
-		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
-	FAIL_IF(p == MAP_FAILED);
-
-	/* Write to the mapping, to at least cause a fault */
-	memset(p, 0xaa, SIZE);
-
-	return 0;
-}
-
-int main(void)
-{
-	return test_harness(test_prot_sao, "prot-sao");
-}
-- 
2.23.0

