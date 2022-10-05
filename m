Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F37AF5F5A53
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 21:05:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjPCJ6MgXz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:05:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C33c96aP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C33c96aP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjPBN11s1z2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 06:04:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C50AF6178A;
	Wed,  5 Oct 2022 19:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86140C433D6;
	Wed,  5 Oct 2022 19:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664996647;
	bh=ms2LxKUF/+3C5vyCiRLUbpBT+qKWwk5Y3RBszCPvMdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C33c96aPw6GJQctedQVWleVyybb8QjFb7d+tX0UM47FQWEd1Pyqg0MIJmJuZdgSUg
	 yexR7zXQnJmPRyHgHWHZlJ25v0Wb0iQEDpskfZFtrD/3IL837n/PRnVjH7cMneH2Te
	 XsNOum8aVBaFa63pVDLiDTlhTAaZScGejxlrBi/sR76glISTA55/+vJD3jFt1/I0NU
	 kv0m2vW1IX/fIAUGrjfOKbCpNmE6ocaTTMdVc+svfVy/+hTWC0bfnEV/3hL/HyC1vl
	 39uj+EGykFMNZ1zyBLBUbojbQECamCccZPh7+HnOug0Pcv604rBR66bShk6hL1h9R3
	 T3anS2aJRa6gA==
Date: Wed, 5 Oct 2022 21:04:02 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Arminder Singh <arminders208@outlook.com>
Subject: Re: [PATCH v2] i2c-pasemi: PASemi I2C controller IRQ enablement
Message-ID: <Yz3VItDOw6mYwxak@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Arminder Singh <arminders208@outlook.com>, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, benh@kernel.crashing.org,
	chzigotzky@xenosoft.de, darren@stevens-zone.net,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	marcan@marcan.st, mpe@ellerman.id.au, paulus@samba.org,
	sven@svenpeter.dev
References: <Yzl16W6+poH8/8h4@shikoro>
 <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bvu7jPk+VeUHSDVn"
Content-Disposition: inline
In-Reply-To: <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
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
Cc: alyssa@rosenzweig.io, darren@stevens-zone.net, sven@svenpeter.dev, marcan@marcan.st, linux-kernel@vger.kernel.org, paulus@samba.org, asahi@lists.linux.dev, chzigotzky@xenosoft.de, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Bvu7jPk+VeUHSDVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Does fixing the alignment issues and the commit description justify a v3
> of the patch or should the minor fixes go out as a "resend"? Just not sure
> in this particular case as the fixes seem to be very minor ones.

Yes, please send a v3. Since you are only fixing whitespace issues, you
can add the Tested-by tags given here for v3 already.


--Bvu7jPk+VeUHSDVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM91SIACgkQFA3kzBSg
KbZ+EBAAnMxkC4kEf5fVj8TlIzY2ZTuYiGbsJBZk2QBuUCBtuLUCvwOLtc9+GRDu
+9o8dkey0GskEOeJOHlCdL7v7t/q0lxXwkRyJnAhZ35ykhPnNCmNqj3aKKxi94fE
QKqhIpR6hEbN5okcdYngYA9UOd1LM23IFXcSEnuw9KaeMWJLzLfJU6xh2N6drOZl
+IoyqPXXMwlGpqX3y/dI84XSxJZ3VfCMZNj6bfe+YvoJO6iyZBrvgBL5fNpch1HI
3ID+7nQEbGZaV9B0Bh22PVYgvc34FyfwUZbnhtSIAgr3aIPGqTvM5n7eDCnNRAEW
YppgIO6CiH3SalgavJqLENIEjf3zm63U8YH8bVMYQXHOFIspu4TyRJewGcgGNEcx
NMKDxUFJ36EB2h8qtqoREo+36bvdMzmobrnJ5M/3yLOFbXvpejMdkq9G9Jsqlst6
jeXQwZ7SaXI0HFxgwp/NtIYfvogi2UEuEWyOYPQCI85f/GlcpT9HEp6EP48P3+rD
wKY1jAW07pbPTr1qLSkjiNORyQdBWMUb9w6BkjPYW4+ZAHvtIh/F3ohOwPdA7Q1b
Kqa1eX2y2Vl36GE7Y56lnZWTSfeFDc867EVp264lG82gSF4ejd4qeOjkfE6u0iOx
CLdQiuFpO158OxZHfz67+RNXlDrLoPLTvpPYiI/mH+IDDKKVVSU=
=yR5q
-----END PGP SIGNATURE-----

--Bvu7jPk+VeUHSDVn--
