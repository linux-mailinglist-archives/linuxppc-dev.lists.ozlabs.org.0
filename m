Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2A1ACFB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 20:34:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4937Df6zwMzDrnR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:34:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49379T2tdYzDrhC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 04:31:54 +1000 (AEST)
Date: Thu, 16 Apr 2020 14:31:51 -0400
From: Rich Felker <dalias@libc.org>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416183151.GA11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
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
Cc: musl@lists.openwall.com, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 03:18:42PM -0300, Adhemerval Zanella wrote:
> 
> 
> On 16/04/2020 14:59, Rich Felker wrote:
> > On Thu, Apr 16, 2020 at 02:50:18PM -0300, Adhemerval Zanella wrote:
> >>
> >>
> >> On 16/04/2020 12:37, Rich Felker wrote:
> >>> On Thu, Apr 16, 2020 at 11:16:04AM -0300, Adhemerval Zanella wrote:
> >>>>> My preference would be that it work just like the i386 AT_SYSINFO
> >>>>> where you just replace "int $128" with "call *%%gs:16" and the kernel
> >>>>> provides a stub in the vdso that performs either scv or the old
> >>>>> mechanism with the same calling convention. Then if the kernel doesn't
> >>>>> provide it (because the kernel is too old) libc would have to provide
> >>>>> its own stub that uses the legacy method and matches the calling
> >>>>> convention of the one the kernel is expected to provide.
> >>>>
> >>>> What about pthread cancellation and the requirement of checking the
> >>>> cancellable syscall anchors in asynchronous cancellation? My plan is
> >>>> still to use musl strategy on glibc (BZ#12683) and for i686 it 
> >>>> requires to always use old int$128 for program that uses cancellation
> >>>> (static case) or just threads (dynamic mode, which should be more
> >>>> common on glibc).
> >>>>
> >>>> Using the i686 strategy of a vDSO bridge symbol would require to always
> >>>> fallback to 'sc' to still use the same cancellation strategy (and
> >>>> thus defeating this optimization in such cases).
> >>>
> >>> Yes, I assumed it would be the same, ignoring the new syscall
> >>> mechanism for cancellable syscalls. While there are some exceptions,
> >>> cancellable syscalls are generally not hot paths but things that are
> >>> expected to block and to have significant amounts of work to do in
> >>> kernelspace, so saving a few tens of cycles is rather pointless.
> >>>
> >>> It's possible to do a branch/multiple versions of the syscall asm for
> >>> cancellation but would require extending the cancellation handler to
> >>> support checking against multiple independent address ranges or using
> >>> some alternate markup of them.
> >>
> >> The main issue is at least for glibc dynamic linking is way more common
> >> than static linking and once the program become multithread the fallback
> >> will be always used.
> > 
> > I'm not relying on static linking optimizing out the cancellable
> > version. I'm talking about how cancellable syscalls are pretty much
> > all "heavy" operations to begin with where a few tens of cycles are in
> > the realm of "measurement noise" relative to the dominating time
> > costs.
> 
> Yes I am aware, but at same time I am not sure how it plays on real world.
> For instance, some workloads might issue kernel query syscalls, such as
> recv, where buffer copying might not be dominant factor. So I see that if
> the idea is optimizing syscall mechanism, we should try to leverage it
> as whole in libc.

Have you timed a minimal recv? I'm not assuming buffer copying is the
dominant factor. I'm assuming the overhead of all the kernel layers
involved is dominant.

> >> And besides the cancellation performance issue, a new bridge vDSO mechanism
> >> will still require to setup some extra bridge for the case of the older
> >> kernel.  In the scheme you suggested:
> >>
> >>   __asm__("indirect call" ... with common clobbers);
> >>
> >> The indirect call will be either the vDSO bridge or an libc provided that
> >> fallback to 'sc' for !PPC_FEATURE2_SCV. I am not this is really a gain
> >> against:
> >>
> >>    if (hwcap & PPC_FEATURE2_SCV) {
> >>      __asm__(... with some clobbers);
> >>    } else {
> >>      __asm__(... with different clobbers);
> >>    }
> > 
> > If the indirect call can be made roughly as efficiently as the sc
> > sequence now (which already have some cost due to handling the nasty
> > error return convention, making the indirect call likely just as small
> > or smaller), it's O(1) additional code size (and thus icache usage)
> > rather than O(n) where n is number of syscall points.
> > 
> > Of course it would work just as well (for avoiding O(n) growth) to
> > have a direct call to out-of-line branch like you suggested.
> 
> Yes, but does it really matter to optimize this specific usage case
> for size? glibc, for instance, tries to leverage the syscall mechanism 
> by adding some complex pre-processor asm directives.  It optimizes
> the syscall code size in most cases.  For instance, kill in static case 
> generates on x86_64:
> 
> 0000000000000000 <__kill>:
>    0:   b8 3e 00 00 00          mov    $0x3e,%eax
>    5:   0f 05                   syscall 
>    7:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
>    d:   0f 83 00 00 00 00       jae    13 <__kill+0x13>
>   13:   c3                      retq   
> 
> While on musl:
> 
> 0000000000000000 <kill>:
>    0:	48 83 ec 08          	sub    $0x8,%rsp
>    4:	48 63 ff             	movslq %edi,%rdi
>    7:	48 63 f6             	movslq %esi,%rsi
>    a:	b8 3e 00 00 00       	mov    $0x3e,%eax
>    f:	0f 05                	syscall 
>   11:	48 89 c7             	mov    %rax,%rdi
>   14:	e8 00 00 00 00       	callq  19 <kill+0x19>
>   19:	5a                   	pop    %rdx
>   1a:	c3                   	retq   

Wow that's some extraordinarily bad codegen going on by gcc... The
sign-extension is semantically needed and I don't see a good way
around it (glibc's asm is kinda a hack taking advantage of kernel not
looking at high bits, I think), but the gratuitous stack adjustment
and refusal to generate a tail call isn't. I'll see if we can track
down what's going on and get it fixed.

> But I hardly think it pays off the required code complexity.  Some
> for providing a O(1) bridge: this will require additional complexity
> to write it and setup correctly.

In some sense I agree, but inline instructions are a lot more
expensive on ppc (being 32-bit each), and it might take out-of-lining
anyway to get rid of stack frame setups if that ends up being a
problem.

> >> Specially if 'hwcap & PPC_FEATURE2_SCV' could be optimized with a 
> >> TCB member (as we do on glibc) and if we could make the asm clever
> >> enough to not require different clobbers (although not sure if
> >> it would be possible).
> > 
> > The easy way not to require different clobbers is just using the union
> > of the clobbers, no? Does the proposed new method clobber any
> > call-saved registers that would make it painful (requiring new call
> > frames to save them in)?
> 
> As far I can tell, it should be ok.

Note that because lr is clobbered we need at least once normally
call-clobbered register that's not syscall clobbered to save lr in.
Otherwise stack frame setup is required to spill it. (And I'm not even
sure if gcc does things right to avoid it by using a register -- we
should check that I guess...)

Rich
