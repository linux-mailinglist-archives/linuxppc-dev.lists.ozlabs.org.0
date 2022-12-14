Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7764D031
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 20:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXQpZ64cjz3bhG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 06:46:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ey/o2OPo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ey/o2OPo;
	dkim-atps=neutral
X-Greylist: delayed 790 seconds by postgrey-1.36 at boromir; Thu, 15 Dec 2022 01:32:23 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXHrR3QcDz3bf7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 01:32:23 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7D211D3CB9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 14:19:14 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6FF0A1C0017;
	Wed, 14 Dec 2022 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671027536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmQ807XpApqJy3ky8AyyrotvaoAVGYYY3USozGQUBPY=;
	b=ey/o2OPoCIMiHTZDssVN7DDIBmfA4kbOab/vKfPdBPvMleF2g50wjKo9+EBCswUhxORexP
	WCKreG+QPA7HRnlNVHf6S1iteh09o26ckOCfXJkK0wvf0GaPYqbkqnzGZg65pZv+Nt5ieK
	1oHWDQFUIZ14BYD+AdWhLCd8a1KXgaJE3APXF4TfjtshYlWKGqzwecO+cjmDRIg99Ab72S
	xKx2HjeJ/5UZjERUzizoNajx8ZuibmwxCfC3VdHodEuCF8+SPUkxR4vIO7svwfeGyi6INZ
	F39EaeHlyuAjuAvDGnebwtdsMfpNqUQ1LSlP7BYUWpw0Z5CMaqLxgXT8kiBs7A==
Date: Wed, 14 Dec 2022 15:18:53 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] spi: fsl_spi: Don't change speed while chipselect is
 active
Message-ID: <20221214151853.797daf7d@bootlin.com>
In-Reply-To: <8aab84c51aa330cf91f4b43782a1c483e150a4e3.1671025244.git.christophe.leroy@csgroup.eu>
References: <8aab84c51aa330cf91f4b43782a1c483e150a4e3.1671025244.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 15 Dec 2022 06:44:34 +1100
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Wed, 14 Dec 2022 14:41:33 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Commit c9bfcb315104 ("spi_mpc83xx: much improved driver") made
> modifications to the driver to not perform speed changes while
> chipselect is active. But those changes where lost with the
> convertion to tranfer_one.
>=20
> Previous implementation was allowing speed changes during
> message transfer when cs_change flag was set.
> At the time being, core SPI does not provide any feature to change
> speed while chipselect is off, so do not allow any speed change during
> message transfer, and perform the transfer setup in prepare_message
> in order to set correct speed while chipselect is still off.
>=20
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Fixes: 64ca1a034f00 ("spi: fsl_spi: Convert to transfer_one")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/spi/spi-fsl-spi.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
> index 731624f157fc..93152144fd2e 100644
> --- a/drivers/spi/spi-fsl-spi.c
> +++ b/drivers/spi/spi-fsl-spi.c
> @@ -333,13 +333,26 @@ static int fsl_spi_prepare_message(struct spi_contr=
oller *ctlr,
>  {
>  	struct mpc8xxx_spi *mpc8xxx_spi =3D spi_controller_get_devdata(ctlr);
>  	struct spi_transfer *t;
> +	struct spi_transfer *first;
> +
> +	first =3D list_first_entry(&m->transfers, struct spi_transfer,
> +				 transfer_list);
> =20
>  	/*
>  	 * In CPU mode, optimize large byte transfers to use larger
>  	 * bits_per_word values to reduce number of interrupts taken.
> +	 *
> +	 * Some glitches can appear on the SPI clock when the mode changes.
> +	 * Check that there is no speed change during the transfer and set it up
> +	 * now to change the mode without having a chip-select asserted.
>  	 */
> -	if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
> -		list_for_each_entry(t, &m->transfers, transfer_list) {
> +	list_for_each_entry(t, &m->transfers, transfer_list) {
> +		if (t->speed_hz !=3D first->speed_hz) {
> +			dev_err(&m->spi->dev,
> +				"speed_hz cannot change during message.\n");
> +			return -EINVAL;
> +		}
> +		if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
>  			if (t->len < 256 || t->bits_per_word !=3D 8)
>  				continue;
>  			if ((t->len & 3) =3D=3D 0)
> @@ -348,7 +361,7 @@ static int fsl_spi_prepare_message(struct spi_control=
ler *ctlr,
>  				t->bits_per_word =3D 16;
>  		}
>  	}
> -	return 0;
> +	return fsl_spi_setup_transfer(m->spi, first);
>  }
> =20
>  static int fsl_spi_transfer_one(struct spi_controller *controller,

Looks good to me.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
