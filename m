Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74657B649C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 10:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=q/PAqxic;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0BJL5b3lz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 19:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=q/PAqxic;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0BHN72Cjz300f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 19:45:49 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231003084534euoutp02d3766c81a6f9a4371503d95d11327ab1~KjIoTk90b0307303073euoutp02m;
	Tue,  3 Oct 2023 08:45:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231003084534euoutp02d3766c81a6f9a4371503d95d11327ab1~KjIoTk90b0307303073euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1696322734;
	bh=O9E7ceDNyRwXJ2xGZgRki4b16kn1UdOkC9S8733H0+Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=q/PAqxicyIL14ZnJRAF5TyZhsBkX76tWzXB1ID9EbQz7XUIupSeiR86qJJf5vhoPP
	 BL7cuUOl+jHVlKjvlobtUhDdK7wgOGhEzSc3f5P+PsqkxPA8WgtV5Cucu//KbMH3Uh
	 bKF5wvkeRwc/Peu9I3nElFhegXa8tV8fwH0otB9s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231003084529eucas1p17c63898bf432159da3eaaba9b7b6f86d~KjIjtXWA41008410084eucas1p1w;
	Tue,  3 Oct 2023 08:45:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 83.01.11320.9A4DB156; Tue,  3
	Oct 2023 09:45:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20231003084528eucas1p172b5a744b37bf5aa4d6028a7a008f8f3~KjIjC-MdF1432014320eucas1p1e;
	Tue,  3 Oct 2023 08:45:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231003084528eusmtrp2259166a349da7be7d0a696cf9bc05b33~KjIjBJitX1344313443eusmtrp2P;
	Tue,  3 Oct 2023 08:45:28 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-3f-651bd4a97e7d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id BB.D4.10549.8A4DB156; Tue,  3
	Oct 2023 09:45:28 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231003084528eusmtip1fb4b1d3ca9e1b33f0519e7023f40cef0~KjIiriNZS2921429214eusmtip1p;
	Tue,  3 Oct 2023 08:45:28 +0000 (GMT)
