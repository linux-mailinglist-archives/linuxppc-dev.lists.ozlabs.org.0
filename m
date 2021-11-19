Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE0456C2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:17:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwWJW2Z6sz3cRQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:16:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E4+fCqJY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E4+fCqJY; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwWHY6RyVz2ywJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 20:16:08 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id z6so8857524pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ZQYiot3fZvMitaGtBTt2q6n5UuRPBzuJ9WhvSQKQji0=;
 b=E4+fCqJYXq6bEVnif+TyRJdAibAZwcsFl5qkq2qDgaDjFoAK+ejylUIkSaWsS6VT8T
 pcEPxMa9reyp4E2XjnALaE0pobJNkMnOchtUAMx5uVCwoiNVY9Bd4yUljQdirmfyOArF
 IgccyMV3dYoHUVYQtL9qjfvzIYRboI1VUUAaTEbylpOlHqQQnQPUHqUa+z0R3PdfydmU
 aMLcdlGFVCmycXalBiXqQ6DHUVuxu7wa9oJXzEU7ofq0zA1Z5vbdCuFeDX3h9M15Wkpm
 Jwqgh/jqSlqnsSPcsup7Tnrk6jWHnhm7pNACyAg+DrATWQLyTuNNzIqPPstiMQDZEPiR
 xIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZQYiot3fZvMitaGtBTt2q6n5UuRPBzuJ9WhvSQKQji0=;
 b=DT8kLg/A3PDmNUXYcgbOaaOGJulc8jhWRR7ZOWfKK7C1NrhNj3y5LCY7TTAK6cGzBi
 v8pwG5eOZFVsxrZ2RYaUds90l2G71IAtwtyHt1Rl5mWxTRbI3KAI4rnVNe3ig5tjR0OY
 jfFKZoc9yztCbUJDaA871fzANX/ldQupYUMFhwufkMXpZbKH26VhGJLcNwjiAEoKbyx6
 yOMY7wns3cFW9Vq48Fr4xoBR5JrAMqmtDOwjazS5dgmW6yoG4eEsUaUZL+H8mxMjXEnN
 6GZfuWDjVJBDOjbnkD35egaonoVLRpA24D2x6iiBvY4Od0Dlboi51m9/10bbji0jqXnY
 Rm+Q==
X-Gm-Message-State: AOAM5305WliLVJT/9jr6Et6KIwWz4RZOWnUa9DVRFJBiVkB1PWWKHuJS
 OgmukuC+6TJRUyhm+EEjuyo=
X-Google-Smtp-Source: ABdhPJwML7QURF2FJMfOjWSNOLc0kv7CysonWezErXx2ApVfP4HWrvKN6O2tdt70lT1ejyfH23rjKQ==
X-Received: by 2002:aa7:9628:0:b0:494:6dc8:66de with SMTP id
 r8-20020aa79628000000b004946dc866demr21241055pfg.73.1637313365590; 
 Fri, 19 Nov 2021 01:16:05 -0800 (PST)
Received: from localhost (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id k22sm2010964pfi.149.2021.11.19.01.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:16:05 -0800 (PST)
Date: Fri, 19 Nov 2021 19:15:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1] powerpc/watchdog: help remote CPUs to flush NMI printk
 output
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20211110030416.2085103-1-npiggin@gmail.com>
 <87o86p3nyj.fsf@linkitivity.dja.id.au>
In-Reply-To: <87o86p3nyj.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1637312800.znetslplrz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of November 12, 2021 4:08 pm:
> Hi,
>=20
>> The printk layer at the moment does not seem to have a good way to force
>> flush printk messages that are created in NMI context, except in the
>> panic path.
>>
>> NMI-context printk messages normally get to the console with irq_work,
>> but that won't help if the CPU is stuck with irqs disabled, as can be
>> the case for hard lockup watchdog messages.
>>
>> The watchdog currently flushes the printk buffers after detecting a
>> lockup on remote CPUs, but they may not have processed their NMI IPI
>> yet by that stage, or they may have self-detected a lockup in which
>> case they won't go via this NMI IPI path.
>>
>> Improve the situation by having NMI-context mark a flag if it called
>> printk, and have watchdog timer interrupts check if that flag was set
>> and try to flush if it was. Latency is not a big problem because we
>> were already stuck for a while, just need to try to make sure the
>> messages eventually make it out.

