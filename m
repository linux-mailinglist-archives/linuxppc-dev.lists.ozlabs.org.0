Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393F44D721
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 14:21:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqj6G0t98z30CK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 00:21:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DG6XsghG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DG6XsghG; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hqj5V0CYgz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 00:20:43 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso4571739pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9Vj7g6+G+CeJOglMT41jbr9+MvqSEc0Qj9wGD0UUdUM=;
 b=DG6XsghGjRzWpBHqjx4Eprax4zEn/fMElr6dvwaLYtV25rrWM+RlaNoULnGESk1Vf+
 Tf6esZIGavJgEij92KVMWzyPwFdpO4evQv1d/49Hv5Yg1dmzhGdDgd0HTPyvMC5rl3GV
 toWT5ZvyBmc3Ql350hsw/Na3P2h1pPQeuhc9SIZ/0D17lZOLjPuoCdiXXCiSEyeg8lHi
 T9ukg0T3cTr8Y+3EamKezOPdAk4X2oBCA+j/0Q7dlOttIS+ZgoFQHRBmf3XdzOxhHr28
 iTnI0dYlxebGz1YM1mgHo3O7lya4sV0ePJNktBqTXntUwkUtR3PMO8YFr8P56gUdsQu4
 Wxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9Vj7g6+G+CeJOglMT41jbr9+MvqSEc0Qj9wGD0UUdUM=;
 b=YM0B7UviQQrvLCirQIXiOz5Hz/XD7IX5EZVkFIpC0tl+TTJslKCOi3jn58Yc0BmhwF
 QNQqliFuRRGfeHxzQqTN3xyTm5+8ad4c3Vn8x2Xr4rjGUNeixoUVEJd13ZpTA6nO79ac
 9pEvVloJcwnH9TxbgavxkaiNUMM3YGRHuxVMk9afmCXauvtFUlFfbg+Sth722oXVasFx
 omdh5Zb8WtRHc7U6fXc/riGSkhEclZCzqqNokVacq1q52uLqJ44HNXdo2hhxAFUJWAm9
 iZzLMAnRXESh99vMF1/6fseglMQjlc1oC1AOskQ29gwi8CExa6K03+GJPw7HzGnQLUmL
 /2yA==
X-Gm-Message-State: AOAM532I3dCtRBaU7bM7t8oeehWxmXQEe8EpcdaBY/L2omak+eLpt9RS
 FlwvXWd2TA2Amf6DQUZBtrY=
X-Google-Smtp-Source: ABdhPJwr6O/MXX4mL3TbsDxEa9f9HKyrGbB01bqS4W2u+2JlOhpvb9mjDJ/x9KE0YfIJ89mhunMY0Q==
X-Received: by 2002:a17:90b:3a83:: with SMTP id
 om3mr8401612pjb.0.1636636839193; 
 Thu, 11 Nov 2021 05:20:39 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id il13sm5710598pjb.52.2021.11.11.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 05:20:38 -0800 (PST)
Date: Thu, 11 Nov 2021 23:20:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] ppc64/fadump: fix inaccurate CPU state info in vmcore
 generated with panic
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20211110190143.186346-1-hbathini@linux.ibm.com>
 <87lf1vmd78.fsf@mpe.ellerman.id.au>
 <1c3effbd-1c88-efdb-93c9-54790ee566b8@linux.ibm.com>
