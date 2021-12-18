Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9A4797DB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 01:39:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JG6RQ0xRsz306d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 11:38:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kRLPRc3K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=kRLPRc3K; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JG6Qd5fksz2ybH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 11:38:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sCq6rslY7drSQhn+391lhYoVFDvXuHqn0QEvibUJ5GY=; b=kRLPRc3KYHA/rDKxe1vjh6sAJ1
 ptZBfemd0PSCHTW9GaUoOLQXaxCf9lcb3uotP/L2xPEzpkt+i++L0n3kehN1+CnTRpagAHSLRyNZN
 nxdOiJtfUmjzJzzggnjJbZHxJFYPJDDZNysr3wkoHfNfTtqZUs2W7JdRx7Je+oOZwjGbOaE7EUmFO
 rtn6UXScKcPFCAiP/GT8qMDhFgMg9rAX38FagkzNmyG6EBSL+QAzys2mT3JKbRssqGCQ7Pt4Ph+MD
 vNvhYARIA8YWF5acmxDPgl9db5lCWopjV73y4suQvd2vS2IpCjeD6im5AKuR34z4zKv5lKGEym71v
 pdwLq93Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myNjL-00HCNI-2U; Sat, 18 Dec 2021 00:37:43 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id D740B9862C4; Sat, 18 Dec 2021 01:37:42 +0100 (CET)
Date: Sat, 18 Dec 2021 01:37:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Subject: Re: [PATCH/RFC] mm: add and use batched version of
 __tlb_remove_table()
Message-ID: <20211218003742.GL16608@worktop.programming.kicks-ass.net>
References: <20211217081909.596413-1-nikita.yushchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217081909.596413-1-nikita.yushchenko@virtuozzo.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Nick Piggin <npiggin@gmail.com>, kernel@openvz.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 17, 2021 at 11:19:10AM +0300, Nikita Yushchenko wrote:
> When batched page table freeing via struct mmu_table_batch is used, the
> final freeing in __tlb_remove_table_free() executes a loop, calling
> arch hook __tlb_remove_table() to free each table individually.
> 
> Shift that loop down to archs. This allows archs to optimize it, by
> freeing multiple tables in a single release_pages() call. This is
> faster than individual put_page() calls, especially with memcg
> accounting enabled.
> 
> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Signed-off-by: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
> ---
>  arch/arm/include/asm/tlb.h                   |  5 ++++
>  arch/arm64/include/asm/tlb.h                 |  5 ++++
>  arch/powerpc/include/asm/book3s/32/pgalloc.h |  8 +++++++
>  arch/powerpc/include/asm/book3s/64/pgalloc.h |  1 +
>  arch/powerpc/include/asm/nohash/pgalloc.h    |  8 +++++++
>  arch/powerpc/mm/book3s64/pgtable.c           |  8 +++++++
>  arch/s390/include/asm/tlb.h                  |  1 +
>  arch/s390/mm/pgalloc.c                       |  8 +++++++
>  arch/sparc/include/asm/pgalloc_64.h          |  8 +++++++
>  arch/x86/include/asm/tlb.h                   |  5 ++++
>  include/asm-generic/tlb.h                    |  2 +-
>  include/linux/swap.h                         |  5 +++-
>  mm/mmu_gather.c                              |  6 +----
>  mm/swap_state.c                              | 24 +++++++++++++++-----
>  14 files changed, 81 insertions(+), 13 deletions(-)

Oh gawd, that's terrible. Never, ever duplicate code like that.

I'm thinking the below does the same? But yes, please do as Dave said,
give us actual numbers that show this is worth it.

---
 arch/Kconfig                 |  4 ++++
 arch/arm/Kconfig             |  1 +
 arch/arm/include/asm/tlb.h   |  5 -----
 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/tlb.h |  5 -----
 arch/x86/Kconfig             |  1 +
 arch/x86/include/asm/tlb.h   |  4 ----
 mm/mmu_gather.c              | 22 +++++++++++++++++++---
 8 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 26b8ed11639d..f2bd3f5af2b1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -415,6 +415,10 @@ config HAVE_ARCH_JUMP_LABEL_RELATIVE
 config MMU_GATHER_TABLE_FREE
 	bool
 
+config MMU_GATHER_TABLE_PAGE
+	bool
+	depends on MMU_GATHER_TABLE_FREE
+
 config MMU_GATHER_RCU_TABLE_FREE
 	bool
 	select MMU_GATHER_TABLE_FREE
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f0f9e8bec83a..11baaa5719c2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -110,6 +110,7 @@ config ARM
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
+	select MMU_GATHER_TABLE_PAGE if MMU
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8cbe03ad260..9d9b21649ca0 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -29,11 +29,6 @@
 #include <linux/swap.h>
 #include <asm/tlbflush.h>
 
-static inline void __tlb_remove_table(void *_table)
-{
-	free_page_and_swap_cache((struct page *)_table);
-}
-
 #include <asm-generic/tlb.h>
 
 static inline void
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c4207cf9bb17..4aa28fb03f4f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -196,6 +196,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select MMU_GATHER_RCU_TABLE_FREE
+	select MMU_GATHER_TABLE_PAGE
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index c995d1f4594f..401826260a5c 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -11,11 +11,6 @@
 #include <linux/pagemap.h>
 #include <linux/swap.h>
 
-static inline void __tlb_remove_table(void *_table)
-{
-	free_page_and_swap_cache((struct page *)_table);
-}
-
 #define tlb_flush tlb_flush
 static void tlb_flush(struct mmu_gather *tlb);
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index b9281fab4e3e..a22e653f4d0e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -235,6 +235,7 @@ config X86
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select MMU_GATHER_RCU_TABLE_FREE		if PARAVIRT
+	select MMU_GATHER_TABLE_PAGE
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if X86_64 && (UNWINDER_FRAME_POINTER || UNWINDER_ORC) && STACK_VALIDATION
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 1bfe979bb9bc..dec5ffa3042a 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -32,9 +32,5 @@ static inline void tlb_flush(struct mmu_gather *tlb)
  * below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
  * for more details.
  */
-static inline void __tlb_remove_table(void *table)
-{
-	free_page_and_swap_cache(table);
-}
 
 #endif /* _ASM_X86_TLB_H */
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1b9837419bf9..0195d0f13ed3 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -93,13 +93,29 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page, int page_
 
 #ifdef CONFIG_MMU_GATHER_TABLE_FREE
 
-static void __tlb_remove_table_free(struct mmu_table_batch *batch)
+#ifdef CONFIG_MMU_GATHER_TABLE_PAGE
+static inline void __tlb_remove_table(void *table)
+{
+	free_page_and_swap_cache(table);
+}
+
+static inline void __tlb_remove_tables(void **tables, int nr)
+{
+	free_pages_and_swap_cache_nolru((struct page **)tables, nr);
+}
+#else
+static inline void __tlb_remove_tables(void **tables, int nr)
 {
 	int i;
 
-	for (i = 0; i < batch->nr; i++)
-		__tlb_remove_table(batch->tables[i]);
+	for (i = 0; i < nr; i++)
+		__tlb_remove_table(tables[i]);
+}
+#endif
 
+static void __tlb_remove_table_free(struct mmu_table_batch *batch)
+{
+	__tlb_remove_tables(batch->tables, batch->nr);
 	free_page((unsigned long)batch);
 }
 
