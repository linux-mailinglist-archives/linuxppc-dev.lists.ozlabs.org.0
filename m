Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A46091ACF55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 20:07:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4936cz1v0hzDrDY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:07:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4936SC2X3czDsM7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 03:59:37 +1000 (AEST)
Date: Thu, 16 Apr 2020 13:59:32 -0400
From: Rich Felker <dalias@libc.org>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416175932.GZ11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
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

On Thu, Apr 16, 2020 at 02:50:18PM -0300, Adhemerval Zanella wrote:
> 
> 
> On 16/04/2020 12:37, Rich Felker wrote:
> > On Thu, Apr 16, 2020 at 11:16:04AM -0300, Adhemerval Zanella wrote:
> >>> My preference would be that it work just like the i386 AT_SYSINFO
> >>> where you just replace "int $128" with "call *%%gs:16" and the kernel
> >>> provides a stub in the vdso that performs either scv or the old
> >>> mechanism with the same calling convention. Then if the kernel doesn't
> >>> provide it (because the kernel is too old) libc would have to provide
> >>> its own stub that uses the legacy method and matches the calling
> >>> convention of the one the kernel is expected to provide.
> >>
> >> What about pthread cancellation and the requirement of checking the
> >> cancellable syscall anchors in asynchronous cancellation? My plan is
> >> still to use musl strategy on glibc (BZ#12683) and for i686 it 
> >> requires to always use old int$128 for program that uses cancellation
> >> (static case) or just threads (dynamic mode, which should be more
> >> common on glibc).
> >>
> >> Using the i686 strategy of a vDSO bridge symbol would require to always
> >> fallback to 'sc' to still use the same cancellation strategy (and
> >> thus defeating this optimization in such cases).
> > 
> > Yes, I assumed it would be the same, ignoring the new syscall
> > mechanism for cancellable syscalls. While there are some exceptions,
> > cancellable syscalls are generally not hot paths but things that are
> > expected to block and to have significant amounts of work to do in
> > kernelspace, so saving a few tens of cycles is rather pointless.
> > 
> > It's possible to do a branch/multiple versions of the syscall asm for
> > cancellation but would require extending the cancellation handler to
> > support checking against multiple independent address ranges or using
> > some alternate markup of them.
> 
> The main issue is at least for glibc dynamic linking is way more common
> than static linking and once the program become multithread the fallback
> will be always used.

I'm not relying on static linking optimizing out the cancellable
version. I'm talking about how cancellable syscalls are pretty much
all "heavy" operations to begin with where a few tens of cycles are in
the realm of "measurement noise" relative to the dominating time
costs.

> And besides the cancellation performance issue, a new bridge vDSO mechanism
> will still require to setup some extra bridge for the case of the older
> kernel.  In the scheme you suggested:
> 
>   __asm__("indirect call" ... with common clobbers);
> 
> The indirect call will be either the vDSO bridge or an libc provided that
> fallback to 'sc' for !PPC_FEATURE2_SCV. I am not this is really a gain
> against:
> 
>    if (hwcap & PPC_FEATURE2_SCV) {
>      __asm__(... with some clobbers);
>    } else {
>      __asm__(... with different clobbers);
>    }

If the indirect call can be made roughly as efficiently as the sc
sequence now (which already have some cost due to handling the nasty
error return convention, making the indirect call likely just as small
or smaller), it's O(1) additional code size (and thus icache usage)
rather than O(n) where n is number of syscall points.

Of course it would work just as well (for avoiding O(n) growth) to
have a direct call to out-of-line branch like you suggested.

> Specially if 'hwcap & PPC_FEATURE2_SCV' could be optimized with a 
> TCB member (as we do on glibc) and if we could make the asm clever
> enough to not require different clobbers (although not sure if
> it would be possible).

The easy way not to require different clobbers is just using the union
of the clobbers, no? Does the proposed new method clobber any
call-saved registers that would make it painful (requiring new call
frames to save them in)?

Rich