In-Reply-To: <1c3effbd-1c88-efdb-93c9-54790ee566b8@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1636636120.84ownze0a9.astroid@bobo.none>
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
Cc: mahesh@linux.ibm.com, sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Hari Bathini's message of November 11, 2021 10:06 pm:
>=20
>=20
> On 11/11/21 11:44 am, Michael Ellerman wrote:
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>> In panic path, fadump is triggered via a panic notifier function.
>>> Before calling panic notifier functions, smp_send_stop() gets called,
>>> which stops all CPUs except the panic'ing CPU. Commit 8389b37dffdc
>>> ("powerpc: stop_this_cpu: remove the cpu from the online map.") and
>>> again commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
>>> started marking CPUs as offline while stopping them. So, if a kernel
>>> has either of the above commits, vmcore captured with fadump via panic
>>> path would show only the panic'ing CPU as online. Sample output of
>>> crash-utility with such vmcore:
>>>
>>>    # crash vmlinux vmcore
>>>    ...
>>>          KERNEL: vmlinux
>>>        DUMPFILE: vmcore  [PARTIAL DUMP]
>>>            CPUS: 1
>>>            DATE: Wed Nov 10 09:56:34 EST 2021
>>>          UPTIME: 00:00:42
>>>    LOAD AVERAGE: 2.27, 0.69, 0.24
>>>           TASKS: 183
>>>        NODENAME: XXXXXXXXX
>>>         RELEASE: 5.15.0+
>>>         VERSION: #974 SMP Wed Nov 10 04:18:19 CST 2021
>>>         MACHINE: ppc64le  (2500 Mhz)
>>>          MEMORY: 8 GB
>>>           PANIC: "Kernel panic - not syncing: sysrq triggered crash"
>>>             PID: 3394
>>>         COMMAND: "bash"
>>>            TASK: c0000000150a5f80  [THREAD_INFO: c0000000150a5f80]
>>>             CPU: 1
>>>           STATE: TASK_RUNNING (PANIC)
>>>
>>>    crash> p -x __cpu_online_mask
>>>    __cpu_online_mask =3D $1 =3D {
>>>      bits =3D {0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
>>>    }
>>>    crash>
>>>    crash>
>>>    crash> p -x __cpu_active_mask
>>>    __cpu_active_mask =3D $2 =3D {
>>>      bits =3D {0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
>>>    }
>>>    crash>
>>>
>>> While this has been the case since fadump was introduced, the issue
>>> was not identified for two probable reasons:
>>>
>>>    - In general, the bulk of the vmcores analyzed were from crash
>>>      due to exception.
>>>
>>>    - The above did change since commit 8341f2f222d7 ("sysrq: Use
>>>      panic() to force a crash") started using panic() instead of
>>>      deferencing NULL pointer to force a kernel crash. But then
>>>      commit de6e5d38417e ("powerpc: smp_send_stop do not offline
>>>      stopped CPUs") stopped marking CPUs as offline till kernel
>>>      commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
>>>      reverted that change.
>>>
>>> To avoid vmcore from showing only one CPU as online in panic path,
>>> skip marking non panic'ing CPUs as offline while stopping them
>>> during fadump crash.
>>=20
>> Is this really worth the added complexity/bug surface?
>>=20
>> Why does it matter if the vmcore shows only one CPU online?
>=20
> We lose out on backtrace/register data of non-crashing CPUs as they
> are explicitly marked offline.
>=20
> Actually, the state of CPU resources is explicitly changed after the
> panic though the aim of vmcore is to capture the system state at the
> time of panic...
>=20
> Alternatively, how about moving crash_fadump() call from panic notifier
> into panic() function explicitly, just like __crash_kexec() - before the
> smp_send_stop() call, so as to remove dependency with smp_send_stop()
> implementation altogether...

Does the crash dump code snapshot the CPUs with send_debuggr_break? I
can't remember the exact flow. But if it sends NMI IPIs to all other
CPUs then maybe it could be moved before smp_send_stop, good idea.

>=20
>>=20
>>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>>> index c23ee842c4c3..20555d5d5966 100644
>>> --- a/arch/powerpc/kernel/smp.c
>>> +++ b/arch/powerpc/kernel/smp.c
>>> @@ -61,6 +61,7 @@
>>>   #include <asm/cpu_has_feature.h>
>>>   #include <asm/ftrace.h>
>>>   #include <asm/kup.h>
>>> +#include <asm/fadump.h>
>>>  =20
>>>   #ifdef DEBUG
>>>   #include <asm/udbg.h>
>>> @@ -626,7 +627,8 @@ static void nmi_stop_this_cpu(struct pt_regs *regs)
>>>   	/*
>>>   	 * IRQs are already hard disabled by the smp_handle_nmi_ipi.
>>>   	 */
>>> -	set_cpu_online(smp_processor_id(), false);
>>> +	if (!(oops_in_progress && should_fadump_crash()))
>>> +		set_cpu_online(smp_processor_id(), false);
>>>  =20
>>>   	spin_begin();
>>>   	while (1)
>>> @@ -650,7 +652,8 @@ static void stop_this_cpu(void *dummy)
>>>   	 * to know other CPUs are offline before it breaks locks to flush
>>>   	 * printk buffers, in case we panic()ed while holding the lock.
>>>   	 */
>>> -	set_cpu_online(smp_processor_id(), false);
>>> +	if (!(oops_in_progress && should_fadump_crash()))
>>> +		set_cpu_online(smp_processor_id(), false);
>>=20
>> The comment talks about printk_safe_flush_on_panic(), and this change
>> would presumably break that. Except that printk_safe_flush_on_panic() no
>> longer exists.
>>=20
>> So do we need to set the CPU online here at all?
>>=20
>> ie. could we revert bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu=
()")
>> now that printk_safe_flush_on_panic() no longer exists?
>=20
> Yeah, sounds like the logical thing to do but I guess, Nick would be in
> a better position to answer this..

Maybe we could look at reverting it, it would be nice. But I think it=20
would be good to consider moving crash_fadump as well. There is at
least one issue with removal of some of that flushing -

https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?h=
=3Drework/printk_safe-removal&id=3D5d5e4522a7f404d1a96fd6c703989d32a9c9568d

I haven't really looked at or tested panic path, it's notoriously
buggy in general so who knows if we have to add workarounds. So even
if we revert it now, retaining the option to change our minds again
and mark CPUs offline as x86 does would be a good thing.

Thanks,
Nick