Sorry just coming back to this now the printk fix was merged upstream.

> Initially I was surprised that this doesn't affect the printk code
> itself, just the powerpc code...

Yeah I'm actually not sure how other watchdogs handle this. If they
use nmi_trigger_cpumask_backtrace() then that does have a flush.

>> Cc: Laurent Dufour <ldufour@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> This patch is actually based on top of this one which is planned to go
>> upstream in rc1/2. https://marc.info/?l=3Dlinux-kernel&m=3D1636260703120=
52&w=3D2
>>
>> Prior to commit 93d102f094be that is fixed by the above, we had a printk
>> flush function with a different name but basically does the same job, so
>> this patch can be backported, just needs some care. I'm posting it for
>> review now for feedback so it's ready to go when the printk patch is
>> upstream.
>>
>> Thanks,
>> Nick
>>
>>  arch/powerpc/kernel/watchdog.c | 29 +++++++++++++++++++++++------
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchd=
og.c
>> index b6533539386b..a7b6b0691203 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -86,6 +86,7 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
>>  /* SMP checker bits */
>>  static unsigned long __wd_smp_lock;
>>  static unsigned long __wd_reporting;
>> +static unsigned long __wd_nmi_output;
>>  static cpumask_t wd_smp_cpus_pending;
>>  static cpumask_t wd_smp_cpus_stuck;
>>  static u64 wd_smp_last_reset_tb;
>> @@ -154,6 +155,18 @@ static void wd_lockup_ipi(struct pt_regs *regs)
>>  	else
>>  		dump_stack();
>> =20
>> +	/*
>> +	 * We printk()ed from NMI context, the contents may not get flushed
>> +	 * if we return to a context with interrupts disabled because
>> +	 * printk uses irq_work to schedule flushes of NMI output.
>> +	 * __wd_nmi_output says there has been output from NMI context, so
>> +	 * other CPUs are recruited to help flush it.
>> +	 *
>> +	 * xchg is not needed here (it could be a simple atomic store), but
>> +	 * it gives the memory ordering and atomicity required.
>> +	 */
>> +	xchg(&__wd_nmi_output, 1);
>> +
>>  	/* Do not panic from here because that can recurse into NMI IPI layer =
*/
>>  }
>=20
> I think, looking at this and the other site where __wd_nmi_output is
> set, that this works because you set the flag only when you are done
> printing from the non-panic lockup context on this CPU. I was initially
> worried that you set this flag part way through printing, and then it
> might get cleared by another CPU while you're still trying to print.
> However, in this function it's right at the end - there's nothing else
> left to do, and ...
>=20
>>  DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>> @@ -386,6 +401,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>>  		print_irqtrace_events(current);
>>  		show_regs(regs);
>> =20
>> +		xchg(&__wd_nmi_output, 1); // see wd_lockup_ipi
>> +
>>  		if (sysctl_hardlockup_all_cpu_backtrace)
>>  			trigger_allbutself_cpu_backtrace();
>=20
> in this one, the only things that can happen afterwards are
>  - a panic, which does its own flushing, and
>=20
> - trigger_allbutself_cpu_backtrace(), which seems to just send IPIs, not
>  do any printing of its own.

Yeah, on powerpc that actually ends up not using NMI IPIs because that's=20
dangerous and core code uses it for less severe things than a hard=20
lockup so we disabled it, so if you can take a regular IPI then you can
run irq work when it returns and print things. If we changed it to use
NMI IPIs I guess we might want to do something, maybe.

> All of which is fine, but I wonder if we need a more descriptive
> variable name or if the comment needs to specify that the flag should
> only be set at certain times.

I did try to add some explanation in that comment. I'll see if that can=20
be made a bit more readable and expand on it a bit.

Thanks,
Nick
