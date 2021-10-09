Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90B4278F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 12:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRLSS2wjyz30RN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 21:11:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vG7tFpqb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vG7tFpqb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRLRn0yK9z2xsC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 21:11:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CA4E60F11;
 Sat,  9 Oct 2021 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633774259;
 bh=I6yMirQXjiY0IGJ/jzB5Ca8tnIUYDvJKAySCD1HCIys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vG7tFpqbwu5nzsyK8zmVciBzlw+Ez+Bh6JWj3b8nvaw8Q7D8FRtysS7kh/YDjXRSk
 o/VmqAB3y8SNX473asU8TMujwhARhh2dgDP6Gm4e7e7NbibXdDo/nfr5KuaF2v2bqt
 fsoidYBXlSlGq+Pz9VICbkAUre058xEY+ymAZ8CAZ0+k65fKaEH1l6pRCwZaLqM65i
 XGABgvwrV0+DrWg4xk4tDerAEYrAgcqnB7IRBWHjx66WgZg+MM0woGFjp4cxJLzl2C
 xvJ5sTX2pJoW0sCUzsud5ZZKnXDzgP4v7vWusyurnTaXLBa7LYKE3bs1/mFSnp+4PM
 aobz952pw9C4g==
Date: Sat, 9 Oct 2021 12:10:55 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Message-ID: <YWFqr4uQGlNgnT1z@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AjEJq1EXRZyEzc7Y"
Content-Disposition: inline
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--AjEJq1EXRZyEzc7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I still don't have access to any old PASemi hardware but the changes from
> v1 are pretty small and I expect them to still work. Would still be nice
> if someone with access to such hardware could give this a quick test.

Looks good to me. I will wait a few more days so that people can report
their tests. But it will be in the next merge window.


--AjEJq1EXRZyEzc7Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFhaq8ACgkQFA3kzBSg
Kba+5RAAoKYeWy96McCs12xbnzgzEDhLea9/Qt4ptal6FD4k1Qd9Aq8jbnOBxYqd
OP1eWehepNLlQoVW9MpQ/mwL/bZH617rm0lXyZ3i0l3cRJ7TYx1VpKsAqqktS5cL
cLpzs0T9CKohcAnpUzmHCG/K6DhIMJM+dprDvW2cGWEtKfNAkhsiJ9jr+fdywfuR
3rrbxvTnVgRO5urI6NJcgtGmTmZBn4bCsnOLeeYyOQmqEgUQ5uyl++cPqdJppxS8
lCUqrKUuVsRWDqyxqbanNd0rlUtaqH4w8BemMqGmiqKSe5w7getSlJWRCKSFOQNu
yYNdu2WSlyQFKBfPbCswE39GnhHh+4Bz6yanjCCEtwZWbkPWLfnpHshpiUAwiBRQ
MzGFEY3G9TgguV/Vukstmi5mX9TcaiocSAMg830b4b49GS1J05nOSfDP87wIpm7H
Ce61h5Jb764YCn27DqGodeAx+2sQGMcgyDxtIrEHogI3Sf4ZnKRm8iGnf9Z/dtx9
7ZPQcpFkyBbalinYTD/3WuMqhxZZt2otdyawwQ3ZsqUT31BhUEMwp7yCzIctw+N7
OpV6at+8YcjJtALKdvhn6H/HfriIdz9xu1EoSKKQ3t9NSLmAcJk8mcAUAnXdIulM
N4WQk8q9PSxkkbsocy6Gr2MixXjxwji1442g0L5CBh/2TcbvLsM=
=GqIM
-----END PGP SIGNATURE-----

--AjEJq1EXRZyEzc7Y--