Received: from localhost (106.210.248.115) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 3 Oct 2023 09:45:27 +0100
Date: Tue, 3 Oct 2023 10:47:49 +0200
From: Joel Granados <j.granados@samsung.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 00/15] sysctl: Remove sentinel elements from drivers
Message-ID: <20231003084749.4xxi4z64hgq5a5lw@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="fnnv6en4biooyeg3"
Content-Disposition: inline
In-Reply-To: <64fd22df-616e-9f5a-26fb-44c4b3423b0c@csgroup.eu>
X-Originating-IP: [106.210.248.115]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTa0wUVxjtndmdWTZiBrTldjHBAGlaUCqU6NciVFPbTOSHplhDjQlSHUAK
	i90FpRpbsCAFledCYXnIe1dWQHGhsIIIRh6CCmXLAkJFXlagivKWsJZ1aGvSf+ec+33n3HOT
	KyItH9ES0VFpKCeT+gbZUmJBVdPivc2X9NbcFkW9GbQY8glYTm6ioT/5MQ2FLY8IeFWVRELW
	/SgB3IiqQHAjvZQC/ewzCsp00QSMNg3R8FNBOQXdv7KQmXiNAFVXOYLB3yWQ31NFQEZ6C4Ks
	Xhd4mr0B6vJW/HJDoP1cMHRUxQthRFNJg+JlEQmpSVMUdOmyKIi5qEMw1nhBAOcM1RS0F1yg
	YWneKARVs5GAnsRRBHEJMQiact+BhaUlIdQOjiCYa5tEkFrsBNkzqSSoJ7NJqFd201CUoSah
	WbVMgabMB+oVl0m42aZYkYwnIfr8Ig23KvoIWFpYCZ7XphA7trJdek926WUyYjMjOgXsbO89
	gtVe6iXY/qIaxNbN5QrYGuUAzeZWhLE6XSTNXlM7sAW1Twh2OXYr2zfhzlaUxFLsgjqB3Lvx
	gHj7ES7o6HFO9qHHIXHApKoSHTP4h8eMDRERSOMZh8xEmHHF2mg1HYfEIktGjXBa6QzFkxmE
	U7qeC3kyjXBnT98KEb1eMeZwvK5CeLxhivx3qHLq8aqXFuHetCrCFCJg7HFF1CWhCVPMJnx/
	sp80Oa1nXHD8xGsnkolZhweudCHTzDrGExvyS2gTNme24RdxM0IeW+DWjBGBCZNMOJ6u0xEm
	H5KxxiqjyCSbMR5YuZxE8N3scEfWBMXj0/iOto8wZWHm7Brc9meqkD/YhXMGH67idXi8WUvz
	eAN+VXNxdSEF4XrjFM0TDcLFkbOrEW44Sj+yurETj0c0Iv6N1uKevyz4i67FyVW/kLxsjn8+
	a8lPv4c1f0wKEpGd8o1qyjeqKf+rxstOuCdVQf1PdsTFeRMkj91xWdkzQS6iS5AVFyYP9ufk
	LlLuhJPcN1geJvV3OhwSXIFWfl6bsXmmGqnGnzs1IkKEGpH9yvLQFU0HkgikIVLOdr35/tsS
	ztL8iO/3JzlZiI8sLIiTNyJrkcDWytzRvfWwJePvG8p9y3HHONk/p4TITBJB2KQ36LcvdNbG
	OKwZdr3nfvvJ3sBZ+202sv7vxO1+p0uqP3H7zKP8B6+W+cCDz2sNdn6fZzz49LfY+soagy58
	4ITj1znHTyzm3xkVx/q4LfeJD14lUzbtsXZtuBpR2P8F0fKC8vnqmPehc6cix76xUA8Gjc13
	a0/d+lK4+WaSnzxn95hiy4H3C4ebrid/cKH7cuTDM+3R3tfsF70epHUOlzZaXH+2s9obHBZ1
	75brd7UMOMd42NKtT68+vXv9vIU4SJ86FrqxK2/yxwNv3Q/oK5F+VD+8z2vHdGZ1gVbi6hH6
	NluU4dy77B067p7WUXrm44RWZXzpnuEgG5aW2Mhe3A3c57VoNbffViAP8HV2IGVy378BjDSm
	zPQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTaUxcVRj1vje8N4whfQLiE1pDp6Rpqw4My/Cxiv3jM5BooqENpuLYvkKV
	YXCGqZWkLAoBBtqyGhgW2feyDDDsUKcUUEiLZd8qLZst2E3KWkYHpqYm/jv3fGf5cnMvFzfd
	Jiy554JDWVmwOIhP8Dj9ut6Zd8uGrVi7tpQD0DdWgMFOSg8J0ylLJBT13cXgb00yDtm3ojnQ
	Ga1G0JlxlYDhZ48IqG6NwWCh5x4JPxTWEDDaxEBWUj0GpUM1CGZHLKFgXINBZkYfguwJe3iY
	sx868vV5eVIYSJDAoOayEcxXNpKQtlWMQ3ryYwKGWrMJiP2pFcGi9hIHEsaaCRgovETC9rrO
	CEp7dRiMJy0gUF6JRdCTZwEb29tG0D47j2CtfwVBeokAclbTcShbycGhSzVKQnFmGQ69pTsE
	VFb7Q1daFQ7X+tP0lC4MYhI3SbiunsRge0NfvN6QinmJmKFhb2Z7KwUxWZG/cZhnEzcxpqF8
	AmOmi1sQ07GWx2FaVDMkk6dWMK2tUSRTX3aMKWy/jzE78SJmctmDUVfEE8xG2RX8Y2s/gbtM
	qghlrQOl8lAP/mdCsBcIXUBg7+giEDo4n3K1d+LberqfYYPOnWdltp5fCAI37wyikJGACwN1
	jSgSlXsrEZdLU460LpdVIh7XlCpG9MZKPqZExnp+P123OmJkwGb081ElYRA9QfS1rjIjw6EB
	0VNFneSuikPZ0Oro8j0HQb1D31qZxncbzCl7+vLyXgNOxZrRt+Nq8F2NGeVNjxVU7HlNKGf6
	qXL1RehdREepGo0Mg9foXzLnObtBOHWeLo3/1gCt6FIdd1dhTHnSqp3kF0sfogezlwkDvkj/
	tbOIkpCZ6j9BqpdBqpdBuwpcv3NL4zTxP/ptuiR/GTdgD7q6+hEnD5EVyJxVyCUBErlQIBdL
	5IrgAMFpqUSN9C9f07NZ34xyHzwRaBHGRVpko3feq60cRJacYGkwyzc38b1hyZqanBF/F8bK
	pP4yRRAr1yIn/R0m45avn5bqv1FwqL9QZOckdBS52Dm5iBz4b5h8GBInNqUCxKHs1ywbwsr+
	9WFcY8tI7JM20fMYt4zD9qKgE0Ve37T41bY/CGgeb9uSqC68CYeNj1wNz2rhSS3IwF717Emf
	I1RcRcRx17Aml/Vac87En6n7zBP8ruf7L9BRB6W87tRXN+9/MPa0zzPxx9+74OivWUu8RAtl
	yacfeTicfLjjZjd6Ft0Mesx5v+OritBo525tfEh1nfXRgkh/m7nYtxbCJ7+XFnOH3Zcm3rNT
	t0586S7RqDd9DwysTdnOBMJcxufiyhSm1HaGPLjSdUh0NvdG/hwesbUk9/FavMMzjSjELTQ/
	n4oE56m6ELfbM0rtQR/qxB9eM2b7/Hw7Liq40Si8iTWzS6k67ljVTbm+YiWNTdPwOfJAsfAY
	LpOL/wHYFGJwjgQAAA==
