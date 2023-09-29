Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB57B3423
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 16:03:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AFYNkKpS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxsWx0Sc7z3cgq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 00:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AFYNkKpS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxsW04Vwhz3cF2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 00:02:50 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230929140240euoutp01afe66b9e4e0ffa1bcecba49359025df5~JY4WWDxoK3251532515euoutp01d;
	Fri, 29 Sep 2023 14:02:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230929140240euoutp01afe66b9e4e0ffa1bcecba49359025df5~JY4WWDxoK3251532515euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695996160;
	bh=Btrm8Ac8d2kEpEoRPdLI6EsuqjId3rLOgFjkXf4LLYQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=AFYNkKpSlDSLgKTy1BFqKkjzrxsiEUyok/P+wi9niUPxPhYWD9cBsK1yjoUw/noIU
	 XMR9yFl90mqqjH9tb/YgNMjRvuGUqinn8j+EtI2Bt9enmbe4U3pQT008WX8/SYh93R
	 gdC2CWgh1OKveRJVjaffdbYgq7tqctX33NWhJz6Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230929140239eucas1p1917c6db31ae8d968a725d3a0824c4271~JY4WG4bVE1493514935eucas1p1Q;
	Fri, 29 Sep 2023 14:02:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id B7.4B.11320.FF8D6156; Fri, 29
	Sep 2023 15:02:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230929140239eucas1p100707358803bb5652bd2e506e93dfaf3~JY4VkDryJ1519215192eucas1p12;
	Fri, 29 Sep 2023 14:02:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230929140239eusmtrp20681390d79a16dcf189beecae65e74a3~JY4VidnSl1185111851eusmtrp2b;
	Fri, 29 Sep 2023 14:02:39 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-bd-6516d8ffe5ca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 3B.14.10549.EF8D6156; Fri, 29
	Sep 2023 15:02:39 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230929140238eusmtip2c25894434db9fa8e8bfc2867c15761a4~JY4VOmMMj3161831618eusmtip2F;
	Fri, 29 Sep 2023 14:02:38 +0000 (GMT)
Received: from localhost (106.210.248.178) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 29 Sep 2023 15:02:38 +0100
Date: Fri, 29 Sep 2023 16:03:47 +0200
From: Joel Granados <j.granados@samsung.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH 14/15] hyper-v/azure: Remove now superfluous sentinel
 element from ctl_table array
