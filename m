Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC31F039B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 01:47:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dzpZ3KCwzDr2j
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 09:47:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49dzmW2b0nzDr0Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 09:45:45 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 055NjQXo031764;
 Fri, 5 Jun 2020 18:45:26 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 055NjNbh031763;
 Fri, 5 Jun 2020 18:45:23 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 5 Jun 2020 18:45:23 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rich Felker <dalias@libc.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200605234523.GU31009@gate.crashing.org>
References: <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
 <20200604233516.GM31009@gate.crashing.org>
 <17459c98-3bd3-4a5d-a828-993b6deef44f@www.fastmail.com>
 <20200605172702.GP31009@gate.crashing.org>
 <20200605175045.GW1079@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605175045.GW1079@brightrain.aerifal.cx>
User-Agent: Mutt/1.4.2.3i
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
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Jun 05, 2020 at 01:50:46PM -0400, Rich Felker wrote:
> On Fri, Jun 05, 2020 at 12:27:02PM -0500, Segher Boessenkool wrote:
> > > I'm also not really all that convinced that vectors make a huge difference in non-specialized code (autovectorization still has a way to go)
> > 
> > They do make a huge difference, depending on the application of course.
> > But VSX is not just vectors even: it also gives you twice as many
> > floating point scalars (64 now), and in newer versions of the ISA it can
> > be beneficially used for integer scalars even.
> 
> Vectorization is useful for a lot of things, and I'm sure there are
> specialized workloads that benefit from 64 scalars, but I've never
> encountered a place where having more than 16 registers made a
> practical difference.

20 years ago 32 FP registers was already often a limitation, making FFT
and similar kernels almost twice slower than they could otherwise be.
Things are only *worse* with short vectors, not better.  In general with
floating point data you need more registers (because you have more state
to look at concurrently) than with integer data.

*Of course* having 64 floating point registers does not matter if your
whole program only ever uses three floating point values, total, let
alone concurrently.

> The fact that there are specialized areas where this stuff matters
> does not imply there aren't huge domains where it's completely
> irrelevant.

There are very few domains where ISA 2.07 does not have significant
advantages over ISA 2.01.  That is Power8 vs. Power4.

> > No, that is exactly the point of requiring ISA 2.07.  Anything can use
> > ISA 2.07 (incl. VSX) without checking first, and without having a
> > fallback to some other implementation.  Going from ISA 2.01 to 2.07 is
> > more than a decade of improvements, it is not trivial at all.
> 
> This only affects code that's non-portable and PPC-specific, which a

No, it does not.  It is not only about vector registers, either.

> I think a lot of the unnecessary fighting on this topic is arising
> from differences of opinion over what an ABI entails. I would call
> what you're talking about a "platform" and more of a platform-specific
> *API* than an ABI -- it's about guarantees of interfaces available to
> the programmer, not implementation details of linkage.

No, this is very much about the ABI.  The B stands for Binary.  Which
is what this is about.


Segher
