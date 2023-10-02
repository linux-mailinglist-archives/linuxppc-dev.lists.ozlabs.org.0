Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E617B4CAB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 09:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JM5sjoqx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzXr351DJz3cBC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 18:38:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JM5sjoqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzXq70sRNz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 18:37:32 +1100 (AEDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231002073720euoutp016fe876eca16495d8528d299c4c7ee324~KOjxvoWoO2433024330euoutp01V;
	Mon,  2 Oct 2023 07:37:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231002073720euoutp016fe876eca16495d8528d299c4c7ee324~KOjxvoWoO2433024330euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1696232240;
	bh=GpVEgYMUf4T/XwZ7+6B8FXnwmrWJ6CC+FEbg1ZXjwco=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JM5sjoqxx/czuPvDtr6u6fxp8xSrPIviov2zbGPSp0LDJiiG1I74OwklyDec1Metn
	 JK2ySWc7cGMV2W67P9g/7ad97JAe2EBmR9Eyyf+onObuwLvINkT9HUNoRE67yIs40m
	 t0+muUw20JcsUQkOaroHhZQO4xt+SQ1GO4Zc/y+E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231002073720eucas1p1f12614d17a256c78b37fa5d7de8f75c3~KOjxiX4bF3033930339eucas1p1E;
	Mon,  2 Oct 2023 07:37:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 9E.D4.11320.0337A156; Mon,  2
	Oct 2023 08:37:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231002073720eucas1p20d4ccb4caf9670a1d718bfbbbdcef951~KOjw9Admk1616816168eucas1p2l;
	Mon,  2 Oct 2023 07:37:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231002073720eusmtrp24b41570e0cc30e17e0bd40d2480fe1cf~KOjw6I0VU0549305493eusmtrp29;
	Mon,  2 Oct 2023 07:37:20 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-9b-651a7330d32d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 18.CC.25043.F237A156; Mon,  2
	Oct 2023 08:37:19 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231002073719eusmtip246e1b150785e2296b5a160aff9b9a4f6~KOjwlh3jv1418614186eusmtip2W;
	Mon,  2 Oct 2023 07:37:19 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 2 Oct 2023 08:37:19 +0100
Date: Mon, 2 Oct 2023 09:39:32 +0200
From: Joel Granados <j.granados@samsung.com>
To: Phillip Potter <phil@philpotter.co.uk>
Subject: Re: [PATCH 01/15] cdrom: Remove now superfluous sentinel element
 from ctl_table array
Message-ID: <20231002073932.72i2ey4zvvaqioqm@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="iym4gjoiy6yoe7oi"
Content-Disposition: inline
In-Reply-To: <ZRhSQaNDJih5xABq@equinox>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe1ATVxjFvbub3UAbXYOjl8j4AEY7iKjU4leLHVsfs31M67T/aF9KYQWr
	BIcYS5nBBlDkoYgIIwQogQhEwUADIqSgTlCCqIA85DHSiqK1EApW5RUNTVhaO9P/fufbc+53
	z51ZMSntZmTiPfIDfLg8YJ877UxV1k80r1ytkPGro+MXQUNnPgEvU+sZONPQR8BU5UkSspsP
	U3DpsAHBpYzzNLQ/H6ZBbzxCwMP6+wzEaktpuHORg6yUcgKK2koR3OuQQX5XJQGZGQ0Isrt9
	4c8cN6jNs5+nCYObSaHQUpksgv7iCwykTRaQkH5yhIY2YzYNR3ONCB6ZjlOQ1FlFw03tcQas
	YzYRFJltBHSlPESQeOIognrNfBi3WkVQc68fwegNC4L0Qh/IeZZOgs6SQ8Jl9R0GCjJ1JJiL
	XtJQrN8Jl9NKSLhyI80+skXCkWMTDNQZegiwjtsXj1WcIja+xbW1f8RZJ1MRl6W6TXEVZ7sJ
	7m5BNeJqRzUUV63uZTiNQckZjdEMV67z4rQ1fxDcywQ/rmdwA2c4l0Bz47oTJJeSfwVtW/yF
	s38Qv2/PQT581bu7nEMyrg2I9mfhiLzeUZEKdbgkIicxZtfi05fi6ETkLJayOoR/etouEsQz
	hAubOklBPEVYE9NnF+LpyMlbbo60lC1COLp2978eQ46JEUQ5wh3dI8jholhP/PB8GeFgmvXG
	zZa7pIPnsV74as/j6d0ke2YOfnLm5+mAC7sLTw2niBwsYddh1ZE6SuC5+HpmP+W4BclGYFWn
	QsCFuMgmdjic2OXYOthKCdXc8XPLcZHAUbixoodwrMJs4uv41osEkVBmMy5VbRU8LnjAXMEI
	7IanqnNn/KcQvmwbYQRRbH+W6OeE4HoHH27vn0m8hxtL42deaDbuGprrGJN2TK08PTOW4Pg4
	qeBehot/tVApyEP9n2LqV8XUr4qpp8/xxppf/qL/N16BC/MGSYE3YL1+mNIg5hxawCsVocG8
	wlfOf++jCAhVKOXBPoFhoQZk/+Nu2MzPqlDRwBMfEyLEyIQ87eH7ZcUtSEbJw+S8+zxJXMt8
	XioJCvghkg8P2xmu3McrTGihmHJfIFmx4XqglA0OOMDv5fn9fPg/Xwmxk0xF7F3cpG+p/XL3
	j8l+Q/zBhKqe4RCR6/LYbL1TulIVUd3ELoxQbprnsWPywuyz2vrWQ7lb3KJ8l0iCpvb/tii/
	1bmxZk/WSlkeXvzaNkXw73Ma7vguIywF8Cbjquhbk+Hi6p0zfC0uV5xuDHVJZqxtzKwHhaak
	kAelTtra95F5fVTgh9o4/81fZ8QOHMK9sqUl9CcfPGpepf74IoyNXiW/+zQFjaTtmNjyTdO2
	jmMxGxnj596bKmQLHmd7tFaZDyjjh0L6unBS75KQXI/xvN2fRTbfHtseSUhcvrJ4rlz/ZNaL
	RbpvadJvbUxJjf9TY92q8XURUYFb1LK2+Vlvby+LeSN+qcGdUoQErPEiwxUBfwOF13L87AQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTe0xTVxz23Hu5t4BoRzt2VlFnIVnGXHkI+MOJWebcLjNLlo0t2RzDRi/g
	Bi1pwWyiBCfILA+L0gHlYQF5CArykEEDgoCVlwoiyEvnCJA5YMwHyLOsUJeZ7L/vfL/f98jJ
	OTzSdo4W8Q7JwjiFTBospq2oduONB+84K0Wcy/htN2i5l0PA0hkDA+dbfidguSqJhIzb0RRc
	jS5HcDX1Eg13p6doKNHHEDBqGGbgRG4pDb2/spCuriCgoLsUwcMeEeT0VRGQltqCIKPfDf7K
	tIe6bJOfTg4dcSHQWZVoASPFVxhIns8jQZP0Nw3d+gwaYs/pEYw1JlAQd6+aho7cBAYWnhst
	oOCGkYA+9SgC1elYBAadHcwuLFhA7cMRBDPtEwg0+RLIfKYhoXAik4R6bS8DeWmFJNwoWKKh
	uMQf6pMvktDQnmyijEcgJn6OgabyAQIWZk3BzyvPEu95sN1397IL82cQmx7VRbGVF/oJdiiv
	BrF1MzqKrdHeZ1hdeTir1x9n2IpCJza39hHBLp3yZAfGvdnyolM0O1t4mmTVOQ3o081fS3Yq
	5OFh3BtBcmWYt3ifK7hJXL1A4ubuJXHdtt1vh5uH2HnXzoNc8KHDnMJ5135JkCH+EhWahn+4
	16yno1C3QIV4PMx3x0k37VXIimfLz0O4abAPqZClibfHZc96LMxYgBd7VbR56THC8zUdLw4V
	CM/2VFMrWxTfEY9eukysYJq/Fd+eGCJXsJDvhJsH/lgVkPzz63HJyeXVCAF/P16eUq9G2PC3
	46iYJsrs+ozALYlaxjx4BbemjawmkPzDeKqgBq30JvkbcIGRt0Jb8t/EC+N3KHNVMZ6eSHhR
	+xh+ujSG1EigfclJ+5KT9j8nM+2E+4yPiP/Rb+P87HHSjL1xSckUpUNMERJy4cqQwBClm0Qp
	DVGGywIlB+Qh5cj07qsMc5XV6MKfjyWNiOChRuRoUg5fLu5EIkoml3Fioc3JTjvO1uag9Mcj
	nELurwgP5pSNyMN0jUmk6NUDctMnkoX5u3q6eLi6e3q5eHh5bhO/ZuMT+rPUlh8oDeO+57hQ
	TvGvjuBZiqKIYw7Kaj+nfXuuf0sMps4EWIvW7DUo4rhNdZOlAhf7yIZ1xmprm4923KQMwcRw
	hDBldDL1S2MExopp1Vs7hIuft16M7qr6ZMvFn7LUnqVbMjcyv2xyYWYiac3ZD9p6NVmGTOpB
	/x39h9eFS9neTz4rU4Snp3+Vp1F9lz7sd1/gcNQ6SzxtMbRxaq1fdOzRslvCAJ/FrWuLNnnm
	v56y8/3jVxLVJ9rXtLXrfosobNe/G3DNhRsck/Y7t37hONlTm5gS0qeMFzDd9SNWvk8eNjts
	2Oyr6HJctztmt+xaJF02sP4uk9bccUzztI3KkZ6LdJJ/o9Pu0Qt8faSdKrD7OGXulnBRTCmD
	pK5OpEIp/Qd2Xc43jAQAAA==
X-CMS-MailID: 20231002073720eucas1p20d4ccb4caf9670a1d718bfbbbdcef951
X-Msg-Generator: CA
X-RootMTR: 20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
	<20230928-jag-sysctl_remove_empty_elem_drivers-v1-1-e59120fca9f9@samsung.com>
	<CGME20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa@eucas1p1.samsung.com>
	<2023092855-cultivate-earthy-4d25@gregkh>
	<20230929121730.bwzhrpaptf45smfy@localhost> <ZRhSQaNDJih5xABq@equinox>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <
 arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin
 K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--iym4gjoiy6yoe7oi
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 05:52:17PM +0100, Phillip Potter wrote:
> On Fri, Sep 29, 2023 at 02:17:30PM +0200, Joel Granados wrote:
> > On Thu, Sep 28, 2023 at 03:36:55PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Sep 28, 2023 at 03:21:26PM +0200, Joel Granados via B4 Relay =
wrote:
> > > > From: Joel Granados <j.granados@samsung.com>
> > > >=20
> > > > This commit comes at the tail end of a greater effort to remove the
> > > > empty elements at the end of the ctl_table arrays (sentinels) which
> > > > will reduce the overall build time size of the kernel and run time
> > > > memory bloat by ~64 bytes per sentinel (further information Link :
> > > > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.o=
rg/)
> > > >=20
> > > > Remove sentinel element from cdrom_table
> > > >=20
> > > > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > > > ---
> > > >  drivers/cdrom/cdrom.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > > > index cc2839805983..451907ade389 100644
> > > > --- a/drivers/cdrom/cdrom.c
> > > > +++ b/drivers/cdrom/cdrom.c
> > > > @@ -3654,8 +3654,7 @@ static struct ctl_table cdrom_table[] =3D {
> > > >  		.maxlen		=3D sizeof(int),
> > > >  		.mode		=3D 0644,
> > > >  		.proc_handler	=3D cdrom_sysctl_handler
> > > > -	},
> > > > -	{ }
> > > > +	}
> > >=20
> > > You should have the final entry as "}," so as to make any future
> > > additions to the list to only contain that entry, that's long been the
> > > kernel style for lists like this.
> > Will send a V2 with this included. Thx.
> >=20
> > >=20
> > > So your patches will just remove one line, not 2 and add 1, making it=
 a
