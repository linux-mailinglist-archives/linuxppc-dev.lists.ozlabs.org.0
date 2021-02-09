Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB43149A9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 08:47:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZZjz2tnkzDsg9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 18:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GSqPsTLR; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZZhF39mHzDr9T
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 18:46:01 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d13so9291249plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=71gOA1eB0GciOZN1DdJ5S2J5iKoGbHDA+m6aKZwvjvM=;
 b=GSqPsTLRpr+JalSzSF6rotdcGRigmAHZ44uxXsend0iBH1rMW9t6J686Kw0ZdvB6QN
 66rwhC7segdBgJYu2Z56l/d6Tquafkg1LtZ+VdbyvbBgukGMINypJOHaKl0l+LEz9Ptr
 MQP6I61A542oFhKkDHBKAxhnqboFDuPnuCIUIwtILa1+14V/urCjh9PVxPpFq6fgjDRe
 r6Aj3Nk5+Z5SiL+/ny9S6mdF/gXHNejmcGwfK6QkfgSCZ0zRRiOuqLteqZdN3g3WPNzY
 /vnfHeL4r+T4218xP+Yzw5ubO3JGrDI0M9qKCtWYuILZSnhxvAPfKJCDFtGCa/d/EV7/
 EhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=71gOA1eB0GciOZN1DdJ5S2J5iKoGbHDA+m6aKZwvjvM=;
 b=WDnbZXnjAfoNddNg2ur/x42vubATJ8/JCaSHe5aJxH7L00kXHqgM05xv6T7LL6oFyu
 x6xeGwylKV5A8ccNt7TQfckXvgHY6N+a2RUSNFmtBNgxXq8UBCh53HMXfy6bzYvO9qWr
 BiP0PG7I3I2DKbGUP232QV1ruDJpJqL31RkmhvNOnXRvb0TbFN+Tqi0YduoGP8SI4yq/
 9/MBlkzfFH9saWko6e3ot85NM0cxwPlCPUPDLFlKJQc8JVoOtI/xEKc2o6+K73z4Pp4U
 HpeXZfaGGnSASGIwVQX2Q3cOc77+mga15ZdcyZRnRfAZdxRVeolJ6WQt/J7PYmB6e5JI
 f0nQ==
X-Gm-Message-State: AOAM530WnFU714iHmuBSvWszdsnIuT+w9+B3+xhjPYiRdh8qQD59fbfx
 mhuuMBI3RLO+1qTodqyiKZk=
X-Google-Smtp-Source: ABdhPJyA4s41LF1ohPFYE/m5/QxG8TmkJFtlDxKQE8kKaSogoNxydFttvkdDq5oDnKFdqoTdGXYf+g==
X-Received: by 2002:a17:902:8342:b029:e1:6aa:d770 with SMTP id
 z2-20020a1709028342b02900e106aad770mr19594675pln.27.1612856759726; 
 Mon, 08 Feb 2021 23:45:59 -0800 (PST)
Received: from localhost ([1.132.145.95])
 by smtp.gmail.com with ESMTPSA id l13sm1469605pjq.30.2021.02.08.23.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 23:45:58 -0800 (PST)
Date: Tue, 09 Feb 2021 17:45:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 32/42] powerpc/64: context tracking move to interrupt
 wrappers
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-33-npiggin@gmail.com>
 <3cb26edb-c9cc-4f21-0b6d-dcd4bbeed7b3@csgroup.eu>
In-Reply-To: <3cb26edb-c9cc-4f21-0b6d-dcd4bbeed7b3@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612856468.7bxb8f69gj.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 3:49 pm:
>=20
>=20
> Le 30/01/2021 =C3=A0 14:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This moves exception_enter/exit calls to wrapper functions for
>> synchronous interrupts. More interrupt handlers are covered by
>> this than previously.
>=20
> Why did you enclose everything in #ifdef CONFIG_PPC64 ? As far as I under=
stand, before this patch=20
> exception_enter() and exception_exit() are called also on PPC32.

PPC32 never selects CONTEXT_TRACKING AFAIKS, but I'm not sure. I worried=20
ctx_state would not be no-oped, but if it's all inlined into the same
function then maybe the compiler will eliminate it.

On the other hand I may move some of the wrapper into its own function=20
if that helps code size, but we can do something about it then...

Hmm, end result is it shouldn't matter for PPC32 at the moment.

Thanks,
Nick

