Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA727C96F7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 00:01:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7HQc5dS1z3vXh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 09:01:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7HQ538BXz3c03
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 09:01:17 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrmfV-0001zq-2D; Sat, 14 Oct 2023 23:59:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrmfI-001hum-RA; Sat, 14 Oct 2023 23:59:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrmfI-00GSU5-Fm; Sat, 14 Oct 2023 23:59:20 +0200
Date: Sat, 14 Oct 2023 23:59:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: soc@kernel.org
Subject: [GIT PULL] Convert drivers/soc to struct
 platform_driver::remove_new()
Message-ID: <20231014215918.prqhkk7kp2vobe3a@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
 <1b2fddf8-c0a6-4afa-8ad0-f280dea1607f@app.fastmail.com>
 <f4hvrslynlgmxu4a2gogc5idvumskhaalxgwildy56yqk2wz7d@lkh4swkv52mi>
 <20230928061449.xxqhyyrg6e357dn2@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7gysnf7ldsm65nug"
Content-Disposition: inline
In-Reply-To: <20230928061449.xxqhyyrg6e357dn2@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Nishanth Menon <nm@ti.com>, Herve Codina <herve.codina@bootlin.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Mateusz Holenko <mholenko@antmicro.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-tegra@vger.kernel.org, "Conor.Dooley" <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-riscv@lists.infradead.org, Karol Gugala <kgugala@antmicro.com>, Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Ruan Jinjie <ruanjinjie@huawei.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Jon Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Gabriel Somlo <gsomlo@gmail.com>, Andy Gross <agross@kernel.org>, Huisong Li <lihuisong@huawei.com>, Joel Stanley <joel@jms.id.au>, Yang Yingliang <yangyingliang@huawei.com>, Sumit Gupta <sumitg@nvidia.com>, "zhang.songyi" <zhang.songyi@zt
 e.com.cn>, Zev Weiss <zev@bewilderbeest.net>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Krzysztof Halasa <khalasa@piap.pl>, loongarch@lists.linux.dev, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, Nick Alcock <nick.alcock@oracle.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7gysnf7ldsm65nug
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

the following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/ukl/linux tags/platform-remove-void-soc-fo=
r-6.7-rc

for you to fetch changes up to e77e6e3e909d33361c58af848a96e1f7f71ba7e4:

  soc/pxa: ssp: Convert to platform remove callback returning void (2023-10=
-14 23:27:34 +0200)

----------------------------------------------------------------
Convert drivers/soc to struct platform_driver::remove_new()

This PR contains the patches I sent in the series available at
https://lore.kernel.org/all/20230925095532.1984344-1-u.kleine-koenig@pengut=
ronix.de
that were not yet picked up in next as of next-20231013.

It converts all drivers below drivers/soc to let their remove callback
return void. See commit 5c5a7680e67b ("platform: Provide a remove
callback that returns no value") for the rationale.

----------------------------------------------------------------

On Thu, Sep 28, 2023 at 08:14:49AM +0200, Uwe Kleine-K=F6nig wrote:
> On Wed, Sep 27, 2023 at 04:01:58PM -0700, Bjorn Andersson wrote:
> > On Wed, Sep 27, 2023 at 10:43:16AM +0200, Arnd Bergmann wrote:
> > > On Wed, Sep 27, 2023, at 04:25, Joel Stanley wrote:
> > > > On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-K=F6nig <u.kleine-koenig@=
pengutronix.de> wrote:
> > > >>
> > > >> this series converts all platform drivers below drivers/soc to use
> > > >> .remove_new(). The motivation is to get rid of an integer return c=
ode
> > > >> that is (mostly) ignored by the platform driver core and error pro=
ne on
> > > >> the driver side.
> > > >>
> > > >> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > > >> returns no value") for an extended explanation and the eventual go=
al.
> > > >>
> > > >> As there is no single maintainer team for drivers/soc, I suggest t=
he
> > > >> individual maintainers to pick up "their" patches.
> > > >
> > > > I'd be happy if Arnd merged the lot at once. Arnd, what do you thin=
k?
> > > >
> > > > If that will be too messy then I understand. I have queued the aspe=
ed
> > > > ones locally and will push that out if we decide that's the best way
> > > > to go.
> > >=20
> > > The main downside of merging it all at once through the soc tree
> > > is that there may be patches that conflict with other work going on
> > > in individual drivers.
> > >=20
> > > What I'd suggest doing here is:
> > >=20
> > > - have platform maintainers pick up patches for their drivers
> > >   if that is their preference for any reason
> >=20
> > I'd prefer this for the qcom drivers at least, please let me know if you
> > would like me to proceed.
>
> I can send a pull request as Arnd suggested. So iff you want the qcom
> drivers not be a part of that PR, just make sure they appear in next
> during the next week. :-)
>
> > > - get a pull request from Uwe for the soc tree for anything that has
> > >  not been picked up in one or two weeks from now

