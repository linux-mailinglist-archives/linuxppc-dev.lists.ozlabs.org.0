Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E25221EEF6C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 04:20:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dRFL6KyjzDr0B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 12:20:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=fsqiH5E8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AtQ8KDT1; 
 dkim-atps=neutral
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dRCS12fCzDqwj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 12:18:43 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id E92A377A;
 Thu,  4 Jun 2020 22:18:39 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Thu, 04 Jun 2020 22:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=63WB7C0/YbKjRkxamNn3NDDMMHJn
 VX5A5NHNX/JouPk=; b=fsqiH5E8+lIgWLylHFJ1PPHsyKGdKb85661JN9qYdN2g
 szxaOd9p1ykLr8oAIM3tXpgP0pjh6otF6Qsu5Tf+ZvSL07W99+NLVFg8mGTqXzcm
 6x41cdR7QGAaCfV866ueIhVbL2XF0Pge2Xswcm6DJMo4X3Z1z7RuoWxYj6s0llX8
 ylhNamHfygSeT2i3TZY3rLNGp+tfoOOMtUh13gxh+S9xxOC+2ugQ0G1U3utzI2pd
 Rn8s9WNY8N4u/31Fz0EWoekH/ncAyCKxR5IQorzXWjy+PuqTvr2qjGiFP1nFmhE+
 D3HVXQD64PK2mPxnh4wnSNFlhaF1p2Eu2aqQJ4GyRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=63WB7C
 0/YbKjRkxamNn3NDDMMHJnVX5A5NHNX/JouPk=; b=AtQ8KDT1Rc9bFBm0iweIRN
 WO8oVZvxoeXDtO0CQH2pjqALN+3L9f3hfc3XyOXVxkZ8oTB9dHc+3Di5dPNLci8c
 tuo0WhNK7OP6CVqM5HVkM8VOAgMaFpd1V0M2gQjO6Rnup8w1Ge7UGyeJJwaJdBYI
 XwnRLZwQqvyw5lfiIemp7fv0D31g4aw+0Rj/Y6zLVSsM+mlqd0CIjuPpFh6Kz29e
 ZrtWA+lenGcK4Md1pNh+a1YvGnagHvL0M7W2fCTLozXkWzYeI4bxBhtZMydWOLEu
 WDOOhyPfJMJtpfkIu7t9cNQ9ynWxhPnz1zQmJBZOliG7Fdiq4fzGh3leNjIhK71w
 ==
X-ME-Sender: <xms:fqvZXmFt-kRXN5vS4-IsCUNcLMuP-0A-b6RR2skihpfpfZLmDE3OfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegvddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepieevvddvjeehiedtvdelgfeuiefhgfetvdeuhfffteehuddu
 fffgudfhfffhleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepuggrnhhivghlsehotghtrghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:fqvZXnXUR5g-hWM2U_zt1JK39HZL5lFQmjU9t8Ibr265NQ8KZJjNZA>
 <xmx:fqvZXgLssqjvwUb4LOaibYyBCbXz8YPqXlbRRH0oYqCUInDpliXCpA>
 <xmx:fqvZXgG18yZZY2Vu5Y6GIwBlCh1LF9UP4sqmUNHl9WzFO9oOcScTKA>
 <xmx:f6vZXvFlU1Gpakd1aSSKwjyqfHANJUG13qLXqGmLt52NIOIhg0vsir-c3Bs>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 546B2C200A4; Thu,  4 Jun 2020 22:18:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <17459c98-3bd3-4a5d-a828-993b6deef44f@www.fastmail.com>
In-Reply-To: <20200604233516.GM31009@gate.crashing.org>
References: <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
 <20200604233516.GM31009@gate.crashing.org>
Date: Fri, 05 Jun 2020 04:18:18 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
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
 musl@lists.openwall.com, Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 5, 2020, at 01:35, Segher Boessenkool wrote:
> Hi!
> 
> On Thu, Jun 04, 2020 at 11:43:53PM +0200, Daniel Kolesa wrote:
> > The thing is, I've yet to see in which way the ELFv2 ABI *actually* requires VSX - I don't think compiling for 970 introduces any actual differences. There will be omissions, yes - but then the more accurate thing would be to say that a subset of ELFv2 is used, rather than it being a different ABI per se.
> 
> Two big things are that binaries that someone else made are supposed to
> work for you as well -- including binaries using VSX registers, or any
> instructions that require ISA 2.07 (or some older ISA after 970).  This
> includes DSOs (shared libraries).  So for a distribution this means that
> they will not use VSX *anywhere*, or only in very specialised things.
> That is a many-years setback, for people/situations where it could be
> used.