X-CMS-MailID: 20231003084528eucas1p172b5a744b37bf5aa4d6028a7a008f8f3
X-Msg-Generator: CA
X-RootMTR: 20231002122730eucas1p17643da82bb9aa655b35c3562446ad395
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231002122730eucas1p17643da82bb9aa655b35c3562446ad395
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
	<CGME20231002122730eucas1p17643da82bb9aa655b35c3562446ad395@eucas1p1.samsung.com>
	<64fd22df-616e-9f5a-26fb-44c4b3423b0c@csgroup.eu>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, "willy@infradead.org" <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "josh@joshtriplett.org" <josh@joshtriplett.org>, Jani Nikula <jani.nikula@linux.intel.com>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, "netdev@vger.kernel.org" <netdev@vger.kerne
 l.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--fnnv6en4biooyeg3
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 12:27:18PM +0000, Christophe Leroy wrote:
>=20
>=20
> Le 02/10/2023 =E0 10:55, Joel Granados via B4 Relay a =E9crit=A0:
> > From: Joel Granados <j.granados@samsung.com>
> >=20
<--- snip --->
> >          - The "yesall" config saves 2432 bytes [4]
> >          - The "tiny" config saves 64 bytes [5]
> >      * memory usage:
> >          In this case there were no bytes saved because I do not have a=
ny
> >          of the drivers in the patch. To measure it comment the printk =
in
> >          `new_dir` and uncomment the if conditional in `new_links` [3].
> >=20
> > ---
> > Changes in v2:
> > - Left the dangling comma in the ctl_table arrays.
> > - Link to v1: https://lore.kernel.org/r/20230928-jag-sysctl_remove_empt=
y_elem_drivers-v1-0-e59120fca9f9@samsung.com
> >=20
> > Comments/feedback greatly appreciated
>=20
> Same problem on powerpc CI tests, all boot target failed, most of them=20
> with similar OOPS, see=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20231002-jag-sysc=
tl_remove_empty_elem_drivers-v2-15-02dd0d46f71e@samsung.com/
I found the culprit!. Here you are rebasing on top of v6.5.0-rc6 "INFO:
Looking for kernel version: 6.5.0-rc6-gbf2ac4d7d596". The error makes
sense becuase in that version we have not introduced the stopping
criteria based on the ctl_table array size, so the loop continues
looking for an empty sentinel past valid memory (and does not find it).
The ctl_table check catches it but then fails to do a proper error
because we have already tried to access invalid memory. The solution
here is to make sure to rebase in on top of the latest rc in v6.6.

