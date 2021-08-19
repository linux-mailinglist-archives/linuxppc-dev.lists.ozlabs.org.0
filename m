Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536B3F2267
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 23:41:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrJBX6wjhz3cLL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 07:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=pa3pYJ3c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=pa3pYJ3c; dkim-atps=neutral
X-Greylist: delayed 112 seconds by postgrey-1.36 at boromir;
 Fri, 20 Aug 2021 07:41:14 AEST
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrJ9k42gpz308G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 07:41:14 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 3F7573781F6;
 Thu, 19 Aug 2021 17:41:12 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZGEgsUCEHpib; Thu, 19 Aug 2021 17:41:07 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id B069F3783B1;
 Thu, 19 Aug 2021 17:41:07 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B069F3783B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1629409267;
 bh=J2pdWpoMI+2vyTpqFQezmJJ20BZQemWJSr2tXYWs+kg=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=pa3pYJ3cbUZgsy5RMEfVX06b5BMW15nJGybYKI80PCZtKT/loekIXo67iDkr3zw2o
 AcQDjSUEvPWZkfXFa2MNL3M12qdedS0z+iwaLKmQvShFxf5k9up1UVkNLovNXP8sDY
 bdA2RyTMR+fBhQ1QbBLFpUUMqTGJRnrvlAIYO29B4UKvWiSALIAw+bbwWQjH4594fa
 f4hMQXetpOHKVNonM0bzEra3naNVB6D/IW5A3QgT+JlY4hoy7eTAZclpqOtXJ3eyZe
 4eLvEB8j4rfdfPDY0Vd+YVFdM2+RDHAKBJzLiMn18KxjxGQvY6sQUgo11F1HW7WM3d
 KWwvfOAqkirvA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lJ00l7vXwbaJ; Thu, 19 Aug 2021 17:41:07 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 774CF37853B;
 Thu, 19 Aug 2021 17:41:07 -0400 (EDT)
Date: Thu, 19 Aug 2021 17:41:07 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <1359319445.19723.1629409267434.JavaMail.zimbra@efficios.com>
In-Reply-To: <20210818001210.4073390-3-seanjc@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-3-seanjc@google.com>
Subject: Re: [PATCH 2/5] entry: rseq: Call rseq_handle_notify_resume() in
 tracehook_notify_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF90 (Linux)/8.8.15_GA_4059)
Thread-Topic: entry: rseq: Call rseq_handle_notify_resume() in
 tracehook_notify_resume()
Thread-Index: gCU2eWL1uMmIvUsMi61iATE69Brb6A==
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
 Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
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

----- On Aug 17, 2021, at 8:12 PM, Sean Christopherson seanjc@google.com wrote:

> Invoke rseq_handle_notify_resume() from tracehook_notify_resume() now
> that the two function are always called back-to-back by architectures
> that have rseq.  The rseq helper is stubbed out for architectures that
> don't support rseq, i.e. this is a nop across the board.
> 
> Note, tracehook_notify_resume() is horribly named and arguably does not
> belong in tracehook.h as literally every line of code in it has nothing
> to do with tracing.  But, that's been true since commit a42c6ded827d
> ("move key_repace_session_keyring() into tracehook_notify_resume()")
> first usurped tracehook_notify_resume() back in 2012.  Punt cleaning that
> mess up to future patches.
> 
> No functional change intended.

