Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BE7B3226
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 14:15:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=M88Xxnqj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxq6W4CXyz3cjj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 22:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=M88Xxnqj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxq5b0qZsz3bWy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 22:14:07 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230929121355euoutp029355d2b77491cadd67994111037d28a5~JXZZf4USK0777807778euoutp02o;
	Fri, 29 Sep 2023 12:13:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230929121355euoutp029355d2b77491cadd67994111037d28a5~JXZZf4USK0777807778euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695989635;
	bh=8lyq3NbxKETKAT4kssG9Gl7+6++BIm6RujbjJHzxU10=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=M88XxnqjOeCFtmJ1iLUvg3cga7VIuTJv+1GqYmT6uofLJq3jgsotPtjN5QZA7t1oZ
	 fs7iWrQBoROVkp7B5E2c/zp8eMYLVW4UMFGtNGm5/jfkl9qXkXZMN/pTuYUUkxDHfR
	 HIDo2xQNUMaOXM4Qdv/qAl1z11RhR58+4jS2E998=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230929121354eucas1p25742ddebbe1cfa7ed6cca8c8327da2b9~JXZZQ0UAB2204222042eucas1p2F;
	Fri, 29 Sep 2023 12:13:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 96.E4.42423.28FB6156; Fri, 29
	Sep 2023 13:13:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230929121353eucas1p222db2685fd99727840771a59abb770ce~JXZYHgAdt1405914059eucas1p2f;
	Fri, 29 Sep 2023 12:13:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230929121353eusmtrp2af1af6bf573e1ce71e31c070f88b0d2f~JXZYGNQIA1483714837eusmtrp2R;
	Fri, 29 Sep 2023 12:13:53 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-c6-6516bf82728c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id CD.21.10549.18FB6156; Fri, 29
	Sep 2023 13:13:53 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230929121353eusmtip13974bd648951759583fb359b46754e5e~JXZXzSlko2058220582eusmtip1C;
	Fri, 29 Sep 2023 12:13:53 +0000 (GMT)
Received: from localhost (106.210.248.178) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 29 Sep 2023 13:13:52 +0100
Date: Fri, 29 Sep 2023 14:14:59 +0200
From: Joel Granados <j.granados@samsung.com>
To: Steve Wahl <steve.wahl@hpe.com>
Subject: Re: [PATCH 11/15] sgi-xp: Remove the now superfluous sentinel
 element from ctl_table array
