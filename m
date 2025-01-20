Return-Path: <linuxppc-dev+bounces-5399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09190A16E50
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 15:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcCCp37nPz305C;
	Tue, 21 Jan 2025 01:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737382806;
	cv=none; b=XDwEpu3qBvd9EErZ2N0aNQBCEb7Y1ZnKIqHa+tmeI8KqdPYKPdlhjOJgGhYEgXF+JavFFWfNZjLHhwYK04INdv9haqpJ2TIPOytru3LFOZr5Iu12r5eY6Y9zPy0XgLiJmAb4lG30J68GN7+xSfSIpzTcGE9UC82qidLQq6cPrCHdT3WKA+d9mxr4Ro3mObtjYC6VmlDx13bj4JzIJmjbbchHpQDUwNt7m0ohgOK0TtoSyHw0APr8NJUan+fhcS1hZUTpMqWLFpzFe7zaISUHqgcQKVfv8s/MYzTW/BGPBEv3bq8Aa66biLBYuxUXJuB5M00gza/1f6O5WQSHxxrcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737382806; c=relaxed/relaxed;
	bh=5vL0gqj8+Rixq0SR6IWYIoznOLzGE0skDx9zrcZ1+AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1tvQw95loE4S6qjaZSq6awaoNnO+rUYSJ+3xXxf37MDuRlHXlz3iimUq9sQY9rmawQ+VMIShyibEWhd9EgM8PtV31I3FqhFTlZmyVwP12XlfsRoOebBcC96J3+DKA0Zk8U+AqKyswcGPvSXp7FVyBCE+nXK/6lA7ymytlRJaK6eOqdArJ3wxao8gTnjykfeqdI3PmgE2rpf+DVJhSFAGlwWotedY+FqwVVcxZyLtCj3HFwWQCW6FEjziXbz9G1KQU5mgL/lDrmdAAck3SZGKJaj1KPW3+ppfwnukg90gTadYVXF17ADl16ToLW1r1quMKQTmYaFVXV1sL7z6yXLuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcCCn3cbHz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 01:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YcBZz0xVRz9sST;
	Mon, 20 Jan 2025 14:51:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEKWxeYMbmyw; Mon, 20 Jan 2025 14:51:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YcBZy6xxBz9sSH;
	Mon, 20 Jan 2025 14:51:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DCB8E8B76E;
	Mon, 20 Jan 2025 14:51:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nw_eIbetc0t2; Mon, 20 Jan 2025 14:51:38 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A74D98B763;
	Mon, 20 Jan 2025 14:51:38 +0100 (CET)
Message-ID: <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
Date: Mon, 20 Jan 2025 14:51:38 +0100
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
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi <berardi.dav@gmail.com>,
 strace-devel@lists.strace.io, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250114170400.GB11820@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
> On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
>> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
>>> Bring syscall_set_return_value() in sync with syscall_get_error(),
>>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>
>>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
>>> syscall_set_return_value()").
>>
>> There is a clear detailed explanation in that commit of why it needs to
>> be done.
>>
>> If you think that commit is wrong you have to explain why with at least
>> the same level of details.
> 
> OK, please have a look whether this explanation is clear and detailed enough:
> 
> =======
> powerpc: properly negate error in syscall_set_return_value()
> 
> When syscall_set_return_value() is used to set an error code, the caller
> specifies it as a negative value in -ERRORCODE form.
> 
> In !trap_is_scv case the error code is traditionally stored as follows:
> gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
> Here are a few examples to illustrate this convention.  The first one
> is from syscall_get_error():
>          /*
>           * If the system call failed,
>           * regs->gpr[3] contains a positive ERRORCODE.
>           */
>          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> 
> The second example is from regs_return_value():
>          if (is_syscall_success(regs))
>                  return regs->gpr[3];
>          else
>                  return -regs->gpr[3];
> 
> The third example is from check_syscall_restart():
>          regs->result = -EINTR;
>          regs->gpr[3] = EINTR;
>          regs->ccr |= 0x10000000;
> 
> Compared with these examples, the failure of syscall_set_return_value()
> to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
> 	/*
> 	 * In the general case it's not obvious that we must deal with
> 	 * CCR here, as the syscall exit path will also do that for us.
> 	 * However there are some places, eg. the signal code, which
> 	 * check ccr to decide if the value in r3 is actually an error.
> 	 */
> 	if (error) {
> 		regs->ccr |= 0x10000000L;
> 		regs->gpr[3] = error;
> 	} else {
> 		regs->ccr &= ~0x10000000L;
> 		regs->gpr[3] = val;
> 	}
> 
> This fix brings syscall_set_return_value() in sync with syscall_get_error()
> and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
> 
> Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
> =======
> 
> 

I think there is still something going wrong.

do_seccomp() sets regs->gpr[3] = -ENOSYS; by default.

Then it calls __secure_computing() which returns what __seccomp_filter() 
returns.

In case of error, __seccomp_filter() calls syscall_set_return_value() 
with a negative value then returns -1

do_seccomp() is called by do_syscall_trace_enter() which returns -1 when 
do_seccomp() doesn't return 0.

do_syscall_trace_enter() is called by system_call_exception() and 
returns -1, so syscall_exception() returns regs->gpr[3]

In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then 
called with the return of syscall_exception() as first parameter, which 
leads to:

	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
			r3 = -r3;
			regs->ccr |= 0x10000000; /* Set SO bit in CR */
		}
	}

By chance, because you have already changed the sign of gpr[3], the 
above test fails and nothing is done to r3, and because you have also 
already set regs->ccr it works.

But all this looks inconsistent with the fact that do_seccomp sets 
-ENOSYS as default value

Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the 
syscall number and when it is wrong it goes to skip: which sets 
regs->gpr[3] = -ENOSYS;

So really I think it is not in line with your changes to set positive 
value in gpr[3].

Maybe your change is still correct but it needs to be handled completely 
in that case.

Christophe

