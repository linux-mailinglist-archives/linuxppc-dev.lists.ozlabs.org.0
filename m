Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7A22944
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 23:40:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456b6T0f24zDqHj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 07:40:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ucw.cz
 (client-ip=195.113.26.193; helo=atrey.karlin.mff.cuni.cz;
 envelope-from=pavel@ucw.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=denx.de
X-Greylist: delayed 222 seconds by postgrey-1.36 at bilbo;
 Mon, 20 May 2019 07:38:48 AEST
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456b4m3rNdzDqH6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 07:38:48 +1000 (AEST)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 04D75803A3; Sun, 19 May 2019 23:38:34 +0200 (CEST)
Date: Sun, 19 May 2019 23:38:44 +0200
From: Pavel Machek <pavel@denx.de>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH V2 3/3] soc: fsl: add RCPM driver
Message-ID: <20190519213844.GH31403@amd>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190517033946.30763-3-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline
In-Reply-To: <20190517033946.30763-3-ran.wang_1@nxp.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Len Brown <len.brown@intel.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> +
> +struct rcpm {
> +	unsigned int wakeup_cells;
> +	void __iomem *ippdexpcr_base;
> +	bool	little_endian;
> +};

Inconsistent whitespace


> +static int rcpm_pm_prepare(struct device *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct wakeup_source *ws;
> +	struct rcpm *rcpm;
> +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> +	int i, ret;
> +
> +	rcpm =3D dev_get_drvdata(dev);
> +	if (!rcpm)
> +		return -EINVAL;
> +
> +	/* Begin with first registered wakeup source */
> +	ws =3D wakeup_source_get_next(NULL);
> +	while (ws) {

while (ws =3D wakeup_source_get_next(NULL)) ?


> +static int rcpm_probe(struct platform_device *pdev)
> +{
> +	struct device	*dev =3D &pdev->dev;
> +	struct resource *r;
> +	struct rcpm		*rcpm;
> +	int ret;

Whitespace.

								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzhzOQACgkQMOfwapXb+vI6ywCfVCMHtkjXb3a+eeg4lf0cWVnK
ltAAn0s9Rg5VoedxYnGb5y+G2Eo0Kxic
=n8eU
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--
