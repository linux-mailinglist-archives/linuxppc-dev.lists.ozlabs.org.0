Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DCB1AB40E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 01:12:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492dRb0jL1zDrCQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 09:12:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
X-Greylist: delayed 913 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Apr 2020 09:11:00 AEST
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492dPw0dtlzDr8g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 09:10:57 +1000 (AEST)
Date: Wed, 15 Apr 2020 18:55:39 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200415225539.GL11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586931450.ub4c8cq8dj.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com,
 linuxppc-dev@lists.ozlabs.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 07:45:09AM +1000, Nicholas Piggin wrote:
> I would like to enable Linux support for the powerpc 'scv' instruction,
> as a faster system call instruction.
> 
> This requires two things to be defined: Firstly a way to advertise to 
> userspace that kernel supports scv, and a way to allocate and advertise
> support for individual scv vectors. Secondly, a calling convention ABI
> for this new instruction.
> 
> Thanks to those who commented last time, since then I have removed my
> answered questions and unpopular alternatives but you can find them
> here
> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-January/203545.html
> 
> Let me try one more with a wider cc list, and then we'll get something
> merged. Any questions or counter-opinions are welcome.
> 
> System Call Vectored (scv) ABI
> ==============================
> 
> The scv instruction is introduced with POWER9 / ISA3, it comes with an
> rfscv counter-part. The benefit of these instructions is performance
> (trading slower SRR0/1 with faster LR/CTR registers, and entering the
> kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR 
> updates. The scv instruction has 128 interrupt entry points (not enough 
> to cover the Linux system call space).
> 
> The proposal is to assign scv numbers very conservatively and allocate 
> them as individual HWCAP features as we add support for more. The zero 
> vector ('scv 0') will be used for normal system calls, equivalent to 'sc'.
> 
> Advertisement
> 
> Linux has not enabled FSCR[SCV] yet, so the instruction will cause a
> SIGILL in current environments. Linux has defined a HWCAP2 bit 
> PPC_FEATURE2_SCV for SCV support, but does not set it.
> 
> When scv instruction support and the scv 0 vector for system calls are 
> added, PPC_FEATURE2_SCV will indicate support for these. Other vectors 
> should not be used without future HWCAP bits indicating support, which is
> how we will allocate them. (Should unallocated ones generate SIGILL, or
> return -ENOSYS in r3?)
> 
> Calling convention
> 
> The proposal is for scv 0 to provide the standard Linux system call ABI 
> with the following differences from sc convention[1]:
> 
> - LR is to be volatile across scv calls. This is necessary because the 
>   scv instruction clobbers LR. From previous discussion, this should be 
>   possible to deal with in GCC clobbers and CFI.
> 
> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow the
>   kernel system call exit to avoid restoring the CR register (although 
>   we probably still would anyway to avoid information leak).
> 
> - Error handling: I think the consensus has been to move to using negative
>   return value in r3 rather than CR0[SO]=1 to indicate error, which matches
>   most other architectures and is closer to a function call.
> 
> The number of scratch registers (r9-r12) at kernel entry seems 
> sufficient that we don't have any costly spilling, patch is here[2].  
> 
> [1] https://github.com/torvalds/linux/blob/master/Documentation/powerpc/syscall64-abi.rst
> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204840.html

My preference would be that it work just like the i386 AT_SYSINFO
where you just replace "int $128" with "call *%%gs:16" and the kernel
provides a stub in the vdso that performs either scv or the old
mechanism with the same calling convention. Then if the kernel doesn't
provide it (because the kernel is too old) libc would have to provide
its own stub that uses the legacy method and matches the calling
convention of the one the kernel is expected to provide.

Note that any libc that actually makes use of the new functionality is
not going to be able to make clobbers conditional on support for it;
branching around different clobbers is going to defeat any gains vs
always just treating anything clobbered by either method as clobbered.
Likewise, it's not useful to have different error return mechanisms
because the caller just has to branch to support both (or the
kernel-provided stub just has to emulate one for it; that could work
if you really want to change the bad existing convention).

Thoughts?

Rich