Message-ID: <20230929140347.dzpk5xfdfkxrcln7@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="pe36q5lo2npaavkw"
Content-Disposition: inline
In-Reply-To: <ZRWbGDlXCS4t8tMf@liuwe-devbox-debian-v2>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTfUxTVxzNfe/1vcpAn8jgBvwoqEtArcJQf3GwzMXF55Zs+0OXZdE4Im+g
	k9a1osyFpG6IAuNbptQyih20ilSsWNsqQljkY2XaDZDa0c0PmE7q0A3kS9pRH24m+++c8zvn
	3t+5yRWTwX1MuHinbC+vkCXtjqIDKHPr+PUVPmcov8rSHAPtvScJmCppZeC79tsE+MzFJGiu
	Z1FwJcuE4MrxOhq6R4ZoMNoOETDQeoeBr3RnabhxkYMTRecJ0HedRXCrJxxOOs0ElB9vR6C5
	GQd/VsyHxqrp87Ry6MxLA4e5QAT9tRcYODpRTUJZ8SMaumwaGg5X2hD83pJPQV6vhYZOXT4D
	k6NeEejbvAQ4iwYQ5BYeRtCqDYWxyUkRXL7Vj+CJ3YOgrEYKFcNlJBg8FSQ0qW8wUF1uIKFN
	P0VDrXE7NB09Q0Kz/ei05D0Ah74eZ+B7k4uAybHpi0cbSok3VnNd3e9wkxMliDuh+oniGk7d
	JLi+aiviGp9oKc6qdjOc1pTO2WwHGe68IYbTXf6D4KZy1nCuwUTOdDqH5sYMhSRXdLIZvb/o
	o4CEZH73zn28YuXrHwekTvV0MnvyQjJs6kuECk2wuUgsxmw8truoXBQgDmYNCNfd/oUUyDDC
	/d+4kED+RriwZ4TJRbOeJZ4aymdceoRbXEPkv67GQ6OEQC4gPJllof0Ril2Kq358+ixOs8vx
	dU8f6cchrASb3SrGHyBZ4xw8dNcg8g/msan46j014cdB7FpsvVbKCHgu7ijvp/yYZDPwzz4d
	4W9BshFY7xX75VnsGvxgvJASVl2Mx+rttIAz8Q8NrmfLYTY7EDcN6kjhBTZg00OF4JmHH7Q1
	zNScj33Wyhl/KcJN3keMQGoRrjk4Qgiu13BWd/9MYj1+fP/5obOx8+FcYc/ZuMR8bEYOwkey
	gwX3K7j2Vw9VhBarX2imfqGZ+r9mgrwcay/9Rf9PXoZrqgZJASdio3GI0iLmNArj05VpKbwy
	TsbvlyqT0pTpshTpDnmaCU1/Oru3bdiC9A8eS1sQIUYtaMl0+E59rQOFUzK5jI8KCcp2hPLB
	QclJnx/gFfLtivTdvLIFRYipqLCgZYkdO4LZlKS9/Kc8v4dXPJ8S4lnhKiK549K7czJdsU2b
	E6wSWFldsXDJwIL6Hs02Yr7U+mWCalm0s6JwaWCRJPBbzcVoLnZXKKrMXNvR5RqOL35c/dm6
	6PwvHLGbblfGuWtydW7TvdlUnoob3/CWZPmHjQVvFp/IOdf8akaJzyt5e4Hnk9H6/N9y+8Ii
	txgt7ZGS4qp8e99lIuLMqSn39uGSI3clPZHuuDvhg4sGN5bFd/Z2uuVOi2jze/vtAatliaVV
	AdckWze9XBA24jhfWZAa4vDoJyJXZO/6QLa+F8uPiUUJzID0XMzdgc77iqW79oGje0lcYHf+
	pvJS27qr8HCVL3lz/LYtmpe2beg1bb3YdW5hSupiT10UpUxNio0hFcqkfwAu818d7wQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe1BUVRzHPfde7l1osBsgXomE1rCGcGEXWH8oOE5TebEam2oiqYQdvAEF
	u7QLaozNrMMb46XgwALGI1iUWgxkEUQgmpYt3iKIiA0Q4rAyIqmwvJZ225qc6b/P+f7O73N+
	c+YcHu6wQrrwoqXxnFwqieGTdkS3qev3XRujzpzP6VIC9DcrMFg/o6PgO/0kBhvaPBxK+pMJ
	aEuuR9BW+AMJN57Mk6BpScHgrm6KgqTKOhJGmlgozm3AQD1Uh2Bi2AUqRrUYFBXqEZTcEsGD
	Ule4Vm72lcmg53QsDGizbWC6tpGC/JUqHAryHpIw1FJCQtq3LQhmOrMIOH3zCgk9lVkUrC6Z
	bEDdZcJgNPcugsycNAS6Mmcwrq7aQOvENILF7jkEBdUCKH1cgEPNXCkO7aoRCqqKanDoUq+T
	UKsJg/b873Ho6M43R6ZESPlmmYKf68cwWDWaD166fBbb788O3XiLXV05g9hi5SDBXr5wC2PH
	q5oRe22xjGCbVXcotqw+gW1pOUWxDTWebGXrLMauZ4jZsftBbP3FDJI11uTgbG5FB3rXLVQQ
	KJclxHPuUTJFfBD/YyGIBMIAEIj8AgRC392f7hH58733BR7lYqKPcXLvfeGCqLyNQiIuw+lE
	+oMsQomMdCay5TG0H7NWU4RnIjueA12FGKUuj7AWXJkfHw/bWNmRWRvJJK2bFhCjHjUQ1kUj
	Yp70dZGWXQTtwZT3rlEWJmkvpn9uHLewE+3OaO8oKUsDTmueZbI6rFpHOor55Z4Ks7A9vZtp
	7jtLWa3FGPOHoZa0Fp5jfi2a/nsmnD7GXDVqzFaemZ9n1CaeJbalxYxhOeefsXcwxkvdpJW/
	Zh6tz6Bc5Kh6yqR6yqT6z2SNPZlR0yz2v/hVprr8Pm7lIEajmSfKEHUROXEJitjIWIVQoJDE
	KhKkkYIIWWw9Mj98rW654Qo6b1gQdCKMhzrRS+bOqUu1A8iFkMqkHN/JPnXAmXOwPyr5KpGT
	y8LkCTGcohP5m68xD3fZEiEz/yJpfJhQ7OMv9BMH+PgHiH35W+2D49IlDnSkJJ77guPiOPm/
	fRjP1kWJvT7m7zWett+0zS2s1TdaLAmX8ju0IvEKb0kxnHrkfTjhEdBYEGwzFvLC58qXw3m9
	mZSkP5Tu+XDQePwTvZuBVSr+zA5+7zN9xF6N4WD6eRgfF82l73FOSlE/2tRmu7m3tqrVveWV
	mPYU92L7N+I9xlOnUqJ3vsjfu91QeP3tn9w2IrWGukB1yDMHZq+uh8xo8u0mpX1RDxeGFnlf
	em0xnNQfvj7ptJJ2mNt6aOLA2lTSIb9z98q3nTzlGtrkPZ+0Xp24Vqm6/U7yphzhbVHAjn4M
	iO2c3cF+m4Ijv7l6f4CTF9xnRnc5bP7o3LzuzeWCqqadxzOZwdd6shu64voWm0gPgk8ooiRC
	T1yukPwF2ZBtso0EAAA=
