Return-Path: <linuxppc-dev+bounces-5629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACCA20CD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj89L2lvKz3029;
	Wed, 29 Jan 2025 02:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738077606;
	cv=none; b=bcxtdn3YVHceoWQE0+c8k4Udi8ZlOVryIQs9WPm6qv9VqIBnGJeVKc6q0lNurW8I3ISAIEYtXJPozq28oup6IeXNCe8ixUida4lmiiBNRWMg4uTujRhnGwAKtYmw6gKvxaLbasZFYtnQEu4cXKLxAIXrpm5Cx5knivsCOzPLWZ7HBFUkzRuWL6JBwLnD3m14E002j4Yv4n+ZH7YrKS2BvcLdboQDK2etOb/fhovjLn13/JoGdU1+mcQ/BkqXH050hB8EKnMV3gNZt5sYtI+edzPAF9p6rHZIPZESByjC9nwaNZAdUz0AvZhzU/QLtwI2N1ve3Ssd7A/Nf3jsRVWu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738077606; c=relaxed/relaxed;
	bh=odfvRky12iPMIMhjvCKWECwWZnRpJu+KSVu6Omrp8us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bavz/fa6kxqGWEEXUPhfZCzT9IQ4Q/aDpYjoSMalBeCRqP8je+3hAg4OIJj03Pb9KJswEwIOMwvugAEJWnQ9UGuaQzGgk4J1TGDRhZFEtOqYQU0yK5YQs6BdQi7LAWZSh86yukbiXP1FQG4CMFBYY0tFXU7B4uly1XD/g7K+cCj9P8NDVzezRpcCnftcBbYnPd/KSbBQjrbBz9qx8uE+42qUcGP+6Im3bTK/uPfF/gbQ/pyYHkvPQO8TLp80O6EIQ1EWV7xwF/PPz0Ls4Dv/0310gr62KvJ2rW6ffXxpCGkjS+nSF7fRixYNDAKR4RKvHMCfafaCjdk+XxERCWHOCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj89J6dP7z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj7jZ2xRsz9sRk;
	Tue, 28 Jan 2025 15:59:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mh0t-AxcVivD; Tue, 28 Jan 2025 15:59:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj7jZ1sb3z9rvV;
	Tue, 28 Jan 2025 15:59:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A25E8B76C;
	Tue, 28 Jan 2025 15:59:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jqHrN5KJmjyV; Tue, 28 Jan 2025 15:59:30 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 79D408B763;
	Tue, 28 Jan 2025 15:59:29 +0100 (CET)
Message-ID: <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
Date: Tue, 28 Jan 2025 15:59:29 +0100
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
Subject: Re: [PATCH 1/2] powerpc: properly negate error in
 syscall_set_return_value() in sc case
To: "Dmitry V. Levin" <ldv@strace.io>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Alexey Gladkov <legion@kernel.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, strace-devel@lists.strace.io,
 linux-kernel@vger.kernel.org
References: <20250127181322.GA1373@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250127181322.GA1373@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Le 27/01/2025 à 19:13, Dmitry V. Levin a écrit :
> According to the Power Architecture Linux system call ABI documented in
> [1], when the syscall is made with the sc instruction, both a value and an
> error condition are returned, where r3 register contains the return value,
> and cr0.SO bit specifies the error condition.  When cr0.SO is clear, the
> syscall succeeded and r3 is the return value.  When cr0.SO is set, the
> syscall failed and r3 is the error value.  This syscall return semantics
> was implemented from the very beginning of Power Architecture on Linux,
> and syscall tracers and debuggers like strace that read or modify syscall
> return information also rely on this ABI.

I see a quite similar ABI on microblaze, mips, nios2 and sparc. Do they 
behave all the same ?

> 
> r3 and cr0.SO are exposed directly via struct pt_regs where gpr[3] and
> (ccr & 0x10000000) correspond to r3 and cr0.SO, respectively.
> For example, here is an excerpt from check_syscall_restart() that assigns
> these members of struct pt_regs:
>          regs->result = -EINTR;
>          regs->gpr[3] = EINTR;
>          regs->ccr |= 0x10000000;
> In this example, the semantics of negative ERRORCODE that's being used
> virtually everywhere in generic kernel code is translated to powerpc sc
> syscall return ABI which uses positive ERRORCODE and cr0.SO bit.

At what point are they exposed really ? At what point do they need to 
comply with the ABI ?

I'm also a bit lost between regs->orig_r3, regs->gpr[3] and regs->result.

