Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B9467D2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 19:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5Lkf18F7z3cR0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 05:21:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qw4NTfMG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qw4NTfMG; 
 dkim-atps=neutral
X-Greylist: delayed 596 seconds by postgrey-1.36 at boromir;
 Sat, 04 Dec 2021 05:21:11 AEDT
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5Ljz2wqLz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 05:21:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E780B62C73;
 Fri,  3 Dec 2021 18:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB94CC53FAD;
 Fri,  3 Dec 2021 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638555067;
 bh=igFrEeJpF2OZf9Jo/80sQz+WH1Z+Faa3wH+gun1zpGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qw4NTfMGNzvYUWRtyWUWBWIFfJbMRl1w+tXmritIu3cq5/GhmZFF7C1Ek7BeaO+7o
 sg2mlee98y5i72D4684ISJFsfqeJWZl45+7nNvmNYrAZaP1x2k81A9hFFeCFZp8hrE
 Wt1vOsMs0G7Op+LNIER1akRdDpHd5Qa/r4czfcErcJd4wRPAoDtT7rlGSC7d2rr0+y
 2d7cuZ9RKtiYbabKfVn30ibthkO8FYNKb/ufKjAjZD9GkYBcU81qdm7VI1YeQDi33z
 cWodv7KJTcjNzWt6aXf3pwNDX2YXSGH70wE6gGJYg8xp4O22l6x2uoRTawksDCK61a
 PLAuMJN8v+GXg==
Date: Fri, 3 Dec 2021 18:11:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Message-ID: <YapdtAAbrhJ8kW0M@sirena.org.uk>
References: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lh3+hiHCqE5cETDw"
Content-Disposition: inline
In-Reply-To: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
X-Cookie: Don't get mad, get interest.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 bcousson@baylibre.com, perex@perex.cz, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lh3+hiHCqE5cETDw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 02:50:17PM -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchsets:
>=20
>   [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
>   [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--lh3+hiHCqE5cETDw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGqXbMACgkQJNaLcl1U
h9D2Cgf/R5khnlu5BvBDSME0pvpG+4+PjCkPFKi3+kdhK7Onjmyln1gLD2p/pjDl
C2EP3YXQcgiUywBXBrCblKFmsu2XQjqlCco9TcYbnmBzcmtROfr+m3vGVgsVFAtY
3R0EhJtfcHTVzhtgQokgsTNeUITGdjPFmU/VozNqdDUObyBP2VLr/l4eLtDcEWF8
RteHve4FrIcJxTQjYNMpAsIBB5ztm2l+IuFI1kAnIcfG3iDgDNaNHeENbhgKIjiU
LES7XBsQbDmO7S8svN213VOLmfUowwAL5I6mnJBZlkTPATA7zMkZnvMk8L59nnsS
rgual2IJtpkc4Viaq4BYba1kKrcWXA==
=gP64
-----END PGP SIGNATURE-----

--lh3+hiHCqE5cETDw--
