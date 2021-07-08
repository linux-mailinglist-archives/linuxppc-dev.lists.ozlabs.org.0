Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B823BF739
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 11:06:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GL9Q96VLhz3bl8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 19:06:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qZH+SEJJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qZH+SEJJ; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GL9Ph2Vn3z2yXt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 19:05:59 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id a2so5264550pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jul 2021 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Atfy8oMsvtFLCjg1qLq522WoJI19QujsuyESGKjbdI=;
 b=qZH+SEJJu3HZF4PGAnMk4cPSMvIJXBP75VzDGqKIgFLSDA2zYRtibDBgV1ybOuKueT
 Jaf0MD4ouKGbGJDWdt7nX/EuMVY6OdfLXrHCUciIbMKAwH7VXvEyARTbusJNp364xCFB
 5c67zsi2XfYH344U93pHfkoCYUHLtu7rGZOEs21iMpZq7DT1OmdtrNzRxCMFzoaImxRD
 isYVLko7eVYYolhBqZvqqKHDT23Il4RFZGwCO5UeSHWPfCrFX9ANg0sXr7N8xGRP4WBK
 xM28J3iJdfYQuqeSvewLj3GZIAOjjFto3Ht8hzv9oSRDjktHbSKx3Qk4E54+A5TXCATe
 a4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Atfy8oMsvtFLCjg1qLq522WoJI19QujsuyESGKjbdI=;
 b=iglWUQNz9KjjO05bH9iIZ/0As58vNzAfbXIh6kN6HMUwyW2DUw+Bc5GWVN20FWnlX7
 mF3QPFk0t/pS4G/i8A4BZQoHJPGPCuAX/FSDVMXOa5QmgclTriFRQczyhWdmBwPmB6Ol
 nVubhj6oW5MLjLTWILga1/fCzClSFYhPMXxYoXlRBFaA/QqRm9YGo3jSwzI4eQVk6Sew
 fMXef62fez31sp+6LgGxV7I2C5qm7Pq++XLddwu2kIpbycMV9pCpmtROVLqVyg848XOn
 WCwQcyn0mt6JEpzMCwqziM4WbFiLF4CHTerfIJrHmXChETg241naP5ezSTwukgkGFORp
 HDbg==
X-Gm-Message-State: AOAM532bii1qEXFbVl8YyI6znOoVm8p3rj0QIfInh8ukE8aAdRg1VSkc
 ksMgTgA/mSkp6wvRaSI3j1I9t8OSmkA=
X-Google-Smtp-Source: ABdhPJylTgIa0Wg/D51J2eKC1HwQc12heZg6ceIkDx5vDLxO9x3HTWVQjcP8PIZAAZ04AayINeEuzg==
X-Received: by 2002:aa7:96cc:0:b029:327:c196:d22a with SMTP id
 h12-20020aa796cc0000b0290327c196d22amr1984002pfq.47.1625735155548; 
 Thu, 08 Jul 2021 02:05:55 -0700 (PDT)
Received: from bobo.ibm.com (14-203-186-173.tpgi.com.au. [14.203.186.173])
 by smtp.gmail.com with ESMTPSA id b67sm2426927pga.37.2021.07.08.02.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 02:05:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/hash: Fix SLB preload cache vs kthread_use_mm
Date: Thu,  8 Jul 2021 19:05:49 +1000
Message-Id: <20210708090549.77975-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>,
 "Christopher M . Riedl" <cmr@codefail.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's possible for kernel threads to pick up SLB preload entries if
they are accessing userspace with kthread_use_mm. If the kthread
later is context switched while using a different mm, when it is
switched back it could preload SLBs belonging to the previous mm.

This could lead to data corruption, leaks, SLB multi hits, etc.

In the absence of a usable hook to clear preloads when unusing an
mm, fix it by keeping track of the mm that the preloads belong to.

