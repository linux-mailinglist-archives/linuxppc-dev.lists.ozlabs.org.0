Return-Path: <linuxppc-dev+bounces-5529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6BEA1A9A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 19:28:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf8Zv1wQvz301Y;
	Fri, 24 Jan 2025 05:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737656903;
	cv=none; b=cjJ2dlcTxCbAdXbfpb389aueHBN097SmDAw9UbVIsdU3BuTFL6IOL7+1F+puTUJTUY8KxseHp6ffdLoaLqapkjYiwkxQDTmCt4GUd4z0sMOaTlTeVGJe8Jzkh/sM9iwlfed+NCR7BvFqELtCrHURATN0NACoGBtcPOk8R/f+lQEBAMiH8SdO/Ikv/ELXmij8YGvxZGLC7ZYwHybUbATANJwuYlq4aLR38G5xvVhCzHrllUEELE53+FAUsum2dzjlzDZjODm2I9aWvrho7xmByRH2vdGcd034HHsBH24BF19+4NsEcBAFdg5DkNlr4e5ZPNklcj3tAnCAgNThBSquWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737656903; c=relaxed/relaxed;
	bh=yvpeRnvb0pNXqn0ZM4T7IYfRIqgxRlT3tCwhA6UGWAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVfO8ISVsQv8aFE9O6u8szDJ3tw3KUnmydF1l0nOaWYGDTcha4UDTh/YlVBK8tUoH8N8VuMRfwcdymLq5PFYbTZR1OlqoNomOa8NBRcWjjHj7E90sqG3Wt4plR/ZROGKRWHaXQYlgdf+8Vccy9RnxsQ4n+tX5N5yUhjXIGMM9OJNB/8lKtKJRjXr9TiQ5vqV8W2+feENawWZAHb86i5IG3bC+UGpXfc1PSYCRhk7NVunmwIIMV7bWH9jFpWEvytdVbyLJsCDuTFvoHwNsnB3N2tUxnV4I672aVbJs27gBRNqJQgcmCl9id8jQLJPa9BhNJiCFYoM4Tzl4LAZ7aj3GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf8Zs0gWtz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 05:28:19 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 9C97C72C8CC;
	Thu, 23 Jan 2025 21:28:15 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 8B8237CCB3A; Thu, 23 Jan 2025 20:28:15 +0200 (IST)
Date: Thu, 23 Jan 2025 20:28:15 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250123182815.GA20994@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
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
In-Reply-To: <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
> Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
> > On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
> >> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
> >>> Bring syscall_set_return_value() in sync with syscall_get_error(),
> >>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> >>>
> >>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> >>> syscall_set_return_value()").
> >>
> >> There is a clear detailed explanation in that commit of why it needs to
> >> be done.
> >>
> >> If you think that commit is wrong you have to explain why with at least
> >> the same level of details.
> > 
> > OK, please have a look whether this explanation is clear and detailed enough:
> > 
> > =======
> > powerpc: properly negate error in syscall_set_return_value()
> > 
> > When syscall_set_return_value() is used to set an error code, the caller
> > specifies it as a negative value in -ERRORCODE form.
> > 
> > In !trap_is_scv case the error code is traditionally stored as follows:
> > gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
> > Here are a few examples to illustrate this convention.  The first one
> > is from syscall_get_error():
> >          /*
> >           * If the system call failed,
> >           * regs->gpr[3] contains a positive ERRORCODE.
> >           */
> >          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> > 
> > The second example is from regs_return_value():
> >          if (is_syscall_success(regs))
> >                  return regs->gpr[3];
> >          else
> >                  return -regs->gpr[3];
> > 
> > The third example is from check_syscall_restart():
> >          regs->result = -EINTR;
> >          regs->gpr[3] = EINTR;
> >          regs->ccr |= 0x10000000;
> > 
> > Compared with these examples, the failure of syscall_set_return_value()
> > to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
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
> > This fix brings syscall_set_return_value() in sync with syscall_get_error()
> > and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
> > 
> > Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
> > =======
> 
> I think there is still something going wrong.
> 
> do_seccomp() sets regs->gpr[3] = -ENOSYS; by default.
> 
> Then it calls __secure_computing() which returns what __seccomp_filter() 
> returns.
> 
> In case of error, __seccomp_filter() calls syscall_set_return_value() 
> with a negative value then returns -1
> 
> do_seccomp() is called by do_syscall_trace_enter() which returns -1 when 
> do_seccomp() doesn't return 0.
> 
> do_syscall_trace_enter() is called by system_call_exception() and 
> returns -1, so syscall_exception() returns regs->gpr[3]
> 
> In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then 
> called with the return of syscall_exception() as first parameter, which 
> leads to:
> 
> 	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
> 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
> 			r3 = -r3;
> 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
> 		}
> 	}
> 
> By chance, because you have already changed the sign of gpr[3], the 
> above test fails and nothing is done to r3, and because you have also 
> already set regs->ccr it works.
> 
> But all this looks inconsistent with the fact that do_seccomp sets 
> -ENOSYS as default value
> 
> Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the 
> syscall number and when it is wrong it goes to skip: which sets 
> regs->gpr[3] = -ENOSYS;
> 
> So really I think it is not in line with your changes to set positive 
> value in gpr[3].
> 
> Maybe your change is still correct but it needs to be handled completely 
> in that case.

Indeed, there is an inconsistency in !trap_is_scv case.

In some places such as syscall_get_error() and regs_return_value() the
semantics is as I described earlier: gpr[3] contains a positive ERRORCODE
and ccr has 0x10000000 flag set.  This semantics is a part of the ABI and
therefore cannot be changed.

In some other places like do_seccomp() and do_syscall_trace_enter() the
semantics is similar to the trap_is_scv case: gpr[3] contains a negative
ERRORCODE and ccr is unchanged.  In addition, system_call_exception()
returns the system call function return value when it is executed, and
gpr[3] otherwise.  The value returned by system_call_exception() is passed
on to syscall_exit_prepare() which performs the conversion you mentioned.

What's remarkable is that in those places that are a part of the ABI the
traditional semantics is kept, while in other places the implementation
follows the trap_is_scv-like semantics, while traditional semantics is
also supported there.

The only case where I see some intersection is do_seccomp() where the
tracer would be able to see -ENOSYS in gpr[3].  However, the seccomp stop
is not the place where the tracer *reads* the system call exit status,
so whatever was written in gpr[3] before __secure_computing() is not
really relevant, consequently, selftests/seccomp/seccomp_bpf passes with
this patch applied as well as without it.

After looking at system_call_exception() I doubt this inconsistency can be
easily avoided, so I don't see how this patch could be enhanced further,
and what else could I do with the patch besides dropping it and letting
!trap_is_scv case be unsupported by PTRACE_SET_SYSCALL_INFO API, which
would be unfortunate.


-- 
ldv

