Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F71EB38A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:57:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bcC20YtpzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:57:02 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=fm3 header.b=mb6fLSqs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=4MIdM6eD; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bc9K58HjzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:55:33 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B0645C008D;
 Mon,  1 Jun 2020 22:55:31 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 22:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=rs
 p52BzWosksRCNxSjIw3SyM9l2pfCSHKD2Pvc/wp/8=; b=mb6fLSqsDDSspfnyYz
 miU8h9OjCu3sHRe0YnXnFb8kYyO5O6sy9o13IPOKves60OaNfgLYuoyZYUkM8SYl
 ZgtRNRAsMFX2T3ZSyulkWUbH0FzzbJ6sZGy3I5fziENqPugaCIp+Ea07EQzyo1C9
 ZcGfAovcjbwCnVYOJmhTao+djHGRlw5TUXGGgwmq9R1G4hsCqKsGy7ZT1KH3ILtq
 F5xhUiHGNAkVUl4HneyM8iwFfRpzND9B78rb394UkGp6POnU9e1jqjHtxk98LI0T
 2+G9aftTodB4Fcu9acejtg7/BWEhaNUU8tbmjXOGzHOnCQyXjzNwy5nfOZGIZz2K
 dZqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=rsp52BzWosksRCNxSjIw3SyM9l2pfCSHKD2Pvc/wp
 /8=; b=4MIdM6eDN8pdUWbat33W9ZOCaZgY9pWUZwoktq0Wyjcq0KEtQzkbDhQ5I
 nB+y3cdMLJa8FxjGuQHbHmxzz481nme+RA1tPsRnmAgMFLz3czkdFBxNpvKHCimP
 yI0NRjPQ2EhbUxZ+TONKUnZM/WpyKd895DLb8pcomZlylxpc+tvZEE6oLFuMAaOT
 xb8IDWEntV2KBzsSntIp4Zc5pSherHkfTTwqrOoTwRInWX4cyko0Sfj7D0Nbvox9
 voXk+h+Y26AnC4O9l9F1Req+V+9yPGSLqtGqC2YSFSrZ7jzlu4u3unGb8NMg1iJj
 8KBW0T1N7V3jiqEXxPABOfY/x9Qiw==
X-ME-Sender: <xms:ob_VXsLUkdDV4NnlQ-ektZXkfWiof5P-CXT67idUCc8fhu8U_iPKjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfffgr
 nhhivghlucfmohhlvghsrgdfuceouggrnhhivghlsehotghtrghfohhrghgvrdhorhhgqe
 enucggtffrrghtthgvrhhnpedujedvjeevveffieekiedvueeiveelffekkeevteeigefh
 vefghfduueffhffgkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrnhhivghlsehotght
 rghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:ob_VXsL-C3ouaSk8jzbDMWjaQpYYEZpv5L1NA5SOQzTmNjr53Fb87g>
 <xmx:ob_VXsscNsxSl27oTC9FpiNeJq8k0cnX3-SB9hOM8qxYLI_IxYpnFg>
 <xmx:ob_VXpYQ8GpnpnsfhYB7gR46aCE0DBFQpYL3N1LovlM3UrcKE27tQQ>
 <xmx:o7_VXux91O-cUaR9kFfjywMYU4HjqSakBGD_ZcsBsDGj5bLtacKw6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0819DC200A4; Mon,  1 Jun 2020 22:55:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <b5ad7f45-a0a0-4dfe-a442-8e7745fde310@www.fastmail.com>
In-Reply-To: <20200602023630.GP31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <20200602015802.GN31009@gate.crashing.org>
 <51122625-15b3-408b-822c-69cdb7b8d5d9@www.fastmail.com>
 <20200602023630.GP31009@gate.crashing.org>
Date: Tue, 02 Jun 2020 04:55:08 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>, musl@lists.openwall.com
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 2, 2020, at 04:36, Segher Boessenkool wrote:
> On Tue, Jun 02, 2020 at 04:12:26AM +0200, Daniel Kolesa wrote:
> > On Tue, Jun 2, 2020, at 03:58, Segher Boessenkool wrote:
> > > I recommend new ports that cannot jump to IEEE QP float directly t=
o use
> > > long double =3D=3D double for the time being, avoiding the extra
> > > complications that IBM double double would bring.  But you'll stil=
l have
> > > a transition to IEEE 128 if you ever want to go there.
> > >=20
> > > But if you already use double-double, I don't know if the cost cha=
nging
> > > away from that is worth it now.
> >=20
> > The transition cost is relatively low, which is why I'm thinking abo=
ut this in the first place. For one, relatively few things use long doub=
le in the first place.
>=20
> Then your cost switching to QP float later will be low as well.  I env=
y
> you :-)
>=20
> > For two, on ppc*, at least the bfd linker (which we use always in Vo=
id) always tags ELFs with an FP ABI tag, and things not using long doubl=
e (or using 64-bit long double) don't receive this tag. It even tags *wh=
ich* ABI is used. See:
>=20
> That works for statically linked stuff, sure.  That is the easy case :=
-/

