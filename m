Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EFB7496F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 10:55:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vQz01X9bzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 18:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=samsung.com
 (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com;
 envelope-from=l.stelmach@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.b="g+76une2"; 
 dkim-atps=neutral
X-Greylist: delayed 573 seconds by postgrey-1.36 at bilbo;
 Thu, 25 Jul 2019 18:35:44 AEST
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vQXJ1lHFzDq9y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 18:35:41 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190725082604euoutp0298369481026adc27ece657c7cd5fd8e3~0mPi3EqjD2558325583euoutp026;
 Thu, 25 Jul 2019 08:26:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190725082604euoutp0298369481026adc27ece657c7cd5fd8e3~0mPi3EqjD2558325583euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564043164;
 bh=gLlrYGwYAg2QhLg8MnOUjG5G1VY9PY6suInEcRfdv34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+76une2oMCdnfZamXlpJ5U+2ejcyxsxJ5AjJaCx8Rp9YMgCVUQ4zxaaATjlR3rtA
 cl3AswDcEMMPQ46SW+qZ0cw+LrQJZamd1YvXy/f6A2ZaGe0VVTO9YRMuC2WHJiwI41
 t6imSkLV+wzfhrN45Kp14N6570da0aFXe70fIh5s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190725082604eucas1p2c4947128af3e9e7521558d942abf491f~0mPiaDKa42775827758eucas1p2A;
 Thu, 25 Jul 2019 08:26:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 27.36.04377.B97693D5; Thu, 25
 Jul 2019 09:26:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190725082603eucas1p205a74e93ec8ce40a1decf9cefcaa970c~0mPhuTa-l1858618586eucas1p2I;
 Thu, 25 Jul 2019 08:26:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190725082603eusmtrp1c1935d1b20d18d2010f33f620834ee09~0mPhtaZ1N2022620226eusmtrp1u;
 Thu, 25 Jul 2019 08:26:03 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-e9-5d39679b63f3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 14.35.04140.B97693D5; Thu, 25
 Jul 2019 09:26:03 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190725082603eusmtip14f6485b9301b1e4daf78576861c67994~0mPhjBqMH2354123541eusmtip1L;
 Thu, 25 Jul 2019 08:26:03 +0000 (GMT)
From: =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] hwrng: Use device-managed registration API
Date: Thu, 25 Jul 2019 10:25:53 +0200
In-Reply-To: <20190725080155.19875-1-hslester96@gmail.com> (Chuhong Yuan's
 message of "Thu, 25 Jul 2019 16:01:55 +0800")
