Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6F19D061
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:43:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tr4C60wVzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 17:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g3hOB4Ue; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tr1S24FnzDrpW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 17:41:15 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id c21so3029188pfo.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 23:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=+gNlgPUHyCNgqXVQOUrygMnJ+oYIOvoTug8dvwTwf3Y=;
 b=g3hOB4UeE+Mno3jxgM2ygnn54UiV0obF61tJDx9/MlgJ//3saygyLrpfp9SftyKtFS
 nYAu9BCc3Hz3FwJ4iGduQcYw6qsqNO5exqgh0tb3iN1TFNaRTDIjiSos5Bu0hAL03rOc
 tzkEPsR6MqfAlEUO7/EK57/NDiUaX0q+7j4FRnJYL0fvnAY6cjUNtqs5cNzPiliSnGD6
 dfYCa4Hr580GdjR/IjjTfHw6MhvZ/fecogbQBa7lr2ehqygWFwFMrr1AwBKkw/N1pK7v
 gkUkNTxPf4zivMWyzTEBiPwQ/Tbf2YvdwWXJTYYw4WvgAYg/G+77ReGAn7eKvjwMY+nW
 Q9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=+gNlgPUHyCNgqXVQOUrygMnJ+oYIOvoTug8dvwTwf3Y=;
 b=XI27AAu4HrNDEiTrdmdQjiJHeSmxErgV69BLj64stNm0mbB8l9ONM4aWni/86jTy3o
 KiHFbHIq0ophuSd0nktM7hsBXideh9OdX33N7iw6yZ8aLf3bcurYCrcXhK4IEHpRX0/G
 PBoZo66oxf86JUNp21cXK/o/nFELyEZN+e1WRUXek8kfFgLIhkSmc6siZ5LOhnNrzAVR
 vBrgYE+a5N8jim12pKc+dAeDyOyxwYfzn42HBenrcUpwpQlWdjbXiIA4PlTZp6FbFTzY
 5DG92HkOUJiPWxaOzXwO/C0+Y++Fy8A9y2xu2D9JuSbmTy+2eyy8QTDf/eH3geae3m1x
 RFMw==
X-Gm-Message-State: AGi0PuY5Rk8BO5CGqpKlSOqGScgLM+f1eFQoTRVH5KrhCMvU8hR9bnQG
 p8TqI8okoZB6ach2rmgtDjo=
X-Google-Smtp-Source: APiQypIf4OjslzARzC9NiCDQetFx3qVsbi9OaY04D2SeJWvS7NrWM3op7L753ugQtG8Vs7Aebbe+7A==
X-Received: by 2002:a63:c007:: with SMTP id h7mr6694767pgg.428.1585896071700; 
 Thu, 02 Apr 2020 23:41:11 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y3sm5023560pfy.158.2020.04.02.23.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 23:41:10 -0700 (PDT)
Date: Fri, 03 Apr 2020 16:41:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
To: Alexios Zavras <alexios.zavras@intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?iso-8859-1?q?Enrico=0A?= Weigelt <info@metux.net>, Leonardo Bras
 <leonardo@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, peterz@infradead.org,
 =?iso-8859-1?q?Thomas=0A?= Gleixner <tglx@linutronix.de>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
