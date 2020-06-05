Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC41EFF6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 19:52:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dqwv6lxszDr1K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 03:52:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dqv456s5zDr0r
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 03:50:54 +1000 (AEST)
Date: Fri, 5 Jun 2020 13:50:46 -0400
From: Rich Felker <dalias@libc.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200605175045.GW1079@brightrain.aerifal.cx>
References: <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
 <20200604233516.GM31009@gate.crashing.org>
 <17459c98-3bd3-4a5d-a828-993b6deef44f@www.fastmail.com>
 <20200605172702.GP31009@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605172702.GP31009@gate.crashing.org>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 12:27:02PM -0500, Segher Boessenkool wrote:
> On Fri, Jun 05, 2020 at 04:18:18AM +0200, Daniel Kolesa wrote:
> > On Fri, Jun 5, 2020, at 01:35, Segher Boessenkool wrote:
> > > > The thing is, I've yet to see in which way the ELFv2 ABI *actually* requires VSX - I don't think compiling for 970 introduces any actual differences. There will be omissions, yes - but then the more accurate thing would be to say that a subset of ELFv2 is used, rather than it being a different ABI per se.
> > > 
> > > Two big things are that binaries that someone else made are supposed to
> > > work for you as well -- including binaries using VSX registers, or any
> > > instructions that require ISA 2.07 (or some older ISA after 970).  This
> > > includes DSOs (shared libraries).  So for a distribution this means that
> > > they will not use VSX *anywhere*, or only in very specialised things.
> > > That is a many-years setback, for people/situations where it could be
> > > used.
> > 
> > Third party precompiled stuff doesn't really need to concern us, since none really exists.
> 
> .... Yet.  And if you claim you support ELFv2, not mentioning the ways
> your implementation deviates from it, users will be unhappy.
> 
> > It's also still an upgrade over ELFv1 regardless (I mean, the same things apply there).
> 
> Yeah, in mostly minor ways, but it all adds up for sure.
> 
> > I'm also not really all that convinced that vectors make a huge difference in non-specialized code (autovectorization still has a way to go)
> 
> They do make a huge difference, depending on the application of course.
> But VSX is not just vectors even: it also gives you twice as many
> floating point scalars (64 now), and in newer versions of the ISA it can
> be beneficially used for integer scalars even.

Vectorization is useful for a lot of things, and I'm sure there are
specialized workloads that benefit from 64 scalars, but I've never
encountered a place where having more than 16 registers made a
practical difference.

The fact that there are specialized areas where this stuff matters
does not imply there aren't huge domains where it's completely
irrelevant.

> > and code written to use vector instructions should probably check
> > auxval and take those paths at runtime.
> 
> No, that is exactly the point of requiring ISA 2.07.  Anything can use
> ISA 2.07 (incl. VSX) without checking first, and without having a
> fallback to some other implementation.  Going from ISA 2.01 to 2.07 is
> more than a decade of improvements, it is not trivial at all.

This only affects code that's non-portable and PPC-specific, which a
lot of people have no interest in and don't care about. Any portable
code is going to either only use vectors via the compiler's choice to
vectorize or conditionally on being one of a set of supported targets
with a vector ISA it supports available. Anyone building for a target
that doesn't have them just gets the portable version of the code.

I think a lot of the unnecessary fighting on this topic is arising
from differences of opinion over what an ABI entails. I would call
what you're talking about a "platform" and more of a platform-specific
*API* than an ABI -- it's about guarantees of interfaces available to
the programmer, not implementation details of linkage.

Rich