This will make it harder to introduce new code paths which consume the
NOTIFY_RESUME without calling the rseq callback, which introduces issues.
Agreed.

Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> arch/arm/kernel/signal.c     | 1 -
> arch/arm64/kernel/signal.c   | 1 -
> arch/csky/kernel/signal.c    | 4 +---
> arch/mips/kernel/signal.c    | 4 +---
> arch/powerpc/kernel/signal.c | 4 +---
> arch/s390/kernel/signal.c    | 1 -
> include/linux/tracehook.h    | 2 ++
> kernel/entry/common.c        | 4 +---
> kernel/entry/kvm.c           | 4 +---
> 9 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
> index a3a38d0a4c85..9df68d139965 100644
> --- a/arch/arm/kernel/signal.c
> +++ b/arch/arm/kernel/signal.c
> @@ -670,7 +670,6 @@ do_work_pending(struct pt_regs *regs, unsigned int
> thread_flags, int syscall)
> 				uprobe_notify_resume(regs);
> 			} else {
> 				tracehook_notify_resume(regs);
> -				rseq_handle_notify_resume(NULL, regs);
> 			}
> 		}
> 		local_irq_disable();
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 23036334f4dc..22b55db13da6 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -951,7 +951,6 @@ asmlinkage void do_notify_resume(struct pt_regs *regs,
> 
> 			if (thread_flags & _TIF_NOTIFY_RESUME) {
> 				tracehook_notify_resume(regs);
> -				rseq_handle_notify_resume(NULL, regs);
> 
> 				/*
> 				 * If we reschedule after checking the affinity
> diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
> index 312f046d452d..bc4238b9f709 100644
> --- a/arch/csky/kernel/signal.c
> +++ b/arch/csky/kernel/signal.c
> @@ -260,8 +260,6 @@ asmlinkage void do_notify_resume(struct pt_regs *regs,
> 	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
> 		do_signal(regs);
> 
> -	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
> +	if (thread_info_flags & _TIF_NOTIFY_RESUME)
> 		tracehook_notify_resume(regs);
> -		rseq_handle_notify_resume(NULL, regs);
> -	}
> }
> diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
> index f1e985109da0..c9b2a75563e1 100644
> --- a/arch/mips/kernel/signal.c
> +++ b/arch/mips/kernel/signal.c
> @@ -906,10 +906,8 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, void
> *unused,
> 	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
> 		do_signal(regs);
> 
> -	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
> +	if (thread_info_flags & _TIF_NOTIFY_RESUME)
> 		tracehook_notify_resume(regs);
> -		rseq_handle_notify_resume(NULL, regs);
> -	}
> 
> 	user_enter();
> }
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index e600764a926c..b93b87df499d 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -293,10 +293,8 @@ void do_notify_resume(struct pt_regs *regs, unsigned long
> thread_info_flags)
> 		do_signal(current);
> 	}
> 
> -	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
> +	if (thread_info_flags & _TIF_NOTIFY_RESUME)
> 		tracehook_notify_resume(regs);
> -		rseq_handle_notify_resume(NULL, regs);
> -	}
> }
> 
> static unsigned long get_tm_stackpointer(struct task_struct *tsk)
> diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
> index 78ef53b29958..b307db26bf2d 100644
> --- a/arch/s390/kernel/signal.c
> +++ b/arch/s390/kernel/signal.c
> @@ -537,5 +537,4 @@ void arch_do_signal_or_restart(struct pt_regs *regs, bool
> has_signal)
> void do_notify_resume(struct pt_regs *regs)
> {
> 	tracehook_notify_resume(regs);
> -	rseq_handle_notify_resume(NULL, regs);
> }
> diff --git a/include/linux/tracehook.h b/include/linux/tracehook.h
> index 3e80c4bc66f7..2564b7434b4d 100644
> --- a/include/linux/tracehook.h
> +++ b/include/linux/tracehook.h
> @@ -197,6 +197,8 @@ static inline void tracehook_notify_resume(struct pt_regs
> *regs)
> 
> 	mem_cgroup_handle_over_high();
> 	blkcg_maybe_throttle_current();
> +
> +	rseq_handle_notify_resume(NULL, regs);
> }
> 
> /*
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index bf16395b9e13..d5a61d565ad5 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -171,10 +171,8 @@ static unsigned long exit_to_user_mode_loop(struct pt_regs
> *regs,
> 		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
> 			handle_signal_work(regs, ti_work);
> 
> -		if (ti_work & _TIF_NOTIFY_RESUME) {
> +		if (ti_work & _TIF_NOTIFY_RESUME)
> 			tracehook_notify_resume(regs);
> -			rseq_handle_notify_resume(NULL, regs);
> -		}
> 
> 		/* Architecture specific TIF work */
> 		arch_exit_to_user_mode_work(regs, ti_work);
> diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
> index 049fd06b4c3d..49972ee99aff 100644
> --- a/kernel/entry/kvm.c
> +++ b/kernel/entry/kvm.c
> @@ -19,10 +19,8 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu,
> unsigned long ti_work)
> 		if (ti_work & _TIF_NEED_RESCHED)
> 			schedule();
> 
> -		if (ti_work & _TIF_NOTIFY_RESUME) {
> +		if (ti_work & _TIF_NOTIFY_RESUME)
> 			tracehook_notify_resume(NULL);
> -			rseq_handle_notify_resume(NULL, NULL);
> -		}
> 
> 		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
> 		if (ret)
> --
> 2.33.0.rc1.237.g0d66db33f3-goog

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
