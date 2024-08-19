Return-Path: <linuxppc-dev+bounces-181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7410C956AC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 14:25:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnWyH1B9pz2xjw;
	Mon, 19 Aug 2024 22:25:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M7Yp+axd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnWyG13Whz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 22:25:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724070308;
	bh=odiXTpiPGwTHqZw3377Co+FPslJzsu/5OO1Cc3rAVFo=;
	h=From:To:Cc:Subject:Date:From;
	b=M7Yp+axdJC1HPLIAzkmIKjB8+iT8hsg/UQz280auXxhMt5GpEFqNSoMuCedrA/g6w
	 lhNmIIf5jH+Pr9ozbyK3zs9Oy4EZpbDkzssl0tpdPxSnydM/s8t+xLPYBMZOmxKL8X
	 d3KfxvCJ4AWZ20nWev+z7dl9VYmoX+n0SmXYjrq2KtrLKql57IaxvG2b51G2bMKJnm
	 824B2t7FOQUPacEMS1HfYHBFAcNB7Ifhluk1uWbevAw06Z7BAbnuqpVb7QamOwGuZN
	 /x5mtYfclYFb6B5NSEl43KCQL4Db/9qcj5glR7KIElXukvP33pEEuNLvQ2pz0Q029j
	 SEfOeGctrpy9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnWyD1XKsz4w2F;
	Mon, 19 Aug 2024 22:25:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: kjain@linux.ibm.com
Subject: [PATCH] powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
Date: Mon, 19 Aug 2024 22:24:01 +1000
Message-ID: <20240819122401.513203-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dtl_access_lock needs to be a rw_sempahore, a sleeping lock, because
the code calls kmalloc() while holding it, which can sleep:

  # echo 1 > /proc/powerpc/vcpudispatch_stats
  BUG: sleeping function called from invalid context at include/linux/sched/mm.h:337
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 199, name: sh
  preempt_count: 1, expected: 0
  3 locks held by sh/199:
   #0: c00000000a0743f8 (sb_writers#3){.+.+}-{0:0}, at: vfs_write+0x324/0x438
   #1: c0000000028c7058 (dtl_enable_mutex){+.+.}-{3:3}, at: vcpudispatch_stats_write+0xd4/0x5f4
   #2: c0000000028c70b8 (dtl_access_lock){+.+.}-{2:2}, at: vcpudispatch_stats_write+0x220/0x5f4
  CPU: 0 PID: 199 Comm: sh Not tainted 6.10.0-rc4 #152
  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
  Call Trace:
    dump_stack_lvl+0x130/0x148 (unreliable)
    __might_resched+0x174/0x410
    kmem_cache_alloc_noprof+0x340/0x3d0
    alloc_dtl_buffers+0x124/0x1ac
    vcpudispatch_stats_write+0x2a8/0x5f4
    proc_reg_write+0xf4/0x150
    vfs_write+0xfc/0x438
    ksys_write+0x88/0x148
    system_call_exception+0x1c4/0x5a0
    system_call_common+0xf4/0x258

Fixes: 06220d78f24a ("powerpc/pseries: Introduce rwlock to gatekeep DTLB usage")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/dtl.h        | 3 ++-
 arch/powerpc/platforms/pseries/dtl.c  | 8 ++++----
 arch/powerpc/platforms/pseries/lpar.c | 8 ++++----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/dtl.h b/arch/powerpc/include/asm/dtl.h
index d6f43d149f8d..e21bac6c065c 100644
--- a/arch/powerpc/include/asm/dtl.h
+++ b/arch/powerpc/include/asm/dtl.h
@@ -1,6 +1,7 @@
 #ifndef _ASM_POWERPC_DTL_H
 #define _ASM_POWERPC_DTL_H
 
+#include <linux/rwsem.h>
 #include <asm/lppaca.h>
 #include <linux/spinlock_types.h>
 
@@ -35,7 +36,7 @@ struct dtl_entry {
 #define DTL_LOG_ALL		(DTL_LOG_CEDE | DTL_LOG_PREEMPT | DTL_LOG_FAULT)
 
 extern struct kmem_cache *dtl_cache;
-extern rwlock_t dtl_access_lock;
+extern struct rw_semaphore dtl_access_lock;
 
 extern void register_dtl_buffer(int cpu);
 extern void alloc_dtl_buffers(unsigned long *time_limit);
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 3f1cdccebc9c..ecc04ef8c53e 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -191,7 +191,7 @@ static int dtl_enable(struct dtl *dtl)
 		return -EBUSY;
 
 	/* ensure there are no other conflicting dtl users */
-	if (!read_trylock(&dtl_access_lock))
+	if (!down_read_trylock(&dtl_access_lock))
 		return -EBUSY;
 
 	n_entries = dtl_buf_entries;
@@ -199,7 +199,7 @@ static int dtl_enable(struct dtl *dtl)
 	if (!buf) {
 		printk(KERN_WARNING "%s: buffer alloc failed for cpu %d\n",
 				__func__, dtl->cpu);
-		read_unlock(&dtl_access_lock);
+		up_read(&dtl_access_lock);
 		return -ENOMEM;
 	}
 
@@ -217,7 +217,7 @@ static int dtl_enable(struct dtl *dtl)
 	spin_unlock(&dtl->lock);
 
 	if (rc) {
-		read_unlock(&dtl_access_lock);
+		up_read(&dtl_access_lock);
 		kmem_cache_free(dtl_cache, buf);
 	}
 
@@ -232,7 +232,7 @@ static void dtl_disable(struct dtl *dtl)
 	dtl->buf = NULL;
 	dtl->buf_entries = 0;
 	spin_unlock(&dtl->lock);
-	read_unlock(&dtl_access_lock);
+	up_read(&dtl_access_lock);
 }
 
 /* file interface */
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index c1d8bee8f701..bb09990eec30 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -169,7 +169,7 @@ struct vcpu_dispatch_data {
  */
 #define NR_CPUS_H	NR_CPUS
 
-DEFINE_RWLOCK(dtl_access_lock);
+DECLARE_RWSEM(dtl_access_lock);
 static DEFINE_PER_CPU(struct vcpu_dispatch_data, vcpu_disp_data);
 static DEFINE_PER_CPU(u64, dtl_entry_ridx);
 static DEFINE_PER_CPU(struct dtl_worker, dtl_workers);
@@ -463,7 +463,7 @@ static int dtl_worker_enable(unsigned long *time_limit)
 {
 	int rc = 0, state;
 
-	if (!write_trylock(&dtl_access_lock)) {
+	if (!down_write_trylock(&dtl_access_lock)) {
 		rc = -EBUSY;
 		goto out;
 	}
@@ -479,7 +479,7 @@ static int dtl_worker_enable(unsigned long *time_limit)
 		pr_err("vcpudispatch_stats: unable to setup workqueue for DTL processing\n");
 		free_dtl_buffers(time_limit);
 		reset_global_dtl_mask();
-		write_unlock(&dtl_access_lock);
+		up_write(&dtl_access_lock);
 		rc = -EINVAL;
 		goto out;
 	}
@@ -494,7 +494,7 @@ static void dtl_worker_disable(unsigned long *time_limit)
 	cpuhp_remove_state(dtl_worker_state);
 	free_dtl_buffers(time_limit);
 	reset_global_dtl_mask();
-	write_unlock(&dtl_access_lock);
+	up_write(&dtl_access_lock);
 }
 
 static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
-- 
2.46.0


