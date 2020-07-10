Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8621ACED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 04:13:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2xR21kPrzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 12:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BoASjg5D; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2x523pzLzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 11:57:42 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id b9so1594591plx.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 18:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuNVeJNgy5mpkucMC/444QKJa8KYGoy9AAUByxslVr0=;
 b=BoASjg5DuB0JgJ/G9iM75j5066TvHrMOt03o2xV9i6pMNokjvc39C4RRiktgpOGDpj
 doX11205IDJ2VrLi+hwng0m6ABgVjNKqpQL8fhFw5B2J1gLI2JIoG704T6+BP64xHFiV
 oC1niasIHgPNHKmcbXkkm7jg1TSu+PYvG91YB+PNqEYITyWlWT4Td2P7rbTyPIeOSQ1p
 UhyJv744LdKzZvGoLMLwHiZ3d7BK5HhwyAmV8z/WA1ssGO44c/ay+9U5Tj75XkrkfkzJ
 E9mOxkFL6p9WWJnJl2n0ivM3zsrbM75wwFMUskppQkK7tJ4l0oImoRAKuPxJfJI9rV4E
 QqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuNVeJNgy5mpkucMC/444QKJa8KYGoy9AAUByxslVr0=;
 b=oDilTaEgRlvvrw0Vz4JhI0ZJLiUTbsFdwOMwCtWIbY/NseLTzaCdzEptqYRJe27cEA
 BURIKuoqpNWb6YGX1Cged4M/o7YLEWhgil9KiyYEmsG9CPwnj1lElvPdRKzvFdD/Kfug
 /Kg/69gU2ghO5uWo9wcC+AjqD17qvdFQggoWhTCr2fs5fWFAgoGe+NX08FK2ba0FeTTr
 T9KCeStaSg3mc7JG+3FLsSy3uMYY6PGDNgzi9BBByXNNaUBpHAvcwzA1aJnv7YWOymJx
 Qe0xJcSvO0nPJbeXtyAarDxCxObYCx+6ZkiPhj4akf9XnQZNia95C0T/30rXfiC9XfeA
 OLDg==
X-Gm-Message-State: AOAM533oTR8qC7WXeb2Arf+0ETd0p+48Egg0Ycg72BM9XdbWWYNZ4Lw3
 E0UW9SKBHQBFajqGVT0FsRiZkJQR
X-Google-Smtp-Source: ABdhPJyO+w0HBiEzqfRNFqWFAjyLUpISZ9zKyiEOCRhCmyS9AmC4eBitlltoelxlr5SRAGfnZKpe8g==
X-Received: by 2002:a17:902:6194:: with SMTP id
 u20mr58629926plj.333.1594346260530; 
 Thu, 09 Jul 2020 18:57:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-245-19-62.static.tpgi.com.au.
 [220.245.19.62])
 by smtp.gmail.com with ESMTPSA id 7sm3912834pgw.85.2020.07.09.18.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 18:57:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [RFC PATCH 7/7] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
Date: Fri, 10 Jul 2020 11:56:46 +1000
Message-Id: <20200710015646.2020871-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200710015646.2020871-1-npiggin@gmail.com>
References: <20200710015646.2020871-1-npiggin@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On big systems, the mm refcount can become highly contented when doing
a lot of context switching with threaded applications (particularly
switching between the idle thread and an application thread).

Abandoning lazy tlb slows switching down quite a bit in the important
user->idle->user cases, so so instead implement a non-refcounted scheme
that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
any remaining lazy ones.

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second. After this patch it goes up to 118 million.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig             | 16 ++++++++++++++++
 arch/powerpc/Kconfig     |  1 +
 include/linux/sched/mm.h |  6 +++---
 kernel/fork.c            | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2daf8fe6146a..edf69437a971 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -418,6 +418,22 @@ config MMU_LAZY_TLB
 	help
 	  Enable "lazy TLB" mmu context switching for kernel threads.
 
+config MMU_LAZY_TLB_REFCOUNT
+	def_bool y
+	depends on MMU_LAZY_TLB
+	depends on !MMU_LAZY_TLB_SHOOTDOWN
+
+config MMU_LAZY_TLB_SHOOTDOWN
+	bool
+	depends on MMU_LAZY_TLB
+	help
+	  Instead of refcounting the "lazy tlb" mm struct, which can cause
+	  contention with multi-threaded apps on large multiprocessor systems,
+	  this option causes __mmdrop to IPI all CPUs in the mm_cpumask and
+	  switch to init_mm if they were using the to-be-freed mm as the lazy
+	  tlb. Architectures which do not track all possible lazy tlb CPUs in
+	  mm_cpumask can not use this (without modification).
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 920c4e3ca4ef..24ac85c868db 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -225,6 +225,7 @@ config PPC
 	select HAVE_PERF_USER_STACK_DUMP
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_PAGE_SIZE
+	select MMU_LAZY_TLB_SHOOTDOWN
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 2c2b20e2ccc7..1067af8039bd 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -53,19 +53,19 @@ void mmdrop(struct mm_struct *mm);
 /* Helpers for lazy TLB mm refcounting */
 static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
 {
-	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
 		mmgrab(mm);
 }
 
 static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
 {
-	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
 		mmdrop(mm);
 }
 
 static inline void mmdrop_lazy_tlb_smp_mb(struct mm_struct *mm)
 {
-	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
 		mmdrop(mm); /* This depends on mmdrop providing a full smp_mb() */
 	else
 		smp_mb();
diff --git a/kernel/fork.c b/kernel/fork.c
index 142b23645d82..da0fba9e6079 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -685,6 +685,40 @@ static void check_mm(struct mm_struct *mm)
 #define allocate_mm()	(kmem_cache_alloc(mm_cachep, GFP_KERNEL))
 #define free_mm(mm)	(kmem_cache_free(mm_cachep, (mm)))
 
+static void do_shoot_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm = arg;
+
+	if (current->active_mm == mm) {
+		BUG_ON(current->mm);
+		switch_mm(mm, &init_mm, current);
+		current->active_mm = &init_mm;
+	}
+}
+
+static void do_check_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm = arg;
+
+	BUG_ON(current->active_mm == mm);
+}
+
+static void shoot_lazy_tlbs(struct mm_struct *mm)
+{
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
+		smp_call_function_many(mm_cpumask(mm), do_shoot_lazy_tlb, (void *)mm, 1);
+		do_shoot_lazy_tlb(mm);
+	}
+}
+
+static void check_lazy_tlbs(struct mm_struct *mm)
+{
+	if (IS_ENABLED(CONFIG_DEBUG_VM)) {
+		smp_call_function(do_check_lazy_tlb, (void *)mm, 1);
+		do_check_lazy_tlb(mm);
+	}
+}
+
 /*
  * Called when the last reference to the mm
  * is dropped: either by a lazy thread or by
@@ -695,6 +729,11 @@ void __mmdrop(struct mm_struct *mm)
 	BUG_ON(mm == &init_mm);
 	WARN_ON_ONCE(mm == current->mm);
 	WARN_ON_ONCE(mm == current->active_mm);
+
+	/* Ensure no CPUs are using this as their lazy tlb mm */
+	shoot_lazy_tlbs(mm);
+	check_lazy_tlbs(mm);
+
 	mm_free_pgd(mm);
 	destroy_context(mm);
 	mmu_notifier_subscriptions_destroy(mm);
-- 
2.23.0

