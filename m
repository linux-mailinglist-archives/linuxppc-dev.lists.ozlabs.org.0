Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918B7B70FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RM510nMz3vbQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:34:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0GqC0c95z2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 23:10:13 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qneCk-0007eI-DF; Tue, 03 Oct 2023 14:08:46 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1qneCb-00Al6E-S0; Tue, 03 Oct 2023 14:08:37 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D0B6422CC33;
	Tue,  3 Oct 2023 11:26:49 +0000 (UTC)
Date: Tue, 3 Oct 2023 13:26:49 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [net-next PATCH 3/4] netdev: replace napi_reschedule with
 napi_schedule
Message-ID: <20231003-struggle-lung-3d7c89eab00b-mkl@pengutronix.de>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
 <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
 <651bf88c.050a0220.3a982.31fc@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbzdaj4jqyp54e52"
Content-Disposition: inline
In-Reply-To: <651bf88c.050a0220.3a982.31fc@mx.google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jose Abreu <joabreu@synopsys.com>, Alex
  Elder <elder@linaro.org>, linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Krzysztof Halasa <khalasa@piap.pl>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuri Karpov <YKarpov@ispras.ru>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.
 org>, Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org, Douglas Miller <dougmill@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zbzdaj4jqyp54e52
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03.10.2023 13:18:33, Christian Marangi wrote:
> On Tue, Oct 03, 2023 at 09:16:33AM +0200, Marc Kleine-Budde wrote:
> > On 02.10.2023 17:10:22, Christian Marangi wrote:
> > > Now that napi_schedule return a bool, we can drop napi_reschedule that
> > > does the same exact function. The function comes from a very old comm=
it
> > > bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of st=
ruct
> > > net_device") and the purpose is actually deprecated in favour of
> > > different logic.
> > >=20
> > > Convert every user of napi_reschedule to napi_schedule.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
> > >  drivers/net/can/dev/rx-offload.c                       |  2 +-
> >=20
> > Acked-by: Marc Kleine-Budde # for can/dev/rx-offload.c
>=20
> Just to make sure can I use the correct tag: (you didn't include the
> mail)

Doh! Sure.

> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload=
=2Ec

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zbzdaj4jqyp54e52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmUb+nYACgkQvlAcSiqK
BOgAwwf9HSZX1sxRgnOHWLXSBACCTpqNm26rDzNrIqPlybJQVie8rNauFCEQbSz+
cKDZD68pDokwEv+8WajpOBW0d/Zc27B2d7EZtYhlopNFjo0XIPYoYfA6QTXfZ6Qs
vi22lC87vHoyEwEi37X3yTPapJVY2GDgyGSD+8FsdOliNE679gautzYvZSWLPiRF
stXo71bRBm15AbVKwCuOqymieHGxKbooQ09lRIYUXdK6oF671CJLKUia6m9Qg42f
6Itf4TBPlF4XdxS0vqKrvTsg78XduHN1FmuI+RJIPdzULMx9CoUlr8BOSfGomsN3
eoH9v4s8IDrkLGQifa7oRIgxg9EkFw==
=72hV
-----END PGP SIGNATURE-----

--zbzdaj4jqyp54e52--
