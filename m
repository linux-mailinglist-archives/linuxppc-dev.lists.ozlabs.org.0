Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49848309958
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:19:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSsC25BqxzDrgn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 11:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.helo=mail-pj1-x102e.google.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=<>; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sqMbwBBC; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSs7S4PKXzDrgF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 11:16:20 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id z9so234639pjl.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 16:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cP3jkcKrTRH72l/nN753Ht9O0hI+z4GxWtjo9/TstQ0=;
 b=sqMbwBBCmtEWdXV8UsvISdoaOS2TT+Sq7SoU/b0WKpDqVNz8EtnPQlLhzpd3UsBzUx
 hQ5UoK2AYi5qpvyUA0nAMjyg3cwdUHmmivktrUhp+zKfzCYzQs9po/oAG8PwbCK877S8
 IGtqaKTHzV7hpNgx2cLRgC5sPpRMt6+scT/Twg4rBw29fMP6x+JziDsjtzgt5f78Q4oX
 ysXVJPstkA7O2i959e5wXSosND85hEU1WA/jlpNhdPovBAHLO/+q2JfGw1O2uVEiqj9n
 bS79KY0ePgjgeEGMVFL0B8/3h3wpfvsvp7u4xgMnh8yGLkgR+BnoN3VTB+Q87BsWVoX9
 ceCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cP3jkcKrTRH72l/nN753Ht9O0hI+z4GxWtjo9/TstQ0=;
 b=Qo1+LB6XAqsoq/Z4tY7fhMeVIbzqllDvqax4DHWFPXTRBrvbwx20ZWH1E0BhiErQlZ
 j+qCrhv5zIdgjczc1snFV5vtKqZSkBrtAOEUpkURbvSnFmRiSRiKdu+XM2utyvn7omcH
 XIyvJPlb1kHl6mwFQFEXZftEB3kc39IU9+ANV2Mc6AuNqtzN4WSeqCvf+y/MAMrDomOR
 fPUIZW20WtgIf7b4mMYnlf1WxzrV88nTHXmQmiC9xpAYmcepy/gDLcm3ikBypVgfcF2f
 iVyXLIwJ21w5XNpa4svRFJUGlVbUMvRwSRTXOBV+pX3s2S1yqK+aNgDWuGeery7QeJ2q
 h/jg==
X-Gm-Message-State: AOAM531IqAnPcjA2WP/e+QYD1Uzq0B56W06GxlHgLyXGk3DOK8Lftgh5
 EkAgk7eBx2nDFMp4+9RfxGk=
X-Google-Smtp-Source: ABdhPJwfaKAtwjR3StROIV1ECyYsNwj8eV5UZEKT4kWHE+4J7kAATUd8KQouQDX54qtt+0fmavw6Pw==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr10705500pjb.166.1612052178479; 
 Sat, 30 Jan 2021 16:16:18 -0800 (PST)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id e12sm13127365pga.13.2021.01.30.16.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 16:16:17 -0800 (PST)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Date: Sat, 30 Jan 2021 16:11:23 -0800
Message-Id: <20210131001132.3368247-12-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131001132.3368247-1-namit@vmware.com>
References: <20210131001132.3368247-1-namit@vmware.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Nick Piggin <npiggin@gmail.com>,
 Nadav Amit <namit@vmware.com>, linux-csky@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nadav Amit <namit@vmware.com>

Architecture-specific tlb_start_vma() and tlb_end_vma() seem
unnecessary. They are currently used for:

1. Avoid per-VMA TLB flushes. This can be determined by introducing
   a new config option.

2. Avoid saving information on the vma that is being flushed. Saving
   this information, even for architectures that do not need it, is
   cheap and we will need it for per-VMA deferred TLB flushing.

3. Avoid calling flush_cache_range().

Remove the architecture specific tlb_start_vma() and tlb_end_vma() in
the following manner, corresponding to the previous requirements:

1. Introduce a new config option -
   ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING - to allow architectures to
   define whether they want aggressive TLB flush batching (instead of
   flushing mappings of each VMA separately).

2. Save information on the vma regardless of architecture. Saving this
   information should have negligible overhead, and they will be
   needed for fine granularity TLB flushes.

3. flush_cache_range() is anyhow not defined for the architectures that
   implement tlb_start/end_vma().

No functional change intended.

Signed-off-by: Nadav Amit <namit@vmware.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will@kernel.org>
Cc: Yu Zhao <yuzhao@google.com>
Cc: Nick Piggin <npiggin@gmail.com>
Cc: linux-csky@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: x86@kernel.org
---
 arch/csky/Kconfig               |  1 +
 arch/csky/include/asm/tlb.h     | 12 ------------
 arch/powerpc/Kconfig            |  1 +
 arch/powerpc/include/asm/tlb.h  |  2 --
 arch/s390/Kconfig               |  1 +
 arch/s390/include/asm/tlb.h     |  3 ---
 arch/sparc/Kconfig              |  1 +
 arch/sparc/include/asm/tlb_64.h |  2 --
 arch/x86/Kconfig                |  1 +
 arch/x86/include/asm/tlb.h      |  3 ---
 include/asm-generic/tlb.h       | 15 +++++----------
 init/Kconfig                    |  8 ++++++++
 12 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 89dd2fcf38fa..924ff5721240 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -8,6 +8,7 @@ config CSKY
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS if NR_CPUS>2
+	select ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
diff --git a/arch/csky/include/asm/tlb.h b/arch/csky/include/asm/tlb.h
index fdff9b8d70c8..8130a5f09a6b 100644
--- a/arch/csky/include/asm/tlb.h
+++ b/arch/csky/include/asm/tlb.h
@@ -6,18 +6,6 @@
 
 #include <asm/cacheflush.h>
 
-#define tlb_start_vma(tlb, vma) \
-	do { \
-		if (!(tlb)->fullmm) \
-			flush_cache_range(vma, (vma)->vm_start, (vma)->vm_end); \
-	}  while (0)
-
-#define tlb_end_vma(tlb, vma) \
-	do { \
-		if (!(tlb)->fullmm) \
-			flush_tlb_range(vma, (vma)->vm_start, (vma)->vm_end); \
-	}  while (0)
-
 #define tlb_flush(tlb) flush_tlb_mm((tlb)->mm)
 
 #include <asm-generic/tlb.h>
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..d9761b6f192a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -151,6 +151,7 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
+	select ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index 160422a439aa..880b7daf904e 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -19,8 +19,6 @@
 
 #include <linux/pagemap.h>
 
-#define tlb_start_vma(tlb, vma)	do { } while (0)
-#define tlb_end_vma(tlb, vma)	do { } while (0)
 #define __tlb_remove_tlb_entry	__tlb_remove_tlb_entry
 
 #define tlb_flush tlb_flush
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c72874f09741..5b3dc5ca9873 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -113,6 +113,7 @@ config S390
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
+	select ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index 954fa8ca6cbd..03f31d59f97c 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -27,9 +27,6 @@ static inline void tlb_flush(struct mmu_gather *tlb);
 static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
 					  struct page *page, int page_size);
 
-#define tlb_start_vma(tlb, vma)			do { } while (0)
-#define tlb_end_vma(tlb, vma)			do { } while (0)
-
 #define tlb_flush tlb_flush
 #define pte_free_tlb pte_free_tlb
 #define pmd_free_tlb pmd_free_tlb
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index c9c34dc52b7d..fb46e1b6f177 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -51,6 +51,7 @@ config SPARC
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select SET_FS
+	select ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
 
 config SPARC32
 	def_bool !64BIT
diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
index 779a5a0f0608..3037187482db 100644
--- a/arch/sparc/include/asm/tlb_64.h
+++ b/arch/sparc/include/asm/tlb_64.h
@@ -22,8 +22,6 @@ void smp_flush_tlb_mm(struct mm_struct *mm);
 void __flush_tlb_pending(unsigned long, unsigned long, unsigned long *);
 void flush_tlb_pending(void);
 
-#define tlb_start_vma(tlb, vma) do { } while (0)
-#define tlb_end_vma(tlb, vma)	do { } while (0)
 #define tlb_flush(tlb)	flush_tlb_pending()
 
 /*
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 6bd4d626a6b3..d56b0f5cb00c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -101,6 +101,7 @@ config X86
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
+	select ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 1bfe979bb9bc..580636cdc257 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -2,9 +2,6 @@
 #ifndef _ASM_X86_TLB_H
 #define _ASM_X86_TLB_H
 
-#define tlb_start_vma(tlb, vma) do { } while (0)
-#define tlb_end_vma(tlb, vma) do { } while (0)
-
 #define tlb_flush tlb_flush
 static inline void tlb_flush(struct mmu_gather *tlb);
 
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 427bfcc6cdec..b97136b7010b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -334,8 +334,8 @@ static inline void __tlb_reset_range(struct mmu_gather *tlb)
 
 #ifdef CONFIG_MMU_GATHER_NO_RANGE
 
-#if defined(tlb_flush) || defined(tlb_start_vma) || defined(tlb_end_vma)
-#error MMU_GATHER_NO_RANGE relies on default tlb_flush(), tlb_start_vma() and tlb_end_vma()
+#if defined(tlb_flush)
+#error MMU_GATHER_NO_RANGE relies on default tlb_flush()
 #endif
 
 /*
@@ -362,10 +362,6 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
 
 #ifndef tlb_flush
 
-#if defined(tlb_start_vma) || defined(tlb_end_vma)
-#error Default tlb_flush() relies on default tlb_start_vma() and tlb_end_vma()
-#endif
-
 /*
  * When an architecture does not provide its own tlb_flush() implementation
  * but does have a reasonably efficient flush_vma_range() implementation
@@ -486,7 +482,6 @@ static inline unsigned long tlb_get_unmap_size(struct mmu_gather *tlb)
  * case where we're doing a full MM flush.  When we're doing a munmap,
  * the vmas are adjusted to only cover the region to be torn down.
  */
-#ifndef tlb_start_vma
 static inline void tlb_start_vma(struct mmu_gather *tlb, struct vm_area_struct *vma)
 {
 	if (tlb->fullmm)
@@ -495,14 +490,15 @@ static inline void tlb_start_vma(struct mmu_gather *tlb, struct vm_area_struct *
 	tlb_update_vma_flags(tlb, vma);
 	flush_cache_range(vma, vma->vm_start, vma->vm_end);
 }
-#endif
 
-#ifndef tlb_end_vma
 static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vma)
 {
 	if (tlb->fullmm)
 		return;
 
+	if (IS_ENABLED(CONFIG_ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING))
+		return;
+
 	/*
 	 * Do a TLB flush and reset the range at VMA boundaries; this avoids
 	 * the ranges growing with the unused space between consecutive VMAs,
@@ -511,7 +507,6 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
 	 */
 	tlb_flush_mmu_tlbonly(tlb);
 }
-#endif
 
 #ifdef CONFIG_ARCH_HAS_TLB_GENERATIONS
 
diff --git a/init/Kconfig b/init/Kconfig
index 3d11a0f7c8cc..14a599a48738 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -849,6 +849,14 @@ config ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 config ARCH_HAS_TLB_GENERATIONS
 	bool
 
+#
+# For architectures that prefer to batch TLB flushes aggressively, i.e.,
+# not to flush after changing or removing each VMA. The architecture must
+# provide its own tlb_flush() function.
+config ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
+	bool
+	depends on !CONFIG_MMU_GATHER_NO_GATHER
+
 config CC_HAS_INT128
 	def_bool !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) && 64BIT
 
-- 
2.25.1

