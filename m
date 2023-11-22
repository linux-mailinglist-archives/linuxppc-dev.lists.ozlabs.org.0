Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A468E7F450A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 12:43:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WBqiAAQ2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZzs34HVFz3dLF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 22:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WBqiAAQ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZzrC3HXMz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 22:42:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 718BFCE1DE8;
	Wed, 22 Nov 2023 11:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAD1C433C8;
	Wed, 22 Nov 2023 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653350;
	bh=QEKSREZFB9WcaZBZKKMacGvB5GHLDryHAUrK5PwyzeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBqiAAQ2L28tf9RBZgy3zkdD02qnghFQovUzDCLddDVS/blqqN03OejYwzMPFRTaD
	 aneNmQlPQXa5R41Fm/hNHNUHglVTWWoiNVsV1ijnMeet9atGN10P+HhKBx7SZy3yJR
	 Q2yXF0FIAi8V9bRzDl6HwTY3OGTZIiBKcNOIJl9ggZWfSQfSxwOIk1pawH4fcd/LGe
	 nAOPB9MwDW6P2BpOqu8LN7gd9Iey77qqozVvAq7BQxs9aS+VyiMiOgehCdBEwYqNTq
	 W22N8LsD1LvYo7qJf4esfClOt2IeZabgCiLjDRR30j4PlbDK6sCX1l6ibTmp/Vdr5m
	 KfnCAUISVWmtg==
Date: Wed, 22 Nov 2023 11:42:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] ASoC: cs4270: Remove unused codec
Message-ID: <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
 <20231122062712.2250426-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sizIwLURlAo5DBqL"
Content-Disposition: inline
In-Reply-To: <20231122062712.2250426-2-mpe@ellerman.id.au>
X-Cookie: Slow day.  Practice crawling.
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, david.rhodes@cirrus.com, nicoleotsuka@gmail.com, paul.gortmaker@windriver.com, rf@opensource.cirrus.com, patches@opensource.cirrus.com, perex@perex.cz, james.schulman@cirrus.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--sizIwLURlAo5DBqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 05:27:12PM +1100, Michael Ellerman wrote:
> The only driver to enable SND_SOC_CS4270 was SND_SOC_MPC8610_HPCD, which
> was dropped in the preceding commit. Remove the codec as unused.

There's no real overhead from having extra drivers and we do have
generic drivers that people can attach CODECs to.

--sizIwLURlAo5DBqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVd6SAACgkQJNaLcl1U
h9AI/Qf+J4DIRnTf3NQShXZHpoX3Pl0SkRoY1ASOBLv/amwIrdoVcjmfHrm8Mth0
cJtFdkyQmmjeem1kXEZm29r1Ro4GyCaRUYQah6JHIbJPJbIOwStqbdI2WmYL8jw1
GO5y4mE6ZVg3dUXwFm6znHoylg3FRrVaLxGxBnXyrL3MMNuz9uPyDR1rFUFTl8WU
lvMR2VOuMawEFJ1GiQ6aaaLu9t8i+8VvoKSn7GD1xTI2tU9PppIT4R0s3CUogNjK
DRx2A9aLQcQmdXN+2LykYfsOw3UZUwOEZGQXZwSNKYXRKu4reowv/ytzO8RaEAxh
h5OlnboVbe6voabyne7F1oieLvRg+w==
=YIcX
-----END PGP SIGNATURE-----

--sizIwLURlAo5DBqL--
