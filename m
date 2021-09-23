Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBB415906
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 09:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFRdj3g8vz30MC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 17:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eSuZi0+i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eSuZi0+i; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFRd506ljz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 17:29:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632382179;
 bh=1DZWUQJxJjE3gVFzURAfp/75FpxWRzroxnKuzT1Kuco=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eSuZi0+iJeYpTWVAFEX6wRzsQmdclBPQLauHcpJuGWF6T+zpRn25ReriDxBEVdS5x
 TW/gmLNgzwU2rd1OqohlaHGoUAfsLJ05PsuwJYrE79gYazAwJDM1LRsyH2Gyf5ECet
 tqOcrX5wh1s8dKcJdprDxUi1BqsXxfr60pyXcsNl0FMuPriIvfAye+LfRm/s9xC1n0
 12kJhj4qG4syc0wBrlfSo1keOEMV1Baayde7ZXTibRP4+lqiYsMPa8sYTaBauVSENq
 Lmt7bIqE6zAS2xrX3b0cVZM9rMP5vLRxBuQGwL4EtloErYriX5ffxMO1HXnwJcp1GW
 /xu+CsE6VRuoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HFRcy6YNBz9sX3;
 Thu, 23 Sep 2021 17:29:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Srikar Dronamraju
 <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
In-Reply-To: <87bl4ko1cp.fsf@linux.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
 <20210922075718.GA2004@linux.vnet.ibm.com> <87ee9gob07.fsf@linux.ibm.com>
 <20210922163351.GB2004@linux.vnet.ibm.com> <87bl4ko1cp.fsf@linux.ibm.com>
Date: Thu, 23 Sep 2021 17:29:32 +1000
Message-ID: <874kabn40z.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>
>> * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-22 11:01:12]:
>>
>>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>>> > * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-20 22:12:13]:
>>> >
>>> >> vcpu_is_preempted() can be used outside of preempt-disabled critical
>>> >> sections, yielding warnings such as:
>>> >> 
>>> >> BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
>>> >> caller is rwsem_spin_on_owner+0x1cc/0x2d0
>>> >> CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
>>> >> Call Trace:
>>> >> [c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
>>> >> [c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
>>> >> [c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
>>> >> [c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
>>> >> [c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
>>> >> [c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
>>> >> [c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
>>> >> [c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
>>> >> [c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250
>>> >> 
>>> >> The result of vcpu_is_preempted() is always subject to invalidation by
>>> >> events inside and outside of Linux; it's just a best guess at a point in
>>> >> time. Use raw_smp_processor_id() to avoid such warnings.
>>> >
>>> > Typically smp_processor_id() and raw_smp_processor_id() except for the
>>> > CONFIG_DEBUG_PREEMPT.
>>> 
>>> Sorry, I don't follow...
>>
>> I meant, Unless CONFIG_DEBUG_PREEMPT, smp_processor_id() is defined as
>> raw_processor_id().
>>
>>> 
>>> > In the CONFIG_DEBUG_PREEMPT case, smp_processor_id()
>>> > is actually debug_smp_processor_id(), which does all the checks.
>>> 
>>> Yes, OK.
>>> 
>>> > I believe these checks in debug_smp_processor_id() are only valid for x86
>>> > case (aka cases were they have __smp_processor_id() defined.)
>>> 
>>> Hmm, I am under the impression that the checks in
>>> debug_smp_processor_id() are valid regardless of whether the arch
>>> overrides __smp_processor_id().
>>
>> From include/linux/smp.h
>>
>> /*
>>  * Allow the architecture to differentiate between a stable and unstable read.
>>  * For example, x86 uses an IRQ-safe asm-volatile read for the unstable but a
>>  * regular asm read for the stable.
>>  */
>> #ifndef __smp_processor_id
>> #define __smp_processor_id(x) raw_smp_processor_id(x)
>> #endif
>>
>> As far as I see, only x86 has a definition of __smp_processor_id.
>> So for archs like Powerpc, __smp_processor_id(), is always
>> defined as raw_smp_processor_id(). Right?
>
> Sure, yes.
>
>> I would think debug_smp_processor_id() would be useful if __smp_processor_id()
>> is different from raw_smp_processor_id(). Do note debug_smp_processor_id() 
>> calls raw_smp_processor_id().

Agree.

> I do not think the utility of debug_smp_processor_id() is related to
> whether the arch defines __smp_processor_id().
>
>> Or can I understand how debug_smp_processor_id() is useful if
>> __smp_processor_id() is defined as raw_smp_processor_id()?

debug_smp_processor_id() is useful on powerpc, as well as other arches,
because it checks that we're in a context where the processor id won't
change out from under us.

eg. something like this is unsafe:

  int counts[NR_CPUS];
  int tmp, cpu;
  
  cpu = smp_processor_id();
  tmp = counts[cpu];
  				<- preempted here and migrated to another CPU
  counts[cpu] = tmp + 1;


> So, for powerpc with DEBUG_PREEMPT unset, a call to smp_procesor_id()
> expands to __smp_processor_id() which expands to raw_smp_processor_id(),
> avoiding the preempt safety checks. This is working as intended.
>
> For powerpc with DEBUG_PREEMPT=y, a call to smp_processor_id() expands
> to the out of line call to debug_smp_processor_id(), which calls
> raw_smp_processor_id() and performs the checks, warning if called in an
> inappropriate context, as seen here. Also working as intended.
>
> AFAICT __smp_processor_id() is a performance/codegen-oriented hook, and
> not really related to the debug facility. Please see 9ed7d75b2f09d
> ("x86/percpu: Relax smp_processor_id()").

Yeah good find.

cheers
