Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918EE7B3246
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 14:17:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=sIIMdzCD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxq9C2nPzz3ccd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 22:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=sIIMdzCD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxq8K6gL8z30GC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 22:16:33 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230929121624euoutp01de2544920d5c5f332d3892fb00ca92f9~JXbkk7tk41063110631euoutp01I;
	Fri, 29 Sep 2023 12:16:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230929121624euoutp01de2544920d5c5f332d3892fb00ca92f9~JXbkk7tk41063110631euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695989784;
	bh=PASHHEyP2CkxpN9N4L3kLehKjI5RN7oHEZcm3GbcotM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=sIIMdzCDWTL3n5QYCAYuS4svR+ViKbFYykTF6Tn1g/RRWywRGRFTKKiMggc1NKSJJ
	 77PfWgBQf7IQt6d8DbZzo4n8PkbCkW+OefxTzWOTd5IxWwvhPiAw08TvwWFpLtAEhI
	 lg48Qa7GwYqF0YQNakAtrRKrc3xfjTuk1x2NpIbQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230929121624eucas1p27199de26748151267e32dfe79c617fd4~JXbkVdv0N3145131451eucas1p2J;
	Fri, 29 Sep 2023 12:16:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 4A.92.11320.710C6156; Fri, 29
	Sep 2023 13:16:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230929121623eucas1p2500651283c0dfe212127844c61ed9d23~JXbjxT1iI0248502485eucas1p21;
	Fri, 29 Sep 2023 12:16:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230929121623eusmtrp17c9678af9dbea2f492a4dbec682bf168~JXbjuIMco1450314503eusmtrp1i;
	Fri, 29 Sep 2023 12:16:23 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-ca-6516c017bb15
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id FB.91.10549.710C6156; Fri, 29
	Sep 2023 13:16:23 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230929121623eusmtip1d3e2f6bb3accde09091b07bde550487e~JXbjaIUt42058220582eusmtip1w;
	Fri, 29 Sep 2023 12:16:23 +0000 (GMT)
Received: from localhost (106.210.248.178) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 29 Sep 2023 13:16:22 +0100
Date: Fri, 29 Sep 2023 14:17:30 +0200
From: Joel Granados <j.granados@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/15] cdrom: Remove now superfluous sentinel element
 from ctl_table array
