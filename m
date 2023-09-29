Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820DF7B3235
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 14:15:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KJZLKPUX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxq7T2cslz3cgc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 22:15:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KJZLKPUX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxq6Z5Db2z3cjy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 22:15:02 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230929121452euoutp015a6105e043c6903a24b28d4b4b217ba8~JXaOukA_q0847108471euoutp01S;
	Fri, 29 Sep 2023 12:14:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230929121452euoutp015a6105e043c6903a24b28d4b4b217ba8~JXaOukA_q0847108471euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695989692;
	bh=Mom1/fyOUmOVuOQ+PmCi85/qSNk2f9N499eF11GQ+Tc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KJZLKPUXlfesrJ/y4S5EYpMquQAdhJ6hBirKRoOzEXmnhHade3/Jh/fbusw4kxXEX
	 Yr37D8o0BvK+QI9tM6VdOKrFgIpuFa2xKUBLJ2qiIkEhQP1ANcFQLvvv9PxHknbA4f
	 XQMxTXAZ5Ux3Wu+rMTsVWlSfPDDCZeYzgXh5auVM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230929121451eucas1p2a7e7e18a5a15c683a238ba4654f8397f~JXaOZzpIM0273802738eucas1p2Q;
	Fri, 29 Sep 2023 12:14:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 0C.15.42423.BBFB6156; Fri, 29
	Sep 2023 13:14:51 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230929121450eucas1p1d1a7bc0ee3fa33c4f52984e2a106c7fe~JXaNbUkgg1521115211eucas1p1O;
	Fri, 29 Sep 2023 12:14:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230929121450eusmtrp25645b9bc156f69c7b11e1d51dfe5f1de~JXaNYJmB41537015370eusmtrp2U;
	Fri, 29 Sep 2023 12:14:50 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-79-6516bfbbe54a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A5.51.10549.ABFB6156; Fri, 29
	Sep 2023 13:14:50 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230929121450eusmtip155061490e2c9660bc8fd18ead32730b8~JXaNDlSRH1908319083eusmtip1A;
	Fri, 29 Sep 2023 12:14:50 +0000 (GMT)
Received: from localhost (106.210.248.178) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 29 Sep 2023 13:14:50 +0100
Date: Fri, 29 Sep 2023 14:15:58 +0200
From: Joel Granados <j.granados@samsung.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH 14/15] hyper-v/azure: Remove now superfluous sentinel
 element from ctl_table array