Message-ID: <20230929121459.t7dfskyybi6jovjn@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="4w7nhf7oeskaesco"
Content-Disposition: inline
In-Reply-To: <ZRW9Eywl831h/YhW@swahl-home.5wahls.com>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTa1BUZRjuO+dwzoKhh9XkG9QsyJzAQBitdxIaDR0PozQ0jkyXGWSV00rJ
	JZYN0hxBQW4hF2GEVWRBYTc2F1hhlUXBcAMURzRALkLIhqSCiigCEksLB8uZ/j3vc3m/9/nx
	iUhxD+MgCg6N5CNCJXscaRtKXz/R/P7B2sX86vLkVdDYXkjAVGY9A6cb+wiY1meQcKI5joKa
	OB2CmpwzNLSOPqZBa4gn4G69iYFDp0ppuHWOg+PpZwlQtZQiuNPmAIUdegJycxoRnOj0gEd5
	S+FigWWfMgyupYTADf0RK+jXVDKQ9aKIhOyMYRpaDCdoSMg3IBioS6Ugpf08DddOpTIwOWa2
	AlWDmYCO9LsIktMSENQrF8P45KQVXLjTj+B50xCC7GJXyHuWTYJ6KI+EWsUtBopy1SQ0qKZo
	0Gh3QG3WLyRcasqyUOa9EP/TBAOXdV0ETI5bHh6rOEqsX8u1tG7hJl9kIu54zE2Kq/i5k+C6
	i6oQd/G5kuKqFD0Mp9TJOYMhluHOqp25UxfuE9xU0gdc16AXpytJorlxdRrJpRdeQn7Lv7Tx
	DOL3BH/PR7h9HGiz++TgQyJ8zD7aqLxCxKCMRcnIWoTZNVgzncMkIxuRmFUjfNtYSQjDM4TT
	9VNzylOE2y6dYV5GShLuk4KgQjjn1zSrf11NjQmUMFQinKpKn41Q7Aqc+fcjNINpdhVuHuom
	Z/Ai1gkfuds2mybZ0gXYWJNHzwgLWR6bOmY2WYts2Q/xUJWRELAdvpLbP8uTbDQu6iy0YJEF
	L8Eqs2iGtmbX4ou/mynhVCc8XtZEC3g/vlrRNVsOs4dfx+VZGWgmi9mNOD5znuBZiB80VMzV
	XIqnq/Ln/EcRrjUPM8KgQbg4dpQQXOtwXGv/XGIDNo1OWglL5+OOh3bCnfNxpv4YKdC2OPGw
	WHC/izV/DFHpyEnxSjPFK80U/zUT6FVYWT1C/492wcUFg6SAvbBW+5hSIqYE2fNyWYiUl7mH
	8lGuMkmITB4qdd0VFqJDll/XZG4YOY/yHjxxrUOECNWhdyxhU5nmBnKgQsNCecdFtn23xbzY
	Nkjyw14+ImxHhHwPL6tDS0SUo72ti9eVXWJWKonkv+X5cD7ipUqIrB1iCDffnR5Kl5vBsbmb
	JCEfna2TrjBWzQ8yRmnf7vW9GlAm763YF34g4VgXvtcem+Oz2fFG5dPAFP9zLVBa/Z6mt9ok
	O65IUhV8suC7qEPXD+8L8tYmOo33te6PHtbbpZgrt/odvfdF0/q0nq+2F9ce1L1p9VYnXSD1
	Wbd5udZvwQaDNHtjoo+fybj65Gvb+gLs/E3bjGHr893m3Xlj2YC2qmQqvnjQ23nU3dPJI3B8
	59Z+nyVXvZNW+qvVI3KFf7CU+etAu4P50yd1seGRW+w3GwKoxgHjZVtPl+ZlX+foMn7MX3ld
	ah481l3mtl0/cUH8m/dned01IX8mTnec1n0et8b3m4W7y+WOlGy3xN2ZjJBJ/gHETZrc8AQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTezBcVxzHe+5d9y4zJtulcoa0SZbMtNosK5YfQdK0f9yONG1H2mRobLbc
	ISlWd5eGSac0VFDP0IlFCRVi1TOejSV0PEpDSWSjdBKDjFBq4rFeq8tOp5npf5/z/X2/33Pm
	zDlckr9OWXMvhClZeZg0RECZcfr03eOHY9usWEfdvA30PCwiYCuzi4Yfe54QsN2QQULeQBwH
	NHG1CDTXf6Lg/vICBZUt8QRMdU3QcKW4ioKRRgZy0+sIKB2uQvD4gTUUaRsIyLnegyDvkRPM
	5++D1huGvkIZ9CeHwmBDqglMqutpyFovISE7428KhlvyKEgoaEEw3ZHCgeSHTRT0F6fQsLGq
	N4HSbj0B2vQpBElpCQi6Cq1At7FhAnceTyJY6ZtDkH1TCPlL2SSUzeWT0KYaoaEkp4yE7tIt
	CtSVEmjLqiChvS/LIOmjIf67NRo6a0cJ2NAZNl69fY04LmaG73szG+uZiMmN+Z3D3L71iGDG
	SpoR07pSyGGaVeM0U1gbwbS0xNJMXZk9U3xnhmC2El2Y0VlPprY8kWJ0ZWkkk17Ujj7c7yv0
	kMsilOyBYJlC6SnwE4GTUOQGQidnN6HoiOs5dyexwMHLI5ANuRDJyh28zguDf9V9i8KX916a
	mdymY1CaZRIy5WKeMy5PmCGTkBmXzytBuKEzljYO9uGapQcmRrbAmyNJlNG0iLAuZos2LuoR
	rsnQoh0Xh3cIZ27O7zLFewsPzI2RO2zJs8WpUztNZlySV7UH39I27ZoseCye0CZwdtic54rn
	mn8hjK1XCVww02hiHLyMe3Mmd00kLxJ/M7diCHMNbINL9dwd2ZQnxq1Deo7xqLZYV91HGfkr
	/HxrGqUjC9ULTaoXmlT/NRlle6zVzxD/k9/EN2/Mkkb2xJWVC5xCRJcjSzZCERoUqhAJFdJQ
	RURYkDBAFlqLDA+/oWutrgn98GxR2IEILupAdobkRLV6EFlzwmRhrMDS/MkffJZvHiiNimbl
	Mok8IoRVdCCx4RozSOtXAmSGXxSmlIhcHMUiZxc3R7GbyxHBXvP3wq9K+bwgqZL9nGXDWfm/
	OYJrah1DXPz5GRO1UL+c4Vitno87yifvvREt8beLRy+dS0tM9/b4LOOEpkJz2eO5j04iZGzt
	lvq9X0VfPHWN9Sw9GdN/xrTouLZq/eNUn9ZAq+oo3pka9+2oPh+xH3tos/MuPiU5fF5SHL2n
	4q+v0UeXUg6MfzLl9Kem0V9b8K7nta3O7lZMDX868Pa2CA36qZvOXrTxiuwdsmx7f/9rlwVS
	qaNl8+Lo6bWmu3m+pxtsj6rG6O+PXUHTg/l1X6pcfQtP2r0OfRIdpZtrP+Z+Nr4iIPeew3Lj
	b4r5Do3/qlqTN3Sqt3tVGJejfMe984O2VnG5iejqevIJq4GDmoPBT5Nmhe4zjrYOAo4iWCqy
	J+UK6T/T24AkjQQAAA==
