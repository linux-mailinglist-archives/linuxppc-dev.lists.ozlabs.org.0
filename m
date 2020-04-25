Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B31B87AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 18:23:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498bvW29mgzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 02:23:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 498bsc1H47zDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 02:22:09 +1000 (AEST)
Date: Sat, 25 Apr 2020 12:22:04 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Re: New powerpc vdso calling convention
Message-ID: <20200425162204.GJ11469@brightrain.aerifal.cx>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587810370.tg8ym9yjpc.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, Andy Lutomirski <luto@kernel.org>,
 musl@lists.openwall.com, binutils@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 08:56:54PM +1000, Nicholas Piggin wrote:
> >> The ELF v2 ABI convention would suit it well, because the caller already
> >> requires the function address for ctr, so having it in r12 will
> >> eliminate the need for address calculation, which suits the vdso data
> >> page access.
> >> 
> >> Is there a need for ELF v1 specific calls as well, or could those just be
> >> deprecated and remain on existing functions or required to use the ELF
> >> v2 calls using asm wrappers?
> > 
> > What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say 
> > yes, it would be good to have it to avoid going through ASM in the middle..
> 
> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with 
> their address in r12 if called at their global entry point. ELFv1 have a 
> function descriptor with call address and TOC in it, caller has to load 
> the TOC if it's global.
> 
> The vdso doesn't have TOC, it has one global address (the vdso data 
> page) which it loads by calculating its own address.

A function descriptor could be put in the VDSO data page, or as it's
done now by glibc the vdso linkage code could create it. My leaning is
to at least have a version of the code that's callable (with the right
descriptor around it) by v1 binaries, but since musl does not use
ELFv1 at all we really have no stake in this and I'm fine with
whatever outcome users of v1 decide on.

> The kernel doesn't change the vdso based on whether it's called by a v1 
> or v2 userspace (it doesn't really know itself and would have to export 
> different functions). glibc has a hack to create something:

I'm pretty sure it does know because signal invocation has to know
whether the function pointer points to a descriptor or code. At least
for FDPIC archs (similar to PPC64 ELFv1 function descriptors) it knows
and has to know.

> >> Is there a good reason for the system call fallback to go in the vdso
> >> function rather than have the caller handle it?
> > 
> > I've seen at least one while porting powerpc to the C VDSO: arguments 
> > toward VDSO functions are in volatile registers. If the caller has to 
> > call the fallback by itself, it has to save them before calling the 
> > VDSO, allthought in 99% of cases it won't use them again. With the 
> > fallback called by the VDSO itself, the arguments are still hot in 
> > volatile registers and ready for calling the fallback. That make it very 
> > easy to call them, see patch 5 in the series 
> > (https://patchwork.ozlabs.org/project/linuxppc-dev/patch/59bea35725ab4cefc67a678577da8b3ab7771af5.1587401492.git.christophe.leroy@c-s.fr/)

This is actually a good reason not to spuriously fail and fallback. At
present musl wouldn't take advantage of it because musl uses the
fallback path for lazy initialization of the vdso function pointer and
doesn't special-case the MIPS badness, but if it made a big difference
we probably could shuffle things around to only do the fallback on
archs that need it and avoid saving the input arg registers across the
vdso call.

Rich
