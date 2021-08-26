Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646833F912B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 01:55:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwfqc1BGNz2ynV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 09:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ItG8l0YB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ItG8l0YB; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwfpt3PSPz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:55:00 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id q3so2795902plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dW8gFjFomOc5wOdjLD9Dz4jaY3La87NN9K39GXWQx+E=;
 b=ItG8l0YBP+DbB+c2JE7Df+BDJmWlmM348qS2tn+o20n2CfRdWAMxuKeVWdApc9i/ph
 SXx9VY/vjBKJ3otuIt73eO92WBuq2g3EeJrPGA1j+NIfwr3rwhzUL7XKr8ulfNJkTyAs
 A/hdowTP0Ti4TQsIpZGrNAHfz/lIC0cgWPZ6lWsmT7TuDhNU3UrobkDJ2/YT8+DUskzz
 HyZQgME2+z2UW9Kqa9640Z5XVMQ6hwklS3TQ+vcyW689vKbrce53AFsKL98ApNqD/w6b
 XBODsFQkhS7SADidGdS4SqCHCuSJuloxnOtFCWTXqWXH7UgBlb+bA6idy73fwmLcWo99
 dmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dW8gFjFomOc5wOdjLD9Dz4jaY3La87NN9K39GXWQx+E=;
 b=RU2buBNMvrAo8LKDHTN7Fqkrl5iFLKQYYoQvFtiZxzGKIam73BhWVCH5rTVIs5pOaZ
 u+cQOvyh3lTFcv8VJbcibXbVo2DPE4Fpw0DhABptDEY71WYFQQFulc9kdff/z06+lECB
 RXt2GqP8daZmZQOBNSqmPdHLgPezlcfzGW9XI2FrN31t7t591gPXLSQk/6W8DCIlX1oO
 O0zWwRj0LJU6u3m/TNVobu6nxj42OL5wpNc4DSS/sHXSPISNV9DH6WDZzWoBcj720FlF
 SCnQ6EKLIdxXpFptpaGZHgSzByKf1sbstz6qZIoJESuQXOh2Ts+n5RltW6Fu1GkykLil
 iBVg==
X-Gm-Message-State: AOAM530DIytBpuRexILAJMMV2o7eOLbKvvoVBgijY9uX2Kc7qUjoR31h
 /d2tf8fGMfq8kn2BehXz25SzDg==
X-Google-Smtp-Source: ABdhPJwzNqdZ7nV9Pm9TbIto/bocQMQl0ruPz+G7jXml1aOfc3KfC0ZbBEbJQskaU4OTATHvb0yPjg==
X-Received: by 2002:a17:902:c643:b0:130:eab4:bd22 with SMTP id
 s3-20020a170902c64300b00130eab4bd22mr5672776pls.13.1630022096179; 
 Thu, 26 Aug 2021 16:54:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id r3sm3863725pff.119.2021.08.26.16.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 16:54:55 -0700 (PDT)
Date: Thu, 26 Aug 2021 23:54:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v2 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to
 detect task migration bugs
Message-ID: <YSgpy8iXXXUQ+b/k@google.com>
References: <20210820225002.310652-1-seanjc@google.com>
 <20210820225002.310652-5-seanjc@google.com>
 <766990430.21713.1629731934069.JavaMail.zimbra@efficios.com>
 <282257549.21721.1629732017655.JavaMail.zimbra@efficios.com>
 <YSblqrrpKcORzilX@google.com>
 <1700758714.29394.1630003332081.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1700758714.29394.1630003332081.JavaMail.zimbra@efficios.com>
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
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390 <linux-s390@vger.kernel.org>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 dvhart <dvhart@infradead.org>, linux-mips <linux-mips@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, paulmck <paulmck@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, rostedt <rostedt@goodmis.org>,
 Shakeel Butt <shakeelb@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 26, 2021, Mathieu Desnoyers wrote:
