Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4581B89E2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 01:13:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498mzg6pVxzDqdV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 09:13:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 498mxp6whwzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 09:11:24 +1000 (AEST)
Date: Sat, 25 Apr 2020 19:11:19 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: New powerpc vdso calling convention
Message-ID: <20200425231119.GM11469@brightrain.aerifal.cx>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
 <1587855423.jug0f1n0b8.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587855423.jug0f1n0b8.astroid@bobo.none>
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

On Sun, Apr 26, 2020 at 08:58:19AM +1000, Nicholas Piggin wrote:
> Excerpts from Christophe Leroy's message of April 25, 2020 10:20 pm:
> > 
> > 
> > Le 25/04/2020 à 12:56, Nicholas Piggin a écrit :
> >> Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
> >>>
> >>>
> >>> Le 25/04/2020 à 07:22, Nicholas Piggin a écrit :
> >>>> As noted in the 'scv' thread, powerpc's vdso calling convention does not
> >>>> match the C ELF ABI calling convention (or the proposed scv convention).
> >>>> I think we could implement a new ABI by basically duplicating function
> >>>> entry points with different names.
> >>>
> >>> I think doing this is a real good idea.
> >>>
> >>> I've been working at porting powerpc VDSO to the GENERIC C VDSO, and the
> >>> main pitfall has been that our vdso calling convention is not compatible
> >>> with C calling convention, so we have go through an ASM entry/exit.
> >>>
> >>> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=171469
> >>>
> >>> We should kill this error flag return through CR[SO] and get it the
> >>> "modern" way like other architectectures implementing the C VDSO: return
> >>> 0 when successfull, return -err when failed.
> >> 
> >> Agreed.
> >> 
> >>>> The ELF v2 ABI convention would suit it well, because the caller already
> >>>> requires the function address for ctr, so having it in r12 will
> >>>> eliminate the need for address calculation, which suits the vdso data
> >>>> page access.
> >>>>
> >>>> Is there a need for ELF v1 specific calls as well, or could those just be
> >>>> deprecated and remain on existing functions or required to use the ELF
> >>>> v2 calls using asm wrappers?
> >>>
> >>> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say
> >>> yes, it would be good to have it to avoid going through ASM in the middle.
> >> 
> >> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with
> >> their address in r12 if called at their global entry point. ELFv1 have a
> >> function descriptor with call address and TOC in it, caller has to load
> >> the TOC if it's global.
> >> 
> >> The vdso doesn't have TOC, it has one global address (the vdso data
> >> page) which it loads by calculating its own address.
> >> 
> >> The kernel doesn't change the vdso based on whether it's called by a v1
> >> or v2 userspace (it doesn't really know itself and would have to export
> >> different functions). glibc has a hack to create something:
> >> 
> >> # define VDSO_IFUNC_RET(value)                           \
> >>    ({                                                     \
> >>      static Elf64_FuncDesc vdso_opd = { .fd_toc = ~0x0 }; \
> >>      vdso_opd.fd_func = (Elf64_Addr)value;                \
> >>      &vdso_opd;                                           \
> >>    })
> >> 
> >> If we could make something which links more like any other dso with
> >> ELFv1, that would be good. Otherwise I think v2 is preferable so it
> >> doesn't have to calculate its own address.
> > 
> > I see the following in glibc. So looks like PPC32 is like PPC64 elfv1. 
> > By the way, they are talking about something not completely finished in 
> > the kernel. Can we finish it ?
> 
> Possibly can. It seems like a good idea to fix all loose ends if we are 
> going to add new versions. Will have to check with the toolchain people 
> to make sure we're doing the right thing.

"ELFv1" and "ELFv2" are PPC64-specific names for the old and new
version of the ELF psABI for PPC64. They have nothing at all to do
with PPC32 which is a completely different ABI from either.

Rich
