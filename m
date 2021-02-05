Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73668311736
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 00:39:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXX2W2TbWzDvVX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 10:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXX0k5kshzDvV9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 10:38:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dTUrOAuT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DXX0k3D9tz9sWV;
 Sat,  6 Feb 2021 10:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612568294;
 bh=Bx65x+xg9Lzonl99HPrYa45i+5twrb0QvUNLnswTAag=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dTUrOAuTaOqVHKsUjQpPg9bFHhahwrJH6ciisy8LUNpsmkvcl16jBTAVsgY1y7lF7
 JlwkQDE6HN/q0lTcRNx55gbpF54Mk7KsLeRbCPRkbZE3I1M2JNf0xY0OxUu6btCk6t
 fw4ud3b4NUtSExgTOU4RjDdMjww67EbAFVhhEhLgZ5kxl8atiDRajJ3qLi4AO4tQUj
 VmAoCVZWfHEUVHfjaktRj1RHrcbcd1EL0QGeQwm+XC2wNtXNR3tKVA+xlBO4MmNJc8
 pKJkes+mlWWvpJVZaflgcGolwHsJ9CTTZ/mftGr7nYNjiebJs+wl48KdDNZvBGfTkf
 jR02z0mzR2r5A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 39/42] powerpc: move NMI entry/exit code into wrapper
In-Reply-To: <1612438069.44myr3nzfs.astroid@bobo.none>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-40-npiggin@gmail.com>
 <87k0rop29e.fsf@mpe.ellerman.id.au>
 <1612438069.44myr3nzfs.astroid@bobo.none>
Date: Sat, 06 Feb 2021 10:38:13 +1100
Message-ID: <875z36ozkq.fsf@mpe.ellerman.id.au>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of February 4, 2021 8:15 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> This moves the common NMI entry and exit code into the interrupt handler
>>> wrappers.
>>>
>>> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
>>> also MCE interrupts on 64e, by adding missing parts of the NMI entry to
>>> them.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/include/asm/interrupt.h | 28 ++++++++++++++++++++++
>>>  arch/powerpc/kernel/mce.c            | 11 ---------
>>>  arch/powerpc/kernel/traps.c          | 35 +++++-----------------------
>>>  arch/powerpc/kernel/watchdog.c       | 10 ++++----
>>>  4 files changed, 38 insertions(+), 46 deletions(-)
>> 
>> This is unhappy when injecting SLB multi-hits:
>> 
>>   root@p86-2:~# echo PPC_SLB_MULTIHIT > /sys/kernel/debug/provoke-crash/DIRECT
>>   [  312.496026][ T1344] kernel BUG at arch/powerpc/include/asm/interrupt.h:152!
>>   [  312.496037][ T1344] Oops: Exception in kernel mode, sig: 5 [#1]
>>   [  312.496045][ T1344] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>
> pseries hash. Blast!

The worst kind.

>> 147 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
>> 148 {
>> 149 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
>> 150 			!firmware_has_feature(FW_FEATURE_LPAR) ||
>> 151 			radix_enabled() || (mfmsr() & MSR_DR))
>> 152 		nmi_exit();
>> 
>> 
>> So presumably it's:
>> 
>> #define __nmi_exit()						\
>> 	do {							\
>> 		BUG_ON(!in_nmi());				\
>
> Yes that would be it, pseries machine check enables MMU half way through 
> so only one side of this triggers.
>
> The MSR_DR check is supposed to catch the other NMIs that run with MMU 
> on (perf, watchdog, etc). Suppose it could test TRAP(regs) explicitly
> although I wonder if we should also do this to keep things balanced

Yeah I think I like that. I'll give it a test.

cheers


> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 149cec2212e6..f57ca0c570be 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -719,6 +719,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>  
>  static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>  {
> +       unsigned long msr;
>         struct pseries_errorlog *pseries_log;
>         struct pseries_mc_errorlog *mce_log = NULL;
>         int disposition = rtas_error_disposition(errp);
> @@ -747,9 +748,12 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>          *       SLB multihit is done by now.
>          */
>  out:
> -       mtmsr(mfmsr() | MSR_IR | MSR_DR);
> +       msr = mfmsr();
> +       mtmsr(msr | MSR_IR | MSR_DR);
>         disposition = mce_handle_err_virtmode(regs, errp, mce_log,
>                                               disposition);
> +       mtmsr(msr);
> +
>         return disposition;
>  }
>  
