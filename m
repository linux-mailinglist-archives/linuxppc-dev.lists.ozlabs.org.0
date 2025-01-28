Return-Path: <linuxppc-dev+bounces-5635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE28A20DA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8tJ0yLJz303d;
	Wed, 29 Jan 2025 02:52:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738079528;
	cv=none; b=mChq0wi4eTxTd4xO5hFeruUOLI8mPPr0GG5tlAPwdX4I5ZPgzL2BYC/0GKKz6cCYedA2qV6M4mPqaN+aButZn/mjwQ6NPuGWss6JfuPb8bcKW1qFNHK7mxhHR1bIy+bFlO/wKkX3Eww8RDvJ8oS6R9o1v4SyLG4z/QszZZxpuA3IxE64QEc4SwK/SpqIlGR+JoqLD2xhvYd0Cueb+BZvzTdFE9lU5tEU/8viGOLWkLW2O67u9lIjxUT05DUrayLhOKoT3MZwp5q+/gE2NTw75xgpj5KxdJR8xrVHzlDVF2HNBh9uBkDzSnKcbAwW5AexPC4DRQHttl/EvWjllt8t4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738079528; c=relaxed/relaxed;
	bh=qUhZ0MeyaRKKEkjfoMT6067wLOGUHFrATYFCRoEfI3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2tYDECW2S3J0YHrvkrConW4+Qy4rlZ2fRovgITrQkb4A3YIrC+HCrjEoqyEl2+oJwGXPm7CFdKqm5++7RE7CWWtr+0rqLzIPVHCQFN+ltOD+1sLKImJMCByofDb0aLCCm1d/cQze1iabEOBfcxGY/EGYLSZznznlBRyHLIylMOcQnrCcrm8tzW0NChkYaCEi8KmzuGMHmAVep+f7dANzIDdZN1+QJmSd9lmpyqKvLw725ZbDOvYqG3l0ecsK/KbngBM9eKOdBhIqigmjB14JdkVXKJF4gNkkctXRnPGCjlrSD+EOsh9xzlO2B7XmbOPI+FOrgrKtnSyZmDr9lf8Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8tG6G8Tz303K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:52:04 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id D345D72C8CC;
	Tue, 28 Jan 2025 18:52:01 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id A0ECE7CCB3A; Tue, 28 Jan 2025 17:52:01 +0200 (IST)
Date: Tue, 28 Jan 2025 17:52:01 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	strace-devel@lists.strace.io, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: properly negate error in
 syscall_set_return_value() in sc case
Message-ID: <20250128155201.GA11869@strace.io>
References: <20250127181322.GA1373@strace.io>
 <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 03:59:29PM +0100, Christophe Leroy wrote:
> Le 27/01/2025 à 19:13, Dmitry V. Levin a écrit :
> > According to the Power Architecture Linux system call ABI documented in
> > [1], when the syscall is made with the sc instruction, both a value and an
> > error condition are returned, where r3 register contains the return value,
> > and cr0.SO bit specifies the error condition.  When cr0.SO is clear, the
> > syscall succeeded and r3 is the return value.  When cr0.SO is set, the
> > syscall failed and r3 is the error value.  This syscall return semantics
> > was implemented from the very beginning of Power Architecture on Linux,
> > and syscall tracers and debuggers like strace that read or modify syscall
> > return information also rely on this ABI.
> 
> I see a quite similar ABI on microblaze, mips, nios2 and sparc. Do they 
> behave all the same ?

Yes, also on alpha.  I don't think microblaze should be in this list,
though.

> > r3 and cr0.SO are exposed directly via struct pt_regs where gpr[3] and
> > (ccr & 0x10000000) correspond to r3 and cr0.SO, respectively.
> > For example, here is an excerpt from check_syscall_restart() that assigns
> > these members of struct pt_regs:
> >          regs->result = -EINTR;
> >          regs->gpr[3] = EINTR;
> >          regs->ccr |= 0x10000000;
> > In this example, the semantics of negative ERRORCODE that's being used
> > virtually everywhere in generic kernel code is translated to powerpc sc
> > syscall return ABI which uses positive ERRORCODE and cr0.SO bit.
> 
> At what point are they exposed really ? At what point do they need to 
> comply with the ABI ?

That's a good question.  Of course when returning to user space, but,
besides that, at syscall exit tracepoint (trace_sys_exit), ptrace syscall
exit stop (ptrace_report_syscall_exit), and PTRACE_EVENT_SECCOMP stop
(__secure_computing).  There could be other points where this is exposed.
For example, on many architectures the tracer can specify syscall error
return value also at ptrace syscall entry stop
(ptrace_report_syscall_entry), but powerpc does not implement this.

> I'm also a bit lost between regs->orig_r3, regs->gpr[3] and regs->result.

I'm not aware of the role of regs->result as it's not in struct user_pt_regs
and therefore is not exposed to user space.