Message-ID: <20230929121558.pvsbbnxlijawaioz@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="3qlh5qneoyp3rgzw"
Content-Disposition: inline
In-Reply-To: <ZRWbGDlXCS4t8tMf@liuwe-devbox-debian-v2>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0xTZxjG951z6CkE2LE4+VKMW1DUeIHhEN6Egc655MQ51IXoZma0wxMw
	o61pZSrZMojcUblYBAqEAoMWOi5BKBcVTN24i0yYAnIf6gZMhSEClbLCwc1k//2e5/2e93KS
	IyRF/bRYeEp2hlPIJMHOAhvK0DDXvv16/Rru/as526HpQS4BC8kNNPzYNEzAoiGJhMy7ERTU
	RZQjqEsrFkDXi2cCKKmNJOBRwwgNF/JKBXC/ioWMxGsEaDtLEQz9JobcbgMB6WlNCDJ7dsDT
	rLVwM8fSTyOHtngpdBguW8GovpIG1Xw+CSlJzwXQWZspgOjsWgSPjZcoiH9QLYC2vEs0mF6a
	rUDbaCagO/ERgriEaAQNmjUwazJZwY2hUQQzrRMIUgpcIWs6hQTdRBYJ9er7NOSn60ho1C4I
	QF9yHOpVP5Fwq1VlscyhEHlxjobb5b0EmGYtg19WXCF272Q7uz5lTfPJiM0I+5ViKwp7CLYv
	vwaxN2c0FFuj7qdZTXkIW1sbTrPXdFvYvBt/EuxCrCfbO+7DlhfFCthZXQLJJubeQgffPWrz
	4Uku+NS3nMLN94RNUMdkGHH6lehcb53RKgxFMXHIWogZD5wTk07EIRuhiNEhPDCmpngxjXDs
	RRXNi78RXuzUC15HqsqqSb6gRTi7OJ7695XROIB4UWkRWYvUUoRiXPDFtG5iiQXMNnx3oo9c
	4tXMe9jQH7Y8g2RK3sbPftdZLRUcmCD8yxP1csCO8cKF7ZU0z6twc/roclOSOYcji0os04QW
	dsJas3DJtmY88dhcAsWvuh7PlrWurP09bqnoJXiOs8Xtsc4878U/t9WRPDvgscYKmue1eLEm
	e/nLYOYKwvXm5zQv9AgXhL9Y6eSNI7pGVxIf4ck/8silhTBjj7v/WsXvaY+TDakrth2OiRLx
	rzdi/cAElYjWq9+4TP3GZer/LuPtbVhzfUrwP3srLsgZJ3n2wSUlzygNoouQIxeilAZySncZ
	d9ZVKZEqQ2SBrgFyaTmy/HWt5sapapQ1NulqRIQQGdEGS3ikTN+BxJRMLuOcV9sNPxRxIruT
	kvOhnEJ+XBESzCmNyElIOTvabfVpDhAxgZIz3Dccd5pTvK4SQmtxGOFhe95vy+f+Ow7mB9yK
	feK0OC2MTj1he3o+ele+/Ijbg8371C4bnDzCa+zLmn8oncFjs45DUw45+48NzURt4qLuJeTb
	mePfyiz0vwP7pjdpdku1Pa0Htqq8JL4jmaNVAR9sbup2s844FLQ/o+OeWL25ePJed/ThwWl/
	U8KM7yEJvXEvIXbYU5/llXzAttiUJDXrglrqbg+PBoSsi93pq++aNfiJ1z0fzHk1HN5SOnhY
	VHDj6xrNsYwKlyOhu7wffjH8iaff4LjM8bvjj586vpLb0LbekzP61UURCcW5gV9+ZVD49+9x
	/yxquqxC9VA72Gf4+J078rzUy9LDMQNH3Zsv7B87G+5MKYMk7ltIhVLyD88kKJzwBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe1BUVRzHOffu3l0oxutCeCJmRAgkqIUFFn4YoJk6V62pLI2pEDe4gQUs
	7bJoNE6YEG95BAjLo+WxgCCIIM/hNZgLDUwY4IokjhDY8I5RkUdQC1uTM/33ne93vp/f+Z05
	h08KVihz/unQcFYWKgm2oow4vRvdo6+1dJixThenbKHnThEB6+kaHpT0jBHwV0MaCXn90Rxo
	j65F0J5dRcHQkwUKqltiCJjUjPPgQvFVCrSNDOSm1hFQNngVwYPb5lA03EBATnYPgry7zjCf
	bwFthTqeSgp9iSFwq+EiFyYq63mQsaomITPtDwoGW/IoiP2hBcHDrmQOJN5poqCvOJkHa083
	uFDWvUHAcOokgoSUWAQalRksr61xofXBBIKl3lkEmaVCyH+cSUL5bD4JHUotD9Q55SR0l61T
	UFntBx0ZV0jo7M3QWRuREJO0woMbtSMErC3rBj+9/j2xT8wMDh1l1lbTEZMb9QuHuX75LsHc
	Uzcjpm1JxWGalaM8RlWrYFpazvOYunJ7prh1imDW492YkRkvprYinmKWy1NIJrWoE7278yOh
	p0yqCGctg6TycC+rj0XgLBR5gNDZ1UMocnH33eMstnL09gxgg09HsDJH71PCoNKRNk7YquBs
	4swMGYWi6QRkyMe0K26saSITkBFfQKsRLpxLp/SBBb72+DZXr03wn9qELV9ALyJcN8nqC/UI
	F8VOczYDDm2Dk7KHiU1N0a/i/tl75KY2pS1xw2gUb7NA0tXbcHKnnmpCB+Gbvyu3Csa0O778
	cz1PT80l8G/TlZQ+2I5/ypnYmkDSEVgdf01X4Ov0S7hsg79pG9JueHolhaM/qTVerun9Z4Nz
	+NH6Q5SKTJTPkJTPkJT/kfS2PR7emPq/7YBLC2dIvfbC1dULHBXiVSBTViEPCQyRi4RySYhc
	ERoo9JeG1CLdu2/QrNQ1oYLpRWEXIvioC72sa47XVN5C5pxQaShrZWo89quAFRgHSL6KZGVS
	P5kimJV3IbHuGtNI8xf8pbpPFBruJ3JzEotc3TycxB5uLlY7jA+HxUkEdKAknP2CZcNY2b89
	gm9oHkVcOCG5VOXwoV+k8oo22fr5UV6jvP+Qt5fg7aVPD64lxfgUDyzYG/me2t2ubb35urHT
	8dixb2IC1KU2b/04sC1L80mbytc7zoc77mC224flSg6U85tzAzQeBjt7lMQ5x/KqkjnTLyXb
	Zw3eX/r2nYR9dt/ZhDs+ai7Ym34ktfHE4HpJQRyX8owYOTmnOPBBaVegyS7bF29M27l/puye
	8uqY7xtwq+hejmg6c2nH/sTCgSyHxqR586V89cnZ+69YmFj3VDqU3v/8PWqock+1pX+v2eib
	ZzzFZxeOnp89dHCJa2Py3NeHmzW7fCLemFA8MSg6fizWNitzUWtXcsQaH7NzSdk7yPoXYCuO
	PEgisidlcsnfXJsG0YwEAAA=
