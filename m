Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE611789AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 05:38:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XLjz0HJkzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 15:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1043; helo=mail-pj1-x1043.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=CTy1/m9r; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XLY05hQqzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 15:31:00 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d8so333857pje.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 20:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkgbxGTiv6piVRKbNX9ksR7st+vRYwUGKl28isP4EyE=;
 b=CTy1/m9rPRtu5aqcm/g32C39uVkhnCm1CDK1E3MoKc72DOf/N1EKMJIr3pw/5uxWiW
 aQFZ7PPtcecTMpCikzs89Vk6Cd7zwKeEp2DpEyqvuO1y3m5wQAko5SuBSHZ6oMK7+tcn
 7a26kNEeAhSpGcezR6hg1kdf7py+ldhA+suXv45gWVb0/eyHk/EY5R9hwk19TtNozwsE
 GJTBwKQ/qGSe8dmtUqsZ67daT1R0Zr+wHM041ryjmGcfLt9pUrkl19nF6KQe8NkZOPNT
 lgtmG8kJFJ5Bb6ZxYNoXUddLIOl7aFVtPx8cQB7Atml4+G/gpweGhOsKVZdU9RXZtdFT
 wp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkgbxGTiv6piVRKbNX9ksR7st+vRYwUGKl28isP4EyE=;
 b=Ro4ARtj/XXXkF2owcX8zVzL5XWJmUQsOxJrOyW4OwJi+BS7tfxDVZutK6qRrYYQEPS
 4S9qjLJo1pcnRIn4nzYp9UphNrZCKifPNYWyKu66tH3hf9E0vIZhZUG8C0TstKT5R304
 QxPsexZwx5nfEatPuqAqrMZmpOXK9VSa7drQxQ9Lpc7dm89sMe/lOvrM6LHFP9cbRQte
 XjUrymubRa/MZm7BshxWovtikiOVB5Midz8GdhKX9FVTJ6UTtGsFkIobwTWbe5nX6avE
 RZ9r0P2Im452EaO1j4wO/IkE8BsRbKkgOh0Oq+DkvBRPxdAHBp75wu8ESE6x3+ISVCsG
 LvyQ==
X-Gm-Message-State: ANhLgQ1XMQRiv58v/gCe74gAUnPPZ8P9zcXPIIqylUnUX2OPSSwQr8WH
 8EUcmIeKqT+xvTO+7iH9MyEGsg==
X-Google-Smtp-Source: ADFU+vs42YnfFoDBWropckxwcqamVQFJr8JXz3WKntS902p8kIlNkYJMI4GVpocQ6GUGg2mBvy2tIA==
X-Received: by 2002:a17:90a:eb18:: with SMTP id
 j24mr1052188pjz.85.1583296257790; 
 Tue, 03 Mar 2020 20:30:57 -0800 (PST)
Received: from santosiv.in.ibm.com ([2401:4900:16ee:7b5f:eac:4364:ff14:3aaa])
 by smtp.gmail.com with ESMTPSA id
 y193sm10775723pfg.162.2020.03.03.20.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 20:30:57 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/6] powerpc/mmu_gather: enable RCU_TABLE_FREE even for
 !SMP case
Date: Wed,  4 Mar 2020 10:00:26 +0530
Message-Id: <20200304043028.280136-5-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200304043028.280136-1-santosh@fossix.org>
References: <20200304043028.280136-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

commit 12e4d53f3f04e81f9e83d6fc10edc7314ab9f6b9 upstream.

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
index e09cfb109b8c..1a00ce4b0040 100644
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

