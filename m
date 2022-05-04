Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72B51AF37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:33:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtpSh5KK1z3bxk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OPgq40SN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OPgq40SN; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtpS42WPVz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 06:33:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 731EC617B5;
 Wed,  4 May 2022 20:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BAAC385A5;
 Wed,  4 May 2022 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696386;
 bh=vXTYk+3aszdO2rzyIDTdT5z/Wbvp6+A1bvIq0k3UvbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OPgq40SNq7gJaguRYkkjMVj9iayuns37TLq7WTtexVmYo96BawSe0bOR4K/D2W4FJ
 42rN29mW3xrdhxkvu7lWr7VsGAIamcDlPWsSKqOnvCAAEGsOZSwPm2QUfFxc3OVICk
 MHADMwhuww1L+AX5R+xcXsNXSlOhZ/Ql6Svj83FYkgylGkBHsQZyLx8SsL1hTOcXKL
 rn9h2WZzmZctmPgJT1E6bwcdPStMKaWknN8GS1U+Um4XIT6wjYjAEOhLWfA6Ovwrl+
 C1co2ZH00Lzg1gXRPOskNjAgyRINLwlHU+ml/UYW8ArR9WWCcnlx0o32XwDk2GZI5k
 Jw4G+FQbFQRHw==
Date: Wed, 4 May 2022 22:32:56 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] i2c: powermac: Prepare cleanup of powerpc's asm/prom.h
Message-ID: <YnLi+E+UsgzPUxLJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <f1785f7b2b9f79bb41525e3b5c3e06894852414f.1648833430.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6Fhrsg5OnubBpYb0"
Content-Disposition: inline
In-Reply-To: <f1785f7b2b9f79bb41525e3b5c3e06894852414f.1648833430.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--6Fhrsg5OnubBpYb0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 02, 2022 at 12:06:59PM +0200, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
>=20
> In order to clean it up, first add missing headers in
> users of asm/prom.h
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Applied to for-next, thanks!


--6Fhrsg5OnubBpYb0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy4vgACgkQFA3kzBSg
KbaXpA//d/536N+cHqZzpvwBcWQbwtNpU/Cq/yyV3bsMD4Dtlo6DBSiMr8992OBz
O9lO9ovmg8cVSl5h3zgvwErKd1wLi0YEYkUUmGsaqw+YZ0ReGhEoyZCMVLz2dnTk
oNQ30UiLFdXxi2SbGEPXlMB7mJNpMFioCc/8xPSE2y4deuk3+gWUEoHmHmq9hP1Y
Y+UXfFOIxu2bkJLmOmDvMWoWS/RhzdfHt8Cq8LMOFnsDzhGMvO1UqcLEu8B+rf+l
sWddki6CLeMIHufhGcqDWBIu2oQNfeTPU8+fAaxh/Lu3QBzxoSnQEh3Px0pc3V6C
GAFFu5Les9nYapcXLdTMe3dRajKlHIPBz8HbQ1nlcS9VPoOa/obAmP8J+6eAPseV
py0rxQXjNjAiFrxStkp5fODk7b7FSI3/JvVBpZGTxbSdsDpFM22Tf23PmStdKxST
gmwOXstxkJnv99xmbKmX5ih8hhM/0kjlFTE4MDCo33O2bI2425siWo+VfSpc3NgJ
3i/q0RzwlWJqknZuyNjwYnLZZC57Kh738LDaM56WWl4KHSebsFU3Zihxgj5uJhmC
zYNwJYe3fgpWsXDSiIgkeTkJ1oKEeVWG9n3sXNXVhNVO04exzBHZcOxnfIUbWOso
W2Js0uf2MzcnqHk4hcbj5TCr37i2FsRsFToG3bA03mHNgJGCfBo=
=mCzu
-----END PGP SIGNATURE-----

--6Fhrsg5OnubBpYb0--
