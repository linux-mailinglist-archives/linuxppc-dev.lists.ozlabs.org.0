Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E92130F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:25:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ychy4Y1KzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T//0vyPn; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ycb83Y6YzDr6f
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 11:20:20 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id u9so8381363pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 18:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSlr7AKnIgAB8760fWJ0BlcAusROwRagjWXPFnp9RMU=;
 b=T//0vyPno1F30cCtBOWn3ltdit5piv07M5U0M6oDgUl9h0dYiajQCJcDMjLR8nLc9i
 jVcDrBbNb+EMnbXhC2fxxwkSgpJLqLpienbaL3dsu7M5YSDL8JOmf6gUQjnssWQzfesF
 cY6Px/1ZUW6ckaeRmBKo+KNsczWCKj3WGG6aRgiLChjtkvxJeD+bnFgghlT/Hu6tjGtS
 iOXGiz3reXc/C7L/CEL8xbJkPucN5b7O/bm9y9hej4J7jk+V6JZfNKipg8WyE0QnLr8L
 V4NShNSJf2E8rgcqBqLQM9GZQNKH2lSycnvZxvAICUbC4/wyVB5IaGyk8xkHo3OlRe9K
 J4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSlr7AKnIgAB8760fWJ0BlcAusROwRagjWXPFnp9RMU=;
 b=PVcEhCtgt1WRK+F8Enu8s/T4jx2eKNWz3kz+qrdIpZLTBEECx4QuYK4FHk5PHDI/IR
 c2PLjPppGICCYXYvguyj90wnkaYxZ6ae9GTrHX3RoKQDZ8loQ1l84SyuGuDvYiEkeu+c
 +eY1S2uPN+K5WEItd3neaRnDnocpUKQR8lf95PGLcvF74CV4JJiNSu7RNmhVy45mX+8x
 nlaIByRzeHa2OzQx4wrhm7+VnxYAxfGbfdFhLp2Cu4G/tbIfgo1/VR/CmY+OV10vip28
 xo3fGIJArn/+uoKTao9rzs0mt/O1BdtcyNJASeyTkLABSI/0jqMtboSECDu4Fs1LokM+
 vrBg==
X-Gm-Message-State: AOAM531uyuToMGxsEQpCBdU8msjuPmM2EYLrBUCZU/ft2bm7r+GL+Zfv
 idU9t9M5v6/cM6YLs7YNCWsESLIe
X-Google-Smtp-Source: ABdhPJx/Ci9eW617nxpITWY7E/TD9wgQ6pi1HTIUkQzVe2/k8ptvW8dUwNA4CbAsp5DqvFXZILBTjQ==
X-Received: by 2002:a17:90a:c58e:: with SMTP id
 l14mr34423548pjt.67.1593739217563; 
 Thu, 02 Jul 2020 18:20:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id v186sm10094222pfv.141.2020.07.02.18.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 18:20:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/64s: remove PROT_SAO support
Date: Fri,  3 Jul 2020 11:19:57 +1000
Message-Id: <20200703011958.1166620-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200703011958.1166620-1-npiggin@gmail.com>
References: <20200703011958.1166620-1-npiggin@gmail.com>
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
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v3.1 does not support the SAO storage control attribute required to
implement PROT_SAO. PROT_SAO was used by specialised system software
(Lx86) that has been discontinued for about 7 years, and is not thought
to be used elsewhere, so removal should not cause problems.

We rather remove it than keep support for older processors, because
live migrating guest partitions to newer processors may not be possible
if SAO is in use (or worse allowed with silent races).

- PROT_SAO stays in the uapi header so code using it would still build.
- arch_validate_prot() is removed, the generic version rejects PROT_SAO
  so applications would get a failure at mmap() time.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  8 ++--
 arch/powerpc/include/asm/cputable.h           | 10 ++---
 arch/powerpc/include/asm/kvm_book3s_64.h      |  5 ++-
 arch/powerpc/include/asm/mman.h               | 26 ++----------
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  2 -
 arch/powerpc/include/uapi/asm/mman.h          |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  2 -
 include/linux/mm.h                            |  2 -
 include/trace/events/mmflags.h                |  2 -
 mm/ksm.c                                      |  4 --
 tools/testing/selftests/powerpc/mm/.gitignore |  1 -
 tools/testing/selftests/powerpc/mm/Makefile   |  4 +-
 tools/testing/selftests/powerpc/mm/prot_sao.c | 42 -------------------
 14 files changed, 20 insertions(+), 92 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/mm/prot_sao.c

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 25c3cb8272c0..8e9aca96143b 100644
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
index bac2252c839e..87284750535d 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -191,7 +191,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_SPURR			LONG_ASM_CONST(0x0000000001000000)
 #define CPU_FTR_DSCR			LONG_ASM_CONST(0x0000000002000000)
 #define CPU_FTR_VSX			LONG_ASM_CONST(0x0000000004000000)
