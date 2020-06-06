Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E39671F043B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 04:15:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f35475TjzDr3N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 12:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=WRT6y93+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=u+JbUz3y; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49f33G4rLbzDr08
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 12:13:45 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD7B25802C4;
 Fri,  5 Jun 2020 22:13:41 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Fri, 05 Jun 2020 22:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=RoqIlV1o9b2w3X8h2SJbDNTQIC2u
 URcCxTxKqHM0QvA=; b=WRT6y93+/LNqlBMDQk8wqq+0+rEYg/eHRDowQq2WFkpJ
 UNBV5V3xqNwwK+MXKCKjWOFU2bNTk6b9q8PmHoq7Wc9+M5OWaycOcKG52KXNXGkU
 dWYhiWju0uK3Gc0s0fNZdhs9W1EV/K1Lde4yuw2A1KzbN4vMfsoWs3Z+NA7bCKFS
 e7X3+rkSQdofUQlJqmgRkXpaVWJfe+/pnzxCIjeo+RuR5xslAjULieAo6lD1PbFP
 Jmc27LJWbtROuhFis32Qe6hjv/W/QX6P1Oq7zv6YQyAYFeMPkDCNFqm+da4I8PY+
 tznoRnWQizfKho8SRzk6/KKzrblCO2lC2nxyWJQ7rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RoqIlV
 1o9b2w3X8h2SJbDNTQIC2uURcCxTxKqHM0QvA=; b=u+JbUz3yLSJ9ZC6uFKI6lv
 8AfB872N0DTRZnd5kqeegTXVyWydLIevcqVp1h4JB8wMBZQdHqKg14erYD4uWI2p
 2S6lOWVgPEO1ZKeY47uH4C51qAuHzS4gbI9VDMrZjSxMZ1qsFOqMV+AcklIhkqpy
 so4t7VqAj0z+KdJUiev8uqlyI0TIZSlBVFLJPN3CPIVI+eYYoBaGZMjEuJDGvKGw
 Q0d0sSlbjq4bcVPvFlvDNHARfjbN4X5/U0hOOEnMzyYxFFxzER+4mwpdJpExvwCa
 4mnqAijUlh646na3HdDKtQGY7wd38gVGS00UqJJ/srU2UNFCNDGs/t8nfmwyXq3A
 ==
X-ME-Sender: <xms:0_vaXt-T1cBDt8Np8xr5lgg6hOoT_EleYKu1RrrDnBeWH0CgoEmHAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepieevvddvjeehiedtvdelgfeuiefhgfetvdeuhfffteehuddu
 fffgudfhfffhleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepuggrnhhivghlsehotghtrghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:0_vaXhtsVPkbe1sDiBNBkdSOgQfP3kaf5wjUgrdWdjxztDzSnsRxhA>
 <xmx:0_vaXrChVgy7hXHehA5wwOlLAVjx2FdMP-kdhgfaP3yit3kn18GdWw>
 <xmx:0_vaXhdkSgmU0KKE6w95Qcm7XgOnBfZ8BX_XN-Q0MRn_blvuRi4ycw>
 <xmx:1fvaXhcz7QW2aGyEoxyJofD1c5FGnMpfI6wldvERJScSF-MMXlbyAA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CBF7DC200A5; Fri,  5 Jun 2020 22:13:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <4a9d8fe1-d176-442f-ae2a-32d3c0ea52a6@www.fastmail.com>
In-Reply-To: <20200606001210.GV31009@gate.crashing.org>
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
 <20200606001210.GV31009@gate.crashing.org>
Date: Sat, 06 Jun 2020 04:13:18 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>, musl@lists.openwall.com
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Content-Type: text/plain
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
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 6, 2020, at 02:12, Segher Boessenkool wrote:
> On Fri, Jun 05, 2020 at 11:59:32PM +0200, Daniel Kolesa wrote:
> > On Fri, Jun 5, 2020, at 19:27, Segher Boessenkool wrote:
> > > > Third party precompiled stuff doesn't really need to concern us, since none really exists.
> > > 
> > > ... Yet.  And if you claim you support ELFv2, not mentioning the ways
> > > your implementation deviates from it, users will be unhappy.
> > 
> > Will they?
> 
> Yes; not only *your* users, but also users of the "actual" ELFv2 (for
> BE), if anything starts using that: the ABI is defined, and at least at
> some point it worked, it is not unreasonable to think someone might
> want to start using it).

