Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6C6C53A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 19:23:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhcL03MGWz3cj0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 05:23:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FIpgouFy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPtx305e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FIpgouFy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPtx305e;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhcK13fqDz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 05:22:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679509360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AQmTyEbfymjzRNtIW6wpo43MqQOqbzqrZwvZwgWkUpU=;
	b=FIpgouFyNulTTtWvxU0mBaBLGH9BSm/yRB7mURQ5fswmrJXd4zbTO8pEwWHxdRoP8CbpDr
	c2GwZ/e8yx46V2h8tq38tOpXiY2ePXvs4qYumUUek1NwsMoUdcqM43x0SVv757mTzSAOIV
	9v8LMdI7tA7v4jQB3Ll3dYsKdK1GV70=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679509361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AQmTyEbfymjzRNtIW6wpo43MqQOqbzqrZwvZwgWkUpU=;
	b=PPtx305e66KvkvD28XRQxH2yujwWhwev75fmdZc91pIwHuG9HkJ40j69a3Rt3+y52z1jU6
	oCtg9dBKY3iY5rwbH4aowdeYpihUju/7iLsS3A4kimCNmHiP723htL1gM0aW/GUzY+FI32
	4xbzli76ReBHg1t3rUfEkl5g/RsKGdY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-m8JtXg8kP1S-AWKo_HP00w-1; Wed, 22 Mar 2023 14:22:37 -0400
X-MC-Unique: m8JtXg8kP1S-AWKo_HP00w-1
Received: by mail-qk1-f197.google.com with SMTP id b34-20020a05620a272200b007460c05a463so9147032qkp.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 11:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509357;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQmTyEbfymjzRNtIW6wpo43MqQOqbzqrZwvZwgWkUpU=;
        b=2kSL5skTgxUD9vylhpyf9m4zo4gDw3XRXuMSUxRkZZmmOfklw1CsusLupX/mslUL46
         4Ovl5zCtmstHVlCnjZpfd6KjRRbXYrsREmIGChuLGxKGXGsPYkOMcDRFpRAk8HWWZsWW
         ARKkPBiCWYczYOpGxXuciIjPUJ77FpgcsBw2vtC8Z2O25rzt5eyjhx9lzvmtKw5fkiio
         lBpZBvOMk5CMlzKyJf9+60qLnc1ncGbag3dlWfuwlqvGQHuCGz52ajgZT+G63SwHVoLV
         amzTe3FwXAC5gDbD/OGLzgq77lwrTENUuAOakRbtOOUztiKhEoRrSdtoBEpfBISZd0SL
         cNtg==
X-Gm-Message-State: AO0yUKXfCjHfDto/ME9lI5eDVc6amsGIy42EbXRyeYmL0E3Hkup9+c4F
	c1EYyKqKe218yRNw9Pn4K8t7qhGdRzNdUm3a7GAOlnnA1/88WBBNpbkJRMOiX+g9qBd42v3D6VU
	aKNYZhzJF2KYIRJLEyy+FuVPD+w==
X-Received: by 2002:ac8:594a:0:b0:3e3:7e53:9a8f with SMTP id 10-20020ac8594a000000b003e37e539a8fmr7511733qtz.50.1679509356914;
        Wed, 22 Mar 2023 11:22:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set+t7wmz3/x7URy1IAcP9apu1JV9+38nhf9A/nHJ2ae3E1Cp8z62mk26+NWh6ExaxyxmUk07Nw==
X-Received: by 2002:ac8:594a:0:b0:3e3:7e53:9a8f with SMTP id 10-20020ac8594a000000b003e37e539a8fmr7511693qtz.50.1679509356631;
        Wed, 22 Mar 2023 11:22:36 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id j23-20020ac86657000000b003e0c29112b6sm6351465qtp.7.2023.03.22.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 11:22:36 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230322172242.GH2357380@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
 <20230322172242.GH2357380@hirez.programming.kicks-ass.net>
Date: Wed, 22 Mar 2023 18:22:28 +0000
Message-ID: <xhsmhh6ucd4t7.mognet@vschneid.remote.csb>
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

On 22/03/23 18:22, Peter Zijlstra wrote:
> On Wed, Mar 22, 2023 at 05:01:13PM +0000, Valentin Schneider wrote:
>
>> > So I was thinking something like this:
>
>> Hm, this does get rid of the func being passed down the helpers, but this
>> means the trace events are now stateful, i.e. I need the first and last
>> events in a CSD stack to figure out which one actually caused the IPI.
>
> Isn't much of tracing stateful? I mean, why am I always writing awk
> programs to parse trace output?
>
> The one that is directly followed by
> generic_smp_call_function_single_interrupt() (horrible name that), is
> the one that tripped the IPI.
>

Right.

>> It also requires whoever is looking at the trace to be aware of which IPIs
>> are attached to a CSD, and which ones aren't. ATM that's only the resched
>> IPI, but per the cover letter there's more to come (e.g. tick_broadcast()
>> for arm64/riscv and a few others). For instance:
>> 
>>        hackbench-157   [001]    10.894320: ipi_send_cpu:         cpu=3 callsite=check_preempt_curr+0x37 callback=0x0
>
> Arguably we should be setting callback to scheduler_ipi(), except
> ofcourse, that's not an actual function...
>
> Maybe we can do "extern inline" for the actual users and provide a dummy
> function for the symbol when tracing.
>

Huh, I wasn't aware that was an option, I'll look into that. I did scribble
down a comment next to smp_send_reschedule(), but having a decodable
function name would be better!

>>        hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=sched_ttwu_pending+0x0
>>        hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=generic_smp_call_function_single_interrupt+0x0
>> 
>> That first one sent a RESCHEDULE IPI, the second one a CALL_FUNCTION one,
>> but you really have to know what you're looking at...
>
> But you have to know that anyway, you can't do tracing and not know wtf
> you're doing. Or rather, if you do, I don't give a crap and you can keep
> the pieces :-)
>
> Grepping the callback should be pretty quick resolution at to what trips
> it, no?
>
> (also, if you *realllllly* can't manage, we can always add yet another
> argument that gives a type thingy)
>

Ah, I was a bit unclear here - I don't care too much about the IPI type
being used, but rather being able to figure out on IRQ entry where that IPI
came from - thinking some more about now, I don't think logging *all* CSDs
causes an issue there, as you'd look at the earliest-not-seen-yet event
targeting this CPU anyway.

That'll be made easy once I get to having cpumask filters for ftrace, so
I can just issue something like:

  trace-cmd record -e 'ipi_send_cpu' -f "cpu == 3" -e 'ipi_send_cpumask' -f "cpus \in {3}" -T hackbench 

(it's somewhere on the todolist...)

TL;DR: I *think* I've convinced myself logging all of them isn't an issue -
I'm going to play with this on something "smarter" than just hackbench
under QEMU just to drill it in.