>=20
> What is strange is that I pushed your series into my github account, and=
=20
> got no failure, see https://github.com/chleroy/linux/actions/runs/6378951=
278
And here it works because you use the latest rc : "INFO: Looking for
kernel version: 6.6.0-rc3-g23d4b5db743c"

>=20
> Christophe
>=20
> >=20
> > Best
> >=20
> > Joel
> >=20
> > [1]
> > We are able to remove a sentinel table without behavioral change by
> > introducing a table_size argument in the same place where procname is
> > checked for NULL. The idea is for it to keep stopping when it hits
> > ->procname =3D=3D NULL, while the sentinel is still present. And when t=
he
> > sentinel is removed, it will stop on the table_size. You can go to
> > (https://lore.kernel.org/all/20230809105006.1198165-1-j.granados@samsun=
g.com/)
> > for more information.
> >=20
> > [2]
> > Links Related to the ctl_table sentinel removal:
> > * Good summary from Luis sent with the "pull request" for the
> >    preparation patches.
> >    https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.or=
g/
> > * Another very good summary from Luis.
> >    https://lore.kernel.org/all/ZMFizKFkVxUFtSqa@bombadil.infradead.org/
> > * This is a patch set that replaces register_sysctl_table with register=
_sysctl
> >    https://lore.kernel.org/all/20230302204612.782387-1-mcgrof@kernel.or=
g/
> > * Patch set to deprecate register_sysctl_paths()
> >    https://lore.kernel.org/all/20230302202826.776286-1-mcgrof@kernel.or=
g/
> > * Here there is an explicit expectation for the removal of the sentinel=
 element.
> >    https://lore.kernel.org/all/20230321130908.6972-1-frank.li@vivo.com
> > * The "ARRAY_SIZE" approach was mentioned (proposed?) in this thread
> >    https://lore.kernel.org/all/20220220060626.15885-1-tangmeng@uniontec=
h.com
> >=20
> > [3]
> > To measure the in memory savings apply this on top of this patchset.
> >=20
> > "
> > diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> > index c88854df0b62..e0073a627bac 100644
> > --- a/fs/proc/proc_sysctl.c
> > +++ b/fs/proc/proc_sysctl.c
> > @@ -976,6 +976,8 @@ static struct ctl_dir *new_dir(struct ctl_table_set=
 *set,
> >          table[0].procname =3D new_name;
> >          table[0].mode =3D S_IFDIR|S_IRUGO|S_IXUGO;
> >          init_header(&new->header, set->dir.header.root, set, node, tab=
le, 1);
> > +       // Counts additional sentinel used for each new dir.
> > +       printk("%ld sysctl saved mem kzalloc \n", sizeof(struct ctl_tab=
le));
> >=20
> >          return new;
> >   }
> > @@ -1199,6 +1201,9 @@ static struct ctl_table_header *new_links(struct =
ctl_dir *dir, struct ctl_table_
> >                  link_name +=3D len;
> >                  link++;
> >          }
> > +       // Counts additional sentinel used for each new registration
> > +       //if ((head->ctl_table + head->ctl_table_size)->procname)
> > +               printk("%ld sysctl saved mem kzalloc \n", sizeof(struct=
 ctl_table));
