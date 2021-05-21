Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE49138D1BB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 00:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fn29f68Wsz3brv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 08:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=COtRV+F1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wnew3-smtp.messagingengine.com (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com;
 envelope-from=marmarek@invisiblethingslab.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=COtRV+F1; 
 dkim-atps=neutral
X-Greylist: delayed 483 seconds by postgrey-1.36 at boromir;
 Fri, 21 May 2021 20:51:18 AEST
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmk1L31fRz303P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 20:51:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id CFA6C127F;
 Fri, 21 May 2021 06:43:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 21 May 2021 06:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5uODI0
 1Xgq6m2Hs1jcEGX2rKBKwRaYcR9su+Lfn8v9I=; b=COtRV+F19cAeQdDNk/rVdC
 Qog2aXIYdX+hhTJoJ4wkbuDGi2XXAs2fj64hX1SwUyQGyNDPi/ojfU4lekj+OXZs
 4TvLBsWR76nVhlvLZZAddWhltadoEGkD1yCVvjIBiWlDAN7zsUvWUdLHF1gCbe0x
 TsiKlgOVLiscgkDk4i1yYCsyUBF79psshPwSVqkzVnTCVyFteOpt5yHpwbgaRBwR
 LHp5egybXYWTXKHMNXIqx7c8uR1RyXHtV/A1mWKSPBRw4nxdCgxgi3gi/iUG5VEa
 qxHcORBLPHHNNQaMhgk/1QI+r21ijf3nurUINMh0WQKdpUDjX9b7A+EJiCTiMCDw
 ==
X-ME-Sender: <xms:u46nYEyh3wZwvMGTA5vBI3zdj3e24axeVBi9PJUqCruMlycdv-ZsHA>
 <xme:u46nYIQRKLpp5zCZkG_RpbHBThveg62q3e0EYoFeY2RcvKd5_bHRRS24lABixvm3J
 8Z0aLg7UPvxjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejfedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegjeej
 jefftdefgffghfeujedvheffhedtjeejgfevhfefgfeigfelkeegjeejgfenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmpdigvghnphhrohhjvggtthdrohhrghenucfkphepledu
 rdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
 mh
X-ME-Proxy: <xmx:u46nYGVl3NcSG603U5Dc6sPvTEae_YeRemGaz37WpHxU-8JMgw_mjA>
 <xmx:u46nYChW7z_JLjaA6qqYp-56HzvX5LPXftyI6zGPcw63_D6vVTgzVw>
 <xmx:u46nYGBjc5kymt7v0TJG_QYkdllTG-gwfaYOchOpMqFUHsSx9dEMFg>
 <xmx:vI6nYHKvcbgLVUghBWSNPmANdv41Y8Bys2iYHcL9bJIpBipIRFdYWJyKg10>
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 06:43:05 -0400 (EDT)
Date: Fri, 21 May 2021 12:43:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/8] xen: harden frontends against malicious backends
Message-ID: <YKeOtbXkFz7JTMn0@mail-itl>
References: <20210513100302.22027-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bxyuzBoNLlcC9wan"
Content-Disposition: inline
In-Reply-To: <20210513100302.22027-1-jgross@suse.com>
X-Mailman-Approved-At: Sat, 22 May 2021 08:59:11 +1000
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--bxyuzBoNLlcC9wan
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 May 2021 12:43:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 0/8] xen: harden frontends against malicious backends

On Thu, May 13, 2021 at 12:02:54PM +0200, Juergen Gross wrote:
> Xen backends of para-virtualized devices can live in dom0 kernel, dom0
> user land, or in a driver domain. This means that a backend might
> reside in a less trusted environment than the Xen core components, so
> a backend should not be able to do harm to a Xen guest (it can still
> mess up I/O data, but it shouldn't be able to e.g. crash a guest by
> other means or cause a privilege escalation in the guest).
>=20
> Unfortunately many frontends in the Linux kernel are fully trusting
> their respective backends. This series is starting to fix the most
> important frontends: console, disk and network.
>=20
> It was discussed to handle this as a security problem, but the topic
> was discussed in public before, so it isn't a real secret.

Is it based on patches we ship in Qubes[1] and also I've sent here some
years ago[2]? I see a lot of similarities. If not, you may want to
compare them.

[1] https://github.com/QubesOS/qubes-linux-kernel/
[2] https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg02336.h=
tml


> Juergen Gross (8):
>   xen: sync include/xen/interface/io/ring.h with Xen's newest version
>   xen/blkfront: read response from backend only once
>   xen/blkfront: don't take local copy of a request from the ring page
>   xen/blkfront: don't trust the backend response data blindly
>   xen/netfront: read response from backend only once
>   xen/netfront: don't read data from request on the ring page
>   xen/netfront: don't trust the backend response data blindly
>   xen/hvc: replace BUG_ON() with negative return value
>=20
>  drivers/block/xen-blkfront.c    | 118 +++++++++-----
>  drivers/net/xen-netfront.c      | 184 ++++++++++++++-------
>  drivers/tty/hvc/hvc_xen.c       |  15 +-
>  include/xen/interface/io/ring.h | 278 ++++++++++++++++++--------------
>  4 files changed, 369 insertions(+), 226 deletions(-)
>=20
> --=20
> 2.26.2
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bxyuzBoNLlcC9wan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCnjrUACgkQ24/THMrX
1yyaAgf/V30jyv6uv6+F7OW2zOfe72gfIS/EQrm6baOF7VkhumGU3/xVm5uGtf0c
MRInt992m2TocU3i807K9juNN42uowicJQMofvWIo0DmU+SFLO7skFDIy1doVZwf
V57we8V1xtULjiW9LFB5gtjyypfD9BnuP+UJczQ1GkvVW0tbrnt9yOnt/RkkbPTo
8Iv+fhPOv/nfH07j2IFmfKTVQXLgpIXEDQjRocpMU9aqx4QxXjLwrV8X5Kl/dDHU
YPTiLLy/lORMJ4YzapwnQSSrIt8ta/i5ZD8RzICPFDqDA9UoHwTXt8AbeBvM7wsm
ts5+9qugZ3Ea/gKhq2VN7t6OKAHw0Q==
=YEbr
-----END PGP SIGNATURE-----

--bxyuzBoNLlcC9wan--
