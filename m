Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 922881EBEDB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 17:16:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bwbr3KtyzDqLX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 01:16:08 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=fm3 header.b=II3kpKbG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rHE2cxEc; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bwYC4xZJzDqHX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 01:13:51 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9AB18731;
 Tue,  2 Jun 2020 11:13:48 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Tue, 02 Jun 2020 11:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=dj
 6HE39zkFyi21hYY/PMc1ZYR2D9tJGR1pihq3eE9YY=; b=II3kpKbGGd/xA0lFAk
 FIvByRTkW7xQXufvKg4UdKNeQtaeZ3GBCx+kwVnkTiR6w2YDNYmYZxFlMlzSxxFk
 Y6ZrJu0H6msSEnBXrlrvbv5RF0jcMI5J3k833ywNMLaKkbK+SUNAMRkeMzzyjI8P
 DYkm9GHkh2kDG8m7mdCXg8heQlMyQTe4cTB9XxZsN/HzQn+kXtmNfXhCJYS5K9pL
 zHm+nCm8++PyMbolBaxFYcje9bcMWK+uJoXxpY0oKBuL2rTudf4ZirXazM7bKTjc
 CNe82VqFcJUDF/ojTrdTBC4tX+ffYC8+2mQQRpe4l/6g7cJgZyQr+mbtFPecdxsJ
 DSCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=dj6HE39zkFyi21hYY/PMc1ZYR2D9tJGR1pihq3eE9
 YY=; b=rHE2cxEciNBf0a7/JbmiE+THZLaObCgh2j1SZS9kssWbpOkT9mcqvVgc2
 nmEe0AI3naGC5TUzkqIHjU2A8yPT5X+RdvjRYSci6WbBQLQnCYrQ+jgVRrQawi0/
 wZvoiCbl28bLpw9N2Zu6hftwV7S8zjTvHZ0X6BFQ9SwfYYVd4C9ZLw2tOy1byyhS
 XFlxnRamQ0OfF5Bdi5ELAfrKFCIYPFeE2kh0FQLUBiW7eXtIP/YUoBXL7xRtJ+8J
 3J6wUvPSyNX4q0OC1FQVamFDqdkhloD8L1iMP0Em6XWz5e4MfHpewcSx2LhcNvOl
 SdII43emTN0ZQVi1miAUWEeG1bLgQ==
X-ME-Sender: <xms:qmzWXqxOvs0Cfn9ADvhCEzhMvdvkuNqEN6VNGIoBxlJVqmHizsd69A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfffgr
 nhhivghlucfmohhlvghsrgdfuceouggrnhhivghlsehotghtrghfohhrghgvrdhorhhgqe
 enucggtffrrghtthgvrhhnpeffgffgtedvieevhffhvedthfdtteeuvdefgedtheetieff
 feefffeijeeihffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:qmzWXmQjPIsHQQxdmpAietCIc7pcib7tn8OFZI2jZGf22B55UXDKnA>
 <xmx:qmzWXsVB959p8plAIEV33vd5T1xMTU9GPi28q5pLyvpFQyrcl_d1nw>
 <xmx:qmzWXghr3f2dS9E61fDmk5nxdZTRzlMrddmueku1TvPZSjlBJmm1pw>
 <xmx:rGzWXr5tr6F1kdoOfJRQH5f6NG77r9h8xAHis3lvutEF9Akmc3dKFg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BD184C200A4; Tue,  2 Jun 2020 11:13:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
In-Reply-To: <20200602142337.GS25173@kitsune.suse.cz>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
Date: Tue, 02 Jun 2020 17:13:25 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 "Joseph Myers" <joseph@codesourcery.com>
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
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 2, 2020, at 16:23, Michal Such=C3=A1nek wrote:
> On Tue, Jun 02, 2020 at 01:40:23PM +0000, Joseph Myers wrote:
> > On Tue, 2 Jun 2020, Daniel Kolesa wrote:
> >=20
> > > not be limited to being just userspace under ppc64le, but should b=
e=20
> > > runnable on a native kernel as well, which should not be limited t=
o any=20
> > > particular baseline other than just PowerPC.
> >=20
> > This is a fairly unusual approach to bringing up a new ABI.  Since n=
ew=20
> > ABIs are more likely to be used on new systems rather than switching=
 ABI=20
> > on an existing installation, and since it can take quite some time f=
or all=20
> > the software support for a new ABI to become widely available in=20
> > distributions, people developing new ABIs are likely to think about =
what=20
> > new systems are going to be relevant in a few years' time when worki=
ng out=20
> > the minimum hardware requirements for the new ABI.  (The POWER8 mini=
mum=20
> > for powerpc64le fits in with that, for example.)
> That means that you cannot run ppc64le on FSL embedded CPUs (which lac=
k
> the vector instructions in LE mode). Which may be fine with you but
> other people may want to support these. Can't really say if that's goo=
d
> idea or not but I don't foresee them going away in a few years, either=
.

well, ppc64le already cannot be run on those, as far as I know (I don't =
think it's possible to build ppc64le userland without VSX in any configu=
ration)

>=20
> Thanks
>=20
> Michal
>

Daniel