X-CMS-MailID: 20230929121353eucas1p222db2685fd99727840771a59abb770ce
X-Msg-Generator: CA
X-RootMTR: 20230928175234eucas1p2c62c48251c66c0016180977783dd2314
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928175234eucas1p2c62c48251c66c0016180977783dd2314
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
	<20230928-jag-sysctl_remove_empty_elem_drive>
	<CGME20230928175234eucas1p2c62c48251c66c0016180977783dd2314@eucas1p2.samsung.com>
	<ZRW9Eywl831h/YhW@swahl-home.5wahls.com>
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
Cc: "Jason A.
 Donenfeld" <Jason@zx2c4.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@li
 nux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen
 Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--4w7nhf7oeskaesco
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 12:51:15PM -0500, Steve Wahl wrote:
> On Thu, Sep 28, 2023 at 03:21:36PM +0200, Joel Granados via B4 Relay wrot=
e:
> > From: Joel Granados <j.granados@samsung.com>
> >=20
> > This commit comes at the tail end of a greater effort to remove the
> > empty elements at the end of the ctl_table arrays (sentinels) which
> > will reduce the overall build time size of the kernel and run time
> > memory bloat by ~64 bytes per sentinel (further information Link :
> > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> >=20
> > Remove sentinel from xpc_sys_xpc_hb and xpc_sys_xpc
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > ---
> >  drivers/misc/sgi-xp/xpc_main.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_m=
ain.c
> > index 6da509d692bb..c898092ff3ac 100644
> > --- a/drivers/misc/sgi-xp/xpc_main.c
> > +++ b/drivers/misc/sgi-xp/xpc_main.c
> > @@ -109,8 +109,7 @@ static struct ctl_table xpc_sys_xpc_hb[] =3D {
> >  	 .mode =3D 0644,
> >  	 .proc_handler =3D proc_dointvec_minmax,
> >  	 .extra1 =3D &xpc_hb_check_min_interval,
> > -	 .extra2 =3D &xpc_hb_check_max_interval},
> > -	{}
> > +	 .extra2 =3D &xpc_hb_check_max_interval}
> >  };
> >  static struct ctl_table xpc_sys_xpc[] =3D {
> >  	{
> > @@ -120,8 +119,7 @@ static struct ctl_table xpc_sys_xpc[] =3D {
> >  	 .mode =3D 0644,
> >  	 .proc_handler =3D proc_dointvec_minmax,
> >  	 .extra1 =3D &xpc_disengage_min_timelimit,
> > -	 .extra2 =3D &xpc_disengage_max_timelimit},
> > -	{}
> > +	 .extra2 =3D &xpc_disengage_max_timelimit}
> >  };
> > =20
> >  static struct ctl_table_header *xpc_sysctl;
> >=20
> > --=20
> > 2.30.2
> >=20
>=20
> I assume you'll match the rest of the changes with regards to the
> trailing comma.
If you are refering to Greg's comments. yes. I'll send a V2 with the
trailing comma.

Best

>=20
> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
>=20
> --=20
> Steve Wahl, Hewlett Packard Enterprise

--=20

Joel Granados

--4w7nhf7oeskaesco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUWv8IACgkQupfNUreW
QU9DQwv+Opqxeb0JXEqqCeoSyrjiYyUtb6SlSpGMHgzSUMrdGnvmrA3cDGKGUhGd
TNgpEJ+tN5ZYPPvQD5O1pqTlaBxf4VZytJ8DonLDtW6cyREdb4WLvjb1yMxn6LJh
bgJYc7vgcgaK53S2uIm8MJhT3OR33Ft2sAxtR8fuOW59OONGh3vDB+GwxspJ/zaM
VR21A7Dpj802nQLhSbKzMo2zv2Za22ltVbKjZOhfo/gH3aDaxJ2OnaVXGlR4oLpw
K7oDpV7SlZzWpia4hixX9z0PeNzNheViN4LmyY0jR11VXnCpOBOM4RUkwtDa5N21
GwipoG/V/D2rGuyWtcKTKRbHkBl3klgfwyeeN17PPVqllgyafCeMPIflxb7Dnuxk
24dDkirouJRzNnsF1F7VPr1YGd9MJNFJ+4OB2C/4eOk/b3ql0r9iZXyQUw3A1OH2
hL977fnUzbzPk/dZYy3qVEFJwj+B1agVRH25sPKRqUNQLD7QnFtgu8xPfKrbuQ0N
1jFybOz5
=hyLo
-----END PGP SIGNATURE-----

--4w7nhf7oeskaesco--