In-Reply-To: <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585895551.7o9oa0ey62.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Leonardo Bras's on April 3, 2020 10:37 am:
> On Thu, 2020-04-02 at 22:28 +1100, Michael Ellerman wrote:
>> Leonardo Bras <leonardo@linux.ibm.com> writes:
>> > During a crash, there is chance that the cpus that handle the NMI IPI
>> > are holding a spin_lock. If this spin_lock is needed by crashing_cpu i=
t
>> > will cause a deadlock. (rtas.lock and printk logbuf_lock as of today)
>> >=20
>> > This is a problem if the system has kdump set up, given if it crashes
>> > for any reason kdump may not be saved for crash analysis.
>> >=20
>> > After NMI IPI is sent to all other cpus, force unlock all spinlocks
>> > needed for finishing crash routine.
>>=20
>> I'm not convinced this is the right approach.
>=20
> Me neither. I think it's a very hacky solution, but I couldn't think of
> anything better at the time.
>=20
>> Busting locks is risky, it could easily cause a crash if data structures
>> are left in some inconsistent state.
>>=20
>> I think we need to make this code more careful about what it's doing.
>> There's a clue at the top of default_machine_crash_shutdown(), which
>> calls crash_kexec_prepare_cpus():
>>=20
>> 	 * This function is only called after the system
>> 	 * has panicked or is otherwise in a critical state.
>> 	 * The minimum amount of code to allow a kexec'd kernel
>> 	 * to run successfully needs to happen here.
>>=20
>>=20
>> You said the "IPI complete" message was the cause of one lockup:
>>=20
>>   #0  arch_spin_lock=20
>>   #1  do_raw_spin_lock=20
>>   #2  __raw_spin_lock=20
>>   #3  _raw_spin_lock=20
>>   #4  vprintk_emit=20
>>   #5  vprintk_func
>>   #7  crash_kexec_prepare_cpus=20
>>   #8  default_machine_crash_shutdown
>>   #9  machine_crash_shutdown=20
>>   #10 __crash_kexec
>>   #11 crash_kexec
>>   #12 oops_end
>>=20
>> TBH I think we could just drop that printk() entirely.
>>=20
>> Or we could tell printk() that we're in NMI context so that it uses the
>> percpu buffers.
>>=20
>> We should probably do the latter anyway, in case there's any other code
>> we call that inadvertently calls printk().
>>=20
>=20
> I was not aware of using per-cpu buffers in printk. It may be a nice
> solution.
>=20
> There is another printk call there:
> printk("kexec: Starting switchover sequence.\n");
> in default_machine_kexec().
>=20
> Two printk and one rtas call: it's all I could see using a spinlock
> after IPI Complete.
>=20
>>=20
>> The RTAS trace you sent was:
>>=20
>>   #0 arch_spin_lock
>>   #1  lock_rtas ()=20
>>   #2  rtas_call (token=3D8204, nargs=3D1, nret=3D1, outputs=3D0x0)
>>   #3  ics_rtas_mask_real_irq (hw_irq=3D4100)=20
>>   #4  machine_kexec_mask_interrupts
>>   #5  default_machine_crash_shutdown
>>   #6  machine_crash_shutdown=20
>>   #7  __crash_kexec
>>   #8  crash_kexec
>>   #9  oops_end
>>=20
>>=20
>> Which doesn't make it clear who holds the RTAS lock. We really shouldn't
>> be crashing while holding the RTAS lock, but I guess it could happen.
>> Can you get a full backtrace?
>>=20
>=20
> Oh, all traces are from the thread that called the crash, by writing
> 'c' to sysrq. That is what I am using to reproduce.
>=20
> #10 bad_page_fault
> #11 handle_page_fault
> #12 __handle_sysrq (key=3D99, check_mask=3Dfalse)=20
> #13 write_sysrq_trigger=20
> #14 proc_reg_write
> #15 __vfs_write
> #16 vfs_write
> #17 SYSC_write
> #18 SyS_write
> #19 system_call
>=20
>>=20
>> PAPR says we are not allowed to have multiple CPUs calling RTAS at once,
>> except for a very small list of RTAS calls. So if we bust the RTAS lock
>> there's a risk we violate that part of PAPR and crash even harder.
>=20
> Interesting, I was not aware.
>=20
>>=20
>> Also it's not specific to kdump, we can't even get through a normal
>> reboot if we crash with the RTAS lock held.
>>=20
>> Anyway here's a patch with some ideas. That allows me to get from a
>> crash with the RTAS lock held through kdump into the 2nd kernel. But it
>> only works if it's the crashing CPU that holds the RTAS lock.
>>=20
>=20
> Nice idea.=20
> But my test environment is just triggering a crash from sysrq, so I
> think it would not improve the result, given that this thread is
> probably not holding the lock by the time.

Crash paths should not take that RTAS lock, it's a massive pain. I'm=20
fixing it for machine check, for other crashes I think it can be removed=20
too, it just needs to be unpicked. The good thing with crashing is that=20
you can reasonably *know* that you're single threaded, so you can=20
usually reason through situations like above.

> I noticed that when rtas is locked, irqs and preemption are also
> disabled.
>=20
> Should the IPI send by crash be able to interrupt a thread with
> disabled irqs?

Yes. It's been a bit painful, but in the long term it means that a CPU=20
which hangs with interrupts off can be debugged, and it means we can=20
take it offline to crash without risking that it will be clobbering what=20
we're doing.

Arguably what I should have done is try a regular IPI first, wait a few=20
seconds, then NMI IPI.

A couple of problems with that. Firstly it probably avoids this issue=20
you hit almost all the time, so it won't get fixed. So when we really=20
need the NMI IPI in the field, it'll still be riddled with deadlocks.

Secondly, sending the IPI first in theory can be more intrusive to the=20
state that we want to debug. It uses the currently running stack, paca=20
save areas, ec. NMI IPI uses its own stack and save regions so it's a=20
little more isolated. Maybe this is only a small advantage but I'd like=20
to have it if we can. =20

Thanks,
Nick

=
