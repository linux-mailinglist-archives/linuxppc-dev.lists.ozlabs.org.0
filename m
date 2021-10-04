Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533C4208D6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 11:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNGLc6xZlz2ypX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HiukkA2c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HiukkA2c; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNGKz4SRWz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 20:55:19 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28450610A2;
 Mon,  4 Oct 2021 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633341314;
 bh=YFCi2y5We01CO4jWthApcileUf1E68BaLX3HsCWtl4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HiukkA2c94NU48TdEzLg8LZww7TRptX/ah4YMnIYPeRxf3NmkhissA/Zc3/wOXQJI
 pVJSjAzNHxbRN6YV/OCJNcDnqpAw3dgH24DfzlEmPIiupYstfw/K/DKleugtzY0Bps
 kqDgqs4M04+9SSJ52oOkU4Iz4T5tTGDk4npv4E3lAcQSNAUAEC6RgyQk7ybH1kC7SF
 6uXD4GFixHgvMpFGn2QgIpa9IHTbEivmQeXb+klw4nNn6jdi07tIXR1qTPwA8GxEGY
 NaPqsewByR+1pj7ZrxA9OX+8AYPTNqB92a9ek8N8iNTvQBaiKB0dRrLkaZ291mfZ7s
 2RtwJ2BJUXWPg==
Date: Mon, 4 Oct 2021 11:55:11 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Add Apple M1 support to PASemi i2c driver
Message-ID: <YVrPf4yVFm184LEG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 mohamed.mediouni@caramail.com, Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 Matthew Leaman <matthew@a-eon.biz>, "R.T.Dickinson" <rtd@a-eon.com>
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
 <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZuPCIRixoUsFfcCu"
Content-Disposition: inline
In-Reply-To: <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, mohamed.mediouni@caramail.com,
 Matthew Leaman <matthew@a-eon.biz>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ZuPCIRixoUsFfcCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> i2c-8	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C adapter
> i2c-9	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C adapter
> i2c-10	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C adapter

As Sven correctly switched from %lx to %p, this is intended behaviour.
Run 'i2cdetect' as root to see the values again.


--ZuPCIRixoUsFfcCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFaz38ACgkQFA3kzBSg
KbbRJw//SKg3woVJNLP5I2QTmOHwRjX94iyEpd1AYK4npUv2H1H2YFfpN91e3rt8
I3315rsWg3EABiiMS2ssAv3lNfSIXZcGTaGpFAb6mWYtXr42otvLDhl71AlXxRIZ
QnvyJziR6z7jgWMIxLIW2Wo8dAw9GxTd1UKEQOFSldRIQ1mQ3FXeGjjqWTFyQWGH
8R8ntfHWURCH8+BdZ4UnSPi7RkaTBiVDn3IkmSUZmkleD2in0U998vl0AZ8zJ2of
8iTbqX8Lbrah6p8pEu9zxzvhOQB/BR28LhFEpaDuaq2ikBxmR1uY7GG+PHlhwBHD
YjxMWsm9nZiYWbmrW1c/pBvNwsgpc/VbB04X2JlujXTacsVQmIPqPei3GMRpHWiY
3KhyfByT0tSy48s/Nly59uimegO/dVYmCK90T17POjga6srqkAYHU7yM336bMgwO
hayW1aWjCKyx+AwI0169BKOlo2ODPmDldBqm7jOb/a89jg/28fvqmP8i+B2h4ckc
09b4HHvLt4lC8xNPIS5nxqoTKuHVe5SwJpeirKW8Af02yL40ypnSxiyjBG/BGeOd
xGdX1clp0VpJZvHw1IMDWVj0T3yo6Y8MrLDLEX6hHakpcgixl08s46qOpDcGwUdX
0sJ3EkOqDTCraHZak/wJTI1AIipKxJ0MurcmUYLx+ArrgtjalVQ=
=PnxX
-----END PGP SIGNATURE-----

--ZuPCIRixoUsFfcCu--