I guess you mean like, if third party software starts shipping builds using ELFv2 and people suddenly find these things don't work because $reasons. The ABI itself wouldn't cause issues here as at binary interface level we're still compatible, but problems may actually arise in case glibc has a modern HW targeting ELFv2 port with IEEE quad float at some point. (not to mention that would be 100% incompatible at binary level because symvers, so i want to resolve this until then either way)

> 
> Just don't pretend X and Y are the same if they are not, people do not
> like to be misled.  Just be clear upfront what the differences are, and
> everyone will be happy.  Confusing people and wasting their time won't
> make you very popular though ;-)
> 
> > The system explicitly mentions that the minimum target in the binary packages is 970. Users can't be expecting features that the hardware we support doesn't support :)
> 
> But you are not the only user of ELFv2.

Sure, the point was more like "ELFv2 + 970 minimum", both of which are explicitly mentioned, cannot really mean anything else than what it already does.

> 
> > Also, we're not the only ones that do this - there's musl of course, but there's also the BSDs. FreeBSD 13 uses ELFv2, and supports all the old hardware including processors without VMX, let alone VSX. OpenBSD is likely to take the same path. But I'm not opposed to making this explicit, if that's what it takes to make other people happy with it.
> 
> Yeah, please do :-)
> 
> > > > It's also still an upgrade over ELFv1 regardless (I mean, the same things apply there).
> > > 
> > > Yeah, in mostly minor ways, but it all adds up for sure.
> > 
> > It's made my life simpler on numerous occasions,
> 
> Great to hear that!
> 
> > and allowed us to bring in software that'd otherwise take significant patching (no software is complete until it has its own assembly implementation of coroutines or something like that :P),
> 
> .. but does it have a mail client?

Probably some ad-hoc, informally specified, bug-ridden implementations of half of Common Lisp as well...

> 
> > > That depends on what you call the average case.  Code that is control
> > > and memory-bound will not benefit much from *anything* :-)
> > 
> > Average case is, quite literally, an average case - i.e. the average of all the software packages shipped in a distro :)
> 
> Ah, mostly boring stuff :-)
> 
> > > Yeah, but it helps quite a bit if your system (shared) libraries get all
> > > improvements they can as well.
> > 
> > Well, glibc will still benefit automatically to a degree even if not built for a modern baseline, since it has runtime checks in place already; as for other things... well, at least for Void, I already mentioned before we're as much of a source distro as a binary one - people can easily rebuild things that bottleneck them, with modern CFLAGS, and still have things be interoperable.
> 
> Yeah, good point there.
> 
> > > I'm not trying to dissuade you from not requiring VSX and 2.07 -- this
> > > sounds like your best option, given the constraints.  I'm just saying
> > > the cost is not trivial (even ignoring the ABI divergence).
> > 
> > Of course the cost is there - it's just not something I can do anything about. I generally recommend that people who can run LE should run LE. We're a bi-endian distribution, so there is a complete, fully functional, ISA-2.07-baseline ppc64le variant (in fact, it's our best-supported port, with greatest repo coverage and testing), as well as the 970-targeting ppc64 variant.
> 
> Ah, so your BE target is mostly for legacy hardware?  That took a while
> to sink in, sorry!  :-)

That's what the average user on BE is expected to be. I'm not opinionated enough to force BE on an average modern hardware user, there's just too many drawbacks nowadays, some of them inherent, like limited graphics hardware support (the choice of HW is limited, modern GPUs don't work at all, older GPUs are limited to OpenGL 3.2 even if they support newer API, and even if newer GPUs *were* working, they'd be crippled performance-wise as modern GPUs are always LE these days - as a gamedev person I need my graphics stuff working, and I expect my RX 5700 XT to be more than a paperweight), nevertheless, if someone is opinionated enough to use BE despite everything when they don't have to, they're welcome and so are their patches.

> 
> > I know about the biarch case as well, and there is also multilib, as an even more elaborate form of that. That's not directly related to what I originally said, though
> 
> Biarch is why -m32 and -m64 can work at all (for building user binaries).
> My point is that this does *not* work for most finer ABI (or OS) -related
> points -- you really do need a toolchain built specifically for that
> config.

Indeed. But target triples don't give you the necessary distinctions. This is why I find that the "we're an everything-compiler" approach of Clang that's supposedly meant to simplify things to the user actually complicates them; with gcc, you can configure your toolchain for the target env when building it, with clang you are not given this option, all you can do is patch its source code, as the ideas of targeting everything and of configuring the compiler details for a target are inherently in conflict. And when cross-building the real complexity for the user lies in setting up the sysroot anyway, at least for complex things with actual dependencies.

> 
> 
> Segher
>

Daniel
