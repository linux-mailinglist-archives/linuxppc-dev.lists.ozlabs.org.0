Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC121DCB64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 12:51:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SRJK6j9LzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 20:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=205.233.59.134; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=p73WvaiB; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SRGT4tJ6zDqgM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 20:50:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UWvnfa19r1FQDwx/9W5RgRGXvBWnFUWUYn6L5ClPmLM=; b=p73WvaiBjYOVphK2nrGUC/aXVZ
 Q85YumDlcbbViLt6y3IZwuXRg4//ElM6aRGlb+WK2Q0yK8+3WafTz8mN2H4eUS5Nqnm/wLUTp+42f
 zInP0dgKxLmHIBrL+jlJrNAlOIYv35lDJ4kfKYayjpwep9MzwWVos5dnubWQdnIlbpUlNSV0V6wtU
 Tb1APna4unoZtH0Ac1e1Mn5VE6pA74HMmhUkmcRaK82mq10YtOvUfHIkb+7mAuvg4LIrcKNZQWthT
 L1mySfRV/O9AJ1T7/Z5kczHIlI88UQq65qNPwXONwDzdhgQZCQ7IMnC48GeXSFD3dOsPH951VUgsw
 X1cDOCZw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbill-0002XT-MC; Thu, 21 May 2020 10:49:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 317103011E8;
 Thu, 21 May 2020 12:49:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DF997286B5F33; Thu, 21 May 2020 12:49:37 +0200 (CEST)
Date: Thu, 21 May 2020 12:49:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200521104937.GB325303@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521093938.GG325280@hirez.programming.kicks-ass.net>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qian Cai <cai@lca.pw>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 11:39:39AM +0200, Peter Zijlstra wrote:
> On Thu, May 21, 2020 at 02:40:36AM +0200, Frederic Weisbecker wrote:

> This:
> 
> >         smp_call_function_single_async() {             smp_call_function_single_async() {
> >             // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
> >             csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK
> 
> concurrent smp_call_function_single_async() using the same csd is what
> I'm looking at as well.

So something like this ought to cure the fundamental problem and make
smp_call_function_single_async() more user friendly, but also more
expensive.

The problem is that while the ILB case is easy to fix, I can't seem to
find an equally nice solution for the ttwu_remote_queue() case; that
would basically require sticking the wake_csd in task_struct, I'll also
post that.

So it's either this:

---
 kernel/smp.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 84303197caf9..d1ca2a2d1cc7 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -109,6 +109,12 @@ static __always_inline void csd_lock_wait(call_single_data_t *csd)
 	smp_cond_load_acquire(&csd->flags, !(VAL & CSD_FLAG_LOCK));
 }
 
+/*
+ * csd_lock() can use non-atomic operations to set CSD_FLAG_LOCK because it's
+ * users are careful to only use CPU-local data. IOW, there is no cross-cpu
+ * lock usage. Also, you're not allowed to use smp_call_function*() from IRQs,
+ * and must be extra careful from SoftIRQ.
+ */
 static __always_inline void csd_lock(call_single_data_t *csd)
 {
 	csd_lock_wait(csd);
@@ -318,7 +324,7 @@ EXPORT_SYMBOL(smp_call_function_single);
 
 /**
  * smp_call_function_single_async(): Run an asynchronous function on a
- * 			         specific CPU.
+ *				     specific CPU.
  * @cpu: The CPU to run on.
  * @csd: Pre-allocated and setup data structure
  *
@@ -339,18 +345,23 @@ EXPORT_SYMBOL(smp_call_function_single);
  */
 int smp_call_function_single_async(int cpu, call_single_data_t *csd)
 {
+	unsigned int csd_flags;
 	int err = 0;
 
 	preempt_disable();
 
-	if (csd->flags & CSD_FLAG_LOCK) {
+	/*
+	 * Unlike the regular smp_call_function*() APIs, this one is actually
+	 * usable from IRQ context, also the -EBUSY return value suggests
+	 * it is safe to share csd's.
+	 */
+	csd_flags = READ_ONCE(csd->flags);
+	if (csd_flags & CSD_FLAG_LOCK ||
+	    cmpxchg(&csd->flags, csd_flags, csd_flags | CSD_FLAG_LOCK) != csd_flags) {
 		err = -EBUSY;
 		goto out;
 	}
 
-	csd->flags = CSD_FLAG_LOCK;
-	smp_wmb();
-
 	err = generic_exec_single(cpu, csd, csd->func, csd->info);
 
 out:
