Return-Path: <linuxppc-dev+bounces-5439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D07A17D3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 12:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YclrG5wDjz2yyD;
	Tue, 21 Jan 2025 22:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737460206;
	cv=none; b=GvM33EAQdXywutTMIemYtzXI5I0djMImbByKFT2t5jHBcVElrPOhyIVyqeAR/L5zi/9Cm6zPGezK5vufx1G+Yj2oAC7bRBKh83foOe2qxe6qTCbUnINVz4uaI9cHAtle4/r8rxMhgnCm9x0x4QfrlYdiUN24jQRrp1C25b107+GhMWlljwLJyxMy8sUI4hbdRBEqzhiw5iz+0odjTZCko2p0LWa+hz7fC7KiJGwBAnZrTJWSi3LHQhIWrMaTVA1MdY1Y/Q6ZPCz6m68Tc05MgkG5o1Hh/1YXUXqv6lV0pvGbqc3CMimXawGyvnDD9ZVd6rYiaV5I54YnrrlJOqYnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737460206; c=relaxed/relaxed;
	bh=R9azhyCHqwyF3HhAKayzMpDim9p9FM9zD16ppdqB8gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8nwtcgfBuvedPjBs2oxTTRgUjdnMaFOps1pvPkiwcVplECnTXsyPOzo8sXTz/dGGkIEfdvM6zQWIV4SphZOnCfPiqSgiYWX8xolMfvZkEfgOs3zctNnHvje1HfAXBjrpBD9oFUTLxM0eOzfFBE2xeJ7cLFtsJ5S7E9f6WSNukPQrVAIl40iezSqWLOlG0NujoMKaT8qiENkR6yYX9UMQXl3QIK5qAaLkuEcyjHkbGUT6FBEmKgfZC6DDZbXzES3TnDRybwFCvZriSHP6Z7pIr54xJES/5EM1PCH7m+E2Pej6jdHOEkQxgMhCO54p+ToPfGIoJQ2pXHeadgCbLn+QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YclrF6yf3z2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 22:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YclMh1WGJz9sS7;
	Tue, 21 Jan 2025 12:28:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQHmO5nYyAco; Tue, 21 Jan 2025 12:28:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YclMh0WlCz9sRk;
	Tue, 21 Jan 2025 12:28:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F38968B774;
	Tue, 21 Jan 2025 12:28:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DuhPnq6i2FUi; Tue, 21 Jan 2025 12:28:47 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BDDC88B763;
	Tue, 21 Jan 2025 12:28:46 +0100 (CET)
Message-ID: <70cb8e5b-7ee5-494a-a02a-ef286f8c970c@csgroup.eu>
Date: Tue, 21 Jan 2025 12:28:46 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
To: Madhavan Srinivasan <maddy@linux.ibm.com>, "Dmitry V. Levin"
 <ldv@strace.io>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi <berardi.dav@gmail.com>,
 strace-devel@lists.strace.io, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250120171249.GA17320@strace.io>
 <70dc8099-e725-4069-9b3a-af31578278e2@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <70dc8099-e725-4069-9b3a-af31578278e2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 21/01/2025 à 12:13, Madhavan Srinivasan a écrit :
> 
> 
> On 1/20/25 10:42 PM, Dmitry V. Levin wrote:
>> On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
>>> Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
>>>> On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
>>>>> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
>>>>>> Bring syscall_set_return_value() in sync with syscall_get_error(),
>>>>>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>>>>
> 
> Sorry for getting to this thread late.
> 
> Tried the series without this patch in
> 
> 1) power9 PowerNV system and in power10 pSeries lpar
> 
> # ./set_syscall_info
> TAP version 13
> 1..1
> # Starting 1 tests from 1 test cases.
> #  RUN           global.set_syscall_info ...
> #            OK  global.set_syscall_info
> ok 1 global.set_syscall_info
> # PASSED: 1 / 1 tests passed.
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> and in both case set_syscall_info passes.
> Will look at it further.

I guess it works because power9/10 are using scv not sc for system call, 
hence using the new ABI ?

Christophe

> 
> Maddy
> 
>>>>>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
>>>>>> syscall_set_return_value()").
>>>>>
>>>>> There is a clear detailed explanation in that commit of why it needs to
>>>>> be done.
>>>>>
>>>>> If you think that commit is wrong you have to explain why with at least
>>>>> the same level of details.
>>>>
>>>> OK, please have a look whether this explanation is clear and detailed enough:
>>>>
>>>> =======
>>>> powerpc: properly negate error in syscall_set_return_value()
>>>>
>>>> When syscall_set_return_value() is used to set an error code, the caller
>>>> specifies it as a negative value in -ERRORCODE form.
>>>>
>>>> In !trap_is_scv case the error code is traditionally stored as follows:
>>>> gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
>>>> Here are a few examples to illustrate this convention.  The first one
>>>> is from syscall_get_error():
>>>>           /*
>>>>            * If the system call failed,
>>>>            * regs->gpr[3] contains a positive ERRORCODE.
>>>>            */
>>>>           return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
>>>>
>>>> The second example is from regs_return_value():
>>>>           if (is_syscall_success(regs))
>>>>                   return regs->gpr[3];
>>>>           else
>>>>                   return -regs->gpr[3];
>>>>
>>>> The third example is from check_syscall_restart():
>>>>           regs->result = -EINTR;
>>>>           regs->gpr[3] = EINTR;
>>>>           regs->ccr |= 0x10000000;
>>>>
>>>> Compared with these examples, the failure of syscall_set_return_value()
>>>> to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
>>>> 	/*
>>>> 	 * In the general case it's not obvious that we must deal with
>>>> 	 * CCR here, as the syscall exit path will also do that for us.
>>>> 	 * However there are some places, eg. the signal code, which
>>>> 	 * check ccr to decide if the value in r3 is actually an error.
>>>> 	 */
>>>> 	if (error) {
>>>> 		regs->ccr |= 0x10000000L;
>>>> 		regs->gpr[3] = error;
>>>> 	} else {
>>>> 		regs->ccr &= ~0x10000000L;
>>>> 		regs->gpr[3] = val;
>>>> 	}
>>>>
>>>> This fix brings syscall_set_return_value() in sync with syscall_get_error()
>>>> and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>>
>>>> Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
>>>> =======
>>>>
>>>>
>>>
>>> I think there is still something going wrong.
>>>
>>> do_seccomp() sets regs->gpr[3] = -ENOSYS; by default.
>>>
>>> Then it calls __secure_computing() which returns what __seccomp_filter()
>>> returns.
>>>
>>> In case of error, __seccomp_filter() calls syscall_set_return_value()
>>> with a negative value then returns -1
>>>
>>> do_seccomp() is called by do_syscall_trace_enter() which returns -1 when
>>> do_seccomp() doesn't return 0.
>>>
>>> do_syscall_trace_enter() is called by system_call_exception() and
>>> returns -1, so syscall_exception() returns regs->gpr[3]
>>>
>>> In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then
>>> called with the return of syscall_exception() as first parameter, which
>>> leads to:
>>>
>>> 	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
>>> 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
>>> 			r3 = -r3;
>>> 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
>>> 		}
>>> 	}
>>
>> Note the "unlikely" keyword here reminding us once more that in !scv case
>> regs->gpr[3] does not normally have -ERRORCODE form.
>>
>>> By chance, because you have already changed the sign of gpr[3], the
>>> above test fails and nothing is done to r3, and because you have also
>>> already set regs->ccr it works.
>>>
>>> But all this looks inconsistent with the fact that do_seccomp sets
>>> -ENOSYS as default value
>>>
>>> Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the
>>> syscall number and when it is wrong it goes to skip: which sets
>>> regs->gpr[3] = -ENOSYS;
>>
>> It looks like do_seccomp() and do_syscall_trace_enter() get away by sheer
>> luck, implicitly relying on syscall_exit_prepare() transparently fixing
>> regs->gpr[3] for them.
>>
>>> So really I think it is not in line with your changes to set positive
>>> value in gpr[3].
>>>
>>> Maybe your change is still correct but it needs to be handled completely
>>> in that case.
>>
>> By the way, is there any reasons why do_seccomp() and
>> do_syscall_trace_enter() don't use syscall_set_return_value() yet?
>>
>>
> 


