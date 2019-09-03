Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81508A60A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 07:33:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mwb50fmHzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MwQ64009zDqV2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 15:25:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x835MStX143130
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Sep 2019 01:25:14 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usgfdta13-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 01:25:13 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Sep 2019 06:25:11 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 06:25:06 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x835P51c40960282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 05:25:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C04EEAE057;
 Tue,  3 Sep 2019 05:25:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D237AAE045;
 Tue,  3 Sep 2019 05:25:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 05:25:04 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8D1F3A00EC;
 Tue,  3 Sep 2019 15:25:03 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 3/6] powerpc: Convert flush_icache_range & friends to C
Date: Tue,  3 Sep 2019 15:23:57 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903052407.16638-1-alastair@au1.ibm.com>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090305-4275-0000-0000-0000036060E7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090305-4276-0000-0000-00003872A0ED
Message-Id: <20190903052407.16638-4-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030060
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
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

Similar to commit 22e9c88d486a
("powerpc/64: reuse PPC32 static inline flush_dcache_range()")
this patch converts the following ASM symbols to C:
    flush_icache_range()
    __flush_dcache_icache()
    __flush_dcache_icache_phys()

This was done as we discovered a long-standing bug where the length of the
range was truncated due to using a 32 bit shift instead of a 64 bit one.

By converting these functions to C, it becomes easier to maintain.

flush_dcache_icache_phys() retains a critical assembler section as we must
ensure there are no memory accesses while the data MMU is disabled
(authored by Christophe Leroy). Since this has no external callers, it has
also been made static, allowing the compiler to inline it within
flush_dcache_icache_page().

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cache.h      |  26 ++---
 arch/powerpc/include/asm/cacheflush.h |  24 ++--
 arch/powerpc/kernel/misc_32.S         | 117 --------------------
 arch/powerpc/kernel/misc_64.S         | 102 -----------------
 arch/powerpc/mm/mem.c                 | 152 +++++++++++++++++++++++++-
 5 files changed, 173 insertions(+), 248 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index f852d5cd746c..91c808c6738b 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -98,20 +98,7 @@ static inline u32 l1_icache_bytes(void)
 #endif
 #endif /* ! __ASSEMBLY__ */
 
-#if defined(__ASSEMBLY__)
-/*
- * For a snooping icache, we still need a dummy icbi to purge all the
- * prefetched instructions from the ifetch buffers. We also need a sync
- * before the icbi to order the the actual stores to memory that might
- * have modified instructions with the icbi.
- */
-#define PURGE_PREFETCHED_INS	\
-	sync;			\
-	icbi	0,r3;		\
-	sync;			\
-	isync
-
-#else
+#if !defined(__ASSEMBLY__)
 #define __read_mostly __attribute__((__section__(".data..read_mostly")))
 
 #ifdef CONFIG_PPC_BOOK3S_32
@@ -145,6 +132,17 @@ static inline void dcbst(void *addr)
 {
 	__asm__ __volatile__ ("dcbst %y0" : : "Z"(*(u8 *)addr) : "memory");
 }
+
+static inline void icbi(void *addr)
+{
+	__asm__ __volatile__ ("icbi 0, %0" : : "r"(addr) : "memory");
+}
+
+static inline void iccci(void *addr)
+{
+	__asm__ __volatile__ ("iccci 0, %0" : : "r"(addr) : "memory");
+}
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_CACHE_H */
diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index ed57843ef452..4a1c9f0200e1 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -42,24 +42,20 @@ extern void flush_dcache_page(struct page *page);
 #define flush_dcache_mmap_lock(mapping)		do { } while (0)
 #define flush_dcache_mmap_unlock(mapping)	do { } while (0)
 
-extern void flush_icache_range(unsigned long, unsigned long);
+void flush_icache_range(unsigned long start, unsigned long stop);
 extern void flush_icache_user_range(struct vm_area_struct *vma,
 				    struct page *page, unsigned long addr,
 				    int len);
