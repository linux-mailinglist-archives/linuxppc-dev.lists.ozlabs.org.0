Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80357614B2D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 13:54:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1qj22vgGz3cKV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 23:54:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pwFUNTan;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pwFUNTan;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1qh75Xthz2xl5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 23:53:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A66B0B81D0C;
	Tue,  1 Nov 2022 12:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BCEC433D6;
	Tue,  1 Nov 2022 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667307202;
	bh=//Hxv4m5/4QFRxQRfAon0gk4J4k+/YkMxoNhB+9hSjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwFUNTanDEt0f8mjmDDpk4NWrcYo9Qn4x5XD5ockyCaqypHBIdKaVZ+14azUWPgpn
	 hMjvkwEzWCtqs46Aet/E0rWrEjF7iZIc8xCakHca3Qvn+VV0OOmFYGgRWwhaw+69Dg
	 LwmcaI03269wCwnQfr5NQv1sen/dHOnzrSTt7vvccQ57Ewg9/w2GZYTCGADBk4vunj
	 +iIE/iEpKcrcxV7ZklHDvKeVRfM2Eu6EMuCsh3ngxn1hD22d2GM+eXGWuvLumv9/ho
	 V1NAE6YQ8UPSWU9gvgqd4THWN4omXnkkVegA/TzD/3WTw4ppprmal9bSnZEmXbegZw
	 FAJIKc0TpYNFw==
Date: Tue, 1 Nov 2022 13:53:18 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Message-ID: <Y2EWvokvkixLucg+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Arminder Singh <arminders208@outlook.com>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>
References: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
 <A0B81E7F-BF26-424D-B9E5-5647323B24EC@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NW2sLPhekt1Tv84F"
Content-Disposition: inline
In-Reply-To: <A0B81E7F-BF26-424D-B9E5-5647323B24EC@svenpeter.dev>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Arminder Singh <arminders208@outlook.com>, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--NW2sLPhekt1Tv84F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +    complete(&smbus->irq_completion);
>=20
> I only realized just now that you also want to disable the interrupt
> right here by writing to IMASK. This is a level sensitive interrupt at
> AIC level so the moment this handler returns it will fire again until
> you reach the write above after the completion wait a bit later.

This seems like a valid request. Any chance for a v4? We are so close to
being good here...


--NW2sLPhekt1Tv84F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFr4ACgkQFA3kzBSg
KbZTiw/8Dlg4oKc1MA8MC7mHzNw8On6Tqi9U92KfEJWvk2wK99rdh41lCyBayYdB
4NCFrJeY+Nqu90Buf4Ui2rVom01pPSd9guyDZ+YAyxd+uLSlfrD8R6vCjLbWbXPo
V0SSN0+POvYYZ5XLE5ASIU3MlIMCAYV/+ZgOesqjD7LyraOIcSvt+nEVe7y0BDFX
qDR2LxOZMo512FVzjoloyGicjbhGbbMBm0Xmo4QKWv5RBmxbZIebuEbqnoibtzEe
VXFGULpQt9wJ+q+Tw1S12uKnrV1ds8qX614A1uILui6he0WaX92mIxiN9FGROGaB
t/0vqarPj6zTgmD7JhQLDtxqZcxjzJSE2mMX4ied6NC1zi1H6NFatxyIg7gCLS5b
hlYlhVk2x8IjeCnaeGfrtczmQSSK71xMi34RhS+Ohyic3PG/xWfOUMqDuI2Glfx1
IwkrTaR+WQwb9TJEnH7peybHATPjmeZHG8mC+VlH9c4vtSRXNq8JYXtH+hLCN8kb
vJuHvbsXFpe0NZGCm4gT12g4UhJTM/nVwBxO89j7wmETdf9AMxAMStUepUQpxd4w
M4q0zgnAwT+iSz1qCRO2LT+84J0LH+tV6zfH+NfysoSnjPG+Gi3Ke9RWqJeEME3T
MzPj6d88/qFAMcwN9L9eewvRncGBSqpqBQcSYEBTnEmrVNSZEto=
=tAGC
-----END PGP SIGNATURE-----

--NW2sLPhekt1Tv84F--
