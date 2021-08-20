Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0823F33DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 20:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrqxS0j5Dz3cXb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 04:32:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=X4Je8orm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=X4Je8orm; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grqwh2SqTz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 04:31:47 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 1AC0B37ECEE;
 Fri, 20 Aug 2021 14:31:43 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kkYr13An0u20; Fri, 20 Aug 2021 14:31:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 88B7737EF3D;
 Fri, 20 Aug 2021 14:31:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 88B7737EF3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1629484298;
 bh=rcXcxanfB6QYZhHo4b7EbXJ6cIL6JRW1zubXgC7Qst4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=X4Je8ormAn0YaA6FlkV1/U8Tl59mByp1mWAIToyIQma9hFegqTueeXe6R/TVChI/E
 0nOZb1vTCAMapORr4Chx/N31Lj/dN2PDXIbl0wz4lBKPddFZnhKp0IYd1UT6iJrdA5
 Sd+GFUUFRAgQSz/n2usWwRTNPJ5yj6eHon7Hg5qRU3ie5/iWZbhaSiD0S4jY73XHJZ
 fbulqoP0HfYCA/L9kAQKGcawUG/fWz+/M+z+nE53KmXoQ+iydSUnVFMvGwkllwl/Vu
 lV+X3jPatZos15gbSLySJGS9WD9gr0qevh4fI/ZX8A2L7p+brg2l4MIljseex/R7cZ
 ZDeYUH2f6XKAA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IM83p2M2TmSm; Fri, 20 Aug 2021 14:31:38 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 6426637EF39;
 Fri, 20 Aug 2021 14:31:38 -0400 (EDT)
Date: Fri, 20 Aug 2021 14:31:38 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <407716135.20250.1629484298288.JavaMail.zimbra@efficios.com>
In-Reply-To: <YR7qXvnI/AQM10gU@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-5-seanjc@google.com>
 <1540548616.19739.1629409956315.JavaMail.zimbra@efficios.com>
 <YR7qXvnI/AQM10gU@google.com>
Subject: Re: [PATCH 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF90 (Linux)/8.8.15_GA_4059)
Thread-Topic: selftests: Add a test for KVM_RUN+rseq to detect task migration
 bugs
Thread-Index: E5JNfmxU00VeJZRF4swNzJN5Z7I5gQ==
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

----- On Aug 19, 2021, at 7:33 PM, Sean Christopherson seanjc@google.com wrote:

> On Thu, Aug 19, 2021, Mathieu Desnoyers wrote:
>> ----- On Aug 17, 2021, at 8:12 PM, Sean Christopherson seanjc@google.com wrote:
>> 
>> > Add a test to verify an rseq's CPU ID is updated correctly if the task is
>> > migrated while the kernel is handling KVM_RUN.  This is a regression test
>> > for a bug introduced by commit 72c3c0fe54a3 ("x86/kvm: Use generic xfer
>> > to guest work function"), where TIF_NOTIFY_RESUME would be cleared by KVM
>> > without updating rseq, leading to a stale CPU ID and other badness.
>> > 
>> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>> > ---
>> 
>> [...]
>> 
>> > +	while (!done) {
>> > +		vcpu_run(vm, VCPU_ID);
>> > +		TEST_ASSERT(get_ucall(vm, VCPU_ID, NULL) == UCALL_SYNC,
>> > +			    "Guest failed?");
>> > +
>> > +		cpu = sched_getcpu();
>> > +		rseq_cpu = READ_ONCE(__rseq.cpu_id);
>> > +
>> > +		/*
>> > +		 * Verify rseq's CPU matches sched's CPU, and that sched's CPU
>> > +		 * is stable.  This doesn't handle the case where the task is
>> > +		 * migrated between sched_getcpu() and reading rseq, and again
>> > +		 * between reading rseq and sched_getcpu(), but in practice no
>> > +		 * false positives have been observed, while on the other hand
>> > +		 * blocking migration while this thread reads CPUs messes with
>> > +		 * the timing and prevents hitting failures on a buggy kernel.
>> > +		 */
>> 
>> I think you could get a stable cpu id between sched_getcpu and __rseq_abi.cpu_id
>> if you add a pthread mutex to protect:
>> 
>> sched_getcpu and __rseq_abi.cpu_id  reads
>> 
>> vs
>> 
>> sched_setaffinity calls within the migration thread.
>> 
>> Thoughts ?
> 
> I tried that and couldn't reproduce the bug.  That's what I attempted to call
> out
> in the blurb "blocking migration while this thread reads CPUs ... prevents
> hitting
> failures on a buggy kernel".
> 
> I considered adding arbitrary delays around the mutex to try and hit the bug,
> but
> I was worried that even if I got it "working" for this bug, the test would be
> too
> tailored to this bug and potentially miss future regression.  Letting the two
> threads run wild seemed like it would provide the best coverage, at the cost of
> potentially causing to false failures.

OK, so your point is that using mutual exclusion to ensure stability of the cpu id
changes the timings too much, to a point where the issues don't reproduce. I understand
that this mutex ties the migration thread timings to the vcpu thread's use of the mutex,
which will reduce timings randomness, which is unwanted here.

I still really hate flakiness in tests, because then people stop caring when they
fail once in a while. And with the nature of rseq, a once-in-a-while failure is a
big deal. Let's see if we can use other tricks to ensure stability of the cpu id
without changing timings too much.

One idea would be to use a seqcount lock. But even if we use that, I'm concerned that
the very long writer critical section calling sched_setaffinity would need to be
alternated with a sleep to ensure the read-side progresses. The sleep delay could be
relatively small compared to the duration of the sched_setaffinity call, e.g. ratio
1:10.

static volatile uint64_t seqcnt;

The thread responsible for setting the affinity would do something like:

for (;;) {
  atomic_inc_seq_cst(&seqcnt);
  sched_setaffinity(..., n++ % nr_cpus);
  atomic_inc_seq_cst(&seqcnt);
  usleep(1);  /* this is where read-side is allowed to progress. */
}

And the thread reading the rseq cpu id and calling sched_getcpu():

uint64_t snapshot;

do {
  snapshot = atomic_load(&seqcnt) & ~1; /* force retry if odd */
  smp_rmb();
  cpu = sched_getcpu();
  rseq_cpu = READ_ONCE(__rseq.cpu_id);
  smp_rmb();
} while (snapshot != atomic_load(&seqcnt));

So the reader retry the cpu id reads whenever sched_setaffinity is being
called by the migration thread, and whenever it is preempted for more
than one migration thread loop.

That should achieve our goal of providing cpu id stability without significantly
changing the timings of the migration thread, given that it never blocks waiting
for the reader.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
