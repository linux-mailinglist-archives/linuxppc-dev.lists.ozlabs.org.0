Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CED7BD9FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 13:35:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFxNRxqS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFxNRxqS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3xm23Zrnz3vkw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 22:35:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFxNRxqS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFxNRxqS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3xgT1xKTz3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 22:31:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696851074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66tr9t3o5B+YlI8Z0Ko9wOOYI/+Cp0wW5QZRg/7Co00=;
	b=PFxNRxqSKI2q8ZBI5q2Ch71BMRRkwFV0qCiDBxavot1PijLrgg2O5/+Sp5QCKuXsN3KZDY
	s1fHCHfEOKhq8xKW2Fp7yaFwgw4BLGWgdtqYRYg/kPtZjRzn5ZanD+eQemSGhrnFOHvA/l
	BsrnTHjcUp2No7RzKJlsWBDHpQMRF3Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696851074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66tr9t3o5B+YlI8Z0Ko9wOOYI/+Cp0wW5QZRg/7Co00=;
	b=PFxNRxqSKI2q8ZBI5q2Ch71BMRRkwFV0qCiDBxavot1PijLrgg2O5/+Sp5QCKuXsN3KZDY
	s1fHCHfEOKhq8xKW2Fp7yaFwgw4BLGWgdtqYRYg/kPtZjRzn5ZanD+eQemSGhrnFOHvA/l
	BsrnTHjcUp2No7RzKJlsWBDHpQMRF3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-NqwxN9HnN0-iUnRLafhCJQ-1; Mon, 09 Oct 2023 07:31:10 -0400
X-MC-Unique: NqwxN9HnN0-iUnRLafhCJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0115918162C4;
	Mon,  9 Oct 2023 11:31:10 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0626B215670B;
	Mon,  9 Oct 2023 11:31:05 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv8 4/5] powerpc/cpu: Skip impossible cpu during iteration on a core
Date: Mon,  9 Oct 2023 19:30:35 +0800
Message-Id: <20231009113036.45988-5-piliu@redhat.com>
In-Reply-To: <20231009113036.45988-1-piliu@redhat.com>
References: <20231009113036.45988-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The threads in a core have equal status, so the code introduces a for
loop pattern to execute the same task on each thread:
    for (i = first_thread; i < first_thread + threads_per_core; i++)

Now that some threads may not be in the cpu_possible_mask, the iteration
skips those threads by checking the mask. In this way, the unpopulated
pcpu struct can be skipped and left unaccessed.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@linux.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/cputhreads.h    |  6 +++++
 arch/powerpc/kernel/smp.c                |  2 +-
 arch/powerpc/kvm/book3s_hv.c             |  7 ++----
 arch/powerpc/platforms/powernv/idle.c    | 32 ++++++++++++------------
 arch/powerpc/platforms/powernv/subcore.c |  5 +++-
 5 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/cputhreads.h b/arch/powerpc/include/asm/cputhreads.h
index f26c430f3982..fdb71ff7f6a9 100644
--- a/arch/powerpc/include/asm/cputhreads.h
+++ b/arch/powerpc/include/asm/cputhreads.h
@@ -65,6 +65,12 @@ static inline int cpu_last_thread_sibling(int cpu)
 	return cpu | (threads_per_core - 1);
 }
 
