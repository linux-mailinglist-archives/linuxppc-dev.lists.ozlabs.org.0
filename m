Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69416599F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 09:50:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NSwM6y2YzDqJ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 19:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=s94zVd+q; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NSlr3nVGzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 19:43:04 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id ay11so1290749plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 00:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gKgbuQ+qyW6cSoObrFJbrpeEDkVLaM+BEDocK6BCUQ=;
 b=s94zVd+qdhp6grErmY5Om0h7V3Zf02oLkoMoLb2t/AQywv7xojk7BWN7lnaefzDX4V
 fAy7b+AZfMB+PzeQJ0ZkzxrGXZJS6KOoo0X4sUuiDZUO6fxM8XfOafVJ3w+N7VtrJgzH
 FQ3BuAczsNhmzctG/kdf+0e2Yu9zAS1NkMyVvHt9GzDXEdhAOIOjVUMeVhpfwLO4M5E7
 +VXpM7/rrYU+E2+Vz+PgJIZ8/4hOX0wHm3nI+Tb1gLD59Toer402jVvaBH/tee1eRrhB
 XcaW0MLfEaeLPuTf2Z5kxMPV3huqDBJyPVW0/F77Te52Fmtbj2mXO18AvjKeVPURj7bB
 btrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gKgbuQ+qyW6cSoObrFJbrpeEDkVLaM+BEDocK6BCUQ=;
 b=l0e3l11Wlvd4H8r7EnrHr94gKzC8239icNKJAqhkXY/zekU0aVBrY8WQPUPYGqiWHR
 +cRc4UHskfxEm/CaagsJtJFCAFKvVJAfjsurK0z2LimisTShwkuZH0l6uFxlYkaZ8PrS
 R19czGCeFHzXrorzJRg7z6uFP6Tj0MWJ7bIMjRBsX6fE8lzIQ/KqqAmgZrHy2fKYXZjb
 cJGauUsuyBZ5dMwwAS1G3tH4h6twZz8rChvhdupqY+XjpaJT9nGdKEonygBQgyzgyH1J
 lQyno0nJjNRQu8TeJu/zfFhUiH2oTd91J7+/mCSzPhxibirg0ylx2EnsWan3tvqFr4DE
 pOvg==
X-Gm-Message-State: APjAAAVq6U6RDzclQY2+4CNHG3eo2q3BZNvklAgDbzebhivT7uKQx/tn
 EFxW/iXwNNzrEIgf31yNLM7td7oCY60=
X-Google-Smtp-Source: APXvYqyRBfvUbgHm/BRv3pVhx5sTcraF9XyZo4Mho4MdiH1Tp0615HezjwCAFENHyx5dXPgJ8yqeMg==
X-Received: by 2002:a17:90b:30c9:: with SMTP id
 hi9mr2250522pjb.81.1582188181592; 
 Thu, 20 Feb 2020 00:43:01 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.72])
 by smtp.gmail.com with ESMTPSA id r145sm2512381pfr.5.2020.02.20.00.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:43:01 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 4/6] powerpc/mmu_gather: enable RCU_TABLE_FREE even for !SMP
 case
Date: Thu, 20 Feb 2020 14:12:27 +0530
Message-Id: <20200220084229.1278137-5-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220084229.1278137-1-santosh@fossix.org>
References: <20200220084229.1278137-1-santosh@fossix.org>
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
Cc: peterz@infradead.org, aneesh.kumar@linux.ibm.com,
 akshay.adiga@linux.ibm.com, gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Patch series "Fixup page directory freeing", v4.

This is a repost of patch series from Peter with the arch specific changes
except ppc64 dropped.  ppc64 changes are added here because we are redoing
the patch series on top of ppc64 changes.  This makes it easy to backport
these changes.  Only the first 2 patches need to be backported to stable.

The thing is, on anything SMP, freeing page directories should observe the
exact same order as normal page freeing:

 1) unhook page/directory
 2) TLB invalidate
 3) free page/directory

Without this, any concurrent page-table walk could end up with a
Use-after-Free.  This is esp.  trivial for anything that has software
page-table walkers (HAVE_FAST_GUP / software TLB fill) or the hardware
caches partial page-walks (ie.  caches page directories).

Even on UP this might give issues since mmu_gather is preemptible these
days.  An interrupt or preempted task accessing user pages might stumble
into the free page if the hardware caches page directories.

