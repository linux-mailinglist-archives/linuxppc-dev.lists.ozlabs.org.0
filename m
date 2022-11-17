Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB9162DE8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 15:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCjRB3bcVz3cN0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:46:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WHLp+j2J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WHLp+j2J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WHLp+j2J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WHLp+j2J;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCjQG1ZDLz3cH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 01:45:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668696338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8gmgQPGvV0Pdco46Use918rHcFMun1FBq8lcqpGuipk=;
	b=WHLp+j2JwA+WtR97vTkPT0o4n4Tn8Z+CdeXCE+SjRo090Dnff4bI5Zw0Wgmn2367z/o2A/
	T34RXjDWMNql3epTmt/hPbAJtxWid97jiX7oFRf1NnIylNSN4bSxhprZiLhAM0wUOy8upu
	vP4iCUt8Y6LZ+v5NwmINmfujQRfd8Ac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668696338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8gmgQPGvV0Pdco46Use918rHcFMun1FBq8lcqpGuipk=;
	b=WHLp+j2JwA+WtR97vTkPT0o4n4Tn8Z+CdeXCE+SjRo090Dnff4bI5Zw0Wgmn2367z/o2A/
	T34RXjDWMNql3epTmt/hPbAJtxWid97jiX7oFRf1NnIylNSN4bSxhprZiLhAM0wUOy8upu
	vP4iCUt8Y6LZ+v5NwmINmfujQRfd8Ac=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-krlo7u74OnqrkCLxN8mvAQ-1; Thu, 17 Nov 2022 09:45:36 -0500
X-MC-Unique: krlo7u74OnqrkCLxN8mvAQ-1
Received: by mail-wr1-f69.google.com with SMTP id i14-20020adfa50e000000b0023652707418so792786wrb.20
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 06:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gmgQPGvV0Pdco46Use918rHcFMun1FBq8lcqpGuipk=;
        b=pqlzp5MDvfWNoPsiQWCn26r3TvTtqtk0PLnYajQ5bfH7KG4pqtVmtvFUmWk+oFXV9+
         qHNL+CRQAVb45KwP7tqgVjPjKX+03kb5cTxWJSNFi9ZHIurMXEYdCx1wVZWKn+AI5fHw
         cN77H4pLiWIbb2xtKbC+FtlbdcDNXt/xe1CgpjVk7ogJD4E+5hzpxkLnrDDqt83aGy/x
         hIJkxO/QNLOUFe2o5PK+FgmgTWkLAEjRDqd9Ik4fMXmaxIAn4TXKsmGtPIoKNEZn35tZ
         R6xm15WDMh911TvXKAfSVkMrzrmHD0bGJOwY4sUVipdNRvmpFIhFd6++eE7Y34mzgcF5
         fy3g==
X-Gm-Message-State: ANoB5pkGOkoB6UhnRQ5tuExtn6RhjM/Ly71QpGLPAJylwOsk5ka1y6VO
	+s7yhZDvvtqM0TbvmwixDxy1xdAL8qX8YEXSXBSlNj7lmu3LDutDy8TZ+WlrzUyhhgauacoHVdV
	uZwS3ef1ABXoEC2rGzdNm/5Tqkw==
X-Received: by 2002:a5d:4683:0:b0:23a:43b7:cdd5 with SMTP id u3-20020a5d4683000000b0023a43b7cdd5mr1645384wrq.387.1668696335546;
        Thu, 17 Nov 2022 06:45:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64NPDvBapwgGSgB2P5pH25AfOA35vY/3ogR7keZELycX3grFeKUdCp0vRGXy3K3A08o5vlDw==
X-Received: by 2002:a5d:4683:0:b0:23a:43b7:cdd5 with SMTP id u3-20020a5d4683000000b0023a43b7cdd5mr1645351wrq.387.1668696335309;
        Thu, 17 Nov 2022 06:45:35 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d6a52000000b00236740c6e6fsm1069950wrw.100.2022.11.17.06.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:45:34 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-7-vschneid@redhat.com>
 <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
Date: Thu, 17 Nov 2022 14:45:29 +0000
Message-ID: <xhsmhfsehy706.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.
 org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/11/22 15:12, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:36PM +0000, Valentin Schneider wrote:
> *yuck*

:-)

