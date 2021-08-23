Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317A3F4CE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:00:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtb5y02ySz2yHW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:00:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=ejPco84G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=ejPco84G; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gtb5B0lqXz2xX3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:00:13 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id A0106334FC6;
 Mon, 23 Aug 2021 11:00:08 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uKFyB1M3jATS; Mon, 23 Aug 2021 11:00:04 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 0D4FB334EEB;
 Mon, 23 Aug 2021 11:00:04 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 0D4FB334EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1629730804;
 bh=EGJSeB1m+KUlEGsOyCQNymBM03QrlJxesVoB9WRZFHo=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ejPco84GHAXhi1/6wOVyAMnfI8z5LTzjRsTcS73jAocDos/Jg612nxN47CZzMjd1v
 j0dkSxvMADrUUQ6+2XaVpzg41uUfS876bws5Dc9KVmY3TbvU8bfG/GzZtSaU6MD/Br
 qd+yqE3E2LAVx+Wr4bAeKieW105tnSA1qBUEcAIFATAGYjySau7Gt6WOjEkKspWh2B
 avdwWhlGU945C6b8YvfAvk1ZdqEc2nt46fnvC2+SAOAbasQIeDIf96bdMWUzu3FQjr
 7/tGcKmANl6xucIecfrF1a7WCI/NBUZnrQLCXvN+xT53buigZa/MX4DkWxF0/t6oL9
 xwMUBg49cEiGg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3fgpCu_WLZGT; Mon, 23 Aug 2021 11:00:03 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id BD2C1335202;
 Mon, 23 Aug 2021 11:00:03 -0400 (EDT)
Date: Mon, 23 Aug 2021 11:00:03 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <733947967.21669.1629730803567.JavaMail.zimbra@efficios.com>
In-Reply-To: <20210820225002.310652-2-seanjc@google.com>
References: <20210820225002.310652-1-seanjc@google.com>
 <20210820225002.310652-2-seanjc@google.com>
Subject: Re: [PATCH v2 1/5] KVM: rseq: Update rseq when processing
 NOTIFY_RESUME on xfer to KVM guest
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - FF90 (Linux)/8.8.15_GA_4059)
Thread-Topic: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM
 guest
Thread-Index: CeEx/cQL9qhzvrS0pzwTWVh97FgvJA==
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

----- On Aug 20, 2021, at 6:49 PM, Sean Christopherson seanjc@google.com wrote:

> Invoke rseq's NOTIFY_RESUME handler when processing the flag prior to
> transferring to a KVM guest, which is roughly equivalent to an exit to
> userspace and processes many of the same pending actions.  While the task
> cannot be in an rseq critical section as the KVM path is reachable only
> by via ioctl(KVM_RUN), the side effects that apply to rseq outside of a
> critical section still apply, e.g. the current CPU needs to be updated if
> the task is migrated.
> 
> Clearing TIF_NOTIFY_RESUME without informing rseq can lead to segfaults
> and other badness in userspace VMMs that use rseq in combination with KVM,
> e.g. due to the CPU ID being stale after task migration.

Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

> 
> Fixes: 72c3c0fe54a3 ("x86/kvm: Use generic xfer to guest work function")
> Reported-by: Peter Foley <pefoley@google.com>
> Bisected-by: Doug Evans <dje@google.com>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> kernel/entry/kvm.c |  4 +++-
> kernel/rseq.c      | 14 +++++++++++---
> 2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
> index 49972ee99aff..049fd06b4c3d 100644
> --- a/kernel/entry/kvm.c
> +++ b/kernel/entry/kvm.c
> @@ -19,8 +19,10 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu,
> unsigned long ti_work)
> 		if (ti_work & _TIF_NEED_RESCHED)
> 			schedule();
> 
> -		if (ti_work & _TIF_NOTIFY_RESUME)
> +		if (ti_work & _TIF_NOTIFY_RESUME) {
> 			tracehook_notify_resume(NULL);
> +			rseq_handle_notify_resume(NULL, NULL);
> +		}
> 
> 		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
> 		if (ret)
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index 35f7bd0fced0..6d45ac3dae7f 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -282,9 +282,17 @@ void __rseq_handle_notify_resume(struct ksignal *ksig,
> struct pt_regs *regs)
> 
> 	if (unlikely(t->flags & PF_EXITING))
> 		return;
> -	ret = rseq_ip_fixup(regs);
> -	if (unlikely(ret < 0))
> -		goto error;
> +
> +	/*
> +	 * regs is NULL if and only if the caller is in a syscall path.  Skip
> +	 * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
> +	 * kill a misbehaving userspace on debug kernels.
> +	 */
> +	if (regs) {
> +		ret = rseq_ip_fixup(regs);
> +		if (unlikely(ret < 0))
> +			goto error;
> +	}
> 	if (unlikely(rseq_update_cpu_id(t)))
> 		goto error;
> 	return;
> --
> 2.33.0.rc2.250.ged5fa647cd-goog

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
