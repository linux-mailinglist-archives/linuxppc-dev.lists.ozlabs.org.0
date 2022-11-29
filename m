Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442E63B6C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 01:50:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLkKT0512z3cJY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 11:50:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SXYGpSXe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLkJV32Pzz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 11:50:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SXYGpSXe;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NLkJP13w1z4x1H;
	Tue, 29 Nov 2022 11:49:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669682997;
	bh=ADJGd40AuaXd++zkpqctODvDOywC9t47k7kH9cSd8EE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SXYGpSXee4eemuJIdxRuFHpQV5XvuYlhKeJBsmOx3pVGqlbn9IaE3zZpQLAhpVelv
	 uWgMEzwGDKEH+J7PvomnhfztQF2a2RXhn5RshyBkgFze6MIeu1I182DtvJJMjY477m
	 3wmuwFDb34KxIxO6kEuPWoovBFw9A5S2adNZPFCNgsVUrPE6TOEBIZI3fI0wYy8CeH
	 8RRfZ6qPoOpk/KgZnNzLWsfPI+rfxl1VyVu8H9WsMCZypGBsLyt4V7CnC0vdsKgD6E
	 9Q18Kqe+4cpV1yAqcoN2Gva5l6kJ2xONshf4yHXPjEVG3BuO3iH5OZWkezij8rMXmI
	 WkL6SaLm3ehXg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/13] powerpc/rtas: place tracepoints in do_enter_rtas()
In-Reply-To: <87tu2i8x0e.fsf@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-14-nathanl@linux.ibm.com>
 <CONLJ0VXR77H.JM4D75GQAF62@bobo> <87tu2i8x0e.fsf@linux.ibm.com>
Date: Tue, 29 Nov 2022 11:49:52 +1100
Message-ID: <87mt8abn4f.fsf@mpe.ellerman.id.au>
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
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
>>> Call the just-added rtas tracepoints in do_enter_rtas(), taking care
>>> to avoid function name lookups in the CPU offline path.
>>>
>>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>>> ---
>>>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index 198366d641d0..3487b42cfbf7 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
>>> @@ -38,6 +38,7 @@
>>>  #include <asm/page.h>
>>>  #include <asm/rtas.h>
>>>  #include <asm/time.h>
>>> +#include <asm/trace.h>
>>>  #include <asm/udbg.h>
>>>  
>>>  enum rtas_function_flags {
>>> @@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
>>>  static void do_enter_rtas(struct rtas_args *args)
>>>  {
>>>  	unsigned long msr;
>>> +	const char *name = NULL;
>>>  
>>>  	/*
>>>  	 * Make sure MSR[RI] is currently enabled as it will be forced later
>>> @@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
>>>  
>>>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
>>>  
>>> +	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
>>> +		/*
>>> +		 * rtas_token_to_function() uses xarray which uses RCU,
>>> +		 * but this code can run in the CPU offline path
>>> +		 * (e.g. stop-self), after it's become invalid to call
>>> +		 * RCU APIs.
>>> +		 */
>>
>> We can call this in real-mode via pseries_machine_check_realmode
>> -> fwnmi_release_errinfo, so tracing should be disabled for that
>> case too... Does this_cpu_set_ftrace_enabled(0) in the early
>> machine check handler cover that sufficiently?
>
> I suspect so, but I'd like to verify. Do you know how I could exercise
> this path in qemu or LPAR?

On a P9 or P10 LPAR you should be able to use tools/testing/selftests/powerpc/mce/inject-ra-err

cheers
