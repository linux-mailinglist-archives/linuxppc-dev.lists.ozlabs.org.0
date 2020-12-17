Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F82DD286
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 15:00:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYYP0kWyzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 01:00:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d1KenFcG; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGj22h2zDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:57 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id s2so15162006plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AmzJPGElmJ2O21RoQOcPbH80sR4AK9QigqzBAupG7Q8=;
 b=d1KenFcGAOh80J5p+UHGSBSZ+67+vCe/Lrmqlk19eiywHY7T/X9MGWuwx1cIQDo+Q+
 so3BbQvEkYUrD3rWxsJEJFyH1FAE1zx8aqOe074ThEjo1IRcyRKuQzSoSJuvU8rzcwoq
 ySYN7pHHrgDo/pI7AX1z+QmqcnXWTSE8GRMoc3x40XKUNBR0fyMQHgvMAYyICBezBBBK
 RQcqPI0+gGdTQfGN8WwL6t7bSQrz+l5xfaJ9AHJYSkmjR5p8inwt2KHOSuFdNSHdcVoO
 gHa5vE9KHnCpQt5I/k/Z5okuhMb1/l+UzWRzl/5U4znYMYCGqbsjqXEZa7Un8q0bTfLF
 HKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AmzJPGElmJ2O21RoQOcPbH80sR4AK9QigqzBAupG7Q8=;
 b=dEr/AH1ju6I/NChjF37GNGVFoR83JTOF9nLjR1znx3iMt5SEW6ozFSez11Q6zF2eI2
 R+BA05UD+QTUbYjTreTnxsZwVlNJH59QRg3JC8+PwIWC2XpxqoP8xhQf7As1Qnv9/UYO
 IBZTjmfZMNTPdmNEs+7l1ZHDlWrwrOv+IvKQcGYQNqdr6Qg2kPSbgI1fGXlxYj1hcLxd
 40MukQeR/j3S2UBKruc+B2+MPGXxttafeCtKj3PO+baTZ1tWCq4JqnETXS9wDvZYObr4
 +5iIm8l6jNQIA/TEsA7SOgP+XaZ6JcT5wz/N0RP7p+95mrAnIiyrzWzeYTJzy/WUtOeO
 CW9A==
X-Gm-Message-State: AOAM532sY9UyX2xGJYC78b6o2j+naP4vcbJXF+OF4aViviRqHdZzmr6c
 qowInUL+1DkJsuGx1KZMWYLRSMxdZ7Fb9Q==
X-Google-Smtp-Source: ABdhPJw1f+D4A5JyEtty5OhfL/hzlnyyOq/ta1C74fX33Lonuvt6qLjvRdXOTocg9WbVPi2qmKSCgQ==
X-Received: by 2002:a17:90a:c910:: with SMTP id
 v16mr8129833pjt.198.1608212874581; 
 Thu, 17 Dec 2020 05:47:54 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] powerpc/64s/radix: serialize_against_pte_lookup IPIs trim
 mm_cpumask
Date: Thu, 17 Dec 2020 23:47:30 +1000
Message-Id: <20201217134731.488135-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201217134731.488135-1-npiggin@gmail.com>
References: <20201217134731.488135-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

serialize_against_pte_lookup() performs IPIs to all CPUs in mm_cpumask.
Take this opportunity to try trim the CPU out of mm_cpumask. This can
reduce the cost of future serialize_against_pte_lookup() and/or the
cost of future TLB flushes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/pgtable.c   | 13 ++++++++++---
 arch/powerpc/mm/book3s64/radix_tlb.c | 20 +++++++++++++-------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index e18ae50a275c..ec23faf102b2 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -79,10 +79,17 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
-static void do_nothing(void *unused)
-{
+void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
 
+static void do_serialize(void *arg)
+{
+	/* We've taken the IPI, so try to trim the mask while here */
+	if (radix_enabled()) {
+		struct mm_struct *mm = arg;
+		exit_lazy_flush_tlb(mm, false);
+	}
 }
+
 /*
  * Serialize against find_current_mm_pte which does lock-less
  * lookup in page tables with local interrupts disabled. For huge pages
@@ -96,7 +103,7 @@ static void do_nothing(void *unused)
 void serialize_against_pte_lookup(struct mm_struct *mm)
 {
 	smp_mb();
-	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
+	smp_call_function_many(mm_cpumask(mm), do_serialize, mm, 1);
 }
 
 /*
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4dca7cbf07e9..d04c80d6f52c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -630,7 +630,11 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
 	return false;
 }
 
-static void exit_lazy_flush_tlb(struct mm_struct *mm)
+/*
+ * If always_flush is true, then flush even if this CPU can't be removed
+ * from mm_cpumask.
+ */
+void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 {
 	unsigned long pid = mm->context.id;
 	int cpu = smp_processor_id();
@@ -643,7 +647,7 @@ static void exit_lazy_flush_tlb(struct mm_struct *mm)
 	 * done with interrupts off.
 	 */
 	if (current->mm == mm)
-		goto out_flush;
+		goto out;
 
 	if (current->active_mm == mm) {
 		WARN_ON_ONCE(current->mm != NULL);
@@ -665,17 +669,19 @@ static void exit_lazy_flush_tlb(struct mm_struct *mm)
 	if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {
 		atomic_dec(&mm->context.active_cpus);
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
+		always_flush = true;
 	}
 
-out_flush:
-	_tlbiel_pid(pid, RIC_FLUSH_ALL);
+out:
+	if (always_flush)
+		_tlbiel_pid(pid, RIC_FLUSH_ALL);
 }
 
 #ifdef CONFIG_SMP
 static void do_exit_flush_lazy_tlb(void *arg)
 {
 	struct mm_struct *mm = arg;
-	exit_lazy_flush_tlb(mm);
+	exit_lazy_flush_tlb(mm, true);
 }
 
 static void exit_flush_lazy_tlbs(struct mm_struct *mm)
@@ -737,7 +743,7 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 			 * to trim.
 			 */
 			if (tick_and_test_trim_clock()) {
-				exit_lazy_flush_tlb(mm);
+				exit_lazy_flush_tlb(mm, true);
 				return FLUSH_TYPE_NONE;
 			}
 		}
@@ -783,7 +789,7 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 		if (current->mm == mm)
 			return FLUSH_TYPE_LOCAL;
 		if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
-			exit_lazy_flush_tlb(mm);
+			exit_lazy_flush_tlb(mm, true);
 		return FLUSH_TYPE_NONE;
 	}
 
-- 
2.23.0

