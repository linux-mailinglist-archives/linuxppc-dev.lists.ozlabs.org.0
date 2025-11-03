Return-Path: <linuxppc-dev+bounces-13701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE32C2D499
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 17:56:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0d5B5J9nz30T8;
	Tue,  4 Nov 2025 03:55:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762188958;
	cv=none; b=Vb+PcFqOAY2XYaPCRlM1qU3iUvx691rY/DnIidwqdSrDicxQdsbaCq0kub6RjdI6A/smZOmClmxeuap1KEJVgdG6rsTH7iIOwkv4+8Db3CTXinOgfMES2tBn6BYH6atB72iBLKO8J9Z8zSPWTz7UDPsMVHXTc4ajsCd9cEY5Y0limZwzw28Fg0cHXCS0gb7ZJ4DbIZi5Bf0elwynKPEemyGsvQ2OeJtOmL7W72gXuEeBE59sRgTQWT3/KGvD+L2MBQadqp766ydTdmGhhazte4RahACxKEiaoiAHsOI20Zb2cT7iYUtopJKh0ILrJdLzSe55nmFBpLgt7pKLuTElNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762188958; c=relaxed/relaxed;
	bh=BtJIApzR/ypDFDwewvSsH7n60xyLgZASA9+u6fTmTYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6A2yXT8hrUodZkfYZlCRZl/z59smGmEbJ2awT+XJZeAc3wcjfWnL8BiCpnPZsm6PK10smCwJFDJOIeL0KUPI4MKItomWXD+Wo+pTytlPhjRY5gf806Qhn4N9W5omhx9Tyh4OtkVsU9JayO+ypLetstbRaokeootQlWVk0wts4oGB2EuBw54KYIcFjTQEDA7Kpgntv23KpOnxta97/xCx3F55qYYry8pTn44IU8I/JA2zFjpZJPOKmqScwPyodnGt/OG+6++oWrUMMPIQ4HpXmE9XqtPhII6nUcYq/oiCFyayYBOv/+IWvNIXfDIkUcspg1ZsNFZgQX0luTx35d10Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZPmPZfN0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZPmPZfN0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0d595yWyz306d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 03:55:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A286240A17;
	Mon,  3 Nov 2025 16:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28A1C116C6;
	Mon,  3 Nov 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188955;
	bh=norwYxHA6VI/ySU0ex5Ew7OW1FQwMlwu39WjPcjgOKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPmPZfN0yXQ5Ndyhd1mm6d5YyvVQn+2NS84I1P7cyPdxS80PfY2ZucI9nnhbgf4WY
	 s7T0hQkmYh3BvC31fK7wOMt5xVzp7z74BHWa8QiGuneY+AjDKqKSdLT2+rUSqfiIRO
	 dq+CUk9yAJPAVVOoWmGfXhaovQn/CvtO/zMXNg05HM/YIbPUs0MlUvc8htSP7z6LHt
	 MfQNRhhp20WhSWzc6Igwle5mi2X3jI4fgZVoTroQvMzbrqdD1j07JdGxQgKVOnVbrm
	 vd3TNzlzeFyZKWqiC0BIaRsKVR8HfiPDkfKQworpdeGvoSegLcGOaqT5hTJ1SqTz0O
	 PrtNV6DhYV2Ww==
Date: Mon, 3 Nov 2025 16:55:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <aQjemPIbHMplGD4N@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <87bjljw1ra.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyY1KyZQ9jhQldRu"
Content-Disposition: inline
In-Reply-To: <87bjljw1ra.ffs@tglx>
X-Cookie: If in doubt, mumble.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--xyY1KyZQ9jhQldRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 04:54:01PM +0100, Thomas Gleixner wrote:
> On Mon, Nov 03 2025 at 15:24, Mark Brown wrote:

> > which isn't super instructive.  Not all platforms seem to be affected,
> > I've seen this on at least the Arm FVP, Orion O6 and Libretech Renegade
> > Elite.  The diagnostics aren't very clear here but given that I'm seeing
> > the same issue and bisect result on multiple platforms it seemed worth
> > mentioning.  Some platforms do seem fine.

> Can you try

>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso

> which is rc1 based and only contains the VDSO changes. That might give
> us a better hint.

Yeah, hopefully - my infrastructure is pretty swamped ATM and I'm in an
internal conference.  I did kick something off earlier on this specific
commit which should be equivalent information but it'll be tomorrow
before I can get a full picture.

--xyY1KyZQ9jhQldRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkI3pcACgkQJNaLcl1U
h9BpwAf9G2OE1wGg3D/F2WCmsKiRzqX8EJTZWpdThdfvEP9vbPytmPqRt4LoPk9E
cKlt3SaJFVZbyfx2YTDOqcC/FaQr5gdVRVsLuiKavYpVHanTEb/HCx2BvROuDvE2
Ssx3Em7R+eHCyonl/unY/EOt7PP4hUtDizXKblf1rb5I/tM9ADlHYpQSTKF2Poxr
/gIn6gPy89C+hD2rrkQJZWraOVcbciUGJVMWtMKRm96l0pPwdHchsimXnrYq6AId
exk8ECk4hjsPpcarTzTqvJr+UCDMFpF99qq7GWDrkeifMqQqrvR5RY2kcsdyNGMw
3ssV8/Eg6XLVg7GU0FL9k76qaqD7kA==
=et8+
-----END PGP SIGNATURE-----

--xyY1KyZQ9jhQldRu--