The comment added by commit 1b1a3702a65c ("powerpc: Don't negate error 
in syscall_set_return_value()") says that CCR needs to be set because of 
signal code. But signal code is invoked by syscall_exit_prepare() 
through call to interrupt_exit_user_prepare_main() after setting CR[SO] 
and negating syscall result.

> 
> Also, r3 and cr0.SO are exposed indirectly via helpers.
> For example, here is an excerpt from syscall_get_error():
>          /*
>           * If the system call failed,
>           * regs->gpr[3] contains a positive ERRORCODE.
>           */
>          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> and here is another example, from regs_return_value():
>          if (is_syscall_success(regs))
>                  return regs->gpr[3];
>          else
>                  return -regs->gpr[3];
> In these examples, the powerpc sc syscall return ABI which uses positive
> ERRORCODE and cr0.SO bit is translated to the semantics of negative
> ERRORCODE that's being used virtually everywhere in generic kernel code.
> 
> Up to a certain point in time the kernel managed to implement the powerpc
> sc syscall return ABI in all cases where struct pt_regs was exposed to user
> space.
> 
> The situation changed when SECCOMP_RET_TRACE support was introduced.
> At this point the -ERRORCODE semantics that was used under the hood to
> implement seccomp on powerpc became exposed to user space.  The tracer
> handling PTRACE_EVENT_SECCOMP is not just able to observe -ENOSYS in gpr[3]
> - this is relatively harmless as at this stage there is no syscall return
> yet so the powerpc sc syscall return ABI does not apply.  What's important
> is that the tracer can change the syscall number to -1 thus making the
> syscall fail, and at this point the tracer is also able to specify the
> error value.  This has to be done in accordance with the syscall return
> ABI, however, the current implementation of do_seccomp() supports both the
> generic kernel -ERRORCODE return value ABI and the powerpc sc syscall
> return ABI, thanks to syscall_exit_prepare() that converts the former to
> the latter.  Consequently, seccomp_bpf selftest passes both with and
> without this change.
> 
> Now comes the moment when PTRACE_SET_SYSCALL_INFO is going to be
> introduced.  PTRACE_SET_SYSCALL_INFO is a generic ptrace API that
> complements PTRACE_GET_SYSCALL_INFO by letting the ptracer modify
> the details of the system calls the tracee is blocked in.
> 
> One of the helpers that have to be used to implement
> PTRACE_SET_SYSCALL_INFO is syscall_set_return_value().
> This helper complements other two helpers, syscall_get_error() and
> syscall_get_return_value(), that are currently used to implement
> PTRACE_GET_SYSCALL_INFO on syscall return.  When syscall_set_return_value()
> is used to set an error code, the caller specifies it as a negative value
> in -ERRORCODE format.
> 
> Unfortunately, this does not work well on powerpc since commit 1b1a3702a65c
> ("powerpc: Don't negate error in syscall_set_return_value()") because
> syscall_set_return_value() does not follow the powerpc sc syscall return
> ABI:
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
> The reason why this syscall_set_return_value() implementation was able to
> get away with violating the powerpc sc syscall return ABI is the following:
> Up to now, syscall_set_return_value() on powerpc could be called only from
> do_syscall_trace_enter() via do_seccomp(), there was no way it could be
> called from do_syscall_trace_leave() which is the point where tracers on
> syscall return are activated and the powerpc sc syscall return ABI has
> to be respected.
> 
> Introduction of PTRACE_SET_SYSCALL_INFO necessitates a change of
> syscall_set_return_value() to comply with the powerpc sc syscall return
> ABI.  Without the change, the upcoming ptrace/set_syscall_info selftest
> fails with the following diagnostics:
> 
>    # set_syscall_info.c:119:set_syscall_info:Expected exp_exit->rval (-38) == info->exit.rval (38)
>    # set_syscall_info.c:120:set_syscall_info:wait #4: PTRACE_GET_SYSCALL_INFO #2: exit stop mismatch
> 
> Note that since backwards compatibility with the current implementation has
> to be provided, the kernel has to continue supporting simultaneously both
> the generic kernel -ERRORCODE return value ABI and the powerpc sc syscall
> return ABI at least for PTRACE_EVENT_SECCOMP tracers.  Consequently, since
> the point of __secure_computing() invocation and up to the point of
> conversion in syscall_exit_prepare(), gpr[3] may be set according to either
> of these two ABIs.  An attempt to address code inconsistencies in syscall
> error return handling that were introduced as a side effect of the dual
> ABI support follows in a separate patch.

What do you mean by "backwards compatibility" here ? backwards 
compatibility applies only to userspace API doesn't it ? So if there was 
no way to trigger the problem previously, what does it mean ?

> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Farch%2Fpowerpc%2Fsyscall64-abi.html%23return-value&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cc2cf590281c24fe1478408dd3efe4a3e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638735984085033893%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=EEP9s6k%2Fs5VfqWgrs6VXi879HEfJ8BYOOJ8InmmVTQA%3D&reserved=0 [1]
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> Reviewed-by: Alexey Gladkov <legion@kernel.org>
> ---
>   arch/powerpc/include/asm/syscall.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 3dd36c5e334a..422d7735ace6 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
>   		 */
>   		if (error) {
>   			regs->ccr |= 0x10000000L;
> -			regs->gpr[3] = error;
> +			/*
> +			 * In case of an error regs->gpr[3] contains
> +			 * a positive ERRORCODE.
> +			 */
> +			regs->gpr[3] = -error;
>   		} else {
>   			regs->ccr &= ~0x10000000L;
>   			regs->gpr[3] = val;


