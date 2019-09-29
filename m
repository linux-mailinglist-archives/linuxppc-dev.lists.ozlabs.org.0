Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE2C19BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 00:44:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hLFB1Sm3zDqP0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 08:44:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="psbJ1dGi"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hLCl1BmtzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 08:43:13 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d9133850000>; Sun, 29 Sep 2019 15:43:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 29 Sep 2019 15:43:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 29 Sep 2019 15:43:10 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 29 Sep
 2019 22:43:09 +0000
Received: from [10.2.173.141] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 29 Sep
 2019 22:43:09 +0000
Subject: Re: [PATCH v4 01/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <kvm-ppc@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-2-leonardo@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <4ff1e8e8-929b-9cfc-9bf8-ee88e34de888@nvidia.com>
Date: Sun, 29 Sep 2019 15:40:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927234008.11513-2-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569796997; bh=QMMg0wzOUYNvhJFaWBvvT6Xqu5aJtHaoSeDd80kZ13s=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=psbJ1dGiw3/tJQFLklEy4UJveioPRREpTH/qOD1knSMZAqLyODWwLATSTWTbwV5/1
 uvKEUM36rA1y6u/4wpHAbN4PDtT+rJvFbgeqUCbJVh6ckt3MqyrUXWQq6WFABRTV8c
 QxM+bUlBZBV6kfk6qWWY3RXaZkvxXhkeMfNLWWnxIX3lk0jfzvFWUdrINS2yyK9Cri
 7ukTODM9z8VBlXYaxwDpRGRO771X2P90QQ4rkzl7MefskWSFi2cvGC07ph+81KVhfI
 QIAG4b9HWDNvwhfOzLqnCOs8C7NVNgS220f8dBcR4097M26qcUC/Clv4tSKVFVDeW7
 lMAWNu6i0tytA==
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
Cc: Keith Busch <keith.busch@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/27/19 4:39 PM, Leonardo Bras wrote:
> It's necessary to monitor lockless pagetable walks, in order to avoid doing
> THP splitting/collapsing during them.
> 
> Some methods rely on local_irq_{save,restore}, but that can be slow on
> cases with a lot of cpus are used for the process.
> 
> In order to speedup some cases, I propose a refcount-based approach, that
> counts the number of lockless pagetable	walks happening on the process.
> 
> This method does not exclude the current irq-oriented method. It works as a
> complement to skip unnecessary waiting.
> 
> start_lockless_pgtbl_walk(mm)
> 	Insert before starting any lockless pgtable walk
> end_lockless_pgtbl_walk(mm)
> 	Insert after the end of any lockless pgtable walk
> 	(Mostly after the ptep is last used)
> running_lockless_pgtbl_walk(mm)
> 	Returns the number of lockless pgtable walks running
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
>   arch/powerpc/mm/book3s64/mmu_context.c   |  1 +
>   arch/powerpc/mm/book3s64/pgtable.c       | 45 ++++++++++++++++++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 23b83d3593e2..13b006e7dde4 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -116,6 +116,9 @@ typedef struct {
>   	/* Number of users of the external (Nest) MMU */
>   	atomic_t copros;
>   
> +	/* Number of running instances of lockless pagetable walk*/
> +	atomic_t lockless_pgtbl_walk_count;
> +
>   	struct hash_mm_context *hash_context;
>   
>   	unsigned long vdso_base;
> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index 2d0cb5ba9a47..3dd01c0ca5be 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -200,6 +200,7 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>   #endif
>   	atomic_set(&mm->context.active_cpus, 0);
>   	atomic_set(&mm->context.copros, 0);
> +	atomic_set(&mm->context.lockless_pgtbl_walk_count, 0);
>   
>   	return 0;
>   }
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 7d0e0d0d22c4..6ba6195bff1b 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -98,6 +98,51 @@ void serialize_against_pte_lookup(struct mm_struct *mm)
>   	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
>   }
>   
> +/*
> + * Counting method to monitor lockless pagetable walks:
> + * Uses start_lockless_pgtbl_walk and end_lockless_pgtbl_walk to track the
> + * number of lockless pgtable walks happening, and
> + * running_lockless_pgtbl_walk to return this value.
> + */
> +
> +/* start_lockless_pgtbl_walk: Must be inserted before a function call that does
> + *   lockless pagetable walks, such as __find_linux_pte()
> + */
> +void start_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	atomic_inc(&mm->context.lockless_pgtbl_walk_count);
> +	/* Avoid reorder to garantee that the increment will happen before any
> +	 * part of the walkless pagetable walk after it.
> +	 */
> +	smp_mb();
> +}
> +EXPORT_SYMBOL(start_lockless_pgtbl_walk);
> +
> +/*
> + * end_lockless_pgtbl_walk: Must be inserted after the last use of a pointer
> + *   returned by a lockless pagetable walk, such as __find_linux_pte()
> +*/
> +void end_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	/* Avoid reorder to garantee that it will only decrement after the last
> +	 * use of the returned ptep from the lockless pagetable walk.
> +	 */
> +	smp_mb();
> +	atomic_dec(&mm->context.lockless_pgtbl_walk_count);
> +}
> +EXPORT_SYMBOL(end_lockless_pgtbl_walk);
> +
> +/*
> + * running_lockless_pgtbl_walk: Returns the number of lockless pagetable walks
> + *   currently running. If it returns 0, there is no running pagetable walk, and
> + *   THP split/collapse can be safely done. This can be used to avoid more
> + *   expensive approaches like serialize_against_pte_lookup()
> + */
> +int running_lockless_pgtbl_walk(struct mm_struct *mm)
> +{
> +	return atomic_read(&mm->context.lockless_pgtbl_walk_count);
> +}
> +
>   /*
>    * We use this to invalidate a pmdp entry before switching from a
>    * hugepte to regular pmd entry.
> 

Hi, Leonardo,

Can we please do it as shown below, instead (compile-tested only)?

This addresses all of the comments that I was going to make about structure
of this patch, which are:

* The lockless synch is tricky, so it should be encapsulated in function
   calls if possible.

* This is really a core mm function, so don't hide it away in arch layers.
   (If you're changing mm/ files, that's a big hint.)

* Other things need parts of this: gup.c needs the memory barriers; IMHO you'll
   be fixing a pre-existing, theoretical (we've never seen bug reports) problem.

* The documentation needs to accurately explain what's going on here.

(Not shown: one or more of the PPC Kconfig files should select
LOCKLESS_PAGE_TABLE_WALK_TRACKING.)

So:


diff --git a/include/linux/mm.h b/include/linux/mm.h
index 294a67b94147..c9e5defb4d7e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1541,6 +1541,9 @@ int account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc);
  int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
  			struct task_struct *task, bool bypass_rlim);
  
+void register_lockless_page_table_walker(unsigned long *flags);
+void deregister_lockless_page_table_walker(unsigned long *flags);
+
  /* Container for pinned pfns / pages */
  struct frame_vector {
  	unsigned int nr_allocated;	/* Number of frames we have space for */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5183e0d77dfa..83b7930a995f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -403,6 +403,16 @@ struct mm_struct {
  		 */
  		atomic_t mm_count;
  
+#ifdef LOCKLESS_PAGE_TABLE_WALK_TRACKING
+		/*
+		 * Number of callers who are doing a lockless walk of the
+		 * page tables. Typically arches might enable this in order to
+		 * help optimize performance, by possibly avoiding expensive
+		 * IPIs at the wrong times.
+		 */
+		atomic_t lockless_pgtbl_nr_walkers;
+#endif
+
  #ifdef CONFIG_MMU
  		atomic_long_t pgtables_bytes;	/* PTE page table pages */
  #endif
diff --git a/mm/Kconfig b/mm/Kconfig
index a5dae9a7eb51..1cf58f668fe1 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -736,4 +736,15 @@ config ARCH_HAS_PTE_SPECIAL
  config ARCH_HAS_HUGEPD
  	bool
  
+config LOCKLESS_PAGE_TABLE_WALK_TRACKING
+	bool "Tracking (and optimization) of lockless page table walkers"
+	default n
+
+	help
+	  Maintain a reference count of active lockless page table
+	  walkers. This adds 4 bytes to struct mm size, and two atomic
+	  operations to calls such as get_user_pages_fast(). Some
+	  architectures can optimize page table operations if this
+	  is enabled.
+
  endmenu
diff --git a/mm/gup.c b/mm/gup.c
index 60c3915c8ee6..7b1be8ed1e8f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2302,6 +2302,62 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
  }
  #endif
  
+/*
+ * register_lockless_page_table_walker() - start a lockless page table walk
+ *
+ * @flags: for saving and restoring irq state
+ *
+ * Lockless page table walking still requires synchronization against freeing
+ * of the page tables, and against splitting of huge pages. This is done by
+ * interacting with interrupts, as first described in the struct mmu_table_batch
+ * comments in include/asm-generic/tlb.h.
+ *
+ * In order to do the right thing, code that walks page tables in the style of
+ * get_user_pages_fast() should call register_lockless_page_table_walker()
+ * before starting the walk, and deregister_lockless_page_table_walker() upon
+ * finishing.
+ */
+void register_lockless_page_table_walker(unsigned long *flags)
+{
+#ifdef LOCKLESS_PAGE_TABLE_WALK_TRACKING
+	atomic_inc(&current->mm->lockless_pgtbl_nr_walkers);
+#endif
+	/*
+	 * This memory barrier pairs with any code that is either trying to
+	 * delete page tables, or split huge pages. In order for that to work,
+	 * interrupts must also be disabled during the lockless page table
+	 * walk. That's because the deleting or splitting involves flushing
+	 * TLBs, which in turn issues interrupts, which will block here.
+	 * However, without memory barriers, the page tables could be
+	 * read speculatively outside of interrupt disabling.
+	 */
+	smp_mb();
+	local_irq_save(*flags);
+}
+EXPORT_SYMBOL_GPL(gup_fast_lock_acquire);
+
+/*
+ * register_lockless_page_table_walker() - finish a lockless page table walk
+ *
+ * This is the complement to register_lockless_page_table_walker().
+ *
+ * @flags: for saving and restoring irq state
+ */
+void deregister_lockless_page_table_walker(unsigned long *flags)
+{
+	local_irq_restore(flags);
+	/*
+	 * This memory barrier pairs with any code that is either trying to
+	 * delete page tables, or split huge pages. See the comments in
+	 * gup_fast_lock_acquire() for details.
+	 */
+	smp_mb();
+#ifdef LOCKLESS_PAGE_TABLE_WALK_TRACKING
+	atomic_dec(&current->mm->lockless_pgtbl_nr_walkers);
+#endif
+}
+EXPORT_SYMBOL_GPL(gup_fast_lock_release);
+
  /*
   * Like get_user_pages_fast() except it's IRQ-safe in that it won't fall back to
   * the regular GUP.
@@ -2341,9 +2397,9 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
  
  	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
  	    gup_fast_permitted(start, end)) {
-		local_irq_save(flags);
+		register_lockless_page_table_walker(&flags);
  		gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
-		local_irq_restore(flags);
+		deregister_lockless_page_table_walker(&flags);
  	}
  
  	return nr;
@@ -2392,7 +2448,7 @@ static int __gup_longterm_unlocked(unsigned long start, int nr_pages,
  int get_user_pages_fast(unsigned long start, int nr_pages,
  			unsigned int gup_flags, struct page **pages)
  {
-	unsigned long addr, len, end;
+	unsigned long addr, len, end, flags;
  	int nr = 0, ret = 0;
  
  	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
@@ -2410,9 +2466,9 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
  
  	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
  	    gup_fast_permitted(start, end)) {
-		local_irq_disable();
+		register_lockless_page_table_walker(&flags);
  		gup_pgd_range(addr, end, gup_flags, pages, &nr);
-		local_irq_enable();
+		deregister_lockless_page_table_walker(&flags);
  		ret = nr;
  	}
  


thanks,
-- 
John Hubbard
NVIDIA
