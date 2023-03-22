Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F756C4A44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 13:21:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhSJC5Dfdz3f3n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 23:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PnTNyyTt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PnTNyyTt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PnTNyyTt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PnTNyyTt;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhSHF2nBVz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 23:20:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679487638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hPXFCTl8qif3OA4s3YNypS2WhS0XvH7qdHBOusQ/gQI=;
	b=PnTNyyTtmjPpSksKWycfVn6N7wbXIRnxRFaje+gf18Yr79F1OaIakI5unT18OEYD0T3l8H
	AiO5qZ+Jv+pbdR4zudblWmbE7d+AgL6vdBt/n6a5D7l3A+jWXuQxd2C0700t/UXnCHiZcO
	6GvLoqY8aF5DmZ0VKlPW0IbASlGit9E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679487638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hPXFCTl8qif3OA4s3YNypS2WhS0XvH7qdHBOusQ/gQI=;
	b=PnTNyyTtmjPpSksKWycfVn6N7wbXIRnxRFaje+gf18Yr79F1OaIakI5unT18OEYD0T3l8H
	AiO5qZ+Jv+pbdR4zudblWmbE7d+AgL6vdBt/n6a5D7l3A+jWXuQxd2C0700t/UXnCHiZcO
	6GvLoqY8aF5DmZ0VKlPW0IbASlGit9E=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-Oau3dkFzPrOP_irmVa88VQ-1; Wed, 22 Mar 2023 08:20:36 -0400
X-MC-Unique: Oau3dkFzPrOP_irmVa88VQ-1
Received: by mail-qt1-f199.google.com with SMTP id y10-20020a05622a164a00b003e38e0a3cc3so479787qtj.14
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679487636;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPXFCTl8qif3OA4s3YNypS2WhS0XvH7qdHBOusQ/gQI=;
        b=gdXbd4s1r4H2AaFvt1DhrTXCN/pwCiRJDmwQqit4IVNgqdnJ1n8d5gkdwNRM0rZJW1
         B7vJGlAn7XW9iHYMroxHSjnW+aJD6tuG5Cim2ksoyQDxRssk09DIA6Rv0h0TQYfYUfZd
         0RKyH3oo8M9Vig/TT4kTjpHQB2AnHXcQoQPErbjiWtvbCwQcPHW4qPZ19YgkxHpywXp8
         wt7BiQM/K2UKh+RAGDlvMCDsRK9R/9RZbaiF/5eJJU05096uIhHd9y+FSqKVeUVn82cI
         tFZJ5XBDY51gghyMIQVCV7q6MKOqro7a3dKC7SuCib7xmC+h+S3gSOacTFr5MW/biDHK
         KrRQ==
X-Gm-Message-State: AO0yUKWj35ZZC0GOeF9NlO2QdegC5R2G8Rzlk4Lz1yckSqZ6Qikm4Hk1
	cco71Rzy+tt9uNxaNpoGCJBh4CS4CVPEd9mJZMD38zoZw5+lEDUEu/Y3cg1MS+LtqYk0sR3liBc
	d+4f2ihCMo3RjGzr296PWpUvJUQ==
X-Received: by 2002:a05:6214:e6e:b0:5c5:95db:858a with SMTP id jz14-20020a0562140e6e00b005c595db858amr5249083qvb.31.1679487636118;
        Wed, 22 Mar 2023 05:20:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set+c4qgqaBQUslatTuVuP/CBQYeSmWHcWFFuVnFTR+yoMggQM+H4NTuj8PmuW7zmUDZ2oj+NWg==
X-Received: by 2002:a05:6214:e6e:b0:5c5:95db:858a with SMTP id jz14-20020a0562140e6e00b005c595db858amr5249039qvb.31.1679487635822;
        Wed, 22 Mar 2023 05:20:35 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id d185-20020a37b4c2000000b007425ef4cbc2sm11175799qkf.100.2023.03.22.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:20:35 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
Date: Wed, 22 Mar 2023 12:20:28 +0000
Message-ID: <xhsmhmt45c703.mognet@vschneid.remote.csb>
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

On 22/03/23 10:53, Peter Zijlstra wrote:
> On Tue, Mar 07, 2023 at 02:35:58PM +0000, Valentin Schneider wrote:
>
>> @@ -477,6 +490,25 @@ static __always_inline void csd_unlock(struct __call_single_data *csd)
>>      smp_store_release(&csd->node.u_flags, 0);
>>  }
>>
>> +static __always_inline void
>> +raw_smp_call_single_queue(int cpu, struct llist_node *node, smp_call_func_t func)
>> +{
>> +	/*
>> +	 * The list addition should be visible to the target CPU when it pops
>> +	 * the head of the list to pull the entry off it in the IPI handler
>> +	 * because of normal cache coherency rules implied by the underlying
>> +	 * llist ops.
>> +	 *
>> +	 * If IPIs can go out of order to the cache coherency protocol
>> +	 * in an architecture, sufficient synchronisation should be added
>> +	 * to arch code to make it appear to obey cache coherency WRT
>> +	 * locking and barrier primitives. Generic code isn't really
>> +	 * equipped to do the right thing...
>> +	 */
>> +	if (llist_add(node, &per_cpu(call_single_queue, cpu)))
>> +		send_call_function_single_ipi(cpu, func);
>> +}
>> +
>>  static DEFINE_PER_CPU_SHARED_ALIGNED(call_single_data_t, csd_data);
>>
>>  void __smp_call_single_queue(int cpu, struct llist_node *node)
>> @@ -493,21 +525,25 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
>>              }
>>      }
>>  #endif
>>      /*
>> +	 * We have to check the type of the CSD before queueing it, because
>> +	 * once queued it can have its flags cleared by
>> +	 *   flush_smp_call_function_queue()
>> +	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
>> +	 * executes migration_cpu_stop() on the remote CPU).
>>       */
>> +	if (trace_ipi_send_cpumask_enabled()) {
>> +		call_single_data_t *csd;
>> +		smp_call_func_t func;
>> +
>> +		csd = container_of(node, call_single_data_t, node.llist);
>> +		func = CSD_TYPE(csd) == CSD_TYPE_TTWU ?
>> +			sched_ttwu_pending : csd->func;
>> +
>> +		raw_smp_call_single_queue(cpu, node, func);
>> +	} else {
>> +		raw_smp_call_single_queue(cpu, node, NULL);
>> +	}
>>  }
>
> Hurmph... so we only really consume @func when we IPI. Would it not be
> more useful to trace this thing for *every* csd enqeued?

It's true that any CSD enqueued on that CPU's call_single_queue in the
[first CSD llist_add()'ed, IPI IRQ hits] timeframe is a potential source of
interference.

However, can we be sure that first CSD isn't an indirect cause for the
following ones? say the target CPU exits RCU EQS due to the IPI, there's a
bit of time before it gets to flush_smp_call_function_queue() where some other CSD
could be enqueued *because* of that change in state.

I couldn't find a easy example of that, I might be biased as this is where
I'd like to go wrt IPI'ing isolated CPUs in usermode. But regardless, when
correlating an IPI IRQ with its source, we'd always have to look at the
first CSD in that CSD stack.

