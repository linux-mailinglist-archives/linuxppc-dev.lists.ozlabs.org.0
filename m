Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB66369E734
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 19:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLnWg4BLbz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 05:15:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZPoSp5eH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZPoSp5eH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLnVj2ht5z30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 05:14:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6CF561172;
	Tue, 21 Feb 2023 18:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD83C433D2;
	Tue, 21 Feb 2023 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677003257;
	bh=55vQ4vuxqdLPNMXiH9FXteJ4euOmT3++dnRzIZaARe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPoSp5eHfpgZRYQttW5kJy+js0VmUfuZoxSK5m5Z6RScU276XD7MWyUyhxCeSF8Me
	 tKqn8RRWnfk9YiWB8nUCV7M0ul56zBisyhhHJ/r7b6LI1nSDfoAQ0sl1D0VC8Otv2q
	 3Tv0rS8q92u3vMIGX37NZA3xLUhn7F5zhL/GY8Lz0rpJFhcBrsAeKNn1fSTo3RS5V5
	 mI3lybp+0tu55n1F6Z2QbQQxY1eQ+w3aLyZSp2KjoZq4ngNwqVa6D+3WXbeuxaLIcj
	 WmT9ZNQIYmuxPV6vqx3vl1F2bla59DuSz22FCZO9yHH/o9UO/yuMU4QvTIoEy95q7i
	 bPCXB4fy/sVHQ==
Date: Tue, 21 Feb 2023 18:14:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 6/7] riscv: Select ARCH_DMA_DEFAULT_COHERENT
Message-ID: <Y/UJ9HowQdsNN+Cz@spud>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221124613.2859-7-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TIgg2EDZf/IvKi42"
Content-Disposition: inline
In-Reply-To: <20230221124613.2859-7-jiaxun.yang@flygoat.com>
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TIgg2EDZf/IvKi42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 12:46:12PM +0000, Jiaxun Yang wrote:
> For RISCV we always assume devices are DMA coherent.

"Always assume", I'm not keen on that wording as it is unclear as to
whether you are suggesting that a) we always take devices to be DMA
coherent, or b) unless a device states it is non-coherent, we take it to
be DMA coherent.
I think you mean b, but being exact would be appreciated, thanks.

> Select ARCH_DMA_DEFAULT_COHERENT to ensure dev->dma_conherent
> is always initialized to true.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Why was this not sent to the riscv list?
When (or if) you send v2, can you please make sure that you do cc it?

Thanks,
Conor.

--TIgg2EDZf/IvKi42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/UJ9AAKCRB4tDGHoIJi
0qtpAP4zXrtuR5siMLRREVaH2TGuvEhGXZZpZVhpdzUNaoIqSQEA9ULHD7KQZrTa
XHUgsMZMeKC10SwAyT/1oU+qjITTOQU=
=swU7
-----END PGP SIGNATURE-----

--TIgg2EDZf/IvKi42--
