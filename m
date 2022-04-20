Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3A50830A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 09:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjtMj1q2Vz3bnn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 17:58:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ucw.cz
 (client-ip=46.255.230.98; helo=jabberwock.ucw.cz; envelope-from=pavel@ucw.cz;
 receiver=<UNKNOWN>)
X-Greylist: delayed 541 seconds by postgrey-1.36 at boromir;
 Wed, 20 Apr 2022 17:58:04 AEST
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjtMJ1966z2xmQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 17:58:04 +1000 (AEST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4B86C1C0B87; Wed, 20 Apr 2022 09:48:56 +0200 (CEST)
Date: Wed, 20 Apr 2022 09:48:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Message-ID: <20220420074855.GA25823@amd>
References: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  sound/soc/fsl/fsl_esai.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index ed444e8f1d6b..1a2bdf8e76f0 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device *=
pdev)
>  			goto err_pm_disable;
>  	}
> =20
> -	ret =3D pm_runtime_get_sync(&pdev->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(&pdev->dev);
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
>  		goto err_pm_get_sync;
> -	}
> =20
>  	ret =3D fsl_esai_hw_init(esai_priv);
>  	if (ret)

Please take a closer look at that function.

a) error labels are now misnamed

b) there's leak if
   ret =3D fsl_esai_hw_init(esai_priv);
   if (ret)
     goto err_pm_get_sync;

happens.

Best regards,
							Pavel			  =20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmJfuucACgkQMOfwapXb+vIiGACffOMVcK21uP4rckwMmbnzLCim
9/QAnjyoa8+Std4g2m6imouSbgDhSKdo
=cpOV
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