-#define CPU_FTR_SAO			LONG_ASM_CONST(0x0000000008000000)
+// Free					LONG_ASM_CONST(0x0000000008000000)
 #define CPU_FTR_CP_USE_DCBTZ		LONG_ASM_CONST(0x0000000010000000)
 #define CPU_FTR_UNALIGNED_LD_STD	LONG_ASM_CONST(0x0000000020000000)
 #define CPU_FTR_ASYM_SMT		LONG_ASM_CONST(0x0000000040000000)
@@ -435,7 +435,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | CPU_FTR_ASYM_SMT | \
+	    CPU_FTR_DSCR | CPU_FTR_ASYM_SMT | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | \
 	    CPU_FTR_VMX_COPY | CPU_FTR_HAS_PPR | CPU_FTR_DABRX | CPU_FTR_PKEY)
@@ -444,7 +444,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_DSCR | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_DAWR | \
@@ -455,7 +455,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_DSCR | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
@@ -473,7 +473,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
 	    CPU_FTR_COHERENT_ICACHE | \
 	    CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
-	    CPU_FTR_DSCR | CPU_FTR_SAO  | \
+	    CPU_FTR_DSCR | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 9bb9bb370b53..fac39ff659d4 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -398,9 +398,10 @@ static inline bool hpte_cache_flags_ok(unsigned long hptel, bool is_ci)
 {
 	unsigned int wimg = hptel & HPTE_R_WIMG;
 
-	/* Handle SAO */
+	/* Handle SAO for POWER7,8,9 */
 	if (wimg == (HPTE_R_W | HPTE_R_I | HPTE_R_M) &&
-	    cpu_has_feature(CPU_FTR_ARCH_206))
+	    cpu_has_feature(CPU_FTR_ARCH_206) &&
+	    !cpu_has_feature(CPU_FTR_ARCH_31))
 		wimg = HPTE_R_M;
 
 	if (!is_ci)
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index 4ba303ea27f5..7c07728af300 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -13,38 +13,20 @@
 #include <linux/pkeys.h>
 #include <asm/cpu_has_feature.h>
 
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
-
-static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
-{
-	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
-		return false;
-	if ((prot & PROT_SAO) && !cpu_has_feature(CPU_FTR_SAO))
-		return false;
-	return true;
-}
-#define arch_validate_prot arch_validate_prot
+#endif
 
 #endif /* CONFIG_PPC64 */
 #endif	/* _ASM_POWERPC_MMAN_H */
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 6cb8aa357191..59ee9fa4ae09 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -82,8 +82,6 @@
  */
 #include <asm/nohash/pte-book3e.h>
 
-#define _PAGE_SAO	0
-
 #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
 
 /*
diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index c0c737215b00..3a700351feca 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -11,7 +11,7 @@
 #include <asm-generic/mman-common.h>
 
 
-#define PROT_SAO	0x10		/* Strong Access Ordering */
+#define PROT_SAO	0x10		/* Unsupported since v5.9 */
 
 #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
 #define MAP_NORESERVE   0x40            /* don't reserve swap pages */
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 3a409517c031..41412c198e70 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -622,7 +622,7 @@ static struct dt_cpu_feature_match __initdata
 	{"processor-control-facility-v3", feat_enable_dbell, CPU_FTR_DBELL},
 	{"processor-utilization-of-resources-register", feat_enable_purr, 0},
 	{"no-execute", feat_enable, 0},
-	{"strong-access-ordering", feat_enable, CPU_FTR_SAO},
+	/* strong-access-ordering is unused */
 	{"cache-inhibited-large-page", feat_enable_large_ci, 0},
 	{"coprocessor-icswx", feat_enable, 0},
 	{"hypervisor-virtualization-interrupt", feat_enable_hvi, 0},
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 468169e33c86..e35d8dae4f84 100644
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
index dc7b87310c10..6c8333d6c991 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -317,8 +317,6 @@ extern unsigned int kobjsize(const void *objp);
 
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
index 4102034cd55a..d1cfa18689b5 100644
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