Message-ID: <87wog6frla.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
 protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0yTVxz19nvSreRS2fitA7N0El9BN9jIJXtJsiU3LlvGsmSBjWDVL4ij
 rbaAAkvomI+J8BVhblDQyDrAIAIBrLZRlEpghJmOKCgiOsfmoOh0gW1VlKz0q4n/nXt+55zf
 I1dktKd5nZhjypMsJkOunlezrv4HvoS67JTMV6p7k8i+v5oE8riqXyD3S/cwZF/1vyrytbOd
 Jwf8saTOO80Q++QMQ3y+DoF0To5y5OaNBypyyVPPkxpfj4rM/7fAkakTVzjSbfPy5KhLRuRU
 VwND6n8aQaS1zymsj6bzD6sQPdJaTH+YtrHU7ZgQqOt8PC2/s5ujnS37eXrucKtAu34sob6a
 BkSvBxoRndy9h6GHPTKi8nQHon8EzjJ0tnPZRzhD/eYWKTenQLKse3ujeuvImTlh+7kPdp0d
 7WVsSE4tQxEi4NfA577IlSG1qMXHELicU4LymEMwttfNKo9ZBOMNHtUTyz/jtnChGUGz7Az7
 /0Qw9V0/WlTx+B2w9/Wwizgar4BZjzuUy2CZhyMtw6HC0qAo4KgUFjGL4+Fvhz/ER+AiqC29
 FuI1OAnmxi6FWj+HU+CGPMErfBQM1v4e0jPYCLW+O0gZ774I7Te3KfhdkA82cQpeCv6BbkHB
 sTBUXR70ikFcAtVVyYuzAS4PHqA+wCqaN+DCwHDYmwr+a32coo+Eq3ejlLaRUOX6nlFoDXyz
 V6uol0Ob/Uw4RQcV/mPhySiUNi4g5VYVCCbuyVwlesnx1DaOp7ZxBGMZvAraPesUeg00Ncww
 Cn4L2trusUcR14JipHyrMVuyJpqknWutBqM135S9drPZ2ImCf3hoYWDuNPI82uRFWET6ZzXi
 JpKp5QwF1kKjFy0PJv3WcfwXpGNNZpOkj9ak2ZIztZothsIiyWLOsuTnSlYvelFk9TGa4iW/
 fqbF2YY86QtJ2i5ZnlRVYoTOhsoTZi7zGfxDnBi5o8O+69PL3RtSem99K+jVBT238fnHd+Oi
 B1e6M26lksDzX37V8nnecMLJ9A2F3UJs2vz7S8zpzgz7/olTae99oko21mUNeWvLToy87hg8
 TrZ5LmpXsK3jvfaf481xL49XfMjpP36h61FOyWzlM1lZcTpv09ihxig9a91qeHU1Y7Ea/gee
 /5wmywMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XbOdqY1OE2lr9F1GGWX2bam3yrL/jsQUlEQZaJjHabpNtmZ
 kUY5TDFnTbMgm5dS01CnrVmakppLrLAwKJUuXkorzdTCe5p1thH43/M+z+954YWXjwntXBE/
 RmekDTpVnJjnjbcvPuvZnqdRRuzIf+mD0sfKCPQnp41AP1PSMJR+bZqDLpbc46HM76tRnnMY
 Q1kDIxjq6LATyDHQxUV9vXMc9KYhn4dyO5o4aH5mkYuGqrq56IHJyUO3ay0A1dUUYSj/eSdA
 ttYSItSXmv+dA6hC2zmqeNiEU/XWHoKqfbKRuvwjlUs5KjJ4VHOBjaBq7iRTHblFgPo4Wwqo
 gdQ0jCposADKMmwH1JfZRoyacKw9RJ6Q7DHoE4z0+mg9YwwRh0uRTCJVIolsp1IilQdH7JIp
 xIF795yi42LO0IbAvVGS6M7Hk0R8c9jZxq4WzAQs+83Aiw/JnXDqgwk3A2++kCwFcDStmx34
 bCCC5QUaD+MDF7rMPA/zBcCH1+oIV8Aj98Gs1ibcpX3JTXCioZ5wQRg5x4V/21OAK/BhoVlr
 trsgJJXw8pUqt4+TG+Ev63d32YtMgjdT3rsZASmHk+/ecFzaj+V7LT08j78Cvrg56OYxMhZO
 VX7DsgFpXRJZl0RW9gaMDID3GgI99lZYVjSCeXQIrK4ex28DbgXwpRMYrUbLyCSMSssk6DQS
 tV7rAOyH1LbNPXgEzGNHnIDkA/FyQW4/ihByVWeYRK0T+LNrPtsrXwMRrtPraLGv4LApKEIo
 OKVKTKIN+khDQhzNOIGCvfMqJvJT69nf0xkjpQppMFJKg+XB8iAkXim4RLacFJIalZGOpel4
 2vC/x+F7iUzg6n1Y51e5SjR2rCh897KtfUZ1XORU1N16B97u83XwYGKYpDtrVDbYH5Dy6kbP
 28Jyo/8tLOP40UsKNKSoKaYH5tUbCueTs0OvjHwaX6wSxwbqGjeXXtdN2tT2Znlh7MKPzOqT
 VQe2CDLSX50+mxm0LeBC69Pp8/G2qDXmdXkzQX1inIlWSbdgBkb1Dz+/ZIdDAwAA
X-CMS-MailID: 20190725082603eucas1p205a74e93ec8ce40a1decf9cefcaa970c
X-Msg-Generator: CA
X-RootMTR: 20190725082603eucas1p205a74e93ec8ce40a1decf9cefcaa970c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190725082603eucas1p205a74e93ec8ce40a1decf9cefcaa970c
References: <20190725080155.19875-1-hslester96@gmail.com>
 <CGME20190725082603eucas1p205a74e93ec8ce40a1decf9cefcaa970c@eucas1p2.samsung.com>
