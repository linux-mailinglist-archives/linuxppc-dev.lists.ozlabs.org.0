Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6FB63CFD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 08:44:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMWSJ32dtz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 18:44:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R0qbuH+L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMWRN1qvlz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 18:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R0qbuH+L;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMWRJ6tPRz4xN1;
	Wed, 30 Nov 2022 18:43:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669794221;
	bh=Cjpd97d8wVJo0FBapuPiSbSWK+4G/zYUPmwLblYkRc4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R0qbuH+LhEOcESjQxby1L+GgBtJTq8DNgI3heKFqOvED7KeWQFgTUwyD2h0Jc8RWD
	 TXJVJ/J1GDntALFWUTTDPEHEzAu41B6gD76xK/Wxk35JcELugATL3ogayjnwpbkM1b
	 umCxZfw/wggEkDivrUvNhhtR1N/rIb8x2gpbpmey05cNXIRxHp6LaSBDpSfUjcA8lw
	 NxnzdZ6GHZv3B6lmApm+fAeFcQn5xKK526jPdNi/87VabL0xUGHSWaO3+gzuk+zeAi
	 zZEr9/eULUnTnVaU8gnwKrRFHDpVp1Ls5miAAS4mecJ95/l46rL5RcKGAtk+r2/FT4
	 CoNVB9vEwC/+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/13] powerpc/rtas: place tracepoints in do_enter_rtas()
In-Reply-To: <87ilix8q5j.fsf@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-14-nathanl@linux.ibm.com>
 <CONLJ0VXR77H.JM4D75GQAF62@bobo> <87tu2i8x0e.fsf@linux.ibm.com>
 <87mt8abn4f.fsf@mpe.ellerman.id.au> <87ilix8q5j.fsf@linux.ibm.com>
Date: Wed, 30 Nov 2022 18:43:34 +1100
Message-ID: <87edtkc2ft.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>>>> On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
>>>>> Call the just-added rtas tracepoints in do_enter_rtas(), taking care
>>>>> to avoid function name lookups in the CPU offline path.
>>>>>
>>>>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>>>>> ---
>>>>>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
>>>>>  1 file changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>>> index 198366d641d0..3487b42cfbf7 100644
>>>>> --- a/arch/powerpc/kernel/rtas.c
>>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>>> @@ -38,6 +38,7 @@
>>>>>  #include <asm/page.h>
>>>>>  #include <asm/rtas.h>
>>>>>  #include <asm/time.h>
>>>>> +#include <asm/trace.h>
>>>>>  #include <asm/udbg.h>
>>>>>  
>>>>>  enum rtas_function_flags {
>>>>> @@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
>>>>>  static void do_enter_rtas(struct rtas_args *args)
>>>>>  {
>>>>>  	unsigned long msr;
>>>>> +	const char *name = NULL;
>>>>>  
>>>>>  	/*
>>>>>  	 * Make sure MSR[RI] is currently enabled as it will be forced later
>>>>> @@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
>>>>>  
>>>>>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
>>>>>  
>>>>> +	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
>>>>> +		/*
>>>>> +		 * rtas_token_to_function() uses xarray which uses RCU,
>>>>> +		 * but this code can run in the CPU offline path
>>>>> +		 * (e.g. stop-self), after it's become invalid to call
>>>>> +		 * RCU APIs.
>>>>> +		 */
>>>>
>>>> We can call this in real-mode via pseries_machine_check_realmode
>>>> -> fwnmi_release_errinfo, so tracing should be disabled for that
>>>> case too... Does this_cpu_set_ftrace_enabled(0) in the early
>>>> machine check handler cover that sufficiently?
>>>
>>> I suspect so, but I'd like to verify. Do you know how I could exercise
>>> this path in qemu or LPAR?
>>
>> On a P9 or P10 LPAR you should be able to use tools/testing/selftests/powerpc/mce/inject-ra-err
>
> Nice. Looks like I was too optimistic. From a P10 LPAR:
>
> # trace-cmd record -T -e powerpc:rtas_input -- \
>   sh -c 'sleep 10; ./inject-ra-err' && trace-cmd report
>      kworker/7:1-73    [007]    72.882159: rtas_input:           event-scan arguments: 4294967295 0 80419368 2048
>      kworker/7:1-73    [007]    72.882165: kernel_stack:         <stack trace >
> => do_enter_rtas (c000000000045180)
> => rtas_call (c000000000045da8)
> => rtas_event_scan (c000000000049458)
> => process_one_work (c0000000001c7618)
> => worker_thread (c0000000001c7bd8)
> => kthread (c0000000001d6858)
> => ret_from_kernel_thread (c00000000000cf5c)
>    inject-ra-err-1080  [001]    78.386947: rtas_input:           ibm,nmi-interlock arguments: 
>    inject-ra-err-1080  [001]    78.386950: kernel_stack:         <stack trace >
> => do_enter_rtas (c000000000045180)
> => rtas_call_unlocked (c000000000046ff4)
> => pseries_machine_check_realmode (c0000000000e8db8)
> => machine_check_early (c0000000000400c4)
> => machine_check_early_common (c00000000000836c)
>
> So... that's bad. (right?)

Potentially. If you booted in hash mode it might crash, if the tracing
causes accesses outside the RMO, or to vmalloc etc.

> I guess this patch needs something like this?

Yeah I think that's probably the easiest solution.

You could split do_enter_rtas() into a tracing and non-tracing version,
but I don't think that would be any cleaner.

cheers


> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 998aab967400..3086b5f6c6fc 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -541,6 +541,7 @@ static void do_enter_rtas(struct rtas_args *args)
>  {
>         unsigned long msr;
>         const char *name = NULL;
> +       bool can_trace;
>  
>         /*
>          * Make sure MSR[RI] is currently enabled as it will be forced later
> @@ -553,7 +554,9 @@ static void do_enter_rtas(struct rtas_args *args)
>  
>         hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
>  
> -       if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
> +       can_trace = (msr & MSR_IR) && (msr & MSR_DR);
> +
> +       if (can_trace && (trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
>                 /*
>                  * rtas_token_to_function() uses xarray which uses RCU,
>                  * but this code can run in the CPU offline path
> @@ -568,15 +571,19 @@ static void do_enter_rtas(struct rtas_args *args)
>                 }
>         }
>  
> -       trace_rtas_input(args, name);
> -       trace_rtas_ll_entry(args);
> +       if (can_trace) {
> +               trace_rtas_input(args, name);
> +               trace_rtas_ll_entry(args);
> +       }
>  
>         enter_rtas(__pa(args));
>  
>         srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
>  
> -       trace_rtas_ll_exit(args);
> -       trace_rtas_output(args, name);
> +       if (can_trace) {
> +               trace_rtas_ll_exit(args);
> +               trace_rtas_output(args, name);
> +       }
>  }
>  
>  struct rtas_t rtas = {