> > > smaller diff.
> > indeed.
> >=20
> > >=20
> > > thanks,
> > >=20
> > > greg k-h
> >=20
> > --=20
> >=20
> > Joel Granados
>=20
> Hi Joel,
>=20
> Thank you for your patch. I look forward to seeing V2, and will be happy
> to review it.
Am following a reported oops. Once I straighten that out, I'll send out
a V2

Bet

>=20
> Regards,
> Phil

--=20

Joel Granados

--iym4gjoiy6yoe7oi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUac7QACgkQupfNUreW
QU/yCwv+ODTBSbi0ueMQdEZxBPJP69SZ4LKBMRpZjtDGBiifZrGt584PygiL6kff
CdRuYLsAGk56gt/+3JZPjEH6tCnTFH6yZzFU3luYhw759BXEHpy79DyEpzv4cBme
ZY3ghhzfhc9cilEW6/mwP4fPxj5/3QavA1Re8mqkCDHhMbGSSx60qJ7KeALt4kje
liPm3oN8g9Rspq958o3ANDvWJsBHsuQinjUc9UdUU/T8DCQ886Rig7yQNnleUbcZ
MvRchNw012YUtmPGk+0wYsu/30GiQ5hg1iodQjsFj05PCTrWIG0svFnZ3CQDKfcy
27vtkqiWYMUCX/gXf373wwxVWsIEuLyJqCz0usoSC0bzgN0yu1NXyTWL6KWivWS3
v1DBHUZV8lAGgUL95xlBfgMNgVInzu19ml5+DfvroOxkUYis2fEVGO+yaGIk6zWO
LU8IcfGU8a2NMba60gnFqizl/uNhX4g9z0D9IC1HykgQ4WJMhxdJSeLSKEclwoXK
6ILmm1E1
=6JBa
-----END PGP SIGNATURE-----

--iym4gjoiy6yoe7oi--
