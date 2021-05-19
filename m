Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61860388F0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 15:27:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlYZH2Tnpz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 23:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=altlinux.org (client-ip=194.107.17.57;
 helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org;
 receiver=<UNKNOWN>)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlYYv45Ngz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 23:26:58 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id B264A72C8BA;
 Wed, 19 May 2021 16:26:56 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 9CC517CC8A6; Wed, 19 May 2021 16:26:56 +0300 (MSK)
Date: Wed, 19 May 2021 16:26:56 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210519132656.GA17204@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621422559.vsmpjhjqzq.astroid@bobo.none>
 <1621421721.r9fefebis8.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, Matheus Castanho <msc@linux.ibm.com>,
 linux-api@vger.kernel.org, musl@lists.openwall.com, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 08:59:05PM +1000, Nicholas Piggin wrote:
> Excerpts from Dmitry V. Levin's message of May 19, 2021 8:24 pm:
> > On Wed, May 19, 2021 at 12:50:24PM +1000, Nicholas Piggin wrote:
> > [...]
> >> With this patch, I think the ptrace ABI should mostly be fixed. I think 
> >> a problem remains with applications that look at system call return 
> >> registers directly and have powerpc specific error cases. Those probably
> >> will just need to be updated unfortunately. Michael thought it might be
> >> possible to return an indication via ptrace somehow that the syscall is
> >> using a new ABI, so such apps can be updated to test for it. I don't 
> >> know how that would be done.
> > 
> > Is there any sane way for these applications to handle the scv case?
> > How can they tell that the scv semantics is being used for the given
> > syscall invocation?  Can this information be obtained e.g. from struct
> > pt_regs?
> 
> Not that I know of. Michael suggested there might be a way to add 
> something. ptrace_syscall_info has some pad bytes, could
> we use one for flags bits and set a bit for "new system call ABI"?

PTRACE_GET_SYSCALL_INFO is an architecture-agnostic API, it hides all
architecture-specific details behind struct ptrace_syscall_info which has
the same meaning on all architectures.  ptrace_syscall_info.exit contains
both rval and is_error fields to support every architecture regardless of
its syscall ABI.

ptrace_syscall_info.exit is extensible, but every architecture would have
to define a method of telling whether the system call follows the "new
system call ABI" conventions to export this bit of information.

This essentially means implementing something like
static inline long syscall_get_error_abi(struct task_struct *task, struct pt_regs *regs)
for every architecture, and using it along with syscall_get_error
in ptrace_get_syscall_info_exit to initialize the new field in
ptrace_syscall_info.exit structure.

> As a more hacky thing you could make a syscall with -1 and see how
> the error looks, and then assume all syscalls will be the same.

This would be very unreliable because sc and scv are allowed to intermingle,
so every syscall invocation can follow any of these two error handling
conventions.

> Or... is it possible at syscall entry to peek the address of
> the instruction which caused the call and see if that was a
> scv instruction? That would be about as reliable as possible
> without having that new flag bit.

No other architecture requires peeking into tracee memory just to find out
the syscall ABI.  This would make powerpc the most ugly architecture for
ptracing.

I wonder why can't this information be just exported to the tracer via
struct pt_regs?


-- 
ldv