>
> How about something like so?
>
> ---
> --- a/kernel/irq_work.c
> +++ b/kernel/irq_work.c
> @@ -24,6 +24,8 @@
>
>  #include <trace/events/ipi.h>
>
> +#include "sched/smp.h"
> +
>  static DEFINE_PER_CPU(struct llist_head, raised_list);
>  static DEFINE_PER_CPU(struct llist_head, lazy_list);
>  static DEFINE_PER_CPU(struct task_struct *, irq_workd);
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3763,16 +3763,17 @@ void sched_ttwu_pending(void *arg)
>       rq_unlock_irqrestore(rq, &rf);
>  }
>
> -void send_call_function_single_ipi(int cpu)
> +bool send_call_function_single_ipi(int cpu)
>  {
>       struct rq *rq = cpu_rq(cpu);
>
>       if (!set_nr_if_polling(rq->idle)) {
> -		trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);
>               arch_send_call_function_single_ipi(cpu);
> -	} else {
> -		trace_sched_wake_idle_without_ipi(cpu);
> +		return true;
>       }
> +
> +	trace_sched_wake_idle_without_ipi(cpu);
> +	return false;
>  }
>
>  /*
> --- a/kernel/sched/smp.h
> +++ b/kernel/sched/smp.h
> @@ -6,7 +6,7 @@
>
>  extern void sched_ttwu_pending(void *arg);
>
> -extern void send_call_function_single_ipi(int cpu);
> +extern bool send_call_function_single_ipi(int cpu);
>
>  #ifdef CONFIG_SMP
>  extern void flush_smp_call_function_queue(void);
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -163,7 +163,6 @@ void __init call_function_init(void)
>  static inline void
>  send_call_function_ipi_mask(const struct cpumask *mask)
>  {
> -	trace_ipi_send_cpumask(mask, _RET_IP_, func);
>       arch_send_call_function_ipi_mask(mask);
>  }
>
> @@ -438,11 +437,16 @@ static void __smp_call_single_queue_debu
>       struct cfd_seq_local *seq = this_cpu_ptr(&cfd_seq_local);
>       struct call_function_data *cfd = this_cpu_ptr(&cfd_data);
>       struct cfd_percpu *pcpu = per_cpu_ptr(cfd->pcpu, cpu);
> +	struct __call_single_data *csd;
> +
> +	csd = container_of(node, call_single_data_t, node.llist);
> +	WARN_ON_ONCE(!(CSD_TYPE(csd) & (CSD_TYPE_SYNC | CSD_TYPE_ASYNC)));
>
>       cfd_seq_store(pcpu->seq_queue, this_cpu, cpu, CFD_SEQ_QUEUE);
>       if (llist_add(node, &per_cpu(call_single_queue, cpu))) {
>               cfd_seq_store(pcpu->seq_ipi, this_cpu, cpu, CFD_SEQ_IPI);
>               cfd_seq_store(seq->ping, this_cpu, cpu, CFD_SEQ_PING);
> +		trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, csd->func);
>               send_call_function_single_ipi(cpu);
>               cfd_seq_store(seq->pinged, this_cpu, cpu, CFD_SEQ_PINGED);
>       } else {
> @@ -487,6 +491,27 @@ static __always_inline void csd_unlock(s
>
>  static DEFINE_PER_CPU_SHARED_ALIGNED(call_single_data_t, csd_data);
>
> +static __always_inline
> +bool raw_smp_call_single_queue(int cpu, struct llist_node *node)
> +{
> +	/*
> +	 * The list addition should be visible to the target CPU when it pops
> +	 * the head of the list to pull the entry off it in the IPI handler
> +	 * because of normal cache coherency rules implied by the underlying
> +	 * llist ops.
> +	 *
> +	 * If IPIs can go out of order to the cache coherency protocol
> +	 * in an architecture, sufficient synchronisation should be added
> +	 * to arch code to make it appear to obey cache coherency WRT
> +	 * locking and barrier primitives. Generic code isn't really
> +	 * equipped to do the right thing...
> +	 */
> +	if (llist_add(node, &per_cpu(call_single_queue, cpu)))
> +		return send_call_function_single_ipi(cpu);
> +
> +	return false;
> +}
> +
>  void __smp_call_single_queue(int cpu, struct llist_node *node)
>  {
>  #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
> @@ -503,19 +528,28 @@ void __smp_call_single_queue(int cpu, st
>  #endif
>
>       /*
> -	 * The list addition should be visible to the target CPU when it pops
> -	 * the head of the list to pull the entry off it in the IPI handler
> -	 * because of normal cache coherency rules implied by the underlying
> -	 * llist ops.
> -	 *
> -	 * If IPIs can go out of order to the cache coherency protocol
> -	 * in an architecture, sufficient synchronisation should be added
> -	 * to arch code to make it appear to obey cache coherency WRT
> -	 * locking and barrier primitives. Generic code isn't really
> -	 * equipped to do the right thing...
> -	 */
> -	if (llist_add(node, &per_cpu(call_single_queue, cpu)))
> -		send_call_function_single_ipi(cpu);
> +	 * We have to check the type of the CSD before queueing it, because
> +	 * once queued it can have its flags cleared by
> +	 *   flush_smp_call_function_queue()
> +	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
> +	 * executes migration_cpu_stop() on the remote CPU).
> +	 */
> +	if (trace_ipi_send_cpumask_enabled()) {
> +		call_single_data_t *csd;
> +		smp_call_func_t func;
> +
> +		csd = container_of(node, call_single_data_t, node.llist);
> +
> +		func = sched_ttwu_pending;
> +		if (CSD_TYPE(csd) != CSD_TYPE_TTWU)
> +			func = csd->func;
> +
> +		if (raw_smp_call_single_queue(cpu, node))
> +			trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);

So I went with the tracepoint being placed *before* the actual IPI gets
sent to have a somewhat sane ordering between trace_ipi_send_cpumask() and
e.g. trace_call_function_single_entry().

Packaging the call_single_queue logic makes the code less horrible, but it
does mix up the event ordering...


> +		return;
> +	}
> +
> +	raw_smp_call_single_queue(cpu, node);
>  }
>
>  /*
> @@ -983,10 +1017,13 @@ static void smp_call_function_many_cond(
>                * number of CPUs might be zero due to concurrent changes to the
>                * provided mask.
>                */
> -		if (nr_cpus == 1)
> +		if (nr_cpus == 1) {
> +			trace_ipi_send_cpumask(cpumask_of(last_cpu), _RET_IP_, func);
>                       send_call_function_single_ipi(last_cpu);

This'll yield an IPI event even if no IPI is sent due to the idle task
polling, no?

> -		else if (likely(nr_cpus > 1))
> -			send_call_function_ipi_mask(cfd->cpumask_ipi);
> +		} else if (likely(nr_cpus > 1)) {
> +			trace_ipi_send_cpumask(mask, _RET_IP_, func);
> +			send_call_function_ipi_mask(mask);
> +		}
>
>               cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
>       }