-extern void __flush_dcache_icache(void *page_va);
 extern void flush_dcache_icache_page(struct page *page);
-#if defined(CONFIG_PPC32) && !defined(CONFIG_BOOKE)
-extern void __flush_dcache_icache_phys(unsigned long physaddr);
-#else
-static inline void __flush_dcache_icache_phys(unsigned long physaddr)
-{
-	BUG();
-}
-#endif
-
-/*
- * Write any modified data cache blocks out to memory and invalidate them.
- * Does not invalidate the corresponding instruction cache blocks.
+void __flush_dcache_icache(void *page);
+
+/**
+ * flush_dcache_range(): Write any modified data cache blocks out to memory and
+ * invalidate them. Does not invalidate the corresponding instruction cache
+ * blocks.
+ *
+ * @start: the start address
+ * @stop: the stop address (exclusive)
  */
 static inline void flush_dcache_range(unsigned long start, unsigned long stop)
 {
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index fe4bd321730e..12b95e6799d4 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -318,123 +318,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_UNIFIED_ID_CACHE)
 EXPORT_SYMBOL(flush_instruction_cache)
 #endif /* CONFIG_PPC_8xx */
 
-/*
- * Write any modified data cache blocks out to memory
- * and invalidate the corresponding instruction cache blocks.
- * This is a no-op on the 601.
- *
- * flush_icache_range(unsigned long start, unsigned long stop)
- */
-_GLOBAL(flush_icache_range)
-BEGIN_FTR_SECTION
-	PURGE_PREFETCHED_INS
-	blr				/* for 601, do nothing */
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
-	rlwinm	r3,r3,0,0,31 - L1_CACHE_SHIFT
-	subf	r4,r3,r4
-	addi	r4,r4,L1_CACHE_BYTES - 1
-	srwi.	r4,r4,L1_CACHE_SHIFT
-	beqlr
-	mtctr	r4
-	mr	r6,r3
-1:	dcbst	0,r3
-	addi	r3,r3,L1_CACHE_BYTES
-	bdnz	1b
-	sync				/* wait for dcbst's to get to ram */
-#ifndef CONFIG_44x
-	mtctr	r4
-2:	icbi	0,r6
-	addi	r6,r6,L1_CACHE_BYTES
-	bdnz	2b
-#else
-	/* Flash invalidate on 44x because we are passed kmapped addresses and
-	   this doesn't work for userspace pages due to the virtually tagged
-	   icache.  Sigh. */
-	iccci	0, r0
-#endif
-	sync				/* additional sync needed on g4 */
-	isync
-	blr
-_ASM_NOKPROBE_SYMBOL(flush_icache_range)
-EXPORT_SYMBOL(flush_icache_range)
-
-/*
- * Flush a particular page from the data cache to RAM.
- * Note: this is necessary because the instruction cache does *not*
- * snoop from the data cache.
- * This is a no-op on the 601 which has a unified cache.
- *
- *	void __flush_dcache_icache(void *page)
- */
-_GLOBAL(__flush_dcache_icache)
-BEGIN_FTR_SECTION
-	PURGE_PREFETCHED_INS
-	blr
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
-	rlwinm	r3,r3,0,0,31-PAGE_SHIFT		/* Get page base address */
-	li	r4,PAGE_SIZE/L1_CACHE_BYTES	/* Number of lines in a page */
-	mtctr	r4
-	mr	r6,r3
-0:	dcbst	0,r3				/* Write line to ram */
-	addi	r3,r3,L1_CACHE_BYTES
-	bdnz	0b
-	sync
-#ifdef CONFIG_44x
-	/* We don't flush the icache on 44x. Those have a virtual icache
-	 * and we don't have access to the virtual address here (it's
-	 * not the page vaddr but where it's mapped in user space). The
-	 * flushing of the icache on these is handled elsewhere, when
-	 * a change in the address space occurs, before returning to
-	 * user space
-	 */
-BEGIN_MMU_FTR_SECTION
-	blr
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_44x)
-#endif /* CONFIG_44x */
-	mtctr	r4
-1:	icbi	0,r6
-	addi	r6,r6,L1_CACHE_BYTES
-	bdnz	1b
-	sync
-	isync
-	blr
-
-#ifndef CONFIG_BOOKE
-/*
- * Flush a particular page from the data cache to RAM, identified
- * by its physical address.  We turn off the MMU so we can just use
- * the physical address (this may be a highmem page without a kernel
- * mapping).
- *
- *	void __flush_dcache_icache_phys(unsigned long physaddr)
- */
-_GLOBAL(__flush_dcache_icache_phys)
-BEGIN_FTR_SECTION
-	PURGE_PREFETCHED_INS
-	blr					/* for 601, do nothing */
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
-	mfmsr	r10
-	rlwinm	r0,r10,0,28,26			/* clear DR */
-	mtmsr	r0
-	isync
-	rlwinm	r3,r3,0,0,31-PAGE_SHIFT		/* Get page base address */
-	li	r4,PAGE_SIZE/L1_CACHE_BYTES	/* Number of lines in a page */
-	mtctr	r4
-	mr	r6,r3
-0:	dcbst	0,r3				/* Write line to ram */
-	addi	r3,r3,L1_CACHE_BYTES
-	bdnz	0b
-	sync
-	mtctr	r4
-1:	icbi	0,r6
-	addi	r6,r6,L1_CACHE_BYTES
-	bdnz	1b
-	sync
-	mtmsr	r10				/* restore DR */
-	isync
-	blr
-#endif /* CONFIG_BOOKE */
-
 /*
  * Copy a whole page.  We use the dcbz instruction on the destination
  * to reduce memory traffic (it eliminates the unnecessary reads of
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 9bc0aa9aeb65..ff20c253f273 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -49,108 +49,6 @@ _GLOBAL(call_do_irq)
 	mtlr	r0
 	blr
 
-	.section	".toc","aw"
-PPC64_CACHES:
-	.tc		ppc64_caches[TC],ppc64_caches
-	.section	".text"
-
-/*
- * Write any modified data cache blocks out to memory
- * and invalidate the corresponding instruction cache blocks.
- *
- * flush_icache_range(unsigned long start, unsigned long stop)
- *
- *   flush all bytes from start through stop-1 inclusive
- */
-
-_GLOBAL_TOC(flush_icache_range)
-BEGIN_FTR_SECTION
-	PURGE_PREFETCHED_INS
-	blr
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
-/*
- * Flush the data cache to memory 
- * 
- * Different systems have different cache line sizes
- * and in some cases i-cache and d-cache line sizes differ from
- * each other.
- */
- 	ld	r10,PPC64_CACHES@toc(r2)
-	lwz	r7,DCACHEL1BLOCKSIZE(r10)/* Get cache block size */
-	addi	r5,r7,-1
-	andc	r6,r3,r5		/* round low to line bdy */
-	subf	r8,r6,r4		/* compute length */
-	add	r8,r8,r5		/* ensure we get enough */
-	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of cache block size */
-	srd.	r8,r8,r9		/* compute line count */
-	beqlr				/* nothing to do? */
-	mtctr	r8
-1:	dcbst	0,r6
-	add	r6,r6,r7
-	bdnz	1b
-	sync
-
-/* Now invalidate the instruction cache */
-	
-	lwz	r7,ICACHEL1BLOCKSIZE(r10)	/* Get Icache block size */
-	addi	r5,r7,-1
-	andc	r6,r3,r5		/* round low to line bdy */
-	subf	r8,r6,r4		/* compute length */
-	add	r8,r8,r5
-	lwz	r9,ICACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of Icache block size */
-	srd.	r8,r8,r9		/* compute line count */
-	beqlr				/* nothing to do? */
-	mtctr	r8
-2:	icbi	0,r6
-	add	r6,r6,r7
-	bdnz	2b
-	isync
-	blr
-_ASM_NOKPROBE_SYMBOL(flush_icache_range)
-EXPORT_SYMBOL(flush_icache_range)
-
-/*
- * Flush a particular page from the data cache to RAM.
- * Note: this is necessary because the instruction cache does *not*
- * snoop from the data cache.
- *
- *	void __flush_dcache_icache(void *page)
- */
-_GLOBAL(__flush_dcache_icache)
-/*
- * Flush the data cache to memory 
- * 
- * Different systems have different cache line sizes
- */
-
-BEGIN_FTR_SECTION
-	PURGE_PREFETCHED_INS
-	blr
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
-
-/* Flush the dcache */
- 	ld	r7,PPC64_CACHES@toc(r2)
-	clrrdi	r3,r3,PAGE_SHIFT           	    /* Page align */
-	lwz	r4,DCACHEL1BLOCKSPERPAGE(r7)	/* Get # dcache blocks per page */
-	lwz	r5,DCACHEL1BLOCKSIZE(r7)	/* Get dcache block size */
-	mr	r6,r3
-	mtctr	r4
-0:	dcbst	0,r6
-	add	r6,r6,r5
-	bdnz	0b
-	sync
-
-/* Now invalidate the icache */	
-
-	lwz	r4,ICACHEL1BLOCKSPERPAGE(r7)	/* Get # icache blocks per page */
-	lwz	r5,ICACHEL1BLOCKSIZE(r7)	/* Get icache block size */
-	mtctr	r4
-1:	icbi	0,r3
-	add	r3,r3,r5
-	bdnz	1b
-	isync
-	blr
-
 _GLOBAL(__bswapdi2)
 EXPORT_SYMBOL(__bswapdi2)
 	srdi	r8,r3,32
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9191a66b3bc5..cd540123874d 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -321,6 +321,105 @@ void free_initmem(void)
 	free_initmem_default(POISON_FREE_INITMEM);
 }
 
