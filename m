Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB822683E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 07:00:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqZ1070mXzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 15:00:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lm4Mggd2; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqYrl0fyszDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 14:52:54 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id o16so4813597pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BsgBvEdcPlC4FOpZ0B4ZRJc7oZi/0lTX9jrx1MeIFsE=;
 b=lm4Mggd2pzqrGBMVYnKwM7b/EYs+tQEgSODr69h0iLSy8WoVDZK4CDne8dWpI9DpM6
 D7lHzUn1CY1LOkA3CpZ/wATmlG5/iwf0Wkf5TtwYG9G4Usond68GfMqQA4O898mUIaeR
 3zIjx82y1PSgmAO26tZtmQ0n5flDErynkErvw5Lejp/HbFchEBel+ZXI5a5yAcs8DBAN
 YRPyFl1OkgYqPFNp6tr/WKTXbnVpTecPa0/OAopkNhdqBzqHeAKxUoLP2ODmdTkjHSwD
 ZlwklUEpqRI97FeYUv0aDOxgxM9ruMntwNpm9kf3/e7pKQBU+eM9UBVlO1C9BfETCUoJ
 JUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BsgBvEdcPlC4FOpZ0B4ZRJc7oZi/0lTX9jrx1MeIFsE=;
 b=ueUQ8PnRKptDOEWrYHvx3DgDu4qAX8CVms8MiQkIednBydONSoUUERA1l84hpbDFcV
 WAaVUKr0MwiyZIY3RILJ3BA4piemH0A/e4A0fEfs/x6QXGjsHI0vGy64X4Y4EVuasOS+
 xfkG1gGsIlyagcysPjMlvxfoxQDtN8V1nMnp3xPaViZZ8lwpsHTyOxBpTRqOSL8NLRIo
 LS+78/6f7MxAyWM+6Ok2qyOtorE+nI3bJPta6PKBXwNOVIscBszOZ2w1f6y6dR61HAFE
 oK4hfMpjgm5Cjy93RIPHATGkgQpEqHPxX6Uv0NAvFD6XyySM6gYax2lJiO10+Sp/hHPz
 LjaA==
X-Gm-Message-State: AOAM532y4dUXXdamICUptzlxCFCpBD6LJT78tYLAiyz3DmhvG570Crfc
 fzGzb7/rgnoMC1/CvWPovCkJhwpvNVI=
X-Google-Smtp-Source: ABdhPJx3KPGLeRQoSE8dRCssQcbtGYQHCGhUf48Xq9kBcMqMZXfkcdYWdvgTWFqkpt5j1OQSPOfkNQ==
X-Received: by 2002:a17:90b:3708:: with SMTP id
 mg8mr12159476pjb.39.1600059170766; 
 Sun, 13 Sep 2020 21:52:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id a13sm6945312pgq.41.2020.09.13.21.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 21:52:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>
Subject: [PATCH v2 3/4] sparc64: remove mm_cpumask clearing to fix
 kthread_use_mm race
Date: Mon, 14 Sep 2020 14:52:18 +1000
Message-Id: <20200914045219.3736466-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200914045219.3736466-1-npiggin@gmail.com>
References: <20200914045219.3736466-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The de facto (and apparently uncommented) standard for using an mm had,
thanks to this code in sparc if nothing else, been that you must have a
reference on mm_users *and that reference must have been obtained with
mmget()*, i.e., from a thread with a reference to mm_users that had used
the mm.

The introduction of mmget_not_zero() in commit d2005e3f41d4
("userfaultfd: don't pin the user memory in userfaultfd_file_create()")
allowed mm_count holders to aoperate on user mappings asynchronously
from the actual threads using the mm, but they were not to load those
mappings into their TLB (i.e., walking vmas and page tables is okay,
kthread_use_mm() is not).

io_uring 2b188cc1bb857 ("Add io_uring IO interface") added code which
does a kthread_use_mm() from a mmget_not_zero() refcount.

The problem with this is code which previously assumed mm == current->mm
and mm->mm_users == 1 implies the mm will remain single-threaded at
least until this thread creates another mm_users reference, has now
broken.

arch/sparc/kernel/smp_64.c:

    if (atomic_read(&mm->mm_users) == 1) {
        cpumask_copy(mm_cpumask(mm), cpumask_of(cpu));
        goto local_flush_and_out;
    }

vs fs/io_uring.c

    if (unlikely(!(ctx->flags & IORING_SETUP_SQPOLL) ||
                 !mmget_not_zero(ctx->sqo_mm)))
        return -EFAULT;
    kthread_use_mm(ctx->sqo_mm);

mmget_not_zero() could come in right after the mm_users == 1 test, then
kthread_use_mm() which sets its CPU in the mm_cpumask. That update could
be lost if cpumask_copy() occurs afterward.

I propose we fix this by allowing mmget_not_zero() to be a first-class
reference, and not have this obscure undocumented and unchecked
restriction.

