Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E81EB341
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:14:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bbFm1Hb9zDqR2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:14:20 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=fm3 header.b=MJQdTUWU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=0NvegJYd; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bbD21gqFzDq72
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:12:50 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CBA4F5C0111;
 Mon,  1 Jun 2020 22:12:47 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 22:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=/cJ3aUZq4bYNIrYemTS8nOyzGQoC
 B7osjkXj43Lf64I=; b=MJQdTUWUoJ8/cFV6NzkxUqwDflgO2Fh1sM3Pqdp5z54J
 fwWb6GF4ar2yFXnnHkizS/wcvtjcu8VqGdep63WHSn0LLWSIF1qUiATI79fWAtXj
 q7z3wERHqrgiv4mG+ODsT/Rn9iUdBwfofnB470hbEfUgELD6gvZGyIKCwYuY7VrQ
 VOl+lO68iH7x8QjTliSq+2H3ER0Kj06rb4VHMNQCo3xlmXOTBvPOHkTejIfavunA
 +KWABsKLEOuQyFvAL2s+mD9V9GCxmC6Sd6buSdPqMjYJl9NyNOlgxW1WfxFAZM6I
 s9MRK77F/CobLa6zFkIrjIR89kSsEKGxJ+KNSztnBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/cJ3aU
 Zq4bYNIrYemTS8nOyzGQoCB7osjkXj43Lf64I=; b=0NvegJYdXP+D8TCABCSdzz
 W8GcyMNeJI1b6KDHlQstscNqVSWNYbtCJhpgVAgb9RufDspPd72KgoS+pP3Bi8GH
 v7takE5miRVBePy93wtyc4npf1EdPpcSudldLe8iPa1rUV4l8XIim3v/CP3+qmKK
 WAi7xdJYtlWk+3YDMdH8VWR0NXyNarmUDtVUkeznSAgNzxCs7Z+MpUmx+ghQAgPr
 EW/pfSewvgc15y1nedyPmjdpg9Y0/EPXF3rL6XpZk7Dd7Ur5hhmyxVGpqjHdeIm0
 D06/dVssEGNaG4qAr61nhzO2yX1klXrDz7nbOKGS51//ttRjgbsVlTa/x5fn3dRA
 ==
X-ME-Sender: <xms:n7XVXsvlZtTbJb-xhkNUL7hG86_myvKzH3PjXyDf8zqULZWDDxlxjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepteejtdetheeuueeivedtffehgfehfeehgfejueeufeevueeh
 ffdvlefhueeiffeunecuffhomhgrihhnpeeftddrshhonecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrnhhivghlsehotghtrghfohhrghgv
 rdhorhhg
X-ME-Proxy: <xmx:n7XVXpdVXgtyZVa4CFMHxDDQhNjCPIlFD9Lb6nJ2_3DASDFLnO0EGQ>
 <xmx:n7XVXnxzpGj8VbyqfPFgyAf7kQHR23bbgilS03zGC3uRAUSIyPEhmw>
 <xmx:n7XVXvP_-ZCaokh_0mv3pn39FGNteYCc6tPfXJob6eWhGB0GrcF9nQ>
 <xmx:n7XVXrnejv4EoTdKt-WDj-iA324qxNuJZrvPe6Cq_UEmCkKDt-j4-A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 67B87C200A4; Mon,  1 Jun 2020 22:12:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <51122625-15b3-408b-822c-69cdb7b8d5d9@www.fastmail.com>
In-Reply-To: <20200602015802.GN31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <20200602015802.GN31009@gate.crashing.org>
Date: Tue, 02 Jun 2020 04:12:26 +0200
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org,
 Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 2, 2020, at 03:58, Segher Boessenkool wrote:
> On Tue, Jun 02, 2020 at 01:26:37AM +0200, Daniel Kolesa wrote:
> > On Mon, Jun 1, 2020, at 23:28, Joseph Myers wrote:
> > Are you sure this would be a new port? Glibc already works in this combination, as it seems to me it'd be best if it was just a variant of the existing 32-bit PowerPC port, sharing most conventions besides endianness with the BE port.
> 
> That's right.  Except it isn't an "official" existing port, never has
> been "officially" supported.
> 
> > 128-bit IEEE long double would not work, since that relies on VSX being present (gcc will explicitly complain if it's not). I'd be all for using 64-bit long double, though (musl already does, on all ppc ports).
> 
> The current IEEE QP float support requires VSX for its emulation, yes
> (possibly even Power8?)  As Mike reminded me today, it also requires
> __int128 support, which rules out anything 32-bit currently.  Without
> that restriction, we could just make QP float passed in GPRs (use the
> ABIs for any struct passed that way), and that'll just work out with
> all ABIs, older or not.
> 
> > While we're at long double, I'd actually be interested in transitioning the existing big endian ports in Void (64-bit and 32-bit, neither has VSX baseline requirement in my case) to using 64-bit long double, abandoning the IBM format altogether (little endian will transition to 128-bit IEEE long double once it's ready on your side, as that assumes POWER8 baseline which includes VSX).
> 
> I recommend new ports that cannot jump to IEEE QP float directly to use
> long double == double for the time being, avoiding the extra
> complications that IBM double double would bring.  But you'll still have
> a transition to IEEE 128 if you ever want to go there.
> 
> But if you already use double-double, I don't know if the cost changing
> away from that is worth it now.

The transition cost is relatively low, which is why I'm thinking about this in the first place. For one, relatively few things use long double in the first place. For two, on ppc*, at least the bfd linker (which we use always in Void) always tags ELFs with an FP ABI tag, and things not using long double (or using 64-bit long double) don't receive this tag. It even tags *which* ABI is used. See:

```
$ readelf -a /usr/bin/echo|grep Power_ABI_FP
$ 
$ readelf -a /usr/lib/libc-2.30.so|grep Power_ABI_FP
  Tag_GNU_Power_ABI_FP: hard float, 128-bit IBM long double
```

I went through this once already (I had the 64-bit ldbl transition nearly done) and the number of packages to rebuild in the whole repo was about 200-300 out of ~12000.

> 
> > What would be the best way for me to proceed with that? I actually experimented with this, using the old glibc compat symbols from pre-ibm128 times, and I mostly had it working, except I haven't managed to find a way to switch the default symbols to 64-bit ones, which is problematic as linking everything against nldbl_nonshared is fragile and potentially quirky (breaks dlsym, function pointer equality across libraries, etc).
> 
> Yup.  "Rebuild the world" works :-/  I don't have any  better advice,
> nothing you cannot figure out yourself.

See above.

> 
> > There is also one more thing while we're at this. The 64-bit big endian Void port uses the ELFv2 ABI, even on glibc. This is not officially supported on glibc as far as I can tell, but it does work out of box, without any patching (things in general match little endian then, i.e. ld64.so.2 etc, but they're big endian). Is there any chance of making that support official?
> 
> (I don't talk for glibc).
> 
> The first thing needed is for "us" to have faith in it.  That starts
> with seeing test results for the testsuites!
> 
> (Something similar goes for the GCC port -- there is no official support
> for BE ELFv2, but of course it does work, and if we get test results we
> may keep it that way, hint hint :-) )

Well, FreeBSD defaults to it since 13; OpenBSD's new powerpc64 port (which is supposedly dual-endian) defaults to it; musl defaults to it on LE and BE. FreeBSD and OpenBSD have to, since they primarily target LLVM system toolchain (with GCC in ports) and ld.lld doesn't support ELFv1 (at all). Void's port was new (and any precompiled binaries would generally be enterprisey stuff which doesn't concern us enough - people can just make a chroot/container with say, Debian, if they really need to), so I felt like it didn't make sense to go with the legacy ABI (besides, function descriptors are gross ;)). The situation in the overall userland has been improving too, so the patch burden is actually very low nowadays.

> 
> 
> Segher
>

Daniel
