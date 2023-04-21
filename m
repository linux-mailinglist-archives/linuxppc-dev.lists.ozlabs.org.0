Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F055C6EB23F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 21:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q34J06GJDz3fX4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Apr 2023 05:25:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1uQO+lQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1uQO+lQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q34H72fK7z3fHP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Apr 2023 05:25:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A572F60C88;
	Fri, 21 Apr 2023 19:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98362C433EF;
	Fri, 21 Apr 2023 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682105103;
	bh=W7uWtRhn74gI5DdykMl9Ygbat47KEyixL2s+R7CXf4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1uQO+lQn46h8sPkUIDTeuuuaqYEuXAC5XrVOBAwjT+6B4j8NizF8+Bhcmg/SbXDx
	 R35KPmFskBNMwE2hWOlTsNitogRtztEI5E/BMcoea1Ygr0ah4ez9K+IKV/JXLH8xg+
	 2hSscDX7Y8/QQfQ0dNAJrbGWNpjH3G26G1l8YL3wv2N927leM1laIByU2Nknx0W5Lh
	 9qUiz7pT6ig8062P2j0qb4E+8nVCmlLsP5ZWFcalVG/T7mul1u92MUMzR6U/UeaO7S
	 IR77iLd+n3LXOoNWDfycqXuLnHTaBxVfi9wkSaVNIx9yoRUXcGRCx1vUEBj83/9xev
	 DJZslEGbLEeSw==
Date: Fri, 21 Apr 2023 20:24:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
Message-ID: <20230421-uneaten-obvious-250d95c86560@spud>
References: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
 <ba235aa677a561ceb2dc776414403dc0@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cYLCWmWMPROB1qtr"
Content-Disposition: inline
In-Reply-To: <ba235aa677a561ceb2dc776414403dc0@linux.dev>
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, linux-kbuild@vger.kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, bjorn@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cYLCWmWMPROB1qtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 07:10:14PM +0000, Konstantin Ryabitsev wrote:
> April 21, 2023 2:59 PM, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:
> >> riscv: Use PUD/P4D/PGD pages for the linear mapping
> >> (https://patchwork.kernel.org/project/linux-riscv/list/?series=3D73360=
3)
> >> base-commit-tag: v6.3-rc1
> >=20
> > The QEMU CI has some way to say "this depends on an un-merged patch set=
 sent as $MESSAGE_ID", not
> > sure if that's a b4-ism but it's a bit less confusing.
>=20
> I think it's patchwork-ism, actually. B4 will eventually learn to be
> able to include dependent series info and automatically retrieve/apply
> them in the proper order on "shazam", but it can't do that yet.

A patchwork-ism or a patchew-ism? Drew Jones was my source for this, but
he had said the thing to do in QEMU-land was put a:
Based-on: $message-id
in your cover letter for each thing that you depend on. I'm not entirely
sure if that meant each series or each patch. I think patchew picks that
up and dumps in it on a patchew github account that the CI might pick up
on. From the QEMU docs:
<quote>
It is also okay to base patches on top of other on-going work that is
not yet part of the git master branch. To aid continuous integration
tools, such as `patchew <http://patchew.org/QEMU/>`__, you should `add a
tag <https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg01288.html>`__
line ``Based-on: $MESSAGE_ID`` to your cover letter to make the series
dependency obvious.
<\quote>

FWIW, my vote is for something with a message-id, rather than those
patchwork series links that you can't dump into b4!

--cYLCWmWMPROB1qtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZELjCgAKCRB4tDGHoIJi
0s1yAP9XTAhQrJD/xmNk2JTUsPIU6e0uJxU1rNaDElF8T2ioggD/RuvGZYpDeAT8
rVM1QBn5DNrHVZWw5EILFxMXOgo1hA4=
=0mnA
-----END PGP SIGNATURE-----

--cYLCWmWMPROB1qtr--