The basic fix for sparc64 is to remove its mm_cpumask clearing code. The
optimisation could be effectively restored by sending IPIs to mm_cpumask
members and having them remove themselves from mm_cpumask. This is more
tricky so I leave it as an exercise for someone with a sparc64 SMP.
powerpc has a (currently similarly broken) example.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/sparc/kernel/smp_64.c | 65 ++++++++------------------------------
 1 file changed, 14 insertions(+), 51 deletions(-)

diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index e286e2badc8a..e38d8bf454e8 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1039,38 +1039,9 @@ void smp_fetch_global_pmu(void)
  * are flush_tlb_*() routines, and these run after flush_cache_*()
  * which performs the flushw.
  *
- * The SMP TLB coherency scheme we use works as follows:
- *
- * 1) mm->cpu_vm_mask is a bit mask of which cpus an address
- *    space has (potentially) executed on, this is the heuristic
- *    we use to avoid doing cross calls.
- *
- *    Also, for flushing from kswapd and also for clones, we
- *    use cpu_vm_mask as the list of cpus to make run the TLB.
- *
- * 2) TLB context numbers are shared globally across all processors
- *    in the system, this allows us to play several games to avoid
- *    cross calls.
- *
- *    One invariant is that when a cpu switches to a process, and
- *    that processes tsk->active_mm->cpu_vm_mask does not have the
- *    current cpu's bit set, that tlb context is flushed locally.
- *
- *    If the address space is non-shared (ie. mm->count == 1) we avoid
- *    cross calls when we want to flush the currently running process's
- *    tlb state.  This is done by clearing all cpu bits except the current
- *    processor's in current->mm->cpu_vm_mask and performing the
- *    flush locally only.  This will force any subsequent cpus which run
- *    this task to flush the context from the local tlb if the process
- *    migrates to another cpu (again).
- *
- * 3) For shared address spaces (threads) and swapping we bite the
- *    bullet for most cases and perform the cross call (but only to
- *    the cpus listed in cpu_vm_mask).
- *
- *    The performance gain from "optimizing" away the cross call for threads is
- *    questionable (in theory the big win for threads is the massive sharing of
- *    address space state across processors).
+ * mm->cpu_vm_mask is a bit mask of which cpus an address
+ * space has (potentially) executed on, this is the heuristic
+ * we use to limit cross calls.
  */
 
 /* This currently is only used by the hugetlb arch pre-fault
@@ -1080,18 +1051,13 @@ void smp_fetch_global_pmu(void)
 void smp_flush_tlb_mm(struct mm_struct *mm)
 {
 	u32 ctx = CTX_HWBITS(mm->context);
-	int cpu = get_cpu();
 
-	if (atomic_read(&mm->mm_users) == 1) {
-		cpumask_copy(mm_cpumask(mm), cpumask_of(cpu));
-		goto local_flush_and_out;
-	}
+	get_cpu();
 
 	smp_cross_call_masked(&xcall_flush_tlb_mm,
 			      ctx, 0, 0,
 			      mm_cpumask(mm));
 
-local_flush_and_out:
 	__flush_tlb_mm(ctx, SECONDARY_CONTEXT);
 
 	put_cpu();
@@ -1114,17 +1080,15 @@ void smp_flush_tlb_pending(struct mm_struct *mm, unsigned long nr, unsigned long
 {
 	u32 ctx = CTX_HWBITS(mm->context);
 	struct tlb_pending_info info;
-	int cpu = get_cpu();
+
+	get_cpu();
 
 	info.ctx = ctx;
 	info.nr = nr;
 	info.vaddrs = vaddrs;
 
-	if (mm == current->mm && atomic_read(&mm->mm_users) == 1)
-		cpumask_copy(mm_cpumask(mm), cpumask_of(cpu));
-	else
-		smp_call_function_many(mm_cpumask(mm), tlb_pending_func,
-				       &info, 1);
+	smp_call_function_many(mm_cpumask(mm), tlb_pending_func,
+			       &info, 1);
 
 	__flush_tlb_pending(ctx, nr, vaddrs);
 
@@ -1134,14 +1098,13 @@ void smp_flush_tlb_pending(struct mm_struct *mm, unsigned long nr, unsigned long
 void smp_flush_tlb_page(struct mm_struct *mm, unsigned long vaddr)
 {
 	unsigned long context = CTX_HWBITS(mm->context);
-	int cpu = get_cpu();
 
-	if (mm == current->mm && atomic_read(&mm->mm_users) == 1)
-		cpumask_copy(mm_cpumask(mm), cpumask_of(cpu));
-	else
-		smp_cross_call_masked(&xcall_flush_tlb_page,
-				      context, vaddr, 0,
-				      mm_cpumask(mm));
+	get_cpu();
+
+	smp_cross_call_masked(&xcall_flush_tlb_page,
+			      context, vaddr, 0,
+			      mm_cpumask(mm));
+
 	__flush_tlb_page(context, vaddr);
 
 	put_cpu();
-- 
2.23.0

