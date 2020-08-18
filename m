Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11D247CF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 05:38:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVxTQ24DSzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 13:38:34 +1000 (AEST)
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
 header.s=20161025 header.b=uRdD8KLt; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVxNY0x40zDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 13:34:20 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id c10so8770542pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5NIMSla2q4H4CYrgEoypiSInrv82zNsRbmwKfnLv98=;
 b=uRdD8KLtueArRi5YgefMeJDNmk3262hrEcmU4d2F6wq++v7Ma9rUefUixF2COxCtLc
 td5Rwz0puO391VwBccL0iLXviBugIL3u84rPg8rn+K+h4YofYGJhIsC8G6APa8gVgzX5
 2APhZ1DyLJRboh/HWU4dTWnJYXK0nLTNC8tH9fSFizTp9Ip7QLOgDFv0zUDT46SeFoAc
 yQStkqIILuLhbKNuf8KDIetfzrKboLdpW02QzOvqhM0RvSPIi0r7Wmlh/Nq4Q+AJ0A6q
 Tfg69C3isdqL8HsOzA8eHcZZF6FPHrfmwUviJRUc1g0N2OtBxFLf7tCrbRwIxKg42dX/
 ZzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5NIMSla2q4H4CYrgEoypiSInrv82zNsRbmwKfnLv98=;
 b=tHVQaC9P8YnGEgBPQPzwvkWVBzdfNl0kULDHhHxkxeBuhXe7s0QBYtRC9caKsuXNGa
 VYq0cVjUJI4uW1vFxJXu2CiF3Vo3h+62cyF6zvdG657w8cCNHmUHRHBqP3X/IojjBlGz
 224Qwcb4iK9l6fcmE4WpHFvp38XDODqQQpdwZ5eHYHzVzsMjjX5NGs3PiEYAJvHYFRHi
 /o+9WjKhfRip5DNrcluE1HkiCgfPmhcZQDfWoD1e7YHX9MFFWLcCz/pHLYMy/eAzB9Cq
 x5yJ0CYJ2hkvzOqtp42XtLTnYeO/TdjyhrvorKd20MQYMGlYX0BxLb8SR/JqgSeH50fm
 9htA==
X-Gm-Message-State: AOAM531w3+1TaXRtkbCJj1oMqPBx0R+gy1HJWBQJ+OOuS6Z9BJ8VRpSx
 5rCdt7SjNfL/KrebtvLBP90=
X-Google-Smtp-Source: ABdhPJy6d0Cu933mn+84pD243uhmVtbLS27aP0ei6qwpVknrf2wE9OmynUNrAFXe9REc+s5VjsOUuA==
X-Received: by 2002:a17:90a:4214:: with SMTP id
 o20mr4177105pjg.232.1597721658610; 
 Mon, 17 Aug 2020 20:34:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-193-175.tpgi.com.au.
 [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id b18sm19823352pgj.12.2020.08.17.20.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 20:34:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH 2/2] powerpc/64s/radix: Fix mm_cpumask trimming race vs
 kthread_use_mm
Date: Tue, 18 Aug 2020 13:34:05 +1000
Message-Id: <20200818033405.170457-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200818033405.170457-1-npiggin@gmail.com>
References: <20200818033405.170457-1-npiggin@gmail.com>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 0cef77c7798a7 ("powerpc/64s/radix: flush remote CPUs out of
single-threaded mm_cpumask") added a mechanism to trim the mm_cpumask of
a process under certain conditions. One of the assumptions is that
mm_users would not be incremented via a reference outside the process
context with mmget_not_zero() then go on to kthread_use_mm() via that
reference.

That invariant was broken by io_uring code (see previous sparc64 fix),
but I'll point Fixes: to the original powerpc commit because we are
changing that assumption going forward, so this will make backports
match up.

Fix this by no longer relying on that assumption, but by having each CPU
check the mm is not being used, and clearing their own bit from the mask
if it's okay. This relies on commit 38cf307c1f20 ("mm: fix
kthread_use_mm() vs TLB invalidate") to disable irqs over the mm switch.

Fixes: 0cef77c7798a7 ("powerpc/64s/radix: flush remote CPUs out of single-threaded mm_cpumask")
not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/tlb.h       | 13 -------------
 arch/powerpc/mm/book3s64/radix_tlb.c | 23 ++++++++++++++++-------
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index fbc6f3002f23..d97f061fecac 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -66,19 +66,6 @@ static inline int mm_is_thread_local(struct mm_struct *mm)
 		return false;
 	return cpumask_test_cpu(smp_processor_id(), mm_cpumask(mm));
 }
-static inline void mm_reset_thread_local(struct mm_struct *mm)
-{
-	WARN_ON(atomic_read(&mm->context.copros) > 0);
-	/*
-	 * It's possible for mm_access to take a reference on mm_users to
-	 * access the remote mm from another thread, but it's not allowed
-	 * to set mm_cpumask, so mm_users may be > 1 here.
-	 */
-	WARN_ON(current->mm != mm);
-	atomic_set(&mm->context.active_cpus, 1);
-	cpumask_clear(mm_cpumask(mm));
-	cpumask_set_cpu(smp_processor_id(), mm_cpumask(mm));
-}
 #else /* CONFIG_PPC_BOOK3S_64 */
 static inline int mm_is_thread_local(struct mm_struct *mm)
 {
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 0d233763441f..a421a0e3f930 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -645,19 +645,29 @@ static void do_exit_flush_lazy_tlb(void *arg)
 	struct mm_struct *mm = arg;
 	unsigned long pid = mm->context.id;
 
+	/*
+	 * A kthread could have done a mmget_not_zero() after the flushing CPU
+	 * checked mm_users == 1, and be in the process of kthread_use_mm when
+	 * interrupted here. In that case, current->mm will be set to mm,
+	 * because kthread_use_mm() setting ->mm and switching to the mm is
+	 * done with interrupts off.
+	 */
 	if (current->mm == mm)
-		return; /* Local CPU */
+		goto out_flush;
 
 	if (current->active_mm == mm) {
-		/*
-		 * Must be a kernel thread because sender is single-threaded.
-		 */
-		BUG_ON(current->mm);
+		WARN_ON_ONCE(current->mm != NULL);
+		/* Is a kernel thread and is using mm as the lazy tlb */
 		mmgrab(&init_mm);
-		switch_mm(mm, &init_mm, current);
 		current->active_mm = &init_mm;
+		switch_mm_irqs_off(mm, &init_mm, current);
 		mmdrop(mm);
 	}
+
+	atomic_dec(&mm->context.active_cpus);
+	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(mm));
+
+out_flush:
 	_tlbiel_pid(pid, RIC_FLUSH_ALL);
 }
 
@@ -672,7 +682,6 @@ static void exit_flush_lazy_tlbs(struct mm_struct *mm)
 	 */
 	smp_call_function_many(mm_cpumask(mm), do_exit_flush_lazy_tlb,
 				(void *)mm, 1);
-	mm_reset_thread_local(mm);
 }
 
 void radix__flush_tlb_mm(struct mm_struct *mm)
-- 
2.23.0

