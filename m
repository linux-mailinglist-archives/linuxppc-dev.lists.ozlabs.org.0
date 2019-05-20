Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C207522F8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 10:58:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456t8f5JffzDqKt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 18:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ucw.cz
 (client-ip=195.113.26.193; helo=atrey.karlin.mff.cuni.cz;
 envelope-from=pavel@ucw.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=denx.de
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456t7J1xxSzDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 18:56:54 +1000 (AEST)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 197348021D; Mon, 20 May 2019 10:56:38 +0200 (CEST)
Date: Mon, 20 May 2019 10:56:47 +0200
From: Pavel Machek <pavel@denx.de>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH V2 3/3] soc: fsl: add RCPM driver
Message-ID: <20190520085647.GA9748@amd>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190517033946.30763-3-ran.wang_1@nxp.com>
 <20190519213844.GH31403@amd>
 <AM5PR0402MB2865EC5E1EF12C6C1D3C5566F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <AM5PR0402MB2865EC5E1EF12C6C1D3C5566F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pavel Machek <pavel@denx.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +static int rcpm_pm_prepare(struct device *dev) {
> > > +	struct device_node *np =3D dev->of_node;
> > > +	struct wakeup_source *ws;
> > > +	struct rcpm *rcpm;
> > > +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> > > +	int i, ret;
> > > +
> > > +	rcpm =3D dev_get_drvdata(dev);
> > > +	if (!rcpm)
> > > +		return -EINVAL;
> > > +
> > > +	/* Begin with first registered wakeup source */
> > > +	ws =3D wakeup_source_get_next(NULL);
> > > +	while (ws) {
> >=20
> > while (ws =3D wakeup_source_get_next(NULL)) ?
>=20
> Actually, we only pass NULL to wakeup_source_get_next() at very first
> call to get 1st wakeup source. Then in the while loop, we will fetch
> next source but not 1st, that's different. I am afraid your suggestion
> is not quite correct.

Sorry, I seen your next version before seeing this explanation.

You are right, but the current code is "interesting". What about

    ws =3D NULL;
    while (ws =3D wakeup_source_get_next(NULL)) ...

then?

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzia88ACgkQMOfwapXb+vLCHQCdEiZVnts+sVGDltC60TnL3F9y
ltIAn0M2k/oHNFq1zm74JskvAw6PG/L7
=/fdT
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