Message-ID: <20230929121730.bwzhrpaptf45smfy@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="zcz64lhnvlbjtldp"
Content-Disposition: inline
In-Reply-To: <2023092855-cultivate-earthy-4d25@gregkh>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe1BUZRjG/c45e85CgYdF5eMyo4OlBkIGiu+kFDU4nhnHcqyxGafCTc4A
	AYvDcoumxOQm1+U2wgq6XlgWMaAFV1y5RQ2gSFAQVyFgwFKWEEW5Y7scLGf67/c9z/t83/P+
	8YlJyQBjJw6QhfGhMmmQI21O6Rrn2lxw/QZ+x9lFEpq7LxGwlNnIwJXmYQKe6zJIyG+LpaA2
	VougNvd7GjqfTtJQqo8jYKxxhIHTl8to6LrBwTlFBQFFHWUIhn63g0s9OgLycpsR5Pe6wd8F
	DlBz0XifKgTuJgdDuy5NBKMl1xnIni8kISfjEQ0d+nwaEi7oEdxvSKUgubuKhruXUxlYmFkW
	QVHTMgE9ijEESekJCBpVG2B2YUEE1UOjCJ61GBDkqF2hYDqHBI2hgIQ6ZRcDhXkaEpqKlmgo
	KfWBuuxrJNS3ZBul5WiIS5lj4CdtHwELs8aHZyqzCK9dXEfnAW5hPhNx52J+pbjK4l6Cu1d4
	E3E1z1QUd1M5wHAqbTin159iuAqNE3e5+gHBLZ3x4PrGPTnt1TM0N6tJJznFpXp0aONR872+
	fFBABB/65jvHzP311cXEiVbrqPw5DYpBP7NJyEyM2Z14uKZKlITMxRJWg/BYuZo0GRJ2GuEO
	BScYTxCeq+6kXyRia7IowShCOF1hIP+dKlYlEsLhOsJlBecpU4RiX8ffpd8gTEyz23Gb4d7K
	G+tYd5zeqmRMAZI9txbHLjYxJsOaPYafTypEJrZgd+OMwQEksBW+nTe6cinJRuFf/hgystjI
	9rhoWWySzVgPfGWmQCRU3Yxny1tWa3+D71T2rZTDbNKreKBYSQmGN1Y/UJACW+OHTZWMwA64
	JSuFEgJZCNctP2KEQwnC6lNPCWFqD47tHF1NvIfvlCWSpkaYtcQ9E1ZCUUucqTu7KlvgxHiJ
	ML0FlwwaKAXarHxpNeVLqyn/W02Qt2PVrcf0/2RnrL44TgrsiUtLJykVYq4iGz5cHuzHy91k
	fKSrXBosD5f5uR4PCdYi469rWW6arkJFD6dcGxAhRg3oNWN4pLykHdlRshAZ77jOYrhfwkss
	fKVfRfOhIT6h4UG8vAHZiylHGwtnz9vHJayfNIwP5PkTfOgLlxCb2cUQqdx67XG7kW6Pare7
	KfNu8fYVMxW/6Y7+4KIe+eLwRJxjUGvCJnMVe+TqlQsnq2wnvF1992vG91908LpGpS2+odl7
	uP3rrolXbH4MXN/8ef+ha6RVVmRSQ+BWL++tke9PnVYOubWuc1pz0Mxh6v5Bifj8/gOG5H46
	J3/02aYP3T2UXqR7/KflDmaZH3TFDlblFxoiIm39PopS+vSfHIcxF9u8pb5P6tz/itj5di34
	39omKz/y5VDlxj0+uwOmpniJJtfbxzIvty7aumrbYck+94HKP7U1CzmBQbrm5k3SQ85+LlvW
	pNU+Vn8ckFiw4+guq7x9YUvTxU/a3vWdL/Sr7a77rFf07QNHSu4vfcuJDJVL/wHmgstA8AQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0xTZxjG951TTgtbZ8dFTxA3R11cUAsFWl4QcJdkOW7JMjZlC26BBk4o
	DlrWFjcxRqYQLg5ablEKVQQrIAywXGVcak0AhxuwykUEAgxwDCZT7reyQl1msv9+3/M+7/O+
	+fJ9LNx2hXBkRUgUtEwiinQmbBgdprahQ7v0O2m3/hoHaO8rwGAjo5UJ19tHMdisTcchrzOe
	Ac3xOgTNl38k4MHCLAHlDQkYTLSOMeFCYQUBvXUU5KqqMCgyViAY6XGEgv5aDHIutyPIe+gO
	TzRO0HTNnJcvhfsXo6CrNs0KxktrmJC1qsUhO/1vAowNeQQkXm1AMGlIZcDFvnoC7hemMmFt
	yWQFRW0mDPpVEwhSlIkIWvN3wvLamhU0jowjWOyYQZB9gwea+Wwcimc0OLSoe5mgzSnGoa1o
	g4DS8mBoySrDQd+RZZZMsZDwwwoT7uoGMFhbNg9eqs7E3hFQxgcfUWurGYjKjetmUNUlDzFq
	UHsbUU2L+QzqtnqISeXrYqiGhu+ZVFWxC1XYOIVRG8lCamDaj9LdTCao5WIlTqkK9OiTN4J4
	vjJpjILeK5bKFX7OJ/jgzuN7A8/d05vH9/D6ysdd4Ozq7xtGR0acomWu/iE8cV1zYHSH3XeZ
	iWlYHDJwUpA1i+R4kvFNmYwUZMOy5WgRWfisl2EpOJG35nusLGxHrvemEBbTU0TqVJeeH2oQ
	WV/yF7blYnDeIs8r67aZ4BwkO2cG8S2253iQyl/UzK0GnJO7g2xe6N+OteOEkJuzqm1mc7zI
	9OEhZEktwcjRjGzMUniNvJczvr0TzjlFTlWsmk0sM+8mi0ysLdmaIySvL2mer8ollys7CAuf
	Jec2JpEK2alfSFK/kKT+L8kiu5D9pinsf/IB8sa1adzCfmR5+SwjHzFvIns6Rh4VHiXn8+Si
	KHmMJJwXKo3SIfO7r21dqapHV/58yjMgjIUMaJ+5c6yytAs5MiRSCe1szx59ZEvbssNEp2Np
	mTRYFhNJyw1IYL7GdNzRIVRq/kQSRTBf6Cbgewq93QTeQg/nXeyj0UkiW064SEF/TdPRtOzf
	Poxl7RiHYTuaNtvLXtLHV40PU/Hrh+99WpKsHPfz/y3sWE7P/HHfIemzpHf3VT+O6LuTtt7i
	WlIW8NnxSK8cA4vrM5WU+2SifC/RGHqF+8h3/88H2YKgRT3L/oOPz2h2K60SJ86lfvFYrDzZ
	Nlp7waZr9KersYfSZ/1OfzMV5DAZppWURJsUAbXH5kyBxtUD57QB1e69c9zEDmHSq3bdZ9hW
	xCsh72uGZ9biB2zm5h3/qHyZKwo6kifsDNT7Gk86hZz/3Paw10JDknr/hnjqS2nayNmx1/3Z
	70XsieOKj04UfassvNPrsDR45M3Eu906pfyWMSErLzjF+pI6dXpPtM/bfr9Gf5ij+N33hDND
	LhbxXXCZXPQP0Flh2owEAAA=
