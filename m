Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 396251EBF40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 17:44:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bxD70zdZzDqTG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 01:44:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=CUTTj5UP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fv3EZwpt; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bx8d5MwYzDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 01:41:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9E332460;
 Tue,  2 Jun 2020 11:41:02 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Tue, 02 Jun 2020 11:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=Ev
 3U1+YcxcS0uEY26T61s87WpkkSE9KspJAU1wU5SN0=; b=CUTTj5UPyDx7xx+DE4
 QnWOog/hwvAMAWD3zjgqPQo/Ki11QB5hAsa3up6CghCDPUzgeB1M/36ycMAZEHlI
 +O/zzuIorAuU/78aut5/ugYLShTTgid/utC3iav+TqGpZyUDTG2mtNFAwtxCXkkU
 iJdB/iqxLO0Muh/stRIyUzMhK5V263uK5gzpAnLqevsxrB8KWuHl+838oltBa6qB
 0JgCtN2D5BYV7tnt3fAggPZcB2FE3JlfnkbXdUfvcND6+ZQ7HrChgyUZrjcjFmJo
 85mx0g2a27Ao8Vjytea50FyRU/TG5Rf7LhIjrJosnt6W3FeB/Lrc9HmVfE8iFm75
 RyQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Ev3U1+YcxcS0uEY26T61s87WpkkSE9KspJAU1wU5S
 N0=; b=fv3EZwptw4EJW7eTW8ksztyFSJXuFYJC3W40UkGqQlKpgFQ8C7Pw5a8Jg
 1rGApILg/vJRSxh4SZNKV+yLogixUhbZlr/1mcfTXOfoIKI8vq75MDZ7YrFwQCNt
 RvrolU8sEcf8tg7SijFiTJZlumGlqo/NSP5609eJpkYvWYkv58dTZ5/EexXUbN/D
 fodb9BnLaz644OjmRDTP1kdsnLNifphuFzP4zsLLt8P56T7gUxLx7rdKB500NGkd
 UVPaXiO7qdd4qdGoshfGFLpSynCRX27o2lHYGmPVMpBAlB2U23BBEDzZgZRJOZNb
 8kkKLLIEa2P7dKl9I0oDqBA6nMwvQ==
X-ME-Sender: <xms:DXPWXqWWYyyz1QQqyDCA0A7r0xI1qSa2RO4yDnnVST7BJL-KHwNlrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfffgr
 nhhivghlucfmohhlvghsrgdfuceouggrnhhivghlsehotghtrghfohhrghgvrdhorhhgqe
 enucggtffrrghtthgvrhhnpeffgffgtedvieevhffhvedthfdtteeuvdefgedtheetieff
 feefffeijeeihffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:DXPWXml-0Z0VMidt53b4uoF4FtmlAuXD3l-3R8ffuVat7tquPIA1gA>
 <xmx:DXPWXuaA8feSy4tNepRQKldKPlKzswwXlfNwR58CxbHr5cL3XOWRaw>
 <xmx:DXPWXhXyjRgdAa68vk-f-qy0FBiAOmMolfHcGl0QnICjGP0A6V_DcA>
 <xmx:DnPWXjvXC44PoBVbnMyAIdzTCTM5w6MFK_wnwMNfyqLv-iEmaxtKag>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1990FC200A4; Tue,  2 Jun 2020 11:41:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <454e0d68-d69e-43fc-9a8c-0461dd5817a9@www.fastmail.com>
In-Reply-To: <20200602152724.GU25173@kitsune.suse.cz>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200602152724.GU25173@kitsune.suse.cz>
Date: Tue, 02 Jun 2020 17:40:39 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: ppc64le and 32-bit LE userland compatibility
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org,
 Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Tue, Jun 2, 2020, at 17:27, Michal Such=C3=A1nek wrote:
> On Tue, Jun 02, 2020 at 05:13:25PM +0200, Daniel Kolesa wrote:
> > On Tue, Jun 2, 2020, at 16:23, Michal Such=C3=A1nek wrote:
> > > On Tue, Jun 02, 2020 at 01:40:23PM +0000, Joseph Myers wrote:
> > > > On Tue, 2 Jun 2020, Daniel Kolesa wrote:
> > > >=20
> > > > > not be limited to being just userspace under ppc64le, but shou=
ld be=20
> > > > > runnable on a native kernel as well, which should not be limit=
ed to any=20
> > > > > particular baseline other than just PowerPC.
> > > >=20
> > > > This is a fairly unusual approach to bringing up a new ABI.  Sin=
ce new=20
> > > > ABIs are more likely to be used on new systems rather than switc=
hing ABI=20
> > > > on an existing installation, and since it can take quite some ti=
me for all=20
> > > > the software support for a new ABI to become widely available in=
=20
> > > > distributions, people developing new ABIs are likely to think ab=
out what=20
> > > > new systems are going to be relevant in a few years' time when w=
orking out=20
> > > > the minimum hardware requirements for the new ABI.  (The POWER8 =
minimum=20
> > > > for powerpc64le fits in with that, for example.)
> > > That means that you cannot run ppc64le on FSL embedded CPUs (which=
 lack
> > > the vector instructions in LE mode). Which may be fine with you bu=
t
> > > other people may want to support these. Can't really say if that's=
 good
> > > idea or not but I don't foresee them going away in a few years, ei=
ther.
> >=20
> > well, ppc64le already cannot be run on those, as far as I know (I do=
n't think it's possible to build ppc64le userland without VSX in any con=
figuration)
>=20
> What hardware are you targetting then? I did not notice anything
> specific mentioned in the thread.
>=20
> Naturally on POWER the first cpu that has LE support is POWER8 so you
> can count on all other POWER8 features to be present. With other
> architecture variants the situation is different.

This is not true; nearly every 32-bit PowerPC CPU has LE support (all th=
e way back to 6xx), these would be the native-hardware targets for the p=
ort (would need kernel support implemented, but it's technically possibl=
e).

As far as 64-bit CPUs go, POWER7 is the first one that could in practice=
 run the current ppc64le configuration, but in glibc it's limited to POW=
ER8 and in gcc the default for powerpc64le is also POWER8 (however, it i=
s perfectly possible to configure gcc for POWER7 and use musl libc with =
it).

>=20
> Thanks
>=20
> Michal
>