+#define for_each_possible_cpu_in_core(start, iter)			\
+	for (iter = start; iter < start + threads_per_core; iter++)	\
+		if (unlikely(!cpu_possible(iter)))			\
+			continue;					\
+		else
+
 /*
  * tlb_thread_siblings are siblings which share a TLB. This is not
  * architected, is not something a hypervisor could emulate and a future
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index fbbb695bae3d..2936f7a2240d 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -933,7 +933,7 @@ static int __init update_mask_from_threadgroup(cpumask_var_t *mask, struct threa
 
 	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
 
-	for (i = first_thread; i < first_thread + threads_per_core; i++) {
+	for_each_possible_cpu_in_core(first_thread, i) {
 		int i_group_start = get_cpu_thread_group_start(i, tg);
 
 		if (unlikely(i_group_start == -1)) {
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 130bafdb1430..ff4b3f8affba 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6235,12 +6235,9 @@ static int kvm_init_subcore_bitmap(void)
 			return -ENOMEM;
 
 
-		for (j = 0; j < threads_per_core; j++) {
-			int cpu = first_cpu + j;
-
-			paca_ptrs[cpu]->sibling_subcore_state =
+		for_each_possible_cpu_in_core(first_cpu, j)
+			paca_ptrs[j]->sibling_subcore_state =
 						sibling_subcore_state;
-		}
 	}
 	return 0;
 }
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index ad41dffe4d92..79d81ce5cf4c 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -823,36 +823,36 @@ void pnv_power9_force_smt4_catch(void)
 
 	cpu = smp_processor_id();
 	cpu0 = cpu & ~(threads_per_core - 1);
-	for (thr = 0; thr < threads_per_core; ++thr) {
-		if (cpu != cpu0 + thr)
-			atomic_inc(&paca_ptrs[cpu0+thr]->dont_stop);
+	for_each_possible_cpu_in_core(cpu0, thr) {
+		if (cpu != thr)
+			atomic_inc(&paca_ptrs[thr]->dont_stop);
 	}
 	/* order setting dont_stop vs testing requested_psscr */
 	smp_mb();
-	for (thr = 0; thr < threads_per_core; ++thr) {
-		if (!paca_ptrs[cpu0+thr]->requested_psscr)
+	for_each_possible_cpu_in_core(cpu0, thr) {
+		if (!paca_ptrs[thr]->requested_psscr)
 			++awake_threads;
 		else
-			poke_threads |= (1 << thr);
+			poke_threads |= (1 << (thr - cpu0));
 	}
 
 	/* If at least 3 threads are awake, the core is in SMT4 already */
 	if (awake_threads < need_awake) {
 		/* We have to wake some threads; we'll use msgsnd */
-		for (thr = 0; thr < threads_per_core; ++thr) {
-			if (poke_threads & (1 << thr)) {
+		for_each_possible_cpu_in_core(cpu0, thr) {
+			if (poke_threads & (1 << (thr - cpu0))) {
 				ppc_msgsnd_sync();
 				ppc_msgsnd(PPC_DBELL_MSGTYPE, 0,
-					   paca_ptrs[cpu0+thr]->hw_cpu_id);
+					   paca_ptrs[thr]->hw_cpu_id);
 			}
 		}
 		/* now spin until at least 3 threads are awake */
 		do {
-			for (thr = 0; thr < threads_per_core; ++thr) {
-				if ((poke_threads & (1 << thr)) &&
-				    !paca_ptrs[cpu0+thr]->requested_psscr) {
+			for_each_possible_cpu_in_core(cpu0, thr) {
+				if ((poke_threads & (1 << (thr - cpu0))) &&
+				    !paca_ptrs[thr]->requested_psscr) {
 					++awake_threads;
-					poke_threads &= ~(1 << thr);
+					poke_threads &= ~(1 << (thr - cpu0));
 				}
 			}
 		} while (awake_threads < need_awake);
@@ -868,9 +868,9 @@ void pnv_power9_force_smt4_release(void)
 	cpu0 = cpu & ~(threads_per_core - 1);
 
 	/* clear all the dont_stop flags */
-	for (thr = 0; thr < threads_per_core; ++thr) {
-		if (cpu != cpu0 + thr)
-			atomic_dec(&paca_ptrs[cpu0+thr]->dont_stop);
+	for_each_possible_cpu_in_core(cpu0, thr) {
+		if (cpu != thr)
+			atomic_dec(&paca_ptrs[thr]->dont_stop);
 	}
 }
 EXPORT_SYMBOL_GPL(pnv_power9_force_smt4_release);
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index 191424468f10..b229115c8c0f 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -151,9 +151,12 @@ static void wait_for_sync_step(int step)
 {
 	int i, cpu = smp_processor_id();
 
-	for (i = cpu + 1; i < cpu + threads_per_core; i++)
+	for_each_possible_cpu_in_core(cpu, i) {
+		if (i == cpu)
+			continue;
 		while(per_cpu(split_state, i).step < step)
 			barrier();
+	}
 
 	/* Order the wait loop vs any subsequent loads/stores. */
 	mb();
-- 
2.31.1