>=20
> Christophe
>=20
>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/interrupt.h  |  9 ++++
>>   arch/powerpc/kernel/traps.c           | 74 ++++++---------------------
>>   arch/powerpc/mm/book3s64/hash_utils.c |  3 --
>>   arch/powerpc/mm/fault.c               |  9 +---
>>   4 files changed, 27 insertions(+), 68 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 488bdd5bd922..e65ce3e2b071 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -7,10 +7,16 @@
>>   #include <asm/ftrace.h>
>>  =20
>>   struct interrupt_state {
>> +#ifdef CONFIG_PPC64
>> +	enum ctx_state ctx_state;
>> +#endif
>>   };
>>  =20
>>   static inline void interrupt_enter_prepare(struct pt_regs *regs, struc=
t interrupt_state *state)
>>   {
>> +#ifdef CONFIG_PPC64
>> +	state->ctx_state =3D exception_enter();
>> +#endif
>>   }
>>  =20
>>   /*
>> @@ -29,6 +35,9 @@ static inline void interrupt_enter_prepare(struct pt_r=
egs *regs, struct interrup
>>    */
>>   static inline void interrupt_exit_prepare(struct pt_regs *regs, struct=
 interrupt_state *state)
>>   {
>> +#ifdef CONFIG_PPC64
>> +	exception_exit(state->ctx_state);
>> +#endif
>>   }
>>  =20
>>   static inline void interrupt_async_enter_prepare(struct pt_regs *regs,=
 struct interrupt_state *state)
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index da488e62fb5f..21fd14828827 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -1087,41 +1087,28 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_except=
ion)
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(unknown_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	printk("Bad trap at PC: %lx, SR: %lx, vector=3D%lx\n",
>>   	       regs->nip, regs->msr, regs->trap);
>>  =20
>>   	_exception(SIGTRAP, regs, TRAP_UNK, 0);
>> -
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	printk("Bad trap at PC: %lx, SR: %lx, vector=3D%lx\n",
>>   	       regs->nip, regs->msr, regs->trap);
>>  =20
>>   	_exception(SIGTRAP, regs, TRAP_UNK, 0);
>> -
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	if (notify_die(DIE_IABR_MATCH, "iabr_match", regs, 5,
>>   					5, SIGTRAP) =3D=3D NOTIFY_STOP)
>> -		goto bail;
>> +		return;
>>   	if (debugger_iabr_match(regs))
>> -		goto bail;
>> +		return;
>>   	_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
>> -
>> -bail:
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(RunModeException)
>> @@ -1131,8 +1118,6 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(single_step_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	clear_single_step(regs);
>>   	clear_br_trace(regs);
>>  =20
>> @@ -1141,14 +1126,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
>>  =20
>>   	if (notify_die(DIE_SSTEP, "single_step", regs, 5,
>>   					5, SIGTRAP) =3D=3D NOTIFY_STOP)
>> -		goto bail;
>> +		return;
>>   	if (debugger_sstep(regs))
>> -		goto bail;
>> +		return;
>>  =20
>>   	_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
>> -
>> -bail:
>> -	exception_exit(prev_state);
>>   }
>>   NOKPROBE_SYMBOL(single_step_exception);
>>  =20
>> @@ -1476,7 +1458,6 @@ static inline int emulate_math(struct pt_regs *reg=
s) { return -1; }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(program_check_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>>   	unsigned int reason =3D get_reason(regs);
>>  =20
>>   	/* We can now get here via a FP Unavailable exception if the core
>> @@ -1485,22 +1466,22 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception=
)
>>   	if (reason & REASON_FP) {
>>   		/* IEEE FP exception */
>>   		parse_fpe(regs);
>> -		goto bail;
>> +		return;
>>   	}
>>   	if (reason & REASON_TRAP) {
>>   		unsigned long bugaddr;
>>   		/* Debugger is first in line to stop recursive faults in
>>   		 * rcu_lock, notify_die, or atomic_notifier_call_chain */
>>   		if (debugger_bpt(regs))
>> -			goto bail;
>> +			return;
>>  =20
>>   		if (kprobe_handler(regs))
>> -			goto bail;
>> +			return;
>>  =20
>>   		/* trap exception */
>>   		if (notify_die(DIE_BPT, "breakpoint", regs, 5, 5, SIGTRAP)
>>   				=3D=3D NOTIFY_STOP)
>> -			goto bail;
>> +			return;
>>  =20
>>   		bugaddr =3D regs->nip;
>>   		/*
>> @@ -1512,10 +1493,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception=
)
>>   		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
>>   		    report_bug(bugaddr, regs) =3D=3D BUG_TRAP_TYPE_WARN) {
>>   			regs->nip +=3D 4;
>> -			goto bail;
>> +			return;
>>   		}
>>   		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
>> -		goto bail;
>> +		return;
>>   	}
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>   	if (reason & REASON_TM) {
>> @@ -1536,7 +1517,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>>   		 */
>>   		if (user_mode(regs)) {
>>   			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
>> -			goto bail;
>> +			return;
>>   		} else {
>>   			printk(KERN_EMERG "Unexpected TM Bad Thing exception "
>>   			       "at %lx (msr 0x%lx) tm_scratch=3D%llx\n",
>> @@ -1567,7 +1548,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>>   	 * pattern to occurrences etc. -dgibson 31/Mar/2003
>>   	 */
>>   	if (!emulate_math(regs))
>> -		goto bail;
>> +		return;
>>  =20
>>   	/* Try to emulate it if we should. */
>>   	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
>> @@ -1575,10 +1556,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception=
)
>>   		case 0:
>>   			regs->nip +=3D 4;
>>   			emulate_single_step(regs);
>> -			goto bail;
>> +			return;
>>   		case -EFAULT:
>>   			_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
>> -			goto bail;
>> +			return;
>>   		}
>>   	}
>>  =20
>> @@ -1587,9 +1568,6 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>>   		_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
>>   	else
>>   		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
>> -
>> -bail:
>> -	exception_exit(prev_state);
>>   }
>>   NOKPROBE_SYMBOL(program_check_exception);
>>  =20
>> @@ -1606,14 +1584,12 @@ NOKPROBE_SYMBOL(emulation_assist_interrupt);
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(alignment_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>>   	int sig, code, fixed =3D 0;
>>   	unsigned long  reason;
>>  =20
>>   	interrupt_cond_local_irq_enable(regs);
>>  =20
>>   	reason =3D get_reason(regs);
>> -
>>   	if (reason & REASON_BOUNDARY) {
>>   		sig =3D SIGBUS;
>>   		code =3D BUS_ADRALN;
>> @@ -1621,7 +1597,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>>   	}
>>  =20
>>   	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
>> -		goto bail;
>> +		return;
>>  =20
>>   	/* we don't implement logging of alignment exceptions */
>>   	if (!(current->thread.align_ctl & PR_UNALIGN_SIGBUS))
>> @@ -1631,7 +1607,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>>   		/* skip over emulated instruction */
>>   		regs->nip +=3D inst_length(reason);
>>   		emulate_single_step(regs);
>> -		goto bail;
>> +		return;
>>   	}
>>  =20
>>   	/* Operand address was bad */
>> @@ -1647,9 +1623,6 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>>   		_exception(sig, regs, code, regs->dar);
>>   	else
>>   		bad_page_fault(regs, sig);
>> -
>> -bail:
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(StackOverflow)
>> @@ -1663,41 +1636,28 @@ DEFINE_INTERRUPT_HANDLER(StackOverflow)
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	die("Kernel stack overflow", regs, SIGSEGV);
>> -
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	printk(KERN_EMERG "Unrecoverable FP Unavailable Exception "
>>   			  "%lx at %lx\n", regs->trap, regs->nip);
>>   	die("Unrecoverable FP Unavailable Exception", regs, SIGABRT);
>> -
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(altivec_unavailable_exception)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -
>>   	if (user_mode(regs)) {
>>   		/* A user program has executed an altivec instruction,
>>   		   but this kernel doesn't support altivec. */
>>   		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
>> -		goto bail;
>> +		return;
>>   	}
>>  =20
>>   	printk(KERN_EMERG "Unrecoverable VMX/Altivec Unavailable Exception "
>>   			"%lx at %lx\n", regs->trap, regs->nip);
>>   	die("Unrecoverable VMX/Altivec Unavailable Exception", regs, SIGABRT)=
;
>> -
>> -bail:
>> -	exception_exit(prev_state);
>>   }
>>  =20
>>   DEFINE_INTERRUPT_HANDLER(vsx_unavailable_exception)
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/boo=
k3s64/hash_utils.c
>> index d681dc5a7b1c..fb7c10524bcd 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -1514,7 +1514,6 @@ EXPORT_SYMBOL_GPL(hash_page);
>>   DECLARE_INTERRUPT_HANDLER_RET(__do_hash_fault);
>>   DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>>   	unsigned long ea =3D regs->dar;
>>   	unsigned long dsisr =3D regs->dsisr;
>>   	unsigned long access =3D _PAGE_PRESENT | _PAGE_READ;
>> @@ -1563,8 +1562,6 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
>>   		err =3D 0;
>>   	}
>>  =20
>> -	exception_exit(prev_state);
>> -
>>   	return err;
>>   }
>>  =20
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 9c4220efc20f..b26a7643fc6e 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -564,14 +564,7 @@ NOKPROBE_SYMBOL(__do_page_fault);
>>  =20
>>   DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
>>   {
>> -	enum ctx_state prev_state =3D exception_enter();
>> -	long err;
>> -
>> -	err =3D __do_page_fault(regs);
>> -
>> -	exception_exit(prev_state);
>> -
>> -	return err;
>> +	return __do_page_fault(regs);
>>   }
>>   NOKPROBE_SYMBOL(do_page_fault);
>>  =20
>>=20
>=20
