Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8A336D9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 09:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx20b6NvPz3d6b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 19:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FhylOKgC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FhylOKgC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx20C2vPFz3cHH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 19:18:51 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9896B61554;
 Thu, 11 Mar 2021 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615450728;
 bh=pcPYx32koDPoQYOnqgHXzh5B1hR+EWUWAY4YkutCz7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhylOKgCVND8Y9Y2qTErMZIg9mJ00+UGrQGUmieOjOSW5LUWaOGH3h7pggBgVtPM6
 qaWJLoyx9SyhQSOm2amdTZTMFZZJ5NCzmS6kOlMQ/QvdEJITkfJpv79fBqd68P9Stb
 PU12e9hpkKqsSTxjvUi9D71ycfDUZi5XpohwQopGd7U4w+TwGuuzoKeeTXRH/LSQ4M
 7sm3ZXipdFxylhKPtQSkpbebDumT0kKCyn5DFRyxtMOjWHZD0ZkGHHUzJDDXljSaGN
 k1gpUo7jMM0qcYLnnCeRrgSOurn9a1NSfEFeEGQL6UqoXcH3WTEGMehDt96Bljow5D
 15PMBuTs/E1gw==
Date: Thu, 11 Mar 2021 09:18:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210311081842.GA1070@ninjato>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
 <1aa0dc23-0706-5902-2f46-0767de0e3ad6@alliedtelesis.co.nz>
 <d5045879-45aa-db38-e6aa-4c8ea3e62f6c@roeck-us.net>
 <b41a802b-2833-13fb-58ad-1762a3507460@alliedtelesis.co.nz>
 <d37a114c-fa3f-40e8-4d85-52eb1ff03c37@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <d37a114c-fa3f-40e8-4d85-52eb1ff03c37@roeck-us.net>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Bummer. What is really weird is that you see clock stretching under
> CPU load. Normally clock stretching is triggered by the device, not
> by the host.

One example: Some hosts need an interrupt per byte to know if they
should send ACK or NACK. If that interrupt is delayed, they stretch the
clock.


--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBJ0l4ACgkQFA3kzBSg
Kbbb/w/8DLizM94FZ2EJrsVVPXMLUIQDEIGL3ujBX2GyAsv6HeYmKAJzuE4QhMyE
kE+xExT0T62C8UpKJ5ZHpRYzWXLgiJEucIOS2qlLEjn29rhI+u6bTd3LfPe/YpyB
qMDuUzwLg4KiOPbiyX856rvJ5KOG/EN2owyWxZPXgKuKqqSUe+ewXIaZzu8l9Z8D
qzvSjMhvWdisp976ZCj6ZK1U8j2iHtbijGiOIdmCvtH3TaLid1Tie/BheiwdQMPo
2yDRYK4XkZDwcd8E0qRDN3Ew8Vv71hQH+uSiW5/cGxWSvXO3j16OuQH9TObSI+KI
WAdnpcTyudvinJAnw5xBhm3Jmc/dbTDh0KYFHrPJS09qBg62D2zRKlG0IeFA/p3v
VWmVk6cklvAemFo0iBejL/O9at2ItOZ+M6n3M4zVsuxGM88roenQQ9S74QxXgBKj
roGq1udYl7LJUxDDswBwGyGTsHWcMfjDTVgimEYlvxlPkjJbg7qv0iHnLCl7hi2G
MZMl28mpaWEmkQMAsiQygwezbEgTYGmV1xU7lVxeqDq3ypI51bsInMP3yc3LPalz
wA8Grj0ZQloVpPWyZHu5sAVIKvEafk3NsDvfNj1rOLh/XBsGQRGv8qRuqqjQfecw
YHTA/PJJ3Wn+i31hH9bqVkRVjgyq6iCeEP4STaAu3dCHKQFaXfs=
=FkGx
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