Adjust the isync() comment to be clear it can't be skipped if we
had no preloads.

Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/thread_info.h |  1 +
 arch/powerpc/mm/book3s64/slb.c         | 36 ++++++++++++++++++--------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index b4ec6c7dd72e..c3de13dde2af 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -54,6 +54,7 @@ struct thread_info {
 #if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC32)
 	struct cpu_accounting_data accounting;
 #endif
+	struct mm_struct *slb_preload_mm;
 	unsigned char slb_preload_nr;
 	unsigned char slb_preload_tail;
 	u32 slb_preload_esid[SLB_PRELOAD_NR];
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c91bd85eb90e..4f9dbce0dd84 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -294,11 +294,20 @@ static bool preload_hit(struct thread_info *ti, unsigned long esid)
 	return false;
 }
 
-static bool preload_add(struct thread_info *ti, unsigned long ea)
+static bool preload_add(struct thread_info *ti, struct mm_struct *mm, unsigned long ea)
 {
 	unsigned char idx;
 	unsigned long esid;
 
+	if (unlikely(ti->slb_preload_mm != mm)) {
+		/*
+		 * kthread_use_mm or other temporary mm switching can
+		 * change the mm being used by a particular thread.
+		 */
+		ti->slb_preload_nr = 0;
+		ti->slb_preload_mm = mm;
+	}
+
 	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
 		/* EAs are stored >> 28 so 256MB segments don't need clearing */
 		if (ea & ESID_MASK_1T)
@@ -362,13 +371,13 @@ void slb_setup_new_exec(void)
 	 * 0x10000000 so it makes sense to preload this segment.
 	 */
 	if (!is_kernel_addr(exec)) {
-		if (preload_add(ti, exec))
+		if (preload_add(ti, mm, exec))
 			slb_allocate_user(mm, exec);
 	}
 
 	/* Libraries and mmaps. */
 	if (!is_kernel_addr(mm->mmap_base)) {
-		if (preload_add(ti, mm->mmap_base))
+		if (preload_add(ti, mm, mm->mmap_base))
 			slb_allocate_user(mm, mm->mmap_base);
 	}
 
@@ -394,19 +403,19 @@ void preload_new_slb_context(unsigned long start, unsigned long sp)
 
 	/* Userspace entry address. */
 	if (!is_kernel_addr(start)) {
-		if (preload_add(ti, start))
+		if (preload_add(ti, mm, start))
 			slb_allocate_user(mm, start);
 	}
 
 	/* Top of stack, grows down. */
 	if (!is_kernel_addr(sp)) {
-		if (preload_add(ti, sp))
+		if (preload_add(ti, mm, sp))
 			slb_allocate_user(mm, sp);
 	}
 
 	/* Bottom of heap, grows up. */
 	if (heap && !is_kernel_addr(heap)) {
-		if (preload_add(ti, heap))
+		if (preload_add(ti, mm, heap))
 			slb_allocate_user(mm, heap);
 	}
 
@@ -502,6 +511,11 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 
 	copy_mm_to_paca(mm);
 
+	if (unlikely(ti->slb_preload_mm != mm)) {
+		ti->slb_preload_nr = 0;
+		ti->slb_preload_mm = mm;
+	}
+
 	/*
 	 * We gradually age out SLBs after a number of context switches to
 	 * reduce reload overhead of unused entries (like we do with FP/VEC
@@ -513,7 +527,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 		unsigned long pc = KSTK_EIP(tsk);
 
 		preload_age(ti);
-		preload_add(ti, pc);
+		preload_add(ti, mm, pc);
 	}
 
 	for (i = 0; i < ti->slb_preload_nr; i++) {
@@ -527,9 +541,9 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	}
 
 	/*
-	 * Synchronize slbmte preloads with possible subsequent user memory
-	 * address accesses by the kernel (user mode won't happen until
-	 * rfid, which is safe).
+	 * Synchronize slbias and slbmte preloads with possible subsequent user
+	 * memory address accesses by the kernel (user mode won't happen until
+	 * rfid, which is synchronizing).
 	 */
 	isync();
 }
@@ -863,7 +877,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 
 		err = slb_allocate_user(mm, ea);
 		if (!err)
-			preload_add(current_thread_info(), ea);
+			preload_add(current_thread_info(), mm, ea);
 
 		return err;
 	}
-- 
2.23.0