X-CMS-MailID: 20230929121450eucas1p1d1a7bc0ee3fa33c4f52984e2a106c7fe
X-Msg-Generator: CA
X-RootMTR: 20230928152622eucas1p20ca3dd701247895e232e59fb84e33e1f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928152622eucas1p20ca3dd701247895e232e59fb84e33e1f
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
	<65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>
	<CGME20230928152622eucas1p20ca3dd701247895e232e59fb84e33e1f@eucas1p2.samsung.com>
	<ZRWbGDlXCS4t8tMf@liuwe-devbox-debian-v2>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linu
 x-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--3qlh5qneoyp3rgzw
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 03:26:16PM +0000, Wei Liu wrote:
> Please change the prefix to "Drivers: hv:" in the subject line in the
> two patches.
>=20
> On Thu, Sep 28, 2023 at 03:21:39PM +0200, Joel Granados via B4 Relay wrot=
e:
> > From: Joel Granados <j.granados@samsung.com>
> >=20
> > This commit comes at the tail end of a greater effort to remove the
> > empty elements at the end of the ctl_table arrays (sentinels) which
> > will reduce the overall build time size of the kernel and run time
> > memory bloat by ~64 bytes per sentinel (further information Link :
> > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> >=20
> > Remove sentinel from hv_ctl_table
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > ---
> >  drivers/hv/hv_common.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> > index ccad7bca3fd3..bc7d678030aa 100644
> > --- a/drivers/hv/hv_common.c
> > +++ b/drivers/hv/hv_common.c
> > @@ -147,8 +147,7 @@ static struct ctl_table hv_ctl_table[] =3D {
> >  		.proc_handler	=3D proc_dointvec_minmax,
> >  		.extra1		=3D SYSCTL_ZERO,
> >  		.extra2		=3D SYSCTL_ONE
> > -	},
> > -	{}
> > +	}
>=20
> Please keep the comma at the end.
My V2 will have this.

>=20
> >  };
> > =20
> >  static int hv_die_panic_notify_crash(struct notifier_block *self,
> >=20
> > --=20
> > 2.30.2
> >=20

--=20

Joel Granados

--3qlh5qneoyp3rgzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUWv/0ACgkQupfNUreW
QU+whgv+InxnpA/bTntZv2zXmVfPlCF5wQv1v2Pr8xRi1bqKD131BW2w2KHwG/lQ
4nA4DNk4RBgJc9QG5vsJFBnULGy0FyMqYh75isB+3byS1FqVcbm4sDAYLgNTc/E8
JYKQcBsnUIO3H2bwRKLC+PD8PpU1uhT96k+4Y0qXW7YI4CXsixf9194xOXrmMJDN
vUckHh5HbmM5M38c4/I+91DEVZxbT6ucuxpGH9peNO6R0SExi9fH6R22WqC6Vbdq
eGFsS5X2OYcG6wIpqmqTSY+hA4BRP3uXlEqJddoVz7HirrCwoIvkniDOxdLaikiC
Vwb1mr4T/Hw3weIEzXdih8v2/ZCXdOhA0v4Aasme6jd6c+JLQN/3BqwXHCzbTwWL
npF+7w2a2v4P3XjX3nIcTk/Y7IiY5wsnptjwc43D9NX1DG6hw/q2NB3Crkm6M3ek
D48OTTGHZEMLidLgAORqIWlAD/Ta2wxaQHe6L5iU+VWYky7mdXjXUaId/qvNocqV
E1CKZWSN
=tJ3K
-----END PGP SIGNATURE-----

--3qlh5qneoyp3rgzw--
