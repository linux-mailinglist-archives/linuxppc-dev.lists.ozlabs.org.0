Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAA07A6878
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 17:59:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=JLWZQZuH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqmZT744zz3cDn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 01:59:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=JLWZQZuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=n8pjl.ca (client-ip=185.70.43.23; helo=mail-4323.proton.ch; envelope-from=peter@n8pjl.ca; receiver=lists.ozlabs.org)
X-Greylist: delayed 79351 seconds by postgrey-1.37 at boromir; Wed, 20 Sep 2023 01:58:58 AEST
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqmYZ1nTlz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 01:58:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
	s=protonmail2; t=1695139129; x=1695398329;
	bh=iQ70sqOuWy3+EASwFa0/309PrDQXmYm3GtUvJiKCnbc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JLWZQZuHawh1kmZgERsEMV6LqT29GcKLho21jKqkgPF1sD5uLFx8MbQaN34J1I4p7
	 m4P68h8x4rYi2/a7K1ML+IcH+b1egMO9vVMZujHDO931fFajAvsXbs1p61rP5VH2aU
	 lfrbBRzXdoQl6hLJE/IyC7na/C0Px9G2LsB6odzXoj4TX4AGzH9v8z/HrpIcLfJ+Bn
	 77XAFrVcZvKoHBnmYVNTIfvfyWjli4k4Dr3fcc67nkjaKIoVsn029amWaWUYG2mke/
	 lcqdwSK9XpRY//BoHx1XHXdR9A3Ld7auTD+jhwsmMkmewEIWzNcmdzujAE444Ounxy
	 2CVfqDCByas5Q==
Date: Tue, 19 Sep 2023 15:58:41 +0000
To: segher@kernel.crashing.org
From: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Message-ID: <20230919155832.4179-1-peter@n8pjl.ca>
In-Reply-To: <20230919151630.GO19790@gate.crashing.org>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org> <20230919000026.7409-1-peter@n8pjl.ca> <20230919151630.GO19790@gate.crashing.org>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-sh@vger.kernel.org, linux@armlinux.org.uk, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, peter@n8pjl.ca, linux-alpha@vger.kernel.org, geert@linux-m68k.org, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 19, 2023 at 11:16, Segher Boessenkool wrote:
>=20
> On Tue, Sep 19, 2023 at 12:00:34AM +0000, Peter Lafreniere wrote:
>=20
> > On Monday, September 18th, 2023 at 19:41, Segher Boessenkool segher@ker=
nel.crashing.org wrote:
> >=20
> > > On Mon, Sep 18, 2023 at 05:56:09PM +0000, Peter Lafreniere wrote:
> > >=20
> > > > ReiserFS has been considered deprecated for 19 months since commit
> > > > eb103a51640e ("reiserfs: Deprecate reiserfs"). However, there are
> > > > several architectures that still build it into their defconfig kern=
els.
> > > >=20
> > > > As ReiserFS will be removed in 2025, delete all ReiserFS-related op=
tions
> > > > from defconfig files before the filesystem's removal.
> > >=20
> > > This is essentially equivalent to deleting the filesystem now. Why do
> > > this? Is there such a hurry?
> >=20
> > This is not equivalent to deleting the filesystem. The filesystem can s=
till
> > be configured into kernels, and few distros use a defconfig kernel anyw=
ay.
>=20
>=20
> Most people who compile kernels use defconfigs though. Distros are a
> tiny minority if you look at builds.
>=20
> Again: why do you want this?
>=20

Because the filesystem is deprecated and rarely used. Those who do use Reis=
erFS
should migrate away from it or get ready to stop upgrading their kernels so=
on.

This removal from defconfig:

 1) Serves as a reminder to those that use the fs that they should take the
    above actions, but with the filesystem staying available should they ne=
ed
    it.

 2) Stops building an obsolete and largely-unused filesystem unnecessarily.
    Some hobbyist targets like m68k and alpha may prefer to keep all filesy=
stems
    available until total removal, but others like arm and UML have no need=
 for
    ReiserFS to be built unless specifically configured.

 3) Arguably simplifies the removal of the filesystem when that takes place=
.
    This point is admittedly quite weak.

 4) Has to happen someday, unless someone steps up and volunteers to mainta=
in
    the fs. I don't find it worthwhile, but you can if you'd like. Perhaps =
work
    towards removal will cause a user to step forward and keep their belove=
d
    filesystem around?

 5) Doesn't actually remove support for the filesystem whatsoever. I can't
    emphasize this enough: users who build their own kernel and maintain a
    niche filesystem like ReiserFS should know how to flip a Kconfig switch=
.

>=20
> Segher

Cheers,
Peter