X-CMS-MailID: 20230929121623eucas1p2500651283c0dfe212127844c61ed9d23
X-Msg-Generator: CA
X-RootMTR: 20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
	<20230928-jag-sysctl_remove_empty_elem_drivers-v1-1-e59120fca9f9@samsung.com>
	<CGME20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa@eucas1p1.samsung.com>
	<2023092855-cultivate-earthy-4d25@gregkh>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--zcz64lhnvlbjtldp
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 03:36:55PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 28, 2023 at 03:21:26PM +0200, Joel Granados via B4 Relay wrot=
e:
> > From: Joel Granados <j.granados@samsung.com>
> >=20
> > This commit comes at the tail end of a greater effort to remove the
> > empty elements at the end of the ctl_table arrays (sentinels) which
> > will reduce the overall build time size of the kernel and run time
> > memory bloat by ~64 bytes per sentinel (further information Link :
> > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> >=20
> > Remove sentinel element from cdrom_table
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > ---
> >  drivers/cdrom/cdrom.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > index cc2839805983..451907ade389 100644
> > --- a/drivers/cdrom/cdrom.c
> > +++ b/drivers/cdrom/cdrom.c
> > @@ -3654,8 +3654,7 @@ static struct ctl_table cdrom_table[] =3D {
> >  		.maxlen		=3D sizeof(int),
> >  		.mode		=3D 0644,
> >  		.proc_handler	=3D cdrom_sysctl_handler
> > -	},
> > -	{ }
> > +	}
>=20
> You should have the final entry as "}," so as to make any future
> additions to the list to only contain that entry, that's long been the
> kernel style for lists like this.
Will send a V2 with this included. Thx.

>=20
> So your patches will just remove one line, not 2 and add 1, making it a
> smaller diff.
indeed.

>=20
> thanks,
>=20
> greg k-h

--=20

Joel Granados

--zcz64lhnvlbjtldp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUWwFoACgkQupfNUreW
QU/Eqwv/RH28JknZG1s6JWiUUmWVbCiC6ZMEv1fxYdNyfq+X2wpGNHySWx2kmx+B
/mF0BfTu/5o5adc5Pb8fw8w5N1n/9zGlG1MuGg6WiiKT5Bfrj3Y96+u3ngMrNkHN
+LlqjMxZNw2Snrq6J0PiecEOD/jhSP2dWmf7nuvkqQOrSjMEaGKWr58aguiB6Cw3
ZCeicpyWHltbn8QGkeX8OSjfRnQplKwd8FxbE97gIbAwRCv0gisjaHJ13JVnghcG
0Zu3q+D6iJRz4ZCftC7ZOwSqqzpIywrKiKO3+4IB9Bi33+BOBJcntewv4mJiqR6x
sCJmMrtEQ7O/4lp5pBQrpnGfH/LieKfQ6T86LoiQJrVCIuNp6AgJxKSFOduHnjLV
/DlSB4ChJAQmyQMjk/Gu4cOPAnCZjbGv6bRFTQR3vuBJ+fhpcPdwW/ASDRFkP5VQ
LPsDEF9Xkvs9ywDFfc5NNMHqqAfHe27BAWILap3GaoB4pIQG04m1Snw7ttTrWnUI
X93esemi
=klCv
-----END PGP SIGNATURE-----

--zcz64lhnvlbjtldp--
