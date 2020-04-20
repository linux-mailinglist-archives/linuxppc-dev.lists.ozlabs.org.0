Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6091B1301
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:29:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Ybp35yBzDqT9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:29:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495YY65PHgzDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 03:27:20 +1000 (AEST)
Date: Mon, 20 Apr 2020 13:27:15 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200420172715.GC11469@brightrain.aerifal.cx>
References: <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587356128.aslvdnmtbw.astroid@bobo.none>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 02:31:58PM +1000, Nicholas Piggin wrote:
> Excerpts from Rich Felker's message of April 20, 2020 2:09 pm:
> > On Mon, Apr 20, 2020 at 12:32:21PM +1000, Nicholas Piggin wrote:
> >> Excerpts from Rich Felker's message of April 20, 2020 11:34 am:
> >> > On Mon, Apr 20, 2020 at 11:10:25AM +1000, Nicholas Piggin wrote:
> >> >> Excerpts from Rich Felker's message of April 17, 2020 4:31 am:
> >> >> > Note that because lr is clobbered we need at least once normally
> >> >> > call-clobbered register that's not syscall clobbered to save lr in.
> >> >> > Otherwise stack frame setup is required to spill it.
> >> >> 
> >> >> The kernel would like to use r9-r12 for itself. We could do with fewer 
> >> >> registers, but we have some delay establishing the stack (depends on a
> >> >> load which depends on a mfspr), and entry code tends to be quite store
> >> >> heavy whereas on the caller side you have r1 set up (modulo stack 
> >> >> updates), and the system call is a long delay during which time the 
> >> >> store queue has significant time to drain.
> >> >> 
> >> >> My feeling is it would be better for kernel to have these scratch 
> >> >> registers.
> >> > 
> >> > If your new kernel syscall mechanism requires the caller to make a
> >> > whole stack frame it otherwise doesn't need and spill registers to it,
> >> > it becomes a lot less attractive. Some of those 90 cycles saved are
> >> > immediately lost on the userspace side, plus you either waste icache
> >> > at the call point or require the syscall to go through a
> >> > userspace-side helper function that performs the spill and restore.
> >> 
> >> You would be surprised how few cycles that takes on a high end CPU. Some 
> >> might be a couple of %. I am one for counting cycles mind you, I'm not 
> >> being flippant about it. If we can come up with something faster I'd be 
> >> up for it.
> > 
> > If the cycle count is trivial then just do it on the kernel side.
> 
> The cycle count for user is, because you have r1 ready. Kernel does not 
> have its stack ready, it has to mfspr rX ; ld rY,N(rX); to get stack to 
> save into.
> 
> Which is also wasted work for a userspace.
> 
> Now that I think about it, no stack frame is even required! lr is saved 
> into the caller's stack when its clobbered with an asm, just as when 
> it's used for a function call.

No. If there is a non-clobbered register, lr can be moved to the
non-clobbered register rather than saved to the stack. However it
looks like (1) gcc doesn't take advantage of that possibility, but (2)
the caller already arranged for there to be space on the stack to save
lr, so the cost is only one store and one load, not any stack
adjustment or other frame setup. So it's probably not a really big
deal. However, just adding "lr" clobber to existing syscall in musl
increased the size of a simple syscall function (getuid) from 20 bytes
to 36 bytes.

> >> > syscall arg registers still preserved? If not, this is a major cost on
> >> > the userspace side, since any call point that has to loop-and-retry
> >> > (e.g. futex) now needs to make its own place to store the original
> >> > values.)
> >> 
> >> Powerpc system calls never did. We could have scv preserve them, but 
> >> you'd still need to restore r3. We could make an ABI which does not
> >> clobber r3 but puts the return value in r9, say. I'd like to see what
> >> the user side code looks like to take advantage of such a thing though.
> > 
> > Oh wow, I hadn't realized that, but indeed the code we have now is
> > allowing for the kernel to clobber them all. So at least this isn't
> > getting any worse I guess. I think it was a very poor choice of
> > behavior though and a disadvantage vs what other archs do (some of
> > them preserve all registers; others preserve only normally call-saved
> > ones plus the syscall arg ones and possibly a few other specials).
> 
> Well, we could change it. Does the generated code improve significantly
> we take those clobbers away?

I'd have to experiment a bit more to see. It's not going to help at
all in functions which are pure syscall wrappers that just do the
syscall and return, since the arg regs are dead after the syscall
anyway (the caller must assume they were clobbered). But where
syscalls are inlined and used in a loop, like a futex wait, it might
make a nontrivial difference.

Unfortunately even if you did change it for the new scv mechanism, it
would be hard to take advantage of the change while also supporting
sc, unless we used a helper function that just did scv directly, but
saved/restored all the arg regs when using the legacy sc mechanism.
Just inlining the hwcap conditional and clobbering more regs in one
code path than in the other likely would not help; gcc won't
shrink-wrap the clobbered/non-clobbered paths separately, and even if
it did, when this were inlined somewhere like a futex loop, it'd end
up having to lift the conditional out of the loop to be very
advantageous, then making the code much larger by producing two copies
of the loop. So I think just behaving similarly to the old sc method
is probably the best option we have...

Rich
