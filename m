Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0C3F4D54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:21:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtbYB0Dp7z2yJ8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=LBQNAG/k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=LBQNAG/k; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtbXS23K6z2xrL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:20:24 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 3DD74334FF2;
 Mon, 23 Aug 2021 11:20:22 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LJrPNFGBu5KN; Mon, 23 Aug 2021 11:20:17 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id C3F7D334FF1;
 Mon, 23 Aug 2021 11:20:17 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C3F7D334FF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1629732017;
 bh=S5wesjMNZpOVqMilT2oI+HzIPYcgfplpkn76pAJBUMs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=LBQNAG/kxGwqMN/Yd/hfOrxjE9t0y6mTOaFLuI1QnbF1Bwvo7LrjI6NIOizCVYXli
 lu6pQIj77Aqgl/KXZ6F3PfMoWWhnub9YC9zozMs5LtB2BmOxbuKCqnl5C7d3ptaPBN
 dVRV5F5ddn8WzFJJGinjIgDsc4ynmGgeUgMlotbRLV/D7mk1Fh76BbQIXs+VTG6u7e
 aSXJiuhHVrV/iGfRd/aBKOv1s5wN2oTSSHOLrUGcv/SqxuaiRHdDhLrcpnRI80I8qb
 y4OQAUHBlP/s8zu6Qqyre3oGuDakv+xU8On9JdL5oSi3xx3v39S8TQC7PJOvLtRIRM
 MEy0mb4AWmGCg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TyoIgPSn19Z2; Mon, 23 Aug 2021 11:20:17 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id A4BF83351E7;
 Mon, 23 Aug 2021 11:20:17 -0400 (EDT)
Date: Mon, 23 Aug 2021 11:20:17 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Sean Christopherson <seanjc@google.com>, Darren Hart <dvhart@infradead.org>
Message-ID: <282257549.21721.1629732017655.JavaMail.zimbra@efficios.com>
In-Reply-To: <766990430.21713.1629731934069.JavaMail.zimbra@efficios.com>
References: <20210820225002.310652-1-seanjc@google.com>
 <20210820225002.310652-5-seanjc@google.com>
 <766990430.21713.1629731934069.JavaMail.zimbra@efficios.com>
Subject: Re: [PATCH v2 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF90 (Linux)/8.8.15_GA_4059)
Thread-Topic: selftests: Add a test for KVM_RUN+rseq to detect task migration
 bugs
Thread-Index: 9INcR4B9tvRD6E6sZQ8uPmTSeu5zxPtDkgBM
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
Cc: KVM list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390 <linux-s390@vger.kernel.org>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips <linux-mips@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 paulmck <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ re-send to Darren Hart ]

