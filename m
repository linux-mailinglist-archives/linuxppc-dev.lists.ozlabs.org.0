Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB45105C0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 09:18:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v8rT2j44zDqSk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 17:18:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v8q84qqPzDq7c
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 17:17:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="VMNlxkEb"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 44v8q748W6z9sNl;
 Wed,  1 May 2019 17:17:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1556695043;
 bh=/Pd7Rohu194UAs1BR+U0F+8HZ90W1+hG9KivofnJlZ4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=VMNlxkEb6iEeTDPWXeIfgr5HJYJ0PCiUUOogXk3CULhoEIoRybJEc8cNkS0IOZIZb
 orCAF3t1Ldf7oWRTXN7NgiGftWPsmzezI0YQODL708ouP9JngOKdoYeEH0T5DssguI
 VxT2gGerNug3z5xWkrAmjraU2ep13VRFcsTJoNtbcqMGQlcdixBpFNk/PjHnTLOhdQ
 54UTb8S9kteSI+JG65VeBfLlmpUL8GB48KlTauzoJ3+EU6DlP814nMJ+YHqX1FzAIH
 /ycudUa8Rd/bElEN34qPtnxQsqhuxPyCC28fk8T0+CsdvWtyNJI6K4HxxfK/Of5D66
 lj55sGBSawPWw==
Received: by neuling.org (Postfix, from userid 1000)
 id 7424F2A0DA3; Wed,  1 May 2019 17:17:23 +1000 (AEST)
Message-ID: <603d76ff3b64377f85c5da279effb13b34b127a7.camel@neuling.org>
Subject: Re: [PATCH] powerpc/tm: Avoid machine crash on rt_sigreturn
From: Michael Neuling <mikey@neuling.org>
To: Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 01 May 2019 17:17:23 +1000
In-Reply-To: <1547657264-28761-1-git-send-email-leitao@debian.org>
References: <1547657264-28761-1-git-send-email-leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
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
Cc: gromero@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-01-16 at 14:47 -0200, Breno Leitao wrote:
> There is a kernel crash that happens if rt_sigreturn is called inside a
> transactional block.
>=20
> This crash happens if the kernel hits an in-kernel page fault when
> accessing userspace memory, usually through copy_ckvsx_to_user(). A major
> page fault calls might_sleep() function, which can cause a task reschedul=
e.
> A task reschedule (switch_to()) reclaim and recheckpoint the TM states,
> but, in the signal return path, the checkpointed memory was already
> reclaimed, thus the exception stack has MSR that points to MSR[TS]=3D0.
>=20
> When the code returns from might_sleep() and a task reschedule happened,
> then this task is returned with the memory recheckpointed, and
> CPU MSR[TS] =3D suspended.
>=20
> This means that there is a side effect at might_sleep() if it is called
> with CPU MSR[TS] =3D 0 and the task has regs->msr[TS] !=3D 0.
>=20
> This side effect can cause a TM bad thing, since at the exception entranc=
e,
> the stack saves MSR[TS]=3D0, and this is what will be used at RFID, but,
> the processor has MSR[TS] =3D Suspended, and this transition will be inva=
lid
> and a TM Bad thing will be raised, causing the following crash:
>=20
> 	Unexpected TM Bad Thing exception at c00000000000e9ec (msr
> 0x8000000302a03031) tm_scratch=3D800000010280b033
> 	cpu 0xc: Vector: 700 (Program Check) at [c00000003ff1fd70]
> 	    pc: c00000000000e9ec: fast_exception_return+0x100/0x1bc
> 	    lr: c000000000032948: handle_rt_signal64+0xb8/0xaf0
> 	    sp: c0000004263ebc40
> 	   msr: 8000000302a03031
> 	  current =3D 0xc000000415050300
> 	  paca    =3D 0xc00000003ffc4080	 irqmask: 0x03	 irq_happened: 0x01
> 	    pid   =3D 25006, comm =3D sigfuz
> 	Linux version 5.0.0-rc1-00001-g3bd6e94bec12 (breno@debian) (gcc version
> 8.2.0 (Debian 8.2.0-3)) #899 SMP Mon Jan 7 11:30:07 EST 2019
> 	WARNING: exception is not recoverable, can't continue
> 	enter ? for help
> 	[c0000004263ebc40] c000000000032948 handle_rt_signal64+0xb8/0xaf0
> (unreliable)
> 	[c0000004263ebd30] c000000000022780 do_notify_resume+0x2f0/0x430
> 	[c0000004263ebe20] c00000000000e844 ret_from_except_lite+0x70/0x74
> 	--- Exception: c00 (System Call) at 00007fffbaac400c
> 	SP (7fffeca90f40) is in userspace
>=20
> The solution for this problem is running the sigreturn code with
> regs->msr[TS] disabled, thus, avoiding hitting the side effect above. Thi=
s
> does not seem to be a problem since regs->msr will be replaced by the
> ucontext value, so, it is being flushed already. In this case, it is
> flushed earlier.
>=20
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Michael Neuling <mikey@neuling.org>

This still applies on powerpc/next so just acking rather than reposting

> ---
>  arch/powerpc/kernel/signal_64.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal=
_64.c
> index 6794466f6420..06c299ef6132 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -565,7 +565,7 @@ static long restore_tm_sigcontexts(struct task_struct
> *tsk,
>  	preempt_disable();
> =20
>  	/* pull in MSR TS bits from user context */
> -	regs->msr =3D (regs->msr & ~MSR_TS_MASK) | (msr & MSR_TS_MASK);
> +	regs->msr |=3D msr & MSR_TS_MASK;
> =20
>  	/*
>  	 * Ensure that TM is enabled in regs->msr before we leave the signal
> @@ -745,6 +745,31 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	if (MSR_TM_SUSPENDED(mfmsr()))
>  		tm_reclaim_current(0);
> =20
> +	/*
> +	 * Disable MSR[TS] bit also, so, if there is an exception in the
> +	 * code below (as a page fault in copy_ckvsx_to_user()), it does
> +	 * not recheckpoint this task if there was a context switch inside
> +	 * the exception.
> +	 *
> +	 * A major page fault can indirectly call schedule(). A reschedule
> +	 * process in the middle of an exception can have a side effect
> +	 * (Changing the CPU MSR[TS] state), since schedule() is called
> +	 * with the CPU MSR[TS] disable and returns with MSR[TS]=3DSuspended
> +	 * (switch_to() calls tm_recheckpoint() for the 'new' process). In
> +	 * this case, the process continues to be the same in the CPU, but
> +	 * the CPU state just changed.
> +	 *
> +	 * This can cause a TM Bad Thing, since the MSR in the stack will
> +	 * have the MSR[TS]=3D0, and this is what will be used to RFID.
> +	 *
> +	 * Clearing MSR[TS] state here will avoid a recheckpoint if there
> +	 * is any process reschedule in kernel space. The MSR[TS] state
> +	 * does not need to be saved also, since it will be replaced with
> +	 * the MSR[TS] that came from user context later, at
> +	 * restore_tm_sigcontexts.
> +	 */
> +	regs->msr &=3D ~MSR_TS_MASK;
> +
>  	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
>  		goto badframe;
>  	if (MSR_TM_ACTIVE(msr)) {

