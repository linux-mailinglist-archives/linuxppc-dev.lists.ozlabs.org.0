Return-Path: <linuxppc-dev+bounces-9075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B97AACAD7A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 13:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9sSM0qDhz2yLT;
	Mon,  2 Jun 2025 21:44:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748864643;
	cv=none; b=SJmpNoY+tTPUhrYp9jkCKdAhHAdhV6HTpbOO9uUZVHVHcLvoW+LUR93FOc8o4vDWJ+6FKpY09enEfly6ngOhALMGZn8bQbwnaaA6xOSGMEW271qxjlx9Sj357LquN1bHZXYfpTt8u5ceat6AZ6ZNWDlVmAMFDZSdsQ0mtPYRaJmsGRIcM7JfeeQ8BzJlKWi2hnHSV1JR8JRYH7nVDSZ7Cx41FsRaXLBsSQagdNro0nG2v8KGMFu7yEgMXB1oS2h9ivmDIBUrf1ZM5NNE6+PH1MBuGfsF078Vaml4UdYi4UHjJc/5k1Eztj7CWWAh4yKR0xrbwrlFRZJrh4+Ud21u/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748864643; c=relaxed/relaxed;
	bh=8I3kEr86XbLXI/IE63aqofLGRBEX2BY6/jTEh3dNRnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIEtc+BFyd0zrF6VzCZIQ/P49s/wRxNnQRFAGnjpiV0s+w7rDgukVWQlL09VcDTkfgbmcS0Wxw4GuclzZanbEDF+8zyb+yMlOyNo+enav2uZS6B1xF/DnDquNCHsoJ8HRX29oxvFiuh7WSr/m7UwxoHNvw4QmBi/A/qMSn8Te71e5r8N7NlLJaM6/EPyotZhvQnQPlW9KN4on4FKJ65ae4fW2CaRGWx96mxrblHRTmJnpGqItvmL5rkALeyWFmRlnYFQFma+vIrW03T6UYMHffV7zjTA/9wIBrA79Zjm5/tMFlRbB8Wb3vva8VQhYC6Renwqhrb7OMkOoE3QS8Hc7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 476 seconds by postgrey-1.37 at boromir; Mon, 02 Jun 2025 21:44:01 AEST
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9sSK2zkDz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 21:44:01 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 615DE72C8CC;
	Mon,  2 Jun 2025 14:36:01 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 52AF57CCB3A; Mon,  2 Jun 2025 14:36:01 +0300 (IDT)
Date: Mon, 2 Jun 2025 14:36:01 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	strace-devel@lists.strace.io, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: properly negate error in
 syscall_set_return_value() in sc case
Message-ID: <20250602113601.GA329@strace.io>
References: <20250127181322.GA1373@strace.io>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127181322.GA1373@strace.io>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 27, 2025 at 08:13:23PM +0200, Dmitry V. Levin wrote:
> According to the Power Architecture Linux system call ABI documented in
> [1], when the syscall is made with the sc instruction, both a value and an
> error condition are returned, where r3 register contains the return value,
> and cr0.SO bit specifies the error condition.  When cr0.SO is clear, the
> syscall succeeded and r3 is the return value.  When cr0.SO is set, the
> syscall failed and r3 is the error value.  This syscall return semantics
> was implemented from the very beginning of Power Architecture on Linux,
> and syscall tracers and debuggers like strace that read or modify syscall
> return information also rely on this ABI.
> 
> r3 and cr0.SO are exposed directly via struct pt_regs where gpr[3] and
> (ccr & 0x10000000) correspond to r3 and cr0.SO, respectively.
> For example, here is an excerpt from check_syscall_restart() that assigns
> these members of struct pt_regs:
>         regs->result = -EINTR;
>         regs->gpr[3] = EINTR;
>         regs->ccr |= 0x10000000;
> In this example, the semantics of negative ERRORCODE that's being used
> virtually everywhere in generic kernel code is translated to powerpc sc
> syscall return ABI which uses positive ERRORCODE and cr0.SO bit.
> 
> Also, r3 and cr0.SO are exposed indirectly via helpers.
> For example, here is an excerpt from syscall_get_error():
>         /*
>          * If the system call failed,
>          * regs->gpr[3] contains a positive ERRORCODE.
>          */
>         return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> and here is another example, from regs_return_value():
>         if (is_syscall_success(regs))
>                 return regs->gpr[3];
>         else
>                 return -regs->gpr[3];
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
>   # set_syscall_info.c:119:set_syscall_info:Expected exp_exit->rval (-38) == info->exit.rval (38)
>   # set_syscall_info.c:120:set_syscall_info:wait #4: PTRACE_GET_SYSCALL_INFO #2: exit stop mismatch
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
> 
> Link: https://www.kernel.org/doc/html/latest/arch/powerpc/syscall64-abi.html#return-value [1]
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> Reviewed-by: Alexey Gladkov <legion@kernel.org>
> ---
>  arch/powerpc/include/asm/syscall.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 3dd36c5e334a..422d7735ace6 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
>  		 */
>  		if (error) {
>  			regs->ccr |= 0x10000000L;
> -			regs->gpr[3] = error;
> +			/*
> +			 * In case of an error regs->gpr[3] contains
> +			 * a positive ERRORCODE.
> +			 */
> +			regs->gpr[3] = -error;
>  		} else {
>  			regs->ccr &= ~0x10000000L;
>  			regs->gpr[3] = val;

Given that the PTRACE_SET_SYSCALL_INFO API has been merged and this
powerpc issue is now exposed to userspace, can we make it fixed, please?


-- 
ldv