This patch series fixes ppc64 and add generic MMU_GATHER changes to
support the conversion of other architectures.  I haven't added patches
w.r.t other architecture because they are yet to be acked.

This patch (of 9):

A followup patch is going to make sure we correctly invalidate page walk
cache before we free page table pages.  In order to keep things simple
enable RCU_TABLE_FREE even for !SMP so that we don't have to fixup the
!SMP case differently in the followup patch

!SMP case is right now broken for radix translation w.r.t page walk
cache flush.  We can get interrupted in between page table free and
that would imply we have page walk cache entries pointing to tables
which got freed already.  Michael said "both our platforms that run on
Power9 force SMP on in Kconfig, so the !SMP case is unlikely to be a
problem for anyone in practice, unless they've hacked their kernel to
build it !SMP."

12e4d53f3f04e in upstream.

Link: http://lkml.kernel.org/r/20200116064531.483522-2-aneesh.kumar@linux.ibm.com
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: <stable@vger.kernel.org> # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: backported for 4.19 stable]
---
 arch/powerpc/Kconfig                         | 2 +-
 arch/powerpc/include/asm/book3s/32/pgalloc.h | 8 --------
 arch/powerpc/include/asm/book3s/64/pgalloc.h | 2 --
 arch/powerpc/mm/pgtable-book3s64.c           | 7 -------
 4 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f7f046ff6407..fa231130eee1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -215,7 +215,7 @@ config PPC
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HAVE_RCU_TABLE_FREE		if SMP
+	select HAVE_RCU_TABLE_FREE
 	select HAVE_RCU_TABLE_NO_INVALIDATE	if HAVE_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC64 && CPU_LITTLE_ENDIAN
diff --git a/arch/powerpc/include/asm/book3s/32/pgalloc.h b/arch/powerpc/include/asm/book3s/32/pgalloc.h
index 82e44b1a00ae..79ba3fbb512e 100644
--- a/arch/powerpc/include/asm/book3s/32/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/32/pgalloc.h
@@ -110,7 +110,6 @@ static inline void pgtable_free(void *table, unsigned index_size)
 #define check_pgt_cache()	do { } while (0)
 #define get_hugepd_cache_index(x)  (x)
 
-#ifdef CONFIG_SMP
 static inline void pgtable_free_tlb(struct mmu_gather *tlb,
 				    void *table, int shift)
 {
@@ -127,13 +126,6 @@ static inline void __tlb_remove_table(void *_table)
 
 	pgtable_free(table, shift);
 }
-#else
-static inline void pgtable_free_tlb(struct mmu_gather *tlb,
-				    void *table, int shift)
-{
-	pgtable_free(table, shift);
-}
-#endif
 
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t table,
 				  unsigned long address)
diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index f9019b579903..1013c0214213 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -47,9 +47,7 @@ extern pmd_t *pmd_fragment_alloc(struct mm_struct *, unsigned long);
 extern void pte_fragment_free(unsigned long *, int);
 extern void pmd_fragment_free(unsigned long *);
 extern void pgtable_free_tlb(struct mmu_gather *tlb, void *table, int shift);
-#ifdef CONFIG_SMP
 extern void __tlb_remove_table(void *_table);
-#endif
 
 static inline pgd_t *radix__pgd_alloc(struct mm_struct *mm)
 {
diff --git a/arch/powerpc/mm/pgtable-book3s64.c b/arch/powerpc/mm/pgtable-book3s64.c
index 297db665d953..5b4e9fd8990c 100644
--- a/arch/powerpc/mm/pgtable-book3s64.c
+++ b/arch/powerpc/mm/pgtable-book3s64.c
@@ -432,7 +432,6 @@ static inline void pgtable_free(void *table, int index)
 	}
 }
 
-#ifdef CONFIG_SMP
 void pgtable_free_tlb(struct mmu_gather *tlb, void *table, int index)
 {
 	unsigned long pgf = (unsigned long)table;
@@ -449,12 +448,6 @@ void __tlb_remove_table(void *_table)
 
 	return pgtable_free(table, index);
 }
-#else
-void pgtable_free_tlb(struct mmu_gather *tlb, void *table, int index)
-{
-	return pgtable_free(table, index);
-}
-#endif
 
 #ifdef CONFIG_PROC_FS
 atomic_long_t direct_pages_count[MMU_PAGE_COUNT];
-- 
2.24.1