> >          init_header(links, dir->header.root, dir->header.set, node, li=
nk_table,
> >                      head->ctl_table_size);
> >          links->nreg =3D nr_entries;
> > "
> > and then run the following bash script in the kernel:
> >=20
> > accum=3D0
> > for n in $(dmesg | grep kzalloc | awk '{print $3}') ; do
> >      echo $n
> >      accum=3D$(calc "$accum + $n")
> > done
> > echo $accum
> >=20
> > [4]
> > add/remove: 0/0 grow/shrink: 0/21 up/down: 0/-2432 (-2432)
> > Function                                     old     new   delta
> > xpc_sys_xpc_hb                               192     128     -64
> > xpc_sys_xpc                                  128      64     -64
> > vrf_table                                    128      64     -64
> > ucma_ctl_table                               128      64     -64
> > tty_table                                    192     128     -64
> > sg_sysctls                                   128      64     -64
> > scsi_table                                   128      64     -64
> > random_table                                 448     384     -64
> > raid_table                                   192     128     -64
> > oa_table                                     192     128     -64
> > mac_hid_files                                256     192     -64
> > iwcm_ctl_table                               128      64     -64
> > ipmi_table                                   128      64     -64
> > hv_ctl_table                                 128      64     -64
> > hpet_table                                   128      64     -64
> > firmware_config_table                        192     128     -64
> > cdrom_table                                  448     384     -64
> > balloon_table                                128      64     -64
> > parport_sysctl_template                      912     720    -192
> > parport_default_sysctl_table                 584     136    -448
> > parport_device_sysctl_template               776     136    -640
> > Total: Before=3D429940038, After=3D429937606, chg -0.00%
> >=20
> > [5]
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-64 (-64)
> > Function                                     old     new   delta
> > random_table                                 448     384     -64
> > Total: Before=3D1885527, After=3D1885463, chg -0.00%
> >=20
> > [6] https://lore.kernel.org/all/20230913-jag-sysctl_remove_empty_elem_a=
rch-v2-0-d1bd13a29bae@samsung.com/
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> >=20
> > To: Luis Chamberlain <mcgrof@kernel.org>
> > To: willy@infradead.org
> > To: josh@joshtriplett.org
> > To: Kees Cook <keescook@chromium.org>
> > To: Phillip Potter <phil@philpotter.co.uk>
> > To: Clemens Ladisch <clemens@ladisch.de>
> > To: Arnd Bergmann <arnd@arndb.de>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > To: Juergen Gross <jgross@suse.com>
> > To: Stefano Stabellini <sstabellini@kernel.org>
> > To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > To: Jiri Slaby <jirislaby@kernel.org>
> > To: "James E.J. Bottomley" <jejb@linux.ibm.com>
> > To: "Martin K. Petersen" <martin.petersen@oracle.com>
> > To: Doug Gilbert <dgilbert@interlog.com>
> > To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > To: Jason Gunthorpe <jgg@ziepe.ca>
> > To: Leon Romanovsky <leon@kernel.org>
> > To: Corey Minyard <minyard@acm.org>
> > To: Theodore Ts'o <tytso@mit.edu>
> > To: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > To: David Ahern <dsahern@kernel.org>
> > To: "David S. Miller" <davem@davemloft.net>
> > To: Eric Dumazet <edumazet@google.com>
> > To: Jakub Kicinski <kuba@kernel.org>
> > To: Paolo Abeni <pabeni@redhat.com>
> > To: Robin Holt <robinmholt@gmail.com>
> > To: Steve Wahl <steve.wahl@hpe.com>
> > To: Russ Weight <russell.h.weight@intel.com>
> > To: "Rafael J. Wysocki" <rafael@kernel.org>
> > To: Song Liu <song@kernel.org>
> > To: "K. Y. Srinivasan" <kys@microsoft.com>
> > To: Haiyang Zhang <haiyangz@microsoft.com>
> > To: Wei Liu <wei.liu@kernel.org>
> > To: Dexuan Cui <decui@microsoft.com>
> > To: Jani Nikula <jani.nikula@linux.intel.com>
> > To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > To: David Airlie <airlied@gmail.com>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: xen-devel@lists.xenproject.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-scsi@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-rdma@vger.kernel.org
> > Cc: openipmi-developer@lists.sourceforge.net
> > Cc: netdev@vger.kernel.org
> > Cc: linux-raid@vger.kernel.org
> > Cc: linux-hyperv@vger.kernel.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> >=20
> > ---
> >=20
> > ---
> > Joel Granados (15):
> >        cdrom: Remove now superfluous sentinel element from ctl_table ar=
ray
> >        hpet: Remove now superfluous sentinel element from ctl_table arr=
ay
> >        xen: Remove now superfluous sentinel element from ctl_table array
> >        tty: Remove now superfluous sentinel element from ctl_table array
> >        scsi: Remove now superfluous sentinel element from ctl_table arr=
ay
> >        parport: Remove the now superfluous sentinel element from ctl_ta=
ble array
> >        macintosh: Remove the now superfluous sentinel element from ctl_=
table array
> >        infiniband: Remove the now superfluous sentinel element from ctl=
_table array
> >        char-misc: Remove the now superfluous sentinel element from ctl_=
table array
> >        vrf: Remove the now superfluous sentinel element from ctl_table =
array
> >        sgi-xp: Remove the now superfluous sentinel element from ctl_tab=
le array
> >        fw loader: Remove the now superfluous sentinel element from ctl_=
table array
> >        raid: Remove now superfluous sentinel element from ctl_table arr=
ay
> >        Drivers: hv: Remove now superfluous sentinel element from ctl_ta=
ble array
> >        intel drm: Remove now superfluous sentinel element from ctl_tabl=
e array
> >=20
> >   drivers/base/firmware_loader/fallback_table.c |  1 -
> >   drivers/cdrom/cdrom.c                         |  1 -
> >   drivers/char/hpet.c                           |  1 -
> >   drivers/char/ipmi/ipmi_poweroff.c             |  1 -
> >   drivers/char/random.c                         |  1 -
> >   drivers/gpu/drm/i915/i915_perf.c              |  1 -
> >   drivers/hv/hv_common.c                        |  1 -
> >   drivers/infiniband/core/iwcm.c                |  1 -
> >   drivers/infiniband/core/ucma.c                |  1 -
> >   drivers/macintosh/mac_hid.c                   |  1 -
> >   drivers/md/md.c                               |  1 -
> >   drivers/misc/sgi-xp/xpc_main.c                |  2 --
> >   drivers/net/vrf.c                             |  1 -
> >   drivers/parport/procfs.c                      | 28 +++++++++++-------=
---------
> >   drivers/scsi/scsi_sysctl.c                    |  1 -
> >   drivers/scsi/sg.c                             |  1 -
> >   drivers/tty/tty_io.c                          |  1 -
> >   drivers/xen/balloon.c                         |  1 -
> >   18 files changed, 11 insertions(+), 35 deletions(-)
> > ---
> > base-commit: 0e945134b680040b8613e962f586d91b6d40292d
> > change-id: 20230927-jag-sysctl_remove_empty_elem_drivers-f034962a0d8c
> >=20
> > Best regards,

