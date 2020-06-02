Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FD1EB34C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:19:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bbMM2XqDzDqNF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:19:11 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=fm3 header.b=CteS01uk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hGUX4uOg; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bbKd3SfvzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:17:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A0555C00C6;
 Mon,  1 Jun 2020 22:17:39 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 22:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=iZ7t50itpN7xJ1t10Aut2hV/3eOe
 L04jDPxdfhLzpRE=; b=CteS01ukYQLmYwG7C7WOl7Ny+JAitGbVUByHgiJ3BNsD
 YUy6WiHYsTvV7yy3yc5MbNDzRKTMjLgRN4AlK3L9odpTUjDPpoTyIK+L4qzpOV/D
 Zcs5qIpbYWe7WkqcF5yyQHlM/bluZyRSWxvbAAga2+iXLy2INZmU56ZA0N9CCU+h
 PX30r0JC+hWj0lufgH4XNXoEUYKFE0Ao5i+1m0+jcYfoIML4dtCVOauFbi1Hm+tf
 zOciy4QuCrubWZx/QPBvYu37vxDgBMTl28A7cd+OKWs9AFlMxhvZ5F6edniKMfAd
 p7nLy0gd8/71LDctnziJTVD3S3AVHqYP7qWdYvOspw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iZ7t50
 itpN7xJ1t10Aut2hV/3eOeL04jDPxdfhLzpRE=; b=hGUX4uOgekM/Z1Gfyh2rOg
 u0LZA3ziRagUiJ8ZzEeyaM0RYoS0aUHgbBRd62DjWRs/u9mUDawODN628oM/96VY
 UJJgntepK01j16qt9dQVSr4VFRPnodgk2ChN6b86LU0JZ1X2jcchvwE8O4NX3sMa
 uIYbn423bK3kjQMbf7gBM2ucynDAJq6l08q00vsEchwvAyNZ0kBW8nH3G6O4RItW
 lzDBWCSP0p2SK7UmN53WBpZ8A5JxOBGeIVvs/wttTcQbl6CFVFqG2hHQHZaGOO9f
 mbmBnJgiBMK+ShRw9DJ+2eQNnXSUbXxv/Be/Pnd2vAGdhfB1kx80MOjzV3KqMqQw
 ==
X-ME-Sender: <xms:wrbVXgJmixqERrJ5xtTuqn1jSLzbc0tKX-IeVHRgkkf3FgKSuek1Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepueelgeeljeeigeeghefgtddtveeuhedvheeuteeiveetledu
 vdevvdfgtdeigfdvnecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhes
 ohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:wrbVXgJXzpi-i6QCDe1yOi4vhwbInIMeS1RrHwmCmi0OmU6h8U9XVg>
 <xmx:wrbVXgswP1vTE1NteeVzBw4x20YFUtzq-udFqxrBo8DhIKzBAft7bw>
 <xmx:wrbVXtbCGLilz9g-9qLfXneDCq8GE3KtbJXavBUyFuTJm1Q6qgXzRQ>
 <xmx:w7bVXiyccsO0XRcRZU8k5ULmH6YNL_m9bgDcXhxKJBgY7Ph-LSTCaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AEC0AC200A4; Mon,  1 Jun 2020 22:17:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <6f755dae-ebc4-4eb1-9fec-58ec58f7a324@www.fastmail.com>
In-Reply-To: <20200602021245.GO31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <20200602021245.GO31009@gate.crashing.org>
Date: Tue, 02 Jun 2020 04:17:17 +0200
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



On Tue, Jun 2, 2020, at 04:12, Segher Boessenkool wrote:
> On Mon, Jun 01, 2020 at 11:45:51PM +0000, Joseph Myers wrote:
> > On Tue, 2 Jun 2020, Daniel Kolesa wrote:
> > > Are you sure this would be a new port? Glibc already works in this 
> > > combination, as it seems to me it'd be best if it was just a variant of 
> > > the existing 32-bit PowerPC port, sharing most conventions besides 
> > > endianness with the BE port.
> > 
> > The supported glibc ABIs are listed at 
> > <https://sourceware.org/glibc/wiki/ABIList>.
> 
> powerpcle-linux already does work somewhat, and that should also he
> worth something, official or not ;-)
> 
> (It has worked for very many years already...  That is, I have built it
> a lot, I have no idea about running a full distro that way).
> 
> > > 128-bit IEEE long double would not work, since that relies on VSX being 
> > > present (gcc will explicitly complain if it's not). I'd be all for using 
> > 
> > The minimum supported architecture for powerpc64le (POWER8) has VSX.  My 
> > understanding was that the suggestion was for 32-bit userspace to run 
> > under powerpc64le kernels running on POWER8 or later, meaning that such a 
> > 32-bit LE port, and any ABI designed for such a port, can assume VSX is 
> > available.  Or does VSX not work, at the hardware level, for 32-bit 
> > POWER8?  (In which case you could pick another ABI for binary128 argument 
> > passing and return.)
> 
> The current powerpcle-linux runs on anything 6xx, or maybe older.  It
> isn't actually supported of course.
> 
> If the CPU is Power8, that does not mean VSX is available to you.
> 
> VSX works fine in 32-bit mode (with the standard gotcha that the GPRs
> do not preserve the high part in all cases, so e.g. the m[ft]vsr insns
> might not work as you want.
> 
> Passing IEEE QP float in GPRs would be natural for most ABIs, and it
> should work fine indeed.  That isn't currently supported in GCC (needs
> some libgcc work), and it might need __int128 to work on 32-bit ports
> first.
> 
> > > There is also one more thing while we're at this. The 64-bit big endian 
> > > Void port uses the ELFv2 ABI, even on glibc. This is not officially 
> > > supported on glibc as far as I can tell, but it does work out of box, 
> > > without any patching (things in general match little endian then, i.e. 
> > > ld64.so.2 etc, but they're big endian). Is there any chance of making 
> > > that support official?
> > 
> > If you want to support ELFv2 for 64-bit big endian in glibc, again that 
> > should have a unique dynamic linker name, new symbol versions, only 
> > binary128 long double, etc. - avoid all the legacy aspects of the existing 
> > ELFv1 port rather than selectively saying that "ELFv1" itself is the only 
> > legacy aspect and keeping the others (when it's the others that are 
> > actually more problematic in glibc).
> 
> You should view it as a variant of the LE ELFv2 port, it has nothing
> much to do with the other BE 64-bit PowerPC ports, other than being BE.

He does have a point with multiarch though - e.g. Debian lets you have all architectures in the same system (with the foreign ones running through binfmt of course) and has individual sysroots for each arch, but dynamic linkers still need to be present in a single location. So, different or not, BE/LE should probably each get its own dynamic linker name (musl solves this nicely by using consistent ld-musl-<archname>so, glibc's naming is fairly arbitrary)

> 
> 
> Segher
>

Daniel