X-CMS-MailID: 20230929140239eucas1p100707358803bb5652bd2e506e93dfaf3
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

--pe36q5lo2npaavkw
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 03:26:16PM +0000, Wei Liu wrote:
> Please change the prefix to "Drivers: hv:" in the subject line in the
> two patches.
I'll change the commit message for the 14/15 patch from "hyper-v/azure"
to "Drivers: hv:". But I only see one patch that needs this. Which is
the other one?

best
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

--pe36q5lo2npaavkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUW2UEACgkQupfNUreW
QU+ZyQv9HSXCGinIOipdlVjAjwhhj6RTSXKmVOPKYpS5Rg7aN0U82HzUpe/YGUvE
dEkLD50b0Mo5onU0fxk7PxAo7caRLYwpTki5RqjceH1a3DgPuH0jozn4rbxb10ym
v0B/fxvdHH9rxasac48TToOUPvqcbelPpQ59h7PEj84QwcYkd7pV6Wt7elbOt2fI
w8dfe8vvnNXGLquYe0hqGv7c6TGjOXwY06dTtga5LzmalTp0IMELfKNebRsWhhPQ
gsL9i6erlZUN75ZmgZM+YMnhEcEQwRFxapO1r2nENKMoWHNKglPIZ8BHfkZnXy48
HCo5Kt8JZ1E1XArWKL6N58dcSyWJx2U9aMXC7Ugl8WWKDGuW3W9+v/1uxuxE7Bsi
wfooQe5Df/UjY3wvmdcooleqJ8NFjWgv7/pU0i/WXS2dxzUB9VF27Ghgj9sRNY7V
IUGRM7apb2US7rjwyn1DuDn4A+iO4ZRBH1tZr3RtnIigP9fboAI8E3+sEIhdL0FX
R517c3qf
=7vL7
-----END PGP SIGNATURE-----

--pe36q5lo2npaavkw--