+/*
+ * Warning: This macro will perform an early return if the CPU has
+ * a coherent icache. The intent is is call this early in function,
+ * and handle the non-coherent icache variant afterwards.
+ *
+ * For a snooping icache, we still need a dummy icbi to purge all the
+ * prefetched instructions from the ifetch buffers. We also need a sync
+ * before the icbi to order the the actual stores to memory that might
+ * have modified instructions with the icbi.
+ */
+#define flush_coherent_icache_or_return(addr) {			\
+	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {		\
+		mb(); /* sync */				\
+		icbi(addr);					\
+		mb(); /* sync */				\
+		isync();					\
+		return;						\
+	}							\
+}
+
+/**
+ * flush_icache_range: Write any modified data cache blocks out to memory
+ * and invalidate the corresponding blocks in the instruction cache
+ *
+ * Generic code will call this after writing memory, before executing from it.
+ *
+ * @start: the start address
+ * @stop: the stop address (exclusive)
+ */
+void flush_icache_range(unsigned long start, unsigned long stop)
+{
+	unsigned long shift = l1_icache_shift();
+	unsigned long bytes = l1_icache_bytes();
+	char *addr = (char *)(start & ~(bytes - 1));
+	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
+	unsigned long i;
+
+	flush_coherent_icache_or_return(addr);
+	clean_dcache_range(start, stop);
+
+	if (IS_ENABLED(CONFIG_44x)) {
+		/*
+		 * Flash invalidate on 44x because we are passed kmapped
+		 * addresses and this doesn't work for userspace pages due to
+		 * the virtually tagged icache.
+		 */
+		iccci(addr);
+	} else {
+		/* Now invalidate the instruction cache */
+		for (i = 0; i < size >> shift; i++, addr += bytes)
+			icbi(addr);
+	}
+
+	if (!IS_ENABLED(CONFIG_PPC64))
+		mb(); /* additional sync needed on g4 */
+	isync();
+}
+EXPORT_SYMBOL(flush_icache_range);
+
+#if !defined(CONFIG_PPC_8xx) & !defined(CONFIG_PPC64)
+/**
+ * flush_dcache_icache_phys() - Flush a page by it's physical address
+ * @physaddr: the physical address of the page
+ */
+static void flush_dcache_icache_phys(unsigned long physaddr)
+{
+	unsigned long bytes = l1_dcache_bytes();
+	unsigned long nb = PAGE_SIZE / bytes;
+	unsigned long addr = physaddr & PAGE_MASK;
+	unsigned long msr, msr0;
+	unsigned long loop1 = addr, loop2 = addr;
+
+	msr0 = mfmsr();
+	msr = msr0 & ~MSR_DR;
+	/*
+	 * This must remain as ASM to prevent potential memory accesses
+	 * while the data MMU is disabled
+	 */
+	asm volatile(
+		"   mtctr %2;"
+		"   mtmsr %3;"
+		"   isync;"
+		"0: dcbst   0, %0;"
+		"   addi    %0, %0, %4;"
+		"   bdnz    0b;"
+		"   sync;"
+		"   mtctr %2;"
+		"1: icbi    0, %1;"
+		"   addi    %1, %1, %4;"
+		"   bdnz    1b;"
+		"   sync;"
+		"   mtmsr %5;"
+		"   isync;"
+		: "+r" (loop1), "+r" (loop2)
+		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
+		: "ctr", "memory");
+}
+#endif // !defined(CONFIG_PPC_8xx) & !defined(CONFIG_PPC64)
+
 /*
  * This is called when a page has been modified by the kernel.
  * It just marks the page as not i-cache clean.  We do the i-cache
@@ -353,12 +452,63 @@ void flush_dcache_icache_page(struct page *page)
 		__flush_dcache_icache(start);
 		kunmap_atomic(start);
 	} else {
-		__flush_dcache_icache_phys(page_to_pfn(page) << PAGE_SHIFT);
+		unsigned long addr = page_to_pfn(page) << PAGE_SHIFT;
+
+		flush_coherent_icache_or_return((void *)addr);
+		flush_dcache_icache_phys(addr);
 	}
 #endif
 }
 EXPORT_SYMBOL(flush_dcache_icache_page);
 
+/**
+ * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
+ * Note: this is necessary because the instruction cache does *not*
+ * snoop from the data cache.
+ *
+ * @page: the address of the page to flush
+ */
+void __flush_dcache_icache(void *page)
+{
+	char *addr = page;
+	unsigned long lines = PAGE_SIZE >> l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
+	unsigned long i;
+
+	flush_coherent_icache_or_return(addr);
+
+	/* Flush the data cache to memory */
+	for (i = 0; i < lines; i++, addr += bytes)
+		dcbst(addr);
+
+	mb(); /* sync */
+
+#ifdef CONFIG_44x
+	/*
+	 * We don't flush the icache on 44x. Those have a virtual icache and we
+	 * don't have access to the virtual address here (it's not the page
+	 * vaddr but where it's mapped in user space). The flushing of the
+	 * icache on these is handled elsewhere, when a change in the address
+	 * space occurs, before returning to user space.
+	 */
+
+	if (cpu_has_feature(MMU_FTR_TYPE_44x))
+		return;
+#endif
+
+	lines = PAGE_SIZE >> l1_icache_shift();
+	bytes = l1_icache_bytes();
+	addr = page;
+
+	/* Now invalidate the instruction cache */
+	for (i = 0; i < lines; i++, addr += bytes)
+		icbi(addr);
+
+	mb(); /* sync */
+	isync();
+}
+EXPORT_SYMBOL(__flush_dcache_icache);
+
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
 	clear_page(page);
-- 
2.21.0