> ----- On Aug 25, 2021, at 8:51 PM, Sean Christopherson seanjc@google.com wrote:
> >> >> +		r = sched_setaffinity(0, sizeof(allowed_mask), &allowed_mask);
> >> >> +		TEST_ASSERT(!r, "sched_setaffinity failed, errno = %d (%s)",
> >> >> +			    errno, strerror(errno));
> >> >> +		atomic_inc(&seq_cnt);
> >> >> +
> >> >> +		CPU_CLR(cpu, &allowed_mask);
> >> >> +
> >> >> +		/*
> >> >> +		 * Let the read-side get back into KVM_RUN to improve the odds
> >> >> +		 * of task migration coinciding with KVM's run loop.
> >> > 
> >> > This comment should be about increasing the odds of letting the seqlock
> >> > read-side complete. Otherwise, the delay between the two back-to-back
> >> > atomic_inc is so small that the seqlock read-side may never have time to
> >> > complete the reading the rseq cpu id and the sched_getcpu() call, and can
> >> > retry forever.
> > 
> > Hmm, but that's not why there's a delay.  I'm not arguing that a livelock isn't
> > possible (though that syscall would have to be screaming fast),
> 
> I don't think we have the same understanding of the livelock scenario. AFAIU the livelock
> would be caused by a too-small delay between the two consecutive atomic_inc() from one
> loop iteration to the next compared to the time it takes to perform a read-side critical
> section of the seqlock. Back-to-back atomic_inc can be performed very quickly, so I
> doubt that the sched_getcpu implementation have good odds to be fast enough to complete
> in that narrow window, leading to lots of read seqlock retry.

Ooooh, yeah, brain fart on my side.  I was thinking of the two atomic_inc() in the
same loop iteration and completely ignoring the next iteration.  Yes, I 100% agree
that a delay to ensure forward progress is needed.  An assertion in main() that the
reader complete at least some reasonable number of KVM_RUNs is also probably a good
idea, e.g. to rule out a false pass due to the reader never making forward progress.

FWIW, the do-while loop does make forward progress without a delay, but at ~50% 
throughput, give or take.

> > but the primary motivation is very much to allow the read-side enough time
> > to get back into KVM proper.
> 
> I'm puzzled by your statement. AFAIU, let's say we don't have the delay, then we
> have:
> 
> migration thread                             KVM_RUN/read-side thread
> -----------------------------------------------------------------------------------
>                                              - ioctl(KVM_RUN)
> - atomic_inc_seq_cst(&seqcnt)
> - sched_setaffinity
> - atomic_inc_seq_cst(&seqcnt)
>                                              - a = atomic_load(&seqcnt) & ~1
>                                              - smp_rmb()
>                                              - b = LOAD_ONCE(__rseq_abi->cpu_id);
>                                              - sched_getcpu()
>                                              - smp_rmb()
>                                              - re-load seqcnt/compare (succeeds)
>                                                - Can only succeed if entire read-side happens while the seqcnt
>                                                  is in an even numbered state.
>                                              - if (a != b) abort()
>   /* no delay. Even counter state is very
>      short. */
> - atomic_inc_seq_cst(&seqcnt)
>   /* Let's suppose the lack of delay causes the
>      setaffinity to complete too early compared
>      with KVM_RUN ioctl */
> - sched_setaffinity
> - atomic_inc_seq_cst(&seqcnt)
> 
>   /* no delay. Even counter state is very
>      short. */
> - atomic_inc_seq_cst(&seqcnt)
>   /* Then a setaffinity from a following
>      migration thread loop will run
>      concurrently with KVM_RUN */
>                                              - ioctl(KVM_RUN)
> - sched_setaffinity
> - atomic_inc_seq_cst(&seqcnt)
> 
> As pointed out here, if the first setaffinity runs too early compared with KVM_RUN,
> a following setaffinity will run concurrently with it. However, the fact that 
> the even counter state is very short may very well hurt progress of the read seqlock.

*sigh*

Several hours later, I think I finally have my head wrapped around everything.

Due to the way the test is written and because of how KVM's run loop works,
TIF_NOTIFY_RESUME or TIF_NEED_RESCHED effectively has to be set before KVM actually
enters the guest, otherwise KVM will exit to userspace without touching the flag,
i.e. it will be handled by the normal exit_to_user_mode_loop().

Where I got lost was trying to figure out why I couldn't make the bug reproduce by
causing the guest to exit to KVM, but not userspace, in which case KVM should
easily trigger the problematic flow as the window for sched_getcpu() to collide
with KVM would be enormous.  The reason I didn't go down this route for the
"official" test is that, unless there's something clever I'm overlooking, it
requires arch specific guest code, and ialso I don't know that forcing an exit
would even be necessary/sufficient on other architectures.

Anyways, I was trying to confirm that the bug was being hit without a delay, while
still retaining the sequence retry in the test.  The test doesn't fail because the
back-to-back atomic_inc() changes seqcnt too fast.  The read-side makes forward
progress, but it never observes failure because the do-while loop only ever
completes after another sched_setaffinity(), never after the one that collides
with KVM because it takes too long to get out of ioctl(KVM_RUN) and back to the
test.  I.e. the atomic_inc() in the next loop iteration (makes seq_cnt odd) always
completes before the check, and so the check ends up spinning until another
migration, which correctly updates rseq.  This was expected and didn't confuse me.

What confused me is that I was trying to confirm the bug was being hit from within
the kernel by confirming KVM observed TIF_NOTIFY_RESUME, but I misunderstood when
TIF_NOTIFY_RESUME would get set.  KVM can observe TIF_NOTIFY_RESUME directly, but
it's rare, and I suspect happens iff sched_setaffinity() hits the small window where
it collides with KVM_RUN before KVM enters the guest.

More commonly, the bug occurs when KVM sees TIF_NEED_RESCHED.  In that case, KVM
calls xfer_to_guest_mode_work(), which does schedule() and _that_ sets
TIF_NOTIFY_RESUME.  xfer_to_guest_mode_work() then mishandles TIF_NOTIFY_RESUME
and the bug is hit, but my confirmation logic in KVM never fired.

So there are effectively three reasons we want a delay:

  1. To allow sched_setaffinity() to coincide with ioctl(KVM_RUN) before KVM can
     enter the guest so that the guest doesn't need an arch-specific VM-Exit source.

  2. To let ioctl(KVM_RUN) make its way back to the test before the next round
     of migration.

  3. To ensure the read-side can make forward progress, e.g. if sched_getcpu()
     involves a syscall.


After looking at KVM for arm64 and s390, #1 is a bit tenuous because x86 is the
only arch that currently uses xfer_to_guest_mode_work(), i.e. the test could be
tweaked to be overtly x86-specific.  But since a delay is needed for #2 and #3,
I'd prefer to rely on it for #1 as well in the hopes that this test provides
coverage for arm64 and/or s390 if they're ever converted to use the common
xfer_to_guest_mode_work().
