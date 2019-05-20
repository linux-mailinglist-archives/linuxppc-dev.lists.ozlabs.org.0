Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E622FDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:09:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456tPf3cSyzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:09:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 456tMr4b92zDq62
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:07:52 +1000 (AEST)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 8BC7080450; Mon, 20 May 2019 11:07:39 +0200 (CEST)
Date: Mon, 20 May 2019 11:07:49 +0200
From: Pavel Machek <pavel@denx.de>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH V2 3/3] soc: fsl: add RCPM driver
Message-ID: <20190520090748.GB9748@amd>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190517033946.30763-3-ran.wang_1@nxp.com>
 <20190519213844.GH31403@amd>
 <AM5PR0402MB2865EC5E1EF12C6C1D3C5566F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <20190520085647.GA9748@amd>
 <AM5PR0402MB2865F4574B19761848B001F9F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <AM5PR0402MB2865F4574B19761848B001F9F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
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


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-05-20 09:03:50, Ran Wang wrote:
> Hi Pavel,
>=20
> On Monday, May 20, 2019 16:57, Pavel Machek wrote:
> >=20
> > Hi!
> >=20
> > > > > +static int rcpm_pm_prepare(struct device *dev) {
> > > > > +	struct device_node *np =3D dev->of_node;
> > > > > +	struct wakeup_source *ws;
> > > > > +	struct rcpm *rcpm;
> > > > > +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> > > > > +	int i, ret;
> > > > > +
> > > > > +	rcpm =3D dev_get_drvdata(dev);
> > > > > +	if (!rcpm)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* Begin with first registered wakeup source */
> > > > > +	ws =3D wakeup_source_get_next(NULL);
> > > > > +	while (ws) {
> > > >
> > > > while (ws =3D wakeup_source_get_next(NULL)) ?
> > >
> > > Actually, we only pass NULL to wakeup_source_get_next() at very first
> > > call to get 1st wakeup source. Then in the while loop, we will fetch
> > > next source but not 1st, that's different. I am afraid your suggestion
> > > is not quite correct.
> >=20
> > Sorry, I seen your next version before seeing this explanation.
> >=20
> > You are right, but the current code is "interesting". What about
> >=20
> >     ws =3D NULL;
> >     while (ws =3D wakeup_source_get_next(NULL)) ...
> >=20
> > then?
>=20
> Did you mean:
>      ws =3D NULL;
>      while (ws =3D wakeup_source_get_next(ws)) ...
>=20
>    Yes, that will be the same to my original logic, do you recommend to c=
hange
> to this? :)

Yes please. It will be less confusing to the reader.

Thanks (and sorry for cross-talk),
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzibmQACgkQMOfwapXb+vJOsgCgqGW6NAUYHlbtL2j5RhCyhuS2
zxMAn1WDZj1TbQDXI+hk99qNzljFSRtI
=XWgf
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
