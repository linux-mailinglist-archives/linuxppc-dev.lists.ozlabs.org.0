Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252163F3421
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 20:51:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrrMp02k3z3cW3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 04:51:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=oNZOQn0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=oNZOQn0x; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrrM22TCwz3bZM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 04:51:10 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 073C437F513;
 Fri, 20 Aug 2021 14:51:08 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zcj2uIDERibu; Fri, 20 Aug 2021 14:51:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 820FA37F511;
 Fri, 20 Aug 2021 14:51:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 820FA37F511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1629485463;
 bh=sXTeQHkaWdD/4l7hoXti4Ubcl0tkf7Zd4TZfSvrKRes=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=oNZOQn0xjFt6WQUvGMQuzpN+Z9NyCI2uyOe78NZQQuRjFo81cXW9nk4wRKHl3p4Tb
 EqvG2mLmSmD+nZsWu9QYNmZf5Y1DYqtvj8uk4FE2UEyOmlnRZzUFrXd8d5OK0H0ZxP
 XJxjfI5LVysK8PvQjSCAb1kxlmlTvRWWPEliUyjGbYyFpEK+6yPplM933+g2sxtbqP
 N1sqXpyAIqfrWktVpmEHUC62l/DvIwZMzji4gpk2dNo1RdQtni4JaXgwh4OJpOFA90
 wA8AQu0rofowBXkgDS63LtzlkTRZuRQUR/m/oMITp7JQzdtCy0vFfbIsRmSgkZQM6D
 sRorjMIQcml/w==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lE-2fVChrxL9; Fri, 20 Aug 2021 14:51:03 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 5E36137F14A;
 Fri, 20 Aug 2021 14:51:03 -0400 (EDT)
Date: Fri, 20 Aug 2021 14:51:03 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
In-Reply-To: <YR7tzZ98XC6OV2vu@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
 <YR7tzZ98XC6OV2vu@google.com>
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing
 NOTIFY_RESUME on xfer to KVM guest
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF90 (Linux)/8.8.15_GA_4059)
Thread-Topic: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM
 guest
Thread-Index: PbBGpAyhKqKIuQG2l1yIkedungrZig==
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

----- On Aug 19, 2021, at 7:48 PM, Sean Christopherson seanjc@google.com wrote:

> On Thu, Aug 19, 2021, Mathieu Desnoyers wrote:
>> ----- On Aug 17, 2021, at 8:12 PM, Sean Christopherson seanjc@google.com wrote:
>> > @@ -250,7 +250,7 @@ static int rseq_ip_fixup(struct pt_regs *regs)
>> > 	 * If not nested over a rseq critical section, restart is useless.
>> > 	 * Clear the rseq_cs pointer and return.
>> > 	 */
>> > -	if (!in_rseq_cs(ip, &rseq_cs))
>> > +	if (!regs || !in_rseq_cs(ip, &rseq_cs))
>> 
>> I think clearing the thread's rseq_cs unconditionally here when regs is NULL
>> is not the behavior we want when this is called from xfer_to_guest_mode_work.
>> 
>> If we have a scenario where userspace ends up calling this ioctl(KVM_RUN)
>> from within a rseq c.s., we really want a CONFIG_DEBUG_RSEQ=y kernel to
>> kill this application in the rseq_syscall handler when exiting back to usermode
>> when the ioctl eventually returns.
>> 
>> However, clearing the thread's rseq_cs will prevent this from happening.
>> 
>> So I would favor an approach where we simply do:
>> 
>> if (!regs)
>>      return 0;
>> 
>> Immediately at the beginning of rseq_ip_fixup, before getting the instruction
>> pointer, so effectively skip all side-effects of the ip fixup code. Indeed, it
>> is not relevant to do any fixup here, because it is nested in a ioctl system
>> call.
>> 
>> Effectively, this would preserve the SIGSEGV behavior when this ioctl is
>> erroneously called by user-space from a rseq critical section.
> 
> Ha, that's effectively what I implemented first, but I changed it because of the
> comment in clear_rseq_cs() that says:
> 
>  The rseq_cs field is set to NULL on preemption or signal delivery ... as well
>  as well as on top of code outside of the rseq assembly block.
> 
> Which makes it sound like something might rely on clearing rseq_cs?

This comment is describing succinctly the lazy clear scheme for rseq_cs.

Without the lazy clear scheme, a rseq c.s. would look like:

 *                     init(rseq_cs)
 *                     cpu = TLS->rseq::cpu_id_start
 *   [1]               TLS->rseq::rseq_cs = rseq_cs
 *   [start_ip]        ----------------------------
 *   [2]               if (cpu != TLS->rseq::cpu_id)
 *                             goto abort_ip;
 *   [3]               <last_instruction_in_cs>
 *   [post_commit_ip]  ----------------------------
 *   [4]               TLS->rseq::rseq_cs = NULL

But as a fast-path optimization, [4] is not entirely needed because the rseq_cs
descriptor contains information about the instruction pointer range of the critical
section. Therefore, userspace can omit [4], but if the kernel never clears it, it
means that it will have to re-read the rseq_cs descriptor's content each time it
needs to check it to confirm that it is not nested over a rseq c.s..

So making the kernel lazily clear the rseq_cs pointer is just an optimization which
ensures that the kernel won't do useless work the next time it needs to check
rseq_cs, given that it has already validated that the userspace code is currently
not within the rseq c.s. currently advertised by the rseq_cs field.

> 
> Ah, or is it the case that rseq_cs is non-NULL if and only if userspace is in an
> rseq critical section, and because syscalls in critical sections are illegal, by
> definition clearing rseq_cs is a nop unless userspace is misbehaving.

Not quite, as I described above. But we want it to stay set so the CONFIG_DEBUG_RSEQ
code executed when returning from ioctl to userspace will be able to validate that
it is not nested within a rseq critical section.

> 
> If that's true, what about explicitly checking that at NOTIFY_RESUME?  Or is it
> not worth the extra code to detect an error that will likely be caught anyways?

The error will indeed already be caught on return from ioctl to userspace, so I
don't see any added value in duplicating this check.

Thanks,

Mathieu

> 
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index 35f7bd0fced0..28b8342290b0 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -282,6 +282,13 @@ void __rseq_handle_notify_resume(struct ksignal *ksig,
> struct pt_regs *regs)
> 
>        if (unlikely(t->flags & PF_EXITING))
>                return;
> +       if (!regs) {
> +#ifdef CONFIG_DEBUG_RSEQ
> +               if (t->rseq && rseq_get_rseq_cs(t, &rseq_cs))
> +                       goto error;
> +#endif
> +               return;
> +       }
>        ret = rseq_ip_fixup(regs);
>        if (unlikely(ret < 0))
>                goto error;
> 
>> Thanks for looking into this !
>> 
>> Mathieu
>> 
>> > 		return clear_rseq_cs(t);
>> > 	ret = rseq_need_restart(t, rseq_cs.flags);
>> > 	if (ret <= 0)
>> > --
>> > 2.33.0.rc1.237.g0d66db33f3-goog
>> 
>> --
>> Mathieu Desnoyers
>> EfficiOS Inc.
> > http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