> The comment added by commit 1b1a3702a65c ("powerpc: Don't negate error 
> in syscall_set_return_value()") says that CCR needs to be set because of 
> signal code. But signal code is invoked by syscall_exit_prepare() 
> through call to interrupt_exit_user_prepare_main() after setting CR[SO] 
> and negating syscall result.

I hope Michael can comment on this.

> > Also, r3 and cr0.SO are exposed indirectly via helpers.
> > For example, here is an excerpt from syscall_get_error():
> >          /*
> >           * If the system call failed,
> >           * regs->gpr[3] contains a positive ERRORCODE.
> >           */
> >          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> > and here is another example, from regs_return_value():
> >          if (is_syscall_success(regs))
> >                  return regs->gpr[3];
> >          else
> >                  return -regs->gpr[3];
> > In these examples, the powerpc sc syscall return ABI which uses positive
> > ERRORCODE and cr0.SO bit is translated to the semantics of negative
> > ERRORCODE that's being used virtually everywhere in generic kernel code.
> > 
> > Up to a certain point in time the kernel managed to implement the powerpc
> > sc syscall return ABI in all cases where struct pt_regs was exposed to user
> > space.
> > 
> > The situation changed when SECCOMP_RET_TRACE support was introduced.
> > At this point the -ERRORCODE semantics that was used under the hood to
> > implement seccomp on powerpc became exposed to user space.  The tracer
> > handling PTRACE_EVENT_SECCOMP is not just able to observe -ENOSYS in gpr[3]
> > - this is relatively harmless as at this stage there is no syscall return
> > yet so the powerpc sc syscall return ABI does not apply.  What's important
> > is that the tracer can change the syscall number to -1 thus making the
> > syscall fail, and at this point the tracer is also able to specify the
> > error value.  This has to be done in accordance with the syscall return
> > ABI, however, the current implementation of do_seccomp() supports both the
> > generic kernel -ERRORCODE return value ABI and the powerpc sc syscall
> > return ABI, thanks to syscall_exit_prepare() that converts the former to
> > the latter.  Consequently, seccomp_bpf selftest passes both with and
> > without this change.
> > 
> > Now comes the moment when PTRACE_SET_SYSCALL_INFO is going to be
> > introduced.  PTRACE_SET_SYSCALL_INFO is a generic ptrace API that
> > complements PTRACE_GET_SYSCALL_INFO by letting the ptracer modify
> > the details of the system calls the tracee is blocked in.
> > 
> > One of the helpers that have to be used to implement
> > PTRACE_SET_SYSCALL_INFO is syscall_set_return_value().
> > This helper complements other two helpers, syscall_get_error() and
> > syscall_get_return_value(), that are currently used to implement
> > PTRACE_GET_SYSCALL_INFO on syscall return.  When syscall_set_return_value()
> > is used to set an error code, the caller specifies it as a negative value
> > in -ERRORCODE format.
> > 
> > Unfortunately, this does not work well on powerpc since commit 1b1a3702a65c
> > ("powerpc: Don't negate error in syscall_set_return_value()") because
> > syscall_set_return_value() does not follow the powerpc sc syscall return
> > ABI:
> > 	/*
> > 	 * In the general case it's not obvious that we must deal with
> > 	 * CCR here, as the syscall exit path will also do that for us.
> > 	 * However there are some places, eg. the signal code, which
> > 	 * check ccr to decide if the value in r3 is actually an error.
> > 	 */
> > 	if (error) {
> > 		regs->ccr |= 0x10000000L;
> > 		regs->gpr[3] = error;
> > 	} else {
> > 		regs->ccr &= ~0x10000000L;
> > 		regs->gpr[3] = val;
> > 	}
> > 
> > The reason why this syscall_set_return_value() implementation was able to
> > get away with violating the powerpc sc syscall return ABI is the following:
> > Up to now, syscall_set_return_value() on powerpc could be called only from
> > do_syscall_trace_enter() via do_seccomp(), there was no way it could be
> > called from do_syscall_trace_leave() which is the point where tracers on
> > syscall return are activated and the powerpc sc syscall return ABI has
> > to be respected.
> > 
> > Introduction of PTRACE_SET_SYSCALL_INFO necessitates a change of
> > syscall_set_return_value() to comply with the powerpc sc syscall return
> > ABI.  Without the change, the upcoming ptrace/set_syscall_info selftest
> > fails with the following diagnostics:
> > 
> >    # set_syscall_info.c:119:set_syscall_info:Expected exp_exit->rval (-38) == info->exit.rval (38)
> >    # set_syscall_info.c:120:set_syscall_info:wait #4: PTRACE_GET_SYSCALL_INFO #2: exit stop mismatch
> > 
> > Note that since backwards compatibility with the current implementation has
> > to be provided, the kernel has to continue supporting simultaneously both
> > the generic kernel -ERRORCODE return value ABI and the powerpc sc syscall
> > return ABI at least for PTRACE_EVENT_SECCOMP tracers.  Consequently, since
> > the point of __secure_computing() invocation and up to the point of
> > conversion in syscall_exit_prepare(), gpr[3] may be set according to either
> > of these two ABIs.  An attempt to address code inconsistencies in syscall
> > error return handling that were introduced as a side effect of the dual
> > ABI support follows in a separate patch.
> 
> What do you mean by "backwards compatibility" here ? backwards 
> compatibility applies only to userspace API doesn't it ? So if there was 
> no way to trigger the problem previously, what does it mean ?

As I wrote earlier, userspace tracers handling PTRACE_EVENT_SECCOMP
are able to set gpr[3] to either -ERRORCODE or ERRORCODE (along with
SO bit) for all these years, and both methods work up to now.


-- 
ldv

