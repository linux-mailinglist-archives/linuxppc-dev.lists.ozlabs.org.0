Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AEA46D50C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 15:05:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8Jq31LjLz3bmk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 01:05:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dh7WNodL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dh7WNodL; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8JpP4jYHz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 01:05:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9B3DB820ED;
 Wed,  8 Dec 2021 14:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D3CC00446;
 Wed,  8 Dec 2021 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638972311;
 bh=vS1icKEjwwFDMks8ZEP6VHIjK8xXwV7tmx3OxQCGPa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dh7WNodLKyM24s9Wp1+uYZ2KSzJJiWdKVYrtanLmUsv5t74iYftQAw7bWw1LWAoqM
 KcIppoQBS6hxp5ZRgslT2XUDa6tLwcW5ONQvitQfNtXSgV7NBS9GkpD79iLRZA5OWR
 vK80u83eimkFeQZqEGYY7JXOvy6dnJU+0zcpuMZlErwmfBgzrCPjZFZABzOLAuwoTl
 cev27RMFydVyvCKmKLnQhnMINCX50WrNNS93repBbTmN0L/EEdIe6XrYPVkEeqouhD
 h/+tTMhO+9WcrrOAGggEJXxBIxfbxk/iDjygQZ/3Z9bX+F2YC9ryGL2Gntp52Jc0rt
 0VRSylJGxhwYw==
Date: Wed, 8 Dec 2021 14:05:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH] sound: fsl: add missing put_device() call in
 imx_hdmi_probe()
Message-ID: <YbC7kffqjbqoPkW5@sirena.org.uk>
References: <1638881818-3407-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rKb0zWUnE/0QDh3m"
Content-Disposition: inline
In-Reply-To: <1638881818-3407-1-git-send-email-wangqing@vivo.com>
X-Cookie: Alex Haley was adopted!
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rKb0zWUnE/0QDh3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 04:56:58AM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
>=20
> of_find_device_by_node() takes a reference to the embedded struct device=
=20
> which needs to be dropped when error return.

=2E..

>  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data) {
> +		put_device(&cpu_pdev->dev);

If it's of_find_device_by_node() you need an of_node_put() since you're
dropping a reference on the OF node.

--rKb0zWUnE/0QDh3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGwu5AACgkQJNaLcl1U
h9DDOQf+J5zK6lF7fGbSzDyocKgHfhSXm+Zi4VikzTPBrRjWBzR7I7Xb3EzyftoK
q8scd1RieKQjYG9+EwWFxAiw3o+L68/BfzK7PGEiiH6PoyGCl0woc87FdYofTIzV
bfWOkjr2i151MEEhmI7Ho00H6jrCvoAYlmyV5aZhjEkv5jLwpzkM0Otk0SIfE5Kw
pzi4d0B35D1JthsWkLp8c4R9SD1zN7G1U/RgXbBTkd3Bcj5LgFK0UpEHKt/ahqqE
mWhpqjAC9q3V0M8T4KLW1riUZ3S2UpW0KYF8y1aoFlrUN8opchz1FFR6J88ddhpi
/KdYZR2CzkcCZcFbxRILlTIJy5q6rw==
=vpxc
-----END PGP SIGNATURE-----

--rKb0zWUnE/0QDh3m--
