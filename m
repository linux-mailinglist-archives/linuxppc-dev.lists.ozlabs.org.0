Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1893F898
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:48:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGBYnPIB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXh6z6KT1z3d4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:48:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGBYnPIB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgyy1qZ3z3cyb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:41:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DB2A5CE0AF1;
	Mon, 29 Jul 2024 14:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432FDC32786;
	Mon, 29 Jul 2024 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722264070;
	bh=Q1+AFnT8npjT4Lpzo89th+2c5Ce2NhXgTpXjWRxaQgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGBYnPIBHtddODwHKJTwc5SNcydiu0rIYiiTdQSD6Jcfh58muUgxoWWx1HGhX+dBA
	 q4aNdnMat9XV/dJSr0Krv+/572bI25pLk/Mw8m3pM/U67w+XRoDfY2+d4KHpmcz3zd
	 fs7kdyp/5OPkGmfFhDPiV8SESJ0AtpesUlGHkWwO5faFczHM1ygCJXXDhxZQtS9nMM
	 L7cFmnCjTkawc8+Es8/SthD6tGXrnfkoP8QVC8hDN+yc/Ow6VOcYYv+1KldeWxoBo2
	 ImEtsNVE8MBdBTpOGXTm/zjat/YsFzJyu+drwCuJE0zSeQMzp8zqe1jcPiaFpveRI2
	 IYuXCKTTYBmqQ==
Date: Mon, 29 Jul 2024 15:41:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <8a6135cc-67cd-4fbe-96fa-3598491c1c66@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
 <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
 <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
 <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
 <a13c3d5e-6517-4632-b20d-49ce9f0d8e58@sirena.org.uk>
 <ZqPLSRjjE+SRoGAQ@e133380.arm.com>
 <a52f1762-afd4-4527-88ac-76cdd8a59d5d@sirena.org.uk>
 <Zqemv4YUSM0gouYO@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hJtaL31y4F/8RS76"
Content-Disposition: inline
In-Reply-To: <Zqemv4YUSM0gouYO@e133380.arm.com>
X-Cookie: List was current at time of printing.
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--hJtaL31y4F/8RS76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2024 at 03:27:11PM +0100, Dave Martin wrote:
> On Fri, Jul 26, 2024 at 06:39:27PM +0100, Mark Brown wrote:

> > Yes, though that would mean if we had to generate any register in there
> > we'd always have to generate at least as many entries as whatever number
> > it got assigned which depending on how much optionality ends up getting
> > used might be unfortunate.

> Ack, though it's only 150 bytes or so at most, so just zeroing it all
> (or as much as we know about) doesn't feel like a big cost.

> It depends how determined we are to squeeze the most out of the
> remaining space.

Indeed, I was more thinking about how it might scale as the number of
extensions grows rather than the current costs.

--hJtaL31y4F/8RS76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmanqfsACgkQJNaLcl1U
h9AXbgf+JtPrAvhLYf2ZdjhYtqAh1SMzgRQmESORZGriT/8kYjk9Mo4NTTvAC2Yn
/VfRFTo1v4jtdJYliDP8UNjdn0/QJDc/vV8wuWpM2OuGhJIY632rnSXGdUKRyg1n
x2CMonSmVuyf9RgJv7ycXFXL2p1CqtQTJ1s1B/q+JMxL0qRTtPouELOvuEzsk6Pu
cr0MQ6m9KR1RlhfmTeW23zy+Diwyrgj9E6Fp5vHHU31sK1rYS7z7ODNzWxhBOkdw
JY29M0Zsww4EHQqBRB9CoPAKSbx3GgG6c5yo6BHxem4Fpun2mq0OKuIfobbb8Luk
psf1yW9CJPnOO6ekMQXlpmPZwS1CPg==
=os6B
-----END PGP SIGNATURE-----

--hJtaL31y4F/8RS76--