X-Mailman-Approved-At: Thu, 25 Jul 2019 18:52:09 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Deepak Saxena <dsaxena@plexity.net>, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Patrice Chotard <patrice.chotard@st.com>, linux-samsung-soc@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kukjin Kim <kgene@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Matt Mackall <mpm@selenic.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2019-07-25 czw 10:01>, when Chuhong Yuan wrote:
> Use devm_hwrng_register to simplify the implementation.
> Manual unregistration and some remove functions can be
> removed now.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/char/hw_random/atmel-rng.c     |  3 +--
>  drivers/char/hw_random/cavium-rng-vf.c | 11 +----------
>  drivers/char/hw_random/exynos-trng.c   |  3 +--
>  drivers/char/hw_random/n2-drv.c        |  4 +---
>  drivers/char/hw_random/nomadik-rng.c   |  3 +--
>  drivers/char/hw_random/omap-rng.c      |  3 +--
>  drivers/char/hw_random/powernv-rng.c   | 10 +---------
>  drivers/char/hw_random/st-rng.c        |  4 +---
>  drivers/char/hw_random/xgene-rng.c     |  4 +---
>  9 files changed, 9 insertions(+), 36 deletions(-)
>

Acked-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/=
atmel-rng.c
> index 433426242b87..e55705745d5e 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -86,7 +86,7 @@ static int atmel_trng_probe(struct platform_device *pde=
v)
>  	trng->rng.name =3D pdev->name;
>  	trng->rng.read =3D atmel_trng_read;
>=20=20
> -	ret =3D hwrng_register(&trng->rng);
> +	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
>  	if (ret)
>  		goto err_register;
>=20=20
> @@ -103,7 +103,6 @@ static int atmel_trng_remove(struct platform_device *=
pdev)
>  {
>  	struct atmel_trng *trng =3D platform_get_drvdata(pdev);
>=20=20
> -	hwrng_unregister(&trng->rng);
>=20=20
>  	atmel_trng_disable(trng);
>  	clk_disable_unprepare(trng->clk);
> diff --git a/drivers/char/hw_random/cavium-rng-vf.c b/drivers/char/hw_ran=
dom/cavium-rng-vf.c
> index 2d1352b67168..3de4a6a443ef 100644
> --- a/drivers/char/hw_random/cavium-rng-vf.c
> +++ b/drivers/char/hw_random/cavium-rng-vf.c
> @@ -67,7 +67,7 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
>=20=20
>  	pci_set_drvdata(pdev, rng);
>=20=20
> -	ret =3D hwrng_register(&rng->ops);
> +	ret =3D devm_hwrng_register(&pdev->dev, &rng->ops);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Error registering device as HWRNG.\n");
>  		return ret;
> @@ -76,14 +76,6 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
>  	return 0;
>  }
>=20=20
> -/* Remove the VF */
> -static void  cavium_rng_remove_vf(struct pci_dev *pdev)
> -{
> -	struct cavium_rng *rng;
> -
> -	rng =3D pci_get_drvdata(pdev);
> -	hwrng_unregister(&rng->ops);
> -}
>=20=20
>  static const struct pci_device_id cavium_rng_vf_id_table[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xa033), 0, 0, 0},
> @@ -95,7 +87,6 @@ static struct pci_driver cavium_rng_vf_driver =3D {
>  	.name		=3D "cavium_rng_vf",
>  	.id_table	=3D cavium_rng_vf_id_table,
>  	.probe		=3D cavium_rng_probe_vf,
> -	.remove		=3D cavium_rng_remove_vf,
>  };
>  module_pci_driver(cavium_rng_vf_driver);
>=20=20
> diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_rando=
m/exynos-trng.c
> index 94235761955c..b4b52ab23b6b 100644
> --- a/drivers/char/hw_random/exynos-trng.c
> +++ b/drivers/char/hw_random/exynos-trng.c
> @@ -153,7 +153,7 @@ static int exynos_trng_probe(struct platform_device *=
pdev)
>  		goto err_clock;
>  	}
>=20=20
> -	ret =3D hwrng_register(&trng->rng);
> +	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not register hwrng device.\n");
>  		goto err_register;
> @@ -179,7 +179,6 @@ static int exynos_trng_remove(struct platform_device =
*pdev)
>  {
>  	struct exynos_trng_dev *trng =3D  platform_get_drvdata(pdev);
>=20=20
> -	hwrng_unregister(&trng->rng);
>  	clk_disable_unprepare(trng->clk);
>=20=20
>  	pm_runtime_put_sync(&pdev->dev);
> diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-=
drv.c
> index d4cab105796f..2d256b3470db 100644
> --- a/drivers/char/hw_random/n2-drv.c
> +++ b/drivers/char/hw_random/n2-drv.c
> @@ -768,7 +768,7 @@ static int n2rng_probe(struct platform_device *op)
>  	np->hwrng.data_read =3D n2rng_data_read;
>  	np->hwrng.priv =3D (unsigned long) np;
>=20=20
> -	err =3D hwrng_register(&np->hwrng);
> +	err =3D devm_hwrng_register(&pdev->dev, &np->hwrng);
>  	if (err)
>  		goto out_hvapi_unregister;
>=20=20
> @@ -793,8 +793,6 @@ static int n2rng_remove(struct platform_device *op)
>=20=20
>  	cancel_delayed_work_sync(&np->work);
>=20=20
> -	hwrng_unregister(&np->hwrng);
> -
>  	sun4v_hvapi_unregister(HV_GRP_RNG);
>=20=20
>  	return 0;
> diff --git a/drivers/char/hw_random/nomadik-rng.c b/drivers/char/hw_rando=
m/nomadik-rng.c
> index fc0f6b0cb80d..74ed29f42e4f 100644
> --- a/drivers/char/hw_random/nomadik-rng.c
> +++ b/drivers/char/hw_random/nomadik-rng.c
> @@ -57,7 +57,7 @@ static int nmk_rng_probe(struct amba_device *dev, const=
 struct amba_id *id)
>  	if (!base)
>  		goto out_release;
>  	nmk_rng.priv =3D (unsigned long)base;
> -	ret =3D hwrng_register(&nmk_rng);
> +	ret =3D devm_hwrng_register(&dev->dev, &nmk_rng);
>  	if (ret)
>  		goto out_release;
>  	return 0;
> @@ -71,7 +71,6 @@ static int nmk_rng_probe(struct amba_device *dev, const=
 struct amba_id *id)
>=20=20
>  static int nmk_rng_remove(struct amba_device *dev)
>  {
> -	hwrng_unregister(&nmk_rng);
>  	amba_release_regions(dev);
>  	clk_disable(rng_clk);
>  	return 0;
> diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/o=
map-rng.c
> index e9b6ac61fb7f..b27f39688b5e 100644
> --- a/drivers/char/hw_random/omap-rng.c
> +++ b/drivers/char/hw_random/omap-rng.c
> @@ -500,7 +500,7 @@ static int omap_rng_probe(struct platform_device *pde=
v)
>  	if (ret)
>  		goto err_register;
>=20=20
> -	ret =3D hwrng_register(&priv->rng);
> +	ret =3D devm_hwrng_register(&pdev->dev, &priv->rng);
>  	if (ret)
>  		goto err_register;
>=20=20
> @@ -525,7 +525,6 @@ static int omap_rng_remove(struct platform_device *pd=
ev)
>  {
>  	struct omap_rng_dev *priv =3D platform_get_drvdata(pdev);
>=20=20
> -	hwrng_unregister(&priv->rng);
>=20=20
>  	priv->pdata->cleanup(priv);
>=20=20
> diff --git a/drivers/char/hw_random/powernv-rng.c b/drivers/char/hw_rando=
m/powernv-rng.c
> index f2e8272e276a..8da1d7917bdc 100644
> --- a/drivers/char/hw_random/powernv-rng.c
> +++ b/drivers/char/hw_random/powernv-rng.c
> @@ -33,18 +33,11 @@ static struct hwrng powernv_hwrng =3D {
>  	.read =3D powernv_rng_read,
>  };
>=20=20
> -static int powernv_rng_remove(struct platform_device *pdev)
> -{
> -	hwrng_unregister(&powernv_hwrng);
> -
> -	return 0;
> -}
> -
>  static int powernv_rng_probe(struct platform_device *pdev)
>  {
>  	int rc;
>=20=20
> -	rc =3D hwrng_register(&powernv_hwrng);
> +	rc =3D devm_hwrng_register(&pdev->dev, &powernv_hwrng);
>  	if (rc) {
>  		/* We only register one device, ignore any others */
>  		if (rc =3D=3D -EEXIST)
> @@ -70,7 +63,6 @@ static struct platform_driver powernv_rng_driver =3D {
>  		.of_match_table =3D powernv_rng_match,
>  	},
>  	.probe	=3D powernv_rng_probe,
> -	.remove =3D powernv_rng_remove,
>  };
>  module_platform_driver(powernv_rng_driver);
>=20=20
> diff --git a/drivers/char/hw_random/st-rng.c b/drivers/char/hw_random/st-=
rng.c
> index bd6a98b3479b..863448360a7d 100644
> --- a/drivers/char/hw_random/st-rng.c
> +++ b/drivers/char/hw_random/st-rng.c
> @@ -102,7 +102,7 @@ static int st_rng_probe(struct platform_device *pdev)
>=20=20
>  	dev_set_drvdata(&pdev->dev, ddata);
>=20=20
> -	ret =3D hwrng_register(&ddata->ops);
> +	ret =3D devm_hwrng_register(&pdev->dev, &ddata->ops);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register HW RNG\n");
>  		clk_disable_unprepare(clk);
> @@ -118,8 +118,6 @@ static int st_rng_remove(struct platform_device *pdev)
>  {
>  	struct st_rng_data *ddata =3D dev_get_drvdata(&pdev->dev);
>=20=20
> -	hwrng_unregister(&ddata->ops);
> -
>  	clk_disable_unprepare(ddata->clk);
>=20=20
>  	return 0;
> diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/=
xgene-rng.c
> index 8c6f9f63da5e..7e568db87ae2 100644
> --- a/drivers/char/hw_random/xgene-rng.c
> +++ b/drivers/char/hw_random/xgene-rng.c
> @@ -361,7 +361,7 @@ static int xgene_rng_probe(struct platform_device *pd=
ev)
>=20=20
>  	xgene_rng_func.priv =3D (unsigned long) ctx;
>=20=20
> -	rc =3D hwrng_register(&xgene_rng_func);
> +	rc =3D devm_hwrng_register(&pdev->dev, &xgene_rng_func);
>  	if (rc) {
>  		dev_err(&pdev->dev, "RNG registering failed error %d\n", rc);
>  		if (!IS_ERR(ctx->clk))
> @@ -375,7 +375,6 @@ static int xgene_rng_probe(struct platform_device *pd=
ev)
>  			rc);
>  		if (!IS_ERR(ctx->clk))
>  			clk_disable_unprepare(ctx->clk);
> -		hwrng_unregister(&xgene_rng_func);
>  		return rc;
>  	}
>=20=20
> @@ -392,7 +391,6 @@ static int xgene_rng_remove(struct platform_device *p=
dev)
>  		dev_err(&pdev->dev, "RNG init wakeup failed error %d\n", rc);
>  	if (!IS_ERR(ctx->clk))
>  		clk_disable_unprepare(ctx->clk);
> -	hwrng_unregister(&xgene_rng_func);
>=20=20
>  	return rc;
>  }

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl05Z5EACgkQsK4enJil
gBDC6wf/RWrFrZa1K0vXQRunm4a/T6+9qOAeK+CilFvhwUfFtc1mhpquqEVSbQYG
Y+r7c5pxZd+JvU5rxPTBelL60GQ1AJd5XKgvKblDiEjXonol8s9Snf2vc6vL0CFp
FCuSxpnvQ3HTKJ16s71HURJxxqdAM3BVFZxod5XPVctNSqVAMM1QhIy29D2ivg/n
UP4pBt5nCY0mzfNJ3OHz1ui6q99ZXMcUT6yzXKhUP/UpHXRjS/XUeXMMub8x6Wpl
SieqaH2+KmufGidxswOQh/aZ3YszzBqsfTOeJTFYQgQbsckAkVVtafoxNk0upNeT
Qqad3s8ystS/i+gUDKSb9C13UDEgRA==
=+zqR
-----END PGP SIGNATURE-----
--=-=-=--