Third party precompiled stuff doesn't really need to concern us, since none really exists. It's also still an upgrade over ELFv1 regardless (I mean, the same things apply there). I'm also not really all that convinced that vectors make a huge difference in non-specialized code (autovectorization still has a way to go) and code written to use vector instructions should probably check auxval and take those paths at runtime. As for other instructions, fair enough, but from my rough testing, it doesn't make such a massive difference for average case (and where it does, one can always rebuild their thing with CFLAGS=-mcpu=power9)

> 
> > The ELFv2 document specifies things like passing of quadruple precision floats. Indeed, VSX is needed there, but that's not a concern if you *don't* use quadruple precision floats.
> 
> As Joseph says, QP float is passed in the VRs, so that works just fine
> *if* you have AltiVec.  If not, you probably should pass such values in
> the GPRs, or however a struct of 16 bytes is passed in whatever ABI you
> use (this is a much more general problem than just BE ELFv2 ;-) )  And
> then you have some kind of "partial soft float".  Fun!  (Or not...)

As I mentioned previously, I kinda want to be able to cover the same targets as ELFv1 can, which also means non-altivec hardware, so it doesn't matter that much either way... being able to cover existing stable compilers with a manageable patchset would be nice, too.

> 
> > > If you always use -mcpu=970 (or similar), then not very much is
> > > different for you most likely -- except of course there is no promise
> > > to the user that they can use VSX and all instructions in ISA 2.07,
> > > which is a very useful promise to have normally.
> > 
> > Yes, -mcpu=970 is used for default packages. *However*, it is possible that the user compiles their own packages with -mcpu=power9 or something similar, and then it'll be possible to utilize VSX and all, and it should still work with the existing userland. When speaking of ABI, what matters is... well, the binary interface, which is the same - so I believe this is still ELFv2. A subset is always compliant with the whole.
> 
> The same calling convention will probably work, yes.  An ABI is more
> than that though.
> 
> 
> > > Btw, if you use GCC, *please* send in testresults?  :-)
> > 
> > Yes, it's all gcc (we do have clang, but compiling repo packages with clang is generally frowned upon in the project, as we have vast majority of packages cross-compilable, and our cross-compiling infrastructure is gcc-centric, plus we enable certain things by default such as hardening flags that clang does not support). I'll try to remember next time I'm running tests.
> 
> Thanks in advance!
> 
> > I have a feeling that glibc would object to such port, since it means it would have to exist in parallel with a potential different ELFv2 port that does have a POWER8 minimal requirement; gcc would need a way to tell them apart, too (based on what would they be told apart? the simplest way would probably be something like, if --with-abi=elfv2 { if --with-cpu < power8 -> use glibc-novsx else use glibc-vsx } ...)
> 
> The target name allows to make such distinctions: this could for example
> be  powerpc64-*-linux-void  (maybe I put the distinction in the wrong
> part of the name here?  The glibc people will know better, and "void" is
> probably not a great name anyway).

Hm, I'm not a huge fan of putting ABI specifics in the triplet, it feels wrong - there is no precedent for it with POWER (ARM did it with EABI though), the last part should remain 'gnu' as it's still glibc; besides, gcc is compiled for exactly one target triplet, and traditionally with ppc compilers it's always been possible to target everything with just one compiler (endian, 32bit, 64bit, abi...). Detection based on CPU is probably quirky too, actually, since it'd mean different CPU types selecting different dynamic linkers.

The best way would probably be adding a new -mabi, e.g. -mabi=elfv2-novsx (just an example), which would behave exactly like -mabi=elfv2, except it'd emit some extra detection macro - that would be documented in the ABI spec (and glibc could use it to choose the correct port), allow gcc (or clang) to select a correct dynamic linker name, and probably default to a 64-bit long double format. This would also get rid of the patches used for musl which pick the default -mlong-double based on target triples :) Alternatively, since -mabi is additive, it could be a modifier for -mabi=elfv2, which would perhaps make even more sense. Clang would need similar changes. I think this way would respect existing conventions the most and be overall least invasive.

Thoughts?

> 
> 
> Segher
>

Daniel
