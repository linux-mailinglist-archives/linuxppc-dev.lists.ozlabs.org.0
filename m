Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F881F02BD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 00:08:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dxbh4RTvzDr3X
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 08:08:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=CQQNNsp1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=QJfq5JT4; 
 dkim-atps=neutral
X-Greylist: delayed 392 seconds by postgrey-1.36 at bilbo;
 Sat, 06 Jun 2020 08:06:32 AEST
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dxZ028DczDqpG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 08:06:32 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id D6861580232;
 Fri,  5 Jun 2020 17:59:55 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Fri, 05 Jun 2020 17:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=z3oPAp3MUPtuaTubzjehshgmx6Ts
 GWnw9rnW8MEf3pg=; b=CQQNNsp1/BLGItze1ymdgL/Iggm6Q+YFbjekqTczhKs8
 y5px2M1lFcisJOl3m3+aVnCa+ssIWPPsLhWiDiuUEnY9JQ0+IFn4sGkiQvstYPYh
 NX706fiFqltciW/dFvX7hiUrThLiXqCvHDWHP7HEDrgEekziy0VTyQ0bMW5Z9aoI
 TG9BlIm/zW5nEQfyU163rJSza+6QxypgO8gvvkfSMsWZ4DU6KTSophuLAEZGTd5d
 rJqcFrwj6vfMY5VzMIDFW64n0FCg6/Udo3ibBF5h+Rge8MAwZE0bPwndNuCqmk2k
 ClRDGEPjQELBXkCJ8v8NDu00NzxAVZsLzLljkkZQ/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z3oPAp
 3MUPtuaTubzjehshgmx6TsGWnw9rnW8MEf3pg=; b=QJfq5JT4oVFAz/1/+QjiWj
 6f7Z/LqF8v5rFw28tW1WWZsSLWliXYtW5YhaX3+2J6/JFLOtGC8MVslvueTdgZOF
 n2Rs1RE45dYl3ZnewE9B5Sqw4FfZ1FYrm/kwxXooFCHeA9CFQBZ3VGA+phb550AA
 R5uQujVke/1Vo3SfWeZ1LXeUlCjYxlKXU1sjONLGKqrM7NbcB3PeRUQgfdVk6MAx
 0Mv9lJCGYLoQyn4ZFTPlQQ72UUkd8pXyAhzDQNEp3SXM1dfHsyAkUygZvJOyArcl
 ubwafE24se+78Rvjy5MEjjyWVC3HL6scUUr9llF3rx1lAreIJPB9p6DFWKFri04Q
 ==
X-ME-Sender: <xms:WsDaXkthTn3fAGq95SO81yAklkdUM9iPkPM2ZihY5FkoHOln6evOKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepieevvddvjeehiedtvdelgfeuiefhgfetvdeuhfffteehuddu
 fffgudfhfffhleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepuggrnhhivghlsehotghtrghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:WsDaXhfr4shbDlN8ulWOlPvpkVrL3UjWn2pBqfrqwLIBkiXUgBkOSQ>
 <xmx:WsDaXvwaaQp77YxcVW51KXg1XRrEBrtSUgcdy6v9v8Ze6cw9WXuEYQ>
 <xmx:WsDaXnNRMoozGopxVlB6P5KiLOg6_mfL-2pCw4nID8ZcYro-Btf-EQ>
 <xmx:W8DaXhNpSeDDj2Q5R5rWPN-bMkDjeGt5vFzR5IaRTGJUYvmH6YrrVA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 065D6C200A4; Fri,  5 Jun 2020 17:59:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <6b987f87-1eee-4772-9ecc-f4d9ce9233b6@www.fastmail.com>
In-Reply-To: <20200605172702.GP31009@gate.crashing.org>
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
 <20200605172702.GP31009@gate.crashing.org>
Date: Fri, 05 Jun 2020 23:59:32 +0200
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

On Fri, Jun 5, 2020, at 19:27, Segher Boessenkool wrote:
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
> ... Yet.  And if you claim you support ELFv2, not mentioning the ways
> your implementation deviates from it, users will be unhappy.

Will they? The system explicitly mentions that the minimum target in the binary packages is 970. Users can't be expecting features that the hardware we support doesn't support :) Also, we're not the only ones that do this - there's musl of course, but there's also the BSDs. FreeBSD 13 uses ELFv2, and supports all the old hardware including processors without VMX, let alone VSX. OpenBSD is likely to take the same path. But I'm not opposed to making this explicit, if that's what it takes to make other people happy with it.

> 
> > It's also still an upgrade over ELFv1 regardless (I mean, the same things apply there).
> 
> Yeah, in mostly minor ways, but it all adds up for sure.

It's made my life simpler on numerous occasions, and allowed us to bring in software that'd otherwise take significant patching (no software is complete until it has its own assembly implementation of coroutines or something like that :P), or would be outright impossible without a lot of work (e.g. the lld linker).

> 
> > I'm also not really all that convinced that vectors make a huge difference in non-specialized code (autovectorization still has a way to go)
> 
> They do make a huge difference, depending on the application of course.

