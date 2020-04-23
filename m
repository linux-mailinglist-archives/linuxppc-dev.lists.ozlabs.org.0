Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1D1B6149
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 18:49:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497NZ55KXVzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 02:49:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497NQw5KCqzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 02:43:18 +1000 (AEST)
Date: Thu, 23 Apr 2020 12:43:14 -0400
From: Rich Felker <dalias@libc.org>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200423164314.GX11469@brightrain.aerifal.cx>
References: <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
 <20200420172715.GC11469@brightrain.aerifal.cx>
 <1587531042.1qvc287tsc.astroid@bobo.none>
 <20200423023642.GP11469@brightrain.aerifal.cx>
 <a972a0e4-25bd-9cf5-75ec-2eb993ef1b6a@linaro.org>
 <20200423161841.GU11469@brightrain.aerifal.cx>
 <3fe73604-7c92-e073-cbe7-abb4a8ae7c1a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe73604-7c92-e073-cbe7-abb4a8ae7c1a@linaro.org>
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
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 23, 2020 at 01:35:01PM -0300, Adhemerval Zanella wrote:
> 
> 
> On 23/04/2020 13:18, Rich Felker wrote:
> > On Thu, Apr 23, 2020 at 09:13:57AM -0300, Adhemerval Zanella wrote:
> >>
> >>
> >> On 22/04/2020 23:36, Rich Felker wrote:
> >>> On Wed, Apr 22, 2020 at 04:18:36PM +1000, Nicholas Piggin wrote:
> >>>> Yeah I had a bit of a play around with musl (which is very nice code I
> >>>> must say). The powerpc64 syscall asm is missing ctr clobber by the way.  
> >>>> Fortunately adding it doesn't change code generation for me, but it 
> >>>> should be fixed. glibc had the same bug at one point I think (probably 
> >>>> due to syscall ABI documentation not existing -- something now lives in 
> >>>> linux/Documentation/powerpc/syscall64-abi.rst).
> >>>
> >>> Do you know anywhere I can read about the ctr issue, possibly the
> >>> relevant glibc bug report? I'm not particularly familiar with ppc
> >>> register file (at least I have to refamiliarize myself every time I
> >>> work on this stuff) so it'd be nice to understand what's
> >>> potentially-wrong now.
> >>
> >> My understanding is the ctr issue only happens for vDSO calls where it
> >> fallback to a syscall in case an error (invalid argument, etc. and
> >> assuming if vDSO does not fallback to a syscall it always succeed).
> >> This makes the vDSO call on powerpc to have same same ABI constraint
> >> as a syscall, where it clobbers CR0.
> > 
> > I think you mean "vsyscall", the old thing glibc used where there are
> > in-userspace implementations of some syscalls with call interfaces
> > roughly equivalent to a syscall. musl has never used this. It only
> > uses the actual exported functions from the vdso which have normal
> > external function call ABI.
> 
> I wasn't thinking in vsyscall in fact, which afaik it is a x86 thing.
> The issue is indeed when calling the powerpc provided functions in 
> vDSO, which musl might want to do eventually.

AIUI (at least this is true for all other archs) the functions have
normal external function call ABI and calling them has nothing to do
with syscall mechanisms.

It looks like we're not using them right now and I'm not sure why. It
could be that there are ABI mismatch issues (are 32-bit ones
compatible with secure-plt? are 64-bit ones compatible with ELFv2?) or
just that nobody proposed adding them. Also as of 5.4 32-bit ppc
lacked time64 versions of them; not sure if this is fixed yet.

Rich