It works for dynamically linked stuff too, since anything either using o=
r exposing any API from anywhere that contains a long double signature w=
ill result in the tag being emitted. The difference becomes fuzzier once=
 you switch to -mlong-double-64, as then they effectively become one typ=
e, and you can no longer check for it. But when it's still on 128-bit (a=
ny format) it's reasonably trivial (mostly just check the whole repo for=
 binaries/libraries, dump the tags everywhere, collect them...)

>=20
> > I went through this once already (I had the 64-bit ldbl transition n=
early done) and the number of packages to rebuild in the whole repo was =
about 200-300 out of ~12000.
>=20
> Cool!  Do you perchance have info you can share about which packages?
> Offline, if you want.

Sure. Here's the list of stuff I had to bump in our repo when I attempte=
d the transition ~half a year ago: https://gist.github.com/q66/08720863a=
3aec12a6612356cd4c0110f

Of course, we've since gained packages, so it might be slightly differen=
t now, and our repos are smaller than something like Debian's, but other=
wise this list is not super difficult to compile. I'll be compiling a ne=
w one for the ieee754 binary128 transition on glibc when the time comes =
:)

>=20
> > > > There is also one more thing while we're at this. The 64-bit big=
 endian Void port uses the ELFv2 ABI, even on glibc. This is not officia=
lly supported on glibc as far as I can tell, but it does work out of box=
, without any patching (things in general match little endian then, i.e.=
 ld64.so.2 etc, but they're big endian). Is there any chance of making t=
hat support official?
> > >=20
> > > (I don't talk for glibc).
> > >=20
> > > The first thing needed is for "us" to have faith in it.  That star=
ts
> > > with seeing test results for the testsuites!
> > >=20
> > > (Something similar goes for the GCC port -- there is no official s=
upport
> > > for BE ELFv2, but of course it does work, and if we get test resul=
ts we
> > > may keep it that way, hint hint :-) )
> >=20
> > Well, FreeBSD defaults to it since 13; OpenBSD's new powerpc64 port =
(which is supposedly dual-endian) defaults to it; musl defaults to it on=
 LE and BE.
>=20
> ... and no one ever has sent us (GCC) test results (nothing I have see=
n
> anyway).  All we "officially" know is that Power7 BE ELFv2 was a
> bring-up vehicle for the current powerpc64le-linux.  Everyone tries no=
t
> to break things without reason to, of course, and things are a little
> bit tested anyway because it is convenient to build ELFv2 stuff on BE
> systems as well (if only to figure out effortlessly if some bug is due=

> to the ABI or due to the endianness), but if we do not know something =
is
> used and we never officially supported it, we might just want to take =
it
> away if it is inconvenient.

Void keeps track of recent versions fairly closely, so if something does=
 break, you can be sure you'll hear about it :) If there is a breakage i=
n something common on ppc BE configurations, we're usually the first to =
come across it these days (the Ad=C3=A9lie folks are doing a good job bu=
t they're usually on LTS versions, and Gentoo musl folks tend to be help=
ful, but still)

Unfortunately, the maintainer team is stretched relatively thin, and on =
ppc-related maintenance in the distro, it's mostly just me when it comes=
 to major work, so deaing with all upstreams can be tricky. Still, I try=
 to make sure we don't lag behind too much.

>=20
> > FreeBSD and OpenBSD have to, since they primarily target LLVM system=
 toolchain (with GCC in ports) and ld.lld doesn't support ELFv1 (at all)=
. Void's port was new (and any precompiled binaries would generally be e=
nterprisey stuff which doesn't concern us enough - people can just make =
a chroot/container with say, Debian, if they really need to),
>=20
> Yeah, enterprisey enough, then just rebuild :-)
>=20
> > so I felt like it didn't make sense to go with the legacy ABI (besid=
es, function descriptors are gross ;)).
>=20
> Descriptors are Great, you just do not understand the True Way!
>=20
> > The situation in the overall userland has been improving too, so the=
 patch burden is actually very low nowadays.
>=20
> Is that because long double just isn't used a lot?  Or are there more
> reasons?

I meant ELFv2+BE. Recently support was gained in OpenSSL, for example (t=
hough it was a fairly trivial patch... but then, it's pretty much always=
 a fairly trivial patch; the most common pitfalls tend to be mixing of _=
_LITTLE_ENDIAN__ and _CALL_ELF =3D=3D 2, like, in 90% of cases when ther=
e's assembly code hidden behind __LITTLE_ENDIAN__ you can be almost sure=
 it's actually just ELFv2, but those cases have been slowly disappearing=
)

>=20
>=20
> Segher
>
