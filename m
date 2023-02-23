Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EFC6A12BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 23:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN6tv0wCsz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 09:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqvoO2IV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqvoO2IV;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN6sx4gJzz3cfF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 09:20:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1A45B81B3E;
	Thu, 23 Feb 2023 22:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242CDC433EF;
	Thu, 23 Feb 2023 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677190832;
	bh=/RlH+uTaquKSn6/TiMh8xypzok73Zt8sPG8pAcmRmTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqvoO2IVOtcWr342wVoa8dpa33bpVLtuRSUYfEPcNnBl2AVduvoZmVu7l/xjE073r
	 7agFjiIId/cqkG1fHGZ/+aWjvkI57OT4L6wkVbP6cC7gt5j/fN+iTzEMjoyfIfNM19
	 wkEuxsSU5mPVRQtXCK5GY9NQnQ3NhGZU0/itVdkSlh0ZnZkIMVD8ZZgtjT0j8UCkiW
	 PN+0ECz8fyhhRN5pd7gxZxwLEawkUL7+DYpSLCVocr1fLoyk1wbkR9Ho0BRjy+xi8+
	 PRNHezUHVBpoqeJ8ZwIsVEZDEZ9D/VQlNFZafspIKpVpK/oQqLCB7NbAO+ei6lffjK
	 rPt63LArumsZg==
Date: Thu, 23 Feb 2023 22:20:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 4/5] riscv: Select ARCH_DMA_DEFAULT_COHERENT
Message-ID: <Y/fmqwboOv/JhWf/@spud>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
 <20230223113644.23356-5-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTYFjkFK/Dt5/rMq"
Content-Disposition: inline
In-Reply-To: <20230223113644.23356-5-jiaxun.yang@flygoat.com>
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--QTYFjkFK/Dt5/rMq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 11:36:43AM +0000, Jiaxun Yang wrote:
> For riscv our assumption is unless a device states it is non-coherent,
> we take it to be DMA coherent.
>=20
> Select ARCH_DMA_DEFAULT_COHERENT to ensure dma_default_coherent
> is always initialized to true.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d46a268ce16..b71ce992c0c0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -233,6 +233,7 @@ config LOCKDEP_SUPPORT
> =20
>  config RISCV_DMA_NONCOHERENT
>  	bool
> +	select ARCH_DMA_DEFAULT_COHERENT

Since we are always coherent by default, I feel like you should put this
in the main "config RISCV" section, where OF_DMA_DEFAULT_COHERENT
currently is, no?

Wouldn't bother respinning for that unless the dma folk have comments
for you.

>  	select ARCH_HAS_DMA_PREP_COHERENT
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
> --=20
> 2.37.1 (Apple Git-137.1)
>=20

--QTYFjkFK/Dt5/rMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/fmqwAKCRB4tDGHoIJi
0leFAP9uQuy0NP1f84CZIhkE/FTxQbCtqVp7mJK2gG8h1AzO+AD+I8qU90iT/HH9
zh/cOUlKSuqIp7B4dD2guraiIpMV2gc=
=YsJz
-----END PGP SIGNATURE-----

--QTYFjkFK/Dt5/rMq--
