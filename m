Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0E1EFED5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 19:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dqPn4Jn8zDr0v
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 03:29:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49dqMy39y9zDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 03:27:25 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 055HR5gf012258;
 Fri, 5 Jun 2020 12:27:05 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 055HR2hY012250;
 Fri, 5 Jun 2020 12:27:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 5 Jun 2020 12:27:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200605172702.GP31009@gate.crashing.org>
References: <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
 <20200604233516.GM31009@gate.crashing.org>
 <17459c98-3bd3-4a5d-a828-993b6deef44f@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17459c98-3bd3-4a5d-a828-993b6deef44f@www.fastmail.com>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, eery@paperfox.es,
 musl@lists.openwall.com, Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 04:18:18AM +0200, Daniel Kolesa wrote:
> On Fri, Jun 5, 2020, at 01:35, Segher Boessenkool wrote:
> > > The thing is, I've yet to see in which way the ELFv2 ABI *actually* requires VSX - I don't think compiling for 970 introduces any actual differences. There will be omissions, yes - but then the more accurate thing would be to say that a subset of ELFv2 is used, rather than it being a different ABI per se.
> > 
> > Two big things are that binaries that someone else made are supposed to
> > work for you as well -- including binaries using VSX registers, or any
> > instructions that require ISA 2.07 (or some older ISA after 970).  This
> > includes DSOs (shared libraries).  So for a distribution this means that
> > they will not use VSX *anywhere*, or only in very specialised things.
> > That is a many-years setback, for people/situations where it could be
> > used.
> 
> Third party precompiled stuff doesn't really need to concern us, since none really exists.

... Yet.  And if you claim you support ELFv2, not mentioning the ways
your implementation deviates from it, users will be unhappy.

> It's also still an upgrade over ELFv1 regardless (I mean, the same things apply there).

Yeah, in mostly minor ways, but it all adds up for sure.

> I'm also not really all that convinced that vectors make a huge difference in non-specialized code (autovectorization still has a way to go)

They do make a huge difference, depending on the application of course.
But VSX is not just vectors even: it also gives you twice as many
floating point scalars (64 now), and in newer versions of the ISA it can
be beneficially used for integer scalars even.

> and code written to use vector instructions should probably check auxval and take those paths at runtime.

No, that is exactly the point of requiring ISA 2.07.  Anything can use
ISA 2.07 (incl. VSX) without checking first, and without having a
fallback to some other implementation.  Going from ISA 2.01 to 2.07 is
more than a decade of improvements, it is not trivial at all.


> As for other instructions, fair enough, but from my rough testing, it doesn't make such a massive difference for average case

That depends on what you call the average case.  Code that is control
and memory-bound will not benefit much from *anything* :-)

> (and where it does, one can always rebuild their thing with CFLAGS=-mcpu=power9)

Yeah, but it helps quite a bit if your system (shared) libraries get all
improvements they can as well.


I'm not trying to dissuade you from not requiring VSX and 2.07 -- this
sounds like your best option, given the constraints.  I'm just saying
the cost is not trivial (even ignoring the ABI divergence).


> > The target name allows to make such distinctions: this could for example
> > be  powerpc64-*-linux-void  (maybe I put the distinction in the wrong
> > part of the name here?  The glibc people will know better, and "void" is
> > probably not a great name anyway).
> 
> Hm, I'm not a huge fan of putting ABI specifics in the triplet, it feels wrong - there is no precedent for it with POWER (ARM did it with EABI though),

Maybe look at what the various BSDs use?  We do have things like this.

> the last part should remain 'gnu' as it's still glibc; besides, gcc is compiled for exactly one target triplet, and traditionally with ppc compilers it's always been possible to target everything with just one compiler (endian, 32bit, 64bit, abi...).

This isn't completely true.

Yes, the compiler allows you to change word size, endianness, ABI, some
more things.  That does not mean you can actually build working binaries
for all resulting combinations.  As a trivial example, it will still
pick up the same libraries from the same library paths usually, and
those will spectacularly fail to work.

We are biarch for some targets, which means that both powerpc-linux
targets and powerpc64-linux targets can actually handle both of those,
with just -m32 or -m64 needed to switch which configuration is used.
But you cannot magically transparently switch to many other
configurations: for those, you just build a separate toolchain for that
specfic (variant) configuration, in the general case.

> The best way would probably be adding a new -mabi, e.g. -mabi=elfv2-novsx (just an example), which would behave exactly like -mabi=elfv2, except it'd emit some extra detection macro

Yeah, that sounds like a good idea.  Patches welcome :-)

(A separate target name is still needed, but this will make development
simpler for sure).


Segher
