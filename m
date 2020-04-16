Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 877551AB4E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:50:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492gcj1hQKzDrCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:50:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492gZn60hpzDr6f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 10:48:47 +1000 (AEST)
Date: Wed, 15 Apr 2020 20:48:43 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416004843.GO11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586994952.nnxigedbu2.astroid@bobo.none>
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
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 10:16:54AM +1000, Nicholas Piggin wrote:
> Excerpts from Rich Felker's message of April 16, 2020 8:55 am:
> > On Thu, Apr 16, 2020 at 07:45:09AM +1000, Nicholas Piggin wrote:
> >> I would like to enable Linux support for the powerpc 'scv' instruction,
> >> as a faster system call instruction.
> >> 
> >> This requires two things to be defined: Firstly a way to advertise to 
> >> userspace that kernel supports scv, and a way to allocate and advertise
> >> support for individual scv vectors. Secondly, a calling convention ABI
> >> for this new instruction.
> >> 
> >> Thanks to those who commented last time, since then I have removed my
> >> answered questions and unpopular alternatives but you can find them
> >> here
> >> 
> >> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-January/203545.html
> >> 
> >> Let me try one more with a wider cc list, and then we'll get something
> >> merged. Any questions or counter-opinions are welcome.
> >> 
> >> System Call Vectored (scv) ABI
> >> ==============================
> >> 
> >> The scv instruction is introduced with POWER9 / ISA3, it comes with an
> >> rfscv counter-part. The benefit of these instructions is performance
> >> (trading slower SRR0/1 with faster LR/CTR registers, and entering the
> >> kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR 
> >> updates. The scv instruction has 128 interrupt entry points (not enough 
> >> to cover the Linux system call space).
> >> 
> >> The proposal is to assign scv numbers very conservatively and allocate 
> >> them as individual HWCAP features as we add support for more. The zero 
> >> vector ('scv 0') will be used for normal system calls, equivalent to 'sc'.
> >> 
> >> Advertisement
> >> 
> >> Linux has not enabled FSCR[SCV] yet, so the instruction will cause a
> >> SIGILL in current environments. Linux has defined a HWCAP2 bit 
> >> PPC_FEATURE2_SCV for SCV support, but does not set it.
> >> 
> >> When scv instruction support and the scv 0 vector for system calls are 
> >> added, PPC_FEATURE2_SCV will indicate support for these. Other vectors 
> >> should not be used without future HWCAP bits indicating support, which is
> >> how we will allocate them. (Should unallocated ones generate SIGILL, or
> >> return -ENOSYS in r3?)
> >> 
> >> Calling convention
> >> 
> >> The proposal is for scv 0 to provide the standard Linux system call ABI 
> >> with the following differences from sc convention[1]:
> >> 
> >> - LR is to be volatile across scv calls. This is necessary because the 
> >>   scv instruction clobbers LR. From previous discussion, this should be 
> >>   possible to deal with in GCC clobbers and CFI.
> >> 
> >> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow the
> >>   kernel system call exit to avoid restoring the CR register (although 
> >>   we probably still would anyway to avoid information leak).
> >> 
> >> - Error handling: I think the consensus has been to move to using negative
> >>   return value in r3 rather than CR0[SO]=1 to indicate error, which matches
> >>   most other architectures and is closer to a function call.
> >> 
> >> The number of scratch registers (r9-r12) at kernel entry seems 
> >> sufficient that we don't have any costly spilling, patch is here[2].  
> >> 
> >> [1] https://github.com/torvalds/linux/blob/master/Documentation/powerpc/syscall64-abi.rst
> >> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204840..html
> > 
> > My preference would be that it work just like the i386 AT_SYSINFO
> > where you just replace "int $128" with "call *%%gs:16" and the kernel
> > provides a stub in the vdso that performs either scv or the old
> > mechanism with the same calling convention. Then if the kernel doesn't
> > provide it (because the kernel is too old) libc would have to provide
> > its own stub that uses the legacy method and matches the calling
> > convention of the one the kernel is expected to provide.
> 
> I'm not sure if that's necessary. That's done on x86-32 because they
> select different sequences to use based on the CPU running and if the host
> kernel is 32 or 64 bit. Sure they could in theory have a bunch of HWCAP
> bits and select the right sequence in libc as well I suppose.

It's not just a HWCAP. It's a contract between the kernel and
userspace to support a particular calling convention that's not
exposed except as the public entry point the kernel exports via
AT_SYSINFO.

> > Note that any libc that actually makes use of the new functionality is
> > not going to be able to make clobbers conditional on support for it;
> > branching around different clobbers is going to defeat any gains vs
> > always just treating anything clobbered by either method as clobbered.
> 
> Well it would have to test HWCAP and patch in or branch to two 
> completely different sequences including register save/restores yes.
> You could have the same asm and matching clobbers to put the sequence
> inline and then you could patch the one sc/scv instruction I suppose.
> 
> A bit of logic to select between them doesn't defeat gains though,
> it's about 90 cycle improvement which is a handful of branch mispredicts 
> so it really is an improvement. Eventually userspace will stop 
> supporting the old variant too.

Oh, I didn't mean it would neutralize the benefit of svc. Rather, I
meant it would be worse to do:

	if (hwcap & X) {
		__asm__(... with some clobbers);
	} else {
		__asm__(... with different clobbers);
	}

instead of just

	__asm__("indirect call" ... with common clobbers);

where the indirect call is to an address ideally provided like on
i386, or otherwise initialized to one of two or more code addresses in
libc based on hwcap bits.

> > Likewise, it's not useful to have different error return mechanisms
> > because the caller just has to branch to support both (or the
> > kernel-provided stub just has to emulate one for it; that could work
> > if you really want to change the bad existing convention).
> > 
> > Thoughts?
> 
> The existing convention has to change somewhat because of the clobbers,
> so I thought we could change the error return at the same time. I'm
> open to not changing it and using CR0[SO], but others liked the idea.
> Pro: it matches sc and vsyscall. Con: it's different from other common
> archs. Performnce-wise it would really be a wash -- cost of conditional
> branch is not the cmp but the mispredict.

If you do the branch on hwcap at each syscall, then you significantly
increase code size of every syscall point, likely turning a bunch of
trivial functions that didn't need stack frames into ones that do. You
also potentially make them need a TOC pointer. Making them all just do
an indirect call unconditionally (with pointer in TLS like i386?) is a
lot more efficient in code size and at least as good for performance.

Rich