--=20

Joel Granados

--fnnv6en4biooyeg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUb1TMACgkQupfNUreW
QU+dSwv/VdmQFmwGJjil1rJHyE+Sc/SnIzc2236zL26xGDgEbQ5tSma2ncYbXdL4
nIY2i4Z9kQshrOjHGUx911wqp3BpmOkRtWDCSjn5uDIKCZ2ZjtNvRaYn10/iahkc
606iTKcJXw2XkjU6j7DqorK+iBQ7Dy6glPHp0vKbS6wxFAVsH/IubN/jhiEgK6qA
Q8Iv2LbaECMpNl5fvrI8Gze2IPEWCSv9ZoUFGUt1ARzsCpCQHbAG3fGYJStQk6tM
w5G0yNVOOLjBjYtXxn4ZkZEwRcnpQ5cvI10GdCP5XtGGcK1qEBgpJqaU1pwraZCW
0zhvgLRVFHuJZCpLoqJscGGNZq3aUNky/gOAoKOdoh9n1magAhx2Q8VXuNDO7P0c
peGouYGzJPLDuxYqWXV5qJ+5sAd0L1upStkDSOWEq9plxYTbdcdU/ej77mZrwJcu
sQOWoEt3YL+G3pPRDQzJDEGIijra1TI9FPTIbbuHEwQKpyWoFP+EKAFDrQosXWyn
sCovmRlT
=9d/Z
-----END PGP SIGNATURE-----

--fnnv6en4biooyeg3--
