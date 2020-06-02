Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8741EB337
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:05:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bb3j1mj4zDqNj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:05:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=QB0nIUcG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NZo7qmTR; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bb1q5b1tzDqJR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:03:58 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A089F5C0065;
 Mon,  1 Jun 2020 22:03:55 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 22:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=1U+TpcmElryzdORJ+uEwkyNjG0LM
 xX7jof7K6babZzE=; b=QB0nIUcGKZ1RrgKVU0teyyu41q54zFycVMeY/nUsAW1q
 C0zzj4bdBvz+pWAVv+Hgg2Ike+bOIKmve4UIYdrYNY1dxgLBgmUzvialnoLc8CUG
 PNTqUZBoshHZ1vp8/cvu61NMBOJOzQpoT8PVssfS+1Tjcc24HSMkMg780ZQzYxyw
 JdJvotafa1f+do1qoUQ27o96lNZECnMk98MitH9tCK98UaNAimRdlXbagh5dDUeU
 uUMnORGVR5HUoWnOJuyEGm0j3kPe01px39z4fQDmgHZ3c0uP7+sokI0sL1aoAs83
 j8U/VsJijiPqw2vhwy2pLsYEyL8guMezPhsv1OJR0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1U+Tpc
 mElryzdORJ+uEwkyNjG0LMxX7jof7K6babZzE=; b=NZo7qmTRpOOr8H9cfJm5z0
 h5VEeHrfAP+hB1lvBz67b5en3axT9IYiOETgH256ArU5+DyStFLkkXFH8/oXGFPc
 7+hKpWxPPEWHw9fnQww/Ta+wdvfCm2jzoJb1kmL/GwYydjfRkdfZVXIqS/mYY4vK
 pN1tWH79PgyuBlT/mNomfe+Gxsp5ZTKsuSN2L94GSEx8RN5jliqwZSeOW/fGeQMm
 VlqoDIkn/aEpRhrbqRM3sI1Lgf5nVatTXPKgxlcKnXweObmkVLEyhibzsuCTSIOT
 X7RT4QnsRVOu23uMmcyRT3Yp0/Xvb+jaCw08CnzAZhglrqhBMDtxQl0bgsou6KvQ
 ==
X-ME-Sender: <xms:irPVXjaRBIWOtK5scMDNBzHOl5n34l7Q_xWmTUHd6xMKr1SPh1BqhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepueelgeeljeeigeeghefgtddtveeuhedvheeuteeiveetledu
 vdevvdfgtdeigfdvnecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhes
 ohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:irPVXiZ0JrcYk9sOuTXsHtDys5_hKjIurfffaTNH2yMX0XkA7GWMHw>
 <xmx:irPVXl_wIYaM7uu0ZFNHQFpb4k4g8DsEtft2Dm0oUrmr_h6Zlz-dVw>
 <xmx:irPVXpoe4NhBK7QU7-oeHYb5CNdfCOzymsyJH4FKH1dNJXkh50FyyA>
 <xmx:i7PVXrBsCvfezuK9x2Qbe1Ri0I6u_OOluPMf0f3Z2zOvEn9TymjxXQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 24EADC200A4; Mon,  1 Jun 2020 22:03:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <d1ae9750-e200-4e33-a118-05b512eaa7cd@www.fastmail.com>
In-Reply-To: <20200602014227.GM31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <20200602014227.GM31009@gate.crashing.org>
Date: Tue, 02 Jun 2020 04:03:33 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>,
 "Joseph Myers" <joseph@codesourcery.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 2, 2020, at 03:42, Segher Boessenkool wrote:
> Hi Joseph,
> 
> On Mon, Jun 01, 2020 at 09:28:25PM +0000, Joseph Myers wrote:
> > On Fri, 29 May 2020, Will Springer via Binutils wrote:
> > 
> > > Hey all, a couple of us over in #talos-workstation on freenode have been
> > > working on an effort to bring up a Linux PowerPC userland that runs in 32-bit
> > > little-endian mode, aka ppcle. As far as we can tell, no ABI has ever been
> > > designated for this (unless you count the patchset from a decade ago [1]), so
> > > it's pretty much uncharted territory as far as Linux is concerned. We want to
> > > sync up with libc and the relevant kernel folks to establish the best path
> > > forward.
> > 
> > As a general comment on the glibc side of things, if this is considered 
> > like a new port, and it probably is, the same principles that apply to new 
> > ports apply here.
> > 
> > There's a general discussion at 
> > <https://sourceware.org/glibc/wiki/NewPorts>, although much of that is 
> > only applicable when adding new CPU architecture support.  More specific 
> > points include that new 32-bit ports should default to 64-bit time and 
> > file offsets from the start, with no support for 32-bit time or offsets 
> > (meaning that if you want to use this with some kind of library call 
> > translation, the library call translation will need to deal with 
> > corresponding type size conversions).
> 
> Either that, or use the same as BE 32-bit PowerPC Linux, I'd say (it
> won't make things worse, and if it is easier?)  But preferably the
> newer, better, thing of course :-)
> 
> > And a new port should not be added 
> > that uses the IBM long double format.  You can use IEEE binary128 long 
> > double, possibly with an ABI similar to that used on powerpc64le, or can 
> > use long double = double, but should not support IBM long double, and 
> > preferably should only have one long double format rather than using the 
> > glibc support for building with different options resulting in functions 
> > for different long double formats being called.
> 
> You cannot use IEEE QP float ("binary128") here, but more on that in a
> later post.
> 
> (I so very much agree about the problems having more than one long
> double format -- on the other hand, you'll just share it with BE, and
> with the existing powerpcle-linux (sup)port).

Well, it'd be nice to use the opportunity to ditch the IBM long doubles altogether, since these get in the way for me in various places (for instance, GCC still can't constant-fold them, which breaks on constexpr in C++, as well as makes it impossible to e.g. enable the runtime/standard library for GDC in GCC as that heavily relies on the `real` type in D, which maps directly to `long double` and druntime/phobos heavily relies on constant folding of the `real` type being functional; there are also assorted libraries and applications in the common userland that don't like the IBM format for one reason or another)

That said, that's also problematic:

1) ppc64le is going to newly use IEEE754 binary128, so we're all good there - baseline mandates VSX, so at least passing them is fine, which is the important thing (actual binary128 instructions came with ISA 3.0 but that can be detected at runtime, at least in glibc) - ibm128 is then implemented via symvers/compat, which is fine.

2) ppc64 for now uses IBM 128-bit long double, so it's problematic. I don't care about ELFv1, as it's legacy and has tons of drawbacks on its own, and there's a whole legacy ecosystem relying on it; that said, a new ELFv2 port (let's say, with ld64.so.3 dynamic linker) could easily default to another long double format, without worrying about compat - I propose this format to be binary64, as it's already used by musl on BE/64 (allows projects such as `gcompat` to work) and thus is already implemented in all toolchains we care about and can easily be flipped on, and is fully compatible with all CPUs that can run ppc64 code, even without VMX/VSX

3) ppcle would be a new port (let's say ld.so.2), so it could default to a new format; binary64 would be good

4) that leaves ppc32/BE, which would be the only outlier - while I could probably implement compat in much the same way as ppc64le does with binary128 (bump symvers for math symbols, leave older symvers for existing binaries, change defaults), this would be divergent from the existing port; glibc/IBM probably won't want to switch this, and while I would definitely like to, maintaining a divergent downstream patchset seems non-ideal. There is some basis for this - glibc did use to use binary64 on ppc32 and ppc64 BE in the past, and the compatibility symbols are still there under the old symvers, but not quite sure what to do there.

> 
> 
> Segher
>

Daniel
