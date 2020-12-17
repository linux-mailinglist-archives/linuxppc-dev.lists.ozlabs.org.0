Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A92DD27E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:58:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYVm6KqRzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 00:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cXHVXq0Z; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGg2Y4BzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:55 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id g18so20383275pgk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvGdw7roJHlZ+mmfvwqxHkWwraGPMXO8QEMbB94qqVE=;
 b=cXHVXq0ZZ2eGtXIEHLouPlkKC8neHuZeDoPY7lsHjd+LbvY4FEbHm5OaFiaNUS18E4
 w/o2y/5GJIj+1Mo61BEOFCl27Gf38fKNq46NcBGRiDxF+nvFwyhIWZZbt6GVH0+EhAIy
 +oePotKikg3pRr//M2GpRcRN2u6F43vgiyuqt/jEnRC474do6CmjdBD37EJPGyM/Ue57
 aNo3taq6KG88YO+mPiIw7eBSUF1pZsQDg1ZijPdPS5A06IKSFmxSHyoT82AzldoM1Ou1
 JDNRobQh1Sa6t9Fx7zBLQjShq3PzCiIeULq2jfBpWI4Bt2NqwkCxsALahEzGV9urv7p+
 NDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvGdw7roJHlZ+mmfvwqxHkWwraGPMXO8QEMbB94qqVE=;
 b=NxF6BFcS6qG0nurr0c0TndV91lAem2/R0Q4nd3iK39crqAmUCl/5a9e6pPEXjRy77s
 Vr1MB11TglgSWAVAlCFwgk0zsVw9Ng9woBQ7zuf7TA2sbcil5xoCWPWcleuXfearZ4uA
 WIHNW7dT/181SJ6Ju2SPHp8JCbgffhe5LEGZ9tYstS4bl4rziqMsCYCmi9TztH70XdkR
 qBDa3eDAKmq39g5OjsR9OVOk+2qdNzMKDdG2jwlM++Kp1B8QHPs9J8Zjrdk3SGCRz7bY
 d5mlyW1B4W857Vq1cSL6R2dsyuTo9M0ZFwePTAqvhFhPFWNmCRPd3gJfj33hQdFG4Sbj
 pU1A==
X-Gm-Message-State: AOAM531YtZDOsjz5yI9x/c7dbKFceMz4S4gSI01NmtsmPo9NY/iBjnb8
 fwNIy//C0zF6rBzeR0Buy+IqvsI+S/gClg==
X-Google-Smtp-Source: ABdhPJz+AXu3Vm5/XjSkozOwtswA+BHpM+tLDjqojUhdXkNpUfpblC3u2N01EU2hNkF5zTL0nX6jbQ==
X-Received: by 2002:a62:7a91:0:b029:19e:55db:9ddc with SMTP id
 v139-20020a627a910000b029019e55db9ddcmr36867122pfc.68.1608212871742; 
 Thu, 17 Dec 2020 05:47:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] powerpc/64s/radix: occasionally attempt to trim mm_cpumask
Date: Thu, 17 Dec 2020 23:47:29 +1000
Message-Id: <20201217134731.488135-6-npiggin@gmail.com>
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

A single-threaded process that is flushing its own address space is
so far the only case where the mm_cpumask is attempted to be trimmed.
This patch expands that to flush in other situations, multi-threaded
processes and external sources. For now it's a relatively simple
occasional trim attempt. The main aim is to add the mechanism,
tweaking and tuning can come with more data.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 60 ++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7b199bee4baa..4dca7cbf07e9 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -630,10 +630,8 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
 	return false;
 }
 
-#ifdef CONFIG_SMP
-static void do_exit_flush_lazy_tlb(void *arg)
+static void exit_lazy_flush_tlb(struct mm_struct *mm)
 {
-	struct mm_struct *mm = arg;
 	unsigned long pid = mm->context.id;
 	int cpu = smp_processor_id();
 
@@ -673,6 +671,13 @@ static void do_exit_flush_lazy_tlb(void *arg)
 	_tlbiel_pid(pid, RIC_FLUSH_ALL);
 }
 
+#ifdef CONFIG_SMP
+static void do_exit_flush_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm = arg;
+	exit_lazy_flush_tlb(mm);
+}
+
 static void exit_flush_lazy_tlbs(struct mm_struct *mm)
 {
 	/*
@@ -685,10 +690,32 @@ static void exit_flush_lazy_tlbs(struct mm_struct *mm)
 	smp_call_function_many(mm_cpumask(mm), do_exit_flush_lazy_tlb,
 				(void *)mm, 1);
 }
+
 #else /* CONFIG_SMP */
 static inline void exit_flush_lazy_tlbs(struct mm_struct *mm) { }
 #endif /* CONFIG_SMP */
 
+static DEFINE_PER_CPU(unsigned int, mm_cpumask_trim_clock);
+
+/*
+ * Interval between flushes at which we send out IPIs to check whether the
+ * mm_cpumask can be trimmed for the case where it's not a single-threaded
+ * process flushing its own mm. The intent is to reduce the cost of later
+ * flushes. Don't want this to be so low that it adds noticable cost to TLB
+ * flushing, or so high that it doesn't help reduce global TLBIEs.
+ */
+static unsigned long tlb_mm_cpumask_trim_timer = 1073;
+
+static bool tick_and_test_trim_clock(void)
+{
+	if (__this_cpu_inc_return(mm_cpumask_trim_clock) ==
+			tlb_mm_cpumask_trim_timer) {
+		__this_cpu_write(mm_cpumask_trim_clock, 0);
+		return true;
+	}
+	return false;
+}
+
 enum tlb_flush_type {
 	FLUSH_TYPE_NONE,
 	FLUSH_TYPE_LOCAL,
@@ -702,8 +729,20 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 
 	if (active_cpus == 0)
 		return FLUSH_TYPE_NONE;
-	if (active_cpus == 1 && cpumask_test_cpu(cpu, mm_cpumask(mm)))
+	if (active_cpus == 1 && cpumask_test_cpu(cpu, mm_cpumask(mm))) {
+		if (current->mm != mm) {
+			/*
+			 * Asynchronous flush sources may trim down to nothing
+			 * if the process is not running, so occasionally try
+			 * to trim.
+			 */
+			if (tick_and_test_trim_clock()) {
+				exit_lazy_flush_tlb(mm);
+				return FLUSH_TYPE_NONE;
+			}
+		}
 		return FLUSH_TYPE_LOCAL;
+	}
 
 	/* Coprocessors require TLBIE to invalidate nMMU. */
 	if (atomic_read(&mm->context.copros) > 0)
@@ -735,6 +774,19 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 		return FLUSH_TYPE_LOCAL;
 	}
 
+	/*
+	 * Occasionally try to trim down the cpumask. It's possible this can
+	 * bring the mask to zero, which results in no flush.
+	 */
+	if (tick_and_test_trim_clock()) {
+		exit_flush_lazy_tlbs(mm);
+		if (current->mm == mm)
+			return FLUSH_TYPE_LOCAL;
+		if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
+			exit_lazy_flush_tlb(mm);
+		return FLUSH_TYPE_NONE;
+	}
+
 	return FLUSH_TYPE_GLOBAL;
 }
 
-- 
2.23.0