----- On Aug 23, 2021, at 11:18 AM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> ----- On Aug 20, 2021, at 6:50 PM, Sean Christopherson seanjc@google.com wrote:
> 
>> Add a test to verify an rseq's CPU ID is updated correctly if the task is
>> migrated while the kernel is handling KVM_RUN.  This is a regression test
>> for a bug introduced by commit 72c3c0fe54a3 ("x86/kvm: Use generic xfer
>> to guest work function"), where TIF_NOTIFY_RESUME would be cleared by KVM
>> without updating rseq, leading to a stale CPU ID and other badness.
>> 
> 
> [...]
> 
> +#define RSEQ_SIG 0xdeadbeef
> 
> Is there any reason for defining a custom signature rather than including
> tools/testing/selftests/rseq/rseq.h ? This should take care of including
> the proper architecture header which will define the appropriate signature.
> 
> Arguably you don't define rseq critical sections in this test per se, but
> I'm wondering why the custom signature here.
> 
> [...]
> 
>> +
>> +static void *migration_worker(void *ign)
>> +{
>> +	cpu_set_t allowed_mask;
>> +	int r, i, nr_cpus, cpu;
>> +
>> +	CPU_ZERO(&allowed_mask);
>> +
>> +	nr_cpus = CPU_COUNT(&possible_mask);
>> +
>> +	for (i = 0; i < 20000; i++) {
>> +		cpu = i % nr_cpus;
>> +		if (!CPU_ISSET(cpu, &possible_mask))
>> +			continue;
>> +
>> +		CPU_SET(cpu, &allowed_mask);
>> +
>> +		/*
>> +		 * Bump the sequence count twice to allow the reader to detect
>> +		 * that a migration may have occurred in between rseq and sched
>> +		 * CPU ID reads.  An odd sequence count indicates a migration
>> +		 * is in-progress, while a completely different count indicates
>> +		 * a migration occurred since the count was last read.
>> +		 */
>> +		atomic_inc(&seq_cnt);
> 
> So technically this atomic_inc contains the required barriers because the
> selftests
> implementation uses "__sync_add_and_fetch(&addr->val, 1)". But it's rather odd
> that
> the semantic differs from the kernel implementation in terms of memory barriers:
> the
> kernel implementation of atomic_inc guarantees no memory barriers, but this one
> happens to provide full barriers pretty much by accident (selftests
> futex/include/atomic.h documents no such guarantee).
> 
> If this full barrier guarantee is indeed provided by the selftests atomic.h
> header,
> I would really like a comment stating that in the atomic.h header so the carpet
> is
> not pulled from under our feet by a future optimization.
> 
> 
>> +		r = sched_setaffinity(0, sizeof(allowed_mask), &allowed_mask);
>> +		TEST_ASSERT(!r, "sched_setaffinity failed, errno = %d (%s)",
>> +			    errno, strerror(errno));
>> +		atomic_inc(&seq_cnt);
>> +
>> +		CPU_CLR(cpu, &allowed_mask);
>> +
>> +		/*
>> +		 * Let the read-side get back into KVM_RUN to improve the odds
>> +		 * of task migration coinciding with KVM's run loop.
> 
> This comment should be about increasing the odds of letting the seqlock
> read-side
> complete. Otherwise, the delay between the two back-to-back atomic_inc is so
> small
> that the seqlock read-side may never have time to complete the reading the rseq
> cpu id and the sched_getcpu() call, and can retry forever.
> 
> I'm wondering if 1 microsecond is sufficient on other architectures as well. One
> alternative way to make this depend less on the architecture's implementation of
> sched_getcpu (whether it's a vDSO, or goes through a syscall) would be to read
> the rseq cpu id and call sched_getcpu a few times (e.g. 3 times) in the
> migration
> thread rather than use usleep, and throw away the value read. This would ensure
> the delay is appropriate on all architectures.
> 
> Thanks!
> 
> Mathieu
> 
>> +		 */
>> +		usleep(1);
>> +	}
>> +	done = true;
>> +	return NULL;
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	struct kvm_vm *vm;
>> +	u32 cpu, rseq_cpu;
>> +	int r, snapshot;
>> +
>> +	/* Tell stdout not to buffer its content */
>> +	setbuf(stdout, NULL);
>> +
>> +	r = sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
>> +	TEST_ASSERT(!r, "sched_getaffinity failed, errno = %d (%s)", errno,
>> +		    strerror(errno));
>> +
>> +	if (CPU_COUNT(&possible_mask) < 2) {
>> +		print_skip("Only one CPU, task migration not possible\n");
>> +		exit(KSFT_SKIP);
>> +	}
>> +
>> +	sys_rseq(0);
>> +
>> +	/*
>> +	 * Create and run a dummy VM that immediately exits to userspace via
>> +	 * GUEST_SYNC, while concurrently migrating the process by setting its
>> +	 * CPU affinity.
>> +	 */
>> +	vm = vm_create_default(VCPU_ID, 0, guest_code);
>> +
>> +	pthread_create(&migration_thread, NULL, migration_worker, 0);
>> +
>> +	while (!done) {
>> +		vcpu_run(vm, VCPU_ID);
>> +		TEST_ASSERT(get_ucall(vm, VCPU_ID, NULL) == UCALL_SYNC,
>> +			    "Guest failed?");
>> +
>> +		/*
>> +		 * Verify rseq's CPU matches sched's CPU.  Ensure migration
>> +		 * doesn't occur between sched_getcpu() and reading the rseq
>> +		 * cpu_id by rereading both if the sequence count changes, or
>> +		 * if the count is odd (migration in-progress).
>> +		 */
>> +		do {
>> +			/*
>> +			 * Drop bit 0 to force a mismatch if the count is odd,
>> +			 * i.e. if a migration is in-progress.
>> +			 */
>> +			snapshot = atomic_read(&seq_cnt) & ~1;
>> +			smp_rmb();
>> +			cpu = sched_getcpu();
>> +			rseq_cpu = READ_ONCE(__rseq.cpu_id);
>> +			smp_rmb();
>> +		} while (snapshot != atomic_read(&seq_cnt));
>> +
>> +		TEST_ASSERT(rseq_cpu == cpu,
>> +			    "rseq CPU = %d, sched CPU = %d\n", rseq_cpu, cpu);
>> +	}
>> +
>> +	pthread_join(migration_thread, NULL);
>> +
>> +	kvm_vm_free(vm);
>> +
>> +	sys_rseq(RSEQ_FLAG_UNREGISTER);
>> +
>> +	return 0;
>> +}
>> --
>> 2.33.0.rc2.250.ged5fa647cd-goog
> 
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
