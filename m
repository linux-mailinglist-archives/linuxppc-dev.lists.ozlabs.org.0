Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E141F03B8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 02:13:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f0Ny6lwVzDr2m
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 10:13:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49f0MK6MwwzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 10:12:29 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0560CCTO032740;
 Fri, 5 Jun 2020 19:12:12 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0560CAoS032739;
 Fri, 5 Jun 2020 19:12:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 5 Jun 2020 19:12:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200606001210.GV31009@gate.crashing.org>
References: <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
 <20200604233516.GM31009@gate.crashing.org>
 <17459c98-3bd3-4a5d-a828-993b6deef44f@www.fastmail.com>
 <20200605172702.GP31009@gate.crashing.org>
 <6b987f87-1eee-4772-9ecc-f4d9ce9233b6@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b987f87-1eee-4772-9ecc-f4d9ce9233b6@www.fastmail.com>
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

On Fri, Jun 05, 2020 at 11:59:32PM +0200, Daniel Kolesa wrote:
> On Fri, Jun 5, 2020, at 19:27, Segher Boessenkool wrote:
> > > Third party precompiled stuff doesn't really need to concern us, since none really exists.
> > 
> > ... Yet.  And if you claim you support ELFv2, not mentioning the ways
> > your implementation deviates from it, users will be unhappy.
> 
> Will they?

Yes; not only *your* users, but also users of the "actual" ELFv2 (for
BE), if anything starts using that: the ABI is defined, and at least at
some point it worked, it is not unreasonable to think someone might
want to start using it).

Just don't pretend X and Y are the same if they are not, people do not
like to be misled.  Just be clear upfront what the differences are, and
everyone will be happy.  Confusing people and wasting their time won't
make you very popular though ;-)

> The system explicitly mentions that the minimum target in the binary packages is 970. Users can't be expecting features that the hardware we support doesn't support :)

But you are not the only user of ELFv2.

> Also, we're not the only ones that do this - there's musl of course, but there's also the BSDs. FreeBSD 13 uses ELFv2, and supports all the old hardware including processors without VMX, let alone VSX. OpenBSD is likely to take the same path. But I'm not opposed to making this explicit, if that's what it takes to make other people happy with it.

Yeah, please do :-)

> > > It's also still an upgrade over ELFv1 regardless (I mean, the same things apply there).
> > 
> > Yeah, in mostly minor ways, but it all adds up for sure.
> 
> It's made my life simpler on numerous occasions,

Great to hear that!

> and allowed us to bring in software that'd otherwise take significant patching (no software is complete until it has its own assembly implementation of coroutines or something like that :P),

.. but does it have a mail client?

> > That depends on what you call the average case.  Code that is control
> > and memory-bound will not benefit much from *anything* :-)
> 
> Average case is, quite literally, an average case - i.e. the average of all the software packages shipped in a distro :)

Ah, mostly boring stuff :-)

> > Yeah, but it helps quite a bit if your system (shared) libraries get all
> > improvements they can as well.
> 
> Well, glibc will still benefit automatically to a degree even if not built for a modern baseline, since it has runtime checks in place already; as for other things... well, at least for Void, I already mentioned before we're as much of a source distro as a binary one - people can easily rebuild things that bottleneck them, with modern CFLAGS, and still have things be interoperable.

Yeah, good point there.

> > I'm not trying to dissuade you from not requiring VSX and 2.07 -- this
> > sounds like your best option, given the constraints.  I'm just saying
> > the cost is not trivial (even ignoring the ABI divergence).
> 
> Of course the cost is there - it's just not something I can do anything about. I generally recommend that people who can run LE should run LE. We're a bi-endian distribution, so there is a complete, fully functional, ISA-2.07-baseline ppc64le variant (in fact, it's our best-supported port, with greatest repo coverage and testing), as well as the 970-targeting ppc64 variant.

Ah, so your BE target is mostly for legacy hardware?  That took a while
to sink in, sorry!  :-)

> I know about the biarch case as well, and there is also multilib, as an even more elaborate form of that. That's not directly related to what I originally said, though

Biarch is why -m32 and -m64 can work at all (for building user binaries).
My point is that this does *not* work for most finer ABI (or OS) -related
points -- you really do need a toolchain built specifically for that
config.


Segher