I've yet to see non-specialized things without explicit VSX impls where the difference is more than 5%, usually it's less.

> But VSX is not just vectors even: it also gives you twice as many
> floating point scalars (64 now), and in newer versions of the ISA it can
> be beneficially used for integer scalars even.
> 
> > and code written to use vector instructions should probably check auxval and take those paths at runtime.
> 
> No, that is exactly the point of requiring ISA 2.07.  Anything can use
> ISA 2.07 (incl. VSX) without checking first, and without having a
> fallback to some other implementation.  Going from ISA 2.01 to 2.07 is
> more than a decade of improvements, it is not trivial at all.

Portable code will need runtime checks anyway if they target big endian systems, especially existing ones, since modern vector instructions can be used even in legacy ABI, where you get no such guarantee. Sure, it's nice to not have to worry about it, but once everything is considered, going with a more modern ABI is still a big net gain for us, even if the guarantees are not all there :)

> 
> 
> > As for other instructions, fair enough, but from my rough testing, it doesn't make such a massive difference for average case
> 
> That depends on what you call the average case.  Code that is control
> and memory-bound will not benefit much from *anything* :-)

Average case is, quite literally, an average case - i.e. the average of all the software packages shipped in a distro :)

> 
> > (and where it does, one can always rebuild their thing with CFLAGS=-mcpu=power9)
> 
> Yeah, but it helps quite a bit if your system (shared) libraries get all
> improvements they can as well.

Well, glibc will still benefit automatically to a degree even if not built for a modern baseline, since it has runtime checks in place already; as for other things... well, at least for Void, I already mentioned before we're as much of a source distro as a binary one - people can easily rebuild things that bottleneck them, with modern CFLAGS, and still have things be interoperable.

> 
> 
> I'm not trying to dissuade you from not requiring VSX and 2.07 -- this
> sounds like your best option, given the constraints.  I'm just saying
> the cost is not trivial (even ignoring the ABI divergence).

Of course the cost is there - it's just not something I can do anything about. I generally recommend that people who can run LE should run LE. We're a bi-endian distribution, so there is a complete, fully functional, ISA-2.07-baseline ppc64le variant (in fact, it's our best-supported port, with greatest repo coverage and testing), as well as the 970-targeting ppc64 variant.

The 970-targeting ppc64 variant is still capable of running on modern hardware, as there are people who wish to run big endian even on their modern machines, and I don't want to take that choice away from them (and since kernel 4.20, you can even have one generic kernel capable of booting POWER4-POWER9, previously separate kernels were needed for <= POWER6 and >= POWER7). Those people can either deal with their computers running a bit slower, or rebuild the packages that specifically bottleneck them with modern CFLAGS.

> 
> 
> > > The target name allows to make such distinctions: this could for example
> > > be  powerpc64-*-linux-void  (maybe I put the distinction in the wrong
> > > part of the name here?  The glibc people will know better, and "void" is
> > > probably not a great name anyway).
> > 
> > Hm, I'm not a huge fan of putting ABI specifics in the triplet, it feels wrong - there is no precedent for it with POWER (ARM did it with EABI though),
> 
> Maybe look at what the various BSDs use?  We do have things like this.

Briefly, the FreeBSD 13 powerpc64 target triple had an -elfv2 suffix, this was done in clang, but I noticed it was reverted in the end and replaced with checks not based on triples. I believe there is no ABI in BSD powerpc triples right now.

> 
> > the last part should remain 'gnu' as it's still glibc; besides, gcc is compiled for exactly one target triplet, and traditionally with ppc compilers it's always been possible to target everything with just one compiler (endian, 32bit, 64bit, abi...).
> 
> This isn't completely true.
> 
> Yes, the compiler allows you to change word size, endianness, ABI, some
> more things.  That does not mean you can actually build working binaries
> for all resulting combinations.  As a trivial example, it will still
> pick up the same libraries from the same library paths usually, and
> those will spectacularly fail to work.

I know, I meant mostly from purely compiler perspective. It's good enough for bare-metal (in that way it matters for stuff like GRUB etc. where you still need to build a 32-bit big-endian ELF, etc)

> 
> We are biarch for some targets, which means that both powerpc-linux
> targets and powerpc64-linux targets can actually handle both of those,
> with just -m32 or -m64 needed to switch which configuration is used.
> But you cannot magically transparently switch to many other
> configurations: for those, you just build a separate toolchain for that
> specfic (variant) configuration, in the general case.

I know about the biarch case as well, and there is also multilib, as an even more elaborate form of that. That's not directly related to what I originally said, though

> 
> > The best way would probably be adding a new -mabi, e.g. -mabi=elfv2-novsx (just an example), which would behave exactly like -mabi=elfv2, except it'd emit some extra detection macro
> 
> Yeah, that sounds like a good idea.  Patches welcome :-)
> 
> (A separate target name is still needed, but this will make development
> simpler for sure).

I don't think a separate target is strictly necessary - it can be done, sure, but with an ABI switch it's more just informative than anything else.

> 
> 
> Segher
>

Daniel