Here comes the promised PR. The qcom patches are among the set of
patches dropped here as they are already in next.

To state the obvious: This is merge window material and the idea is that
it's pulled into armsoc and then included in the armsoc v6.7-rc1 PR to
Linus Torvalds. I hope it's not too late for that already.

Best regards and thanks
Uwe

Uwe Kleine-K=F6nig (12):
      soc/fsl: dpaa2-console: Convert to platform remove callback returning=
 void
      soc/fsl: cpm: qmc: Convert to platform remove callback returning void
      soc/fsl: cpm: tsa: Convert to platform remove callback returning void
      soc/fujitsu: a64fx-diag: Convert to platform remove callback returnin=
g void
      soc/hisilicon: kunpeng_hccs: Convert to platform remove callback retu=
rning void
      soc/ixp4xx: ixp4xx-npe: Convert to platform remove callback returning=
 void
      soc/ixp4xx: ixp4xx-qmgr: Convert to platform remove callback returnin=
g void
      soc/litex: litex_soc_ctrl: Convert to platform remove callback return=
ing void
      soc/loongson: loongson2_guts: Convert to platform remove callback ret=
urning void
      soc/mediatek: mtk-devapc: Convert to platform remove callback returni=
ng void
      soc/mediatek: mtk-mmsys: Convert to platform remove callback returnin=
g void
      soc/pxa: ssp: Convert to platform remove callback returning void

 drivers/soc/fsl/dpaa2-console.c       | 6 ++----
 drivers/soc/fsl/qe/qmc.c              | 6 ++----
 drivers/soc/fsl/qe/tsa.c              | 5 ++---
 drivers/soc/fujitsu/a64fx-diag.c      | 6 ++----
 drivers/soc/hisilicon/kunpeng_hccs.c  | 6 ++----
 drivers/soc/ixp4xx/ixp4xx-npe.c       | 6 ++----
 drivers/soc/ixp4xx/ixp4xx-qmgr.c      | 5 ++---
 drivers/soc/litex/litex_soc_ctrl.c    | 5 ++---
 drivers/soc/loongson/loongson2_guts.c | 6 ++----
 drivers/soc/mediatek/mtk-devapc.c     | 6 ++----
 drivers/soc/mediatek/mtk-mmsys.c      | 6 ++----
 drivers/soc/pxa/ssp.c                 | 6 ++----
 12 files changed, 24 insertions(+), 45 deletions(-)

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7gysnf7ldsm65nug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUrDzUACgkQj4D7WH0S
/k5j4gf/bF9kgxVuSiift0gAwVEYG58vErpILxnhavoGUJkIvS/2rxDkuHmTNQ5X
QalfUGigAoE8LztKGVtaC0Xx+ie+VRIk5mw7tId7GP1bfzJnrekEsnRe0feT2zy4
2d7Jc3JZ2H+C31SObKtmKNcav5jLzXd8vN/RS+w/tj9/nE/paVB+kcHIX17ZPGE2
zIumGo0OqOAmN6fNwoqyqQuy22i5ECmPHi9DAJkeOg4/Hu017wBfW2V/FvHA+eee
KpnkXofsyZDqGCLvlNHd4qBQG/88+W7qcVxbCoDebo18y86tj2IbgeeFfbihxKLO
lcwKEm4ptKtWDPzYdLgO7nELl73FRw==
=h2pz
-----END PGP SIGNATURE-----

--7gysnf7ldsm65nug--
