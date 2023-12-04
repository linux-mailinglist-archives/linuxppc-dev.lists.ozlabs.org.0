Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE40803D12
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:32:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkXMH24bFz3dPs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 05:32:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkXLl6yZZz3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 05:31:42 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj4-00038w-0z; Mon, 04 Dec 2023 19:31:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj1-00DZmP-KD; Mon, 04 Dec 2023 19:31:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj1-00EE78-9y; Mon, 04 Dec 2023 19:31:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 0/9] net*: Convert to platform remove callback returning void
Date: Mon,  4 Dec 2023 19:30:40 +0100
Message-ID: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=OVvQ8uYjxLMYTaZSJq1OCfRdtPS4cvgLm8vM3BejMRM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbhrRA9QNL9A6/+EC/b+KUL8ByuRJhbrVgnSOG 4TWQn68YNaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW4a0QAKCRCPgPtYfRL+ TjVDB/0eG4VYbw9drfz2A1JiSQIiH+SED39TRg3MQbSa1i7JvhthEdJz3RsgmHJGxuIbvTEaf+G pE3/IiK/WYsAVNlWURx8F58h1MaKSgcCxB6UkK3F13nFcsSdkYViabIu/cyHooy2wVyyCDL31/D kmn9dtqyNwosyXWaN7VXQpLtM+q3Smw5Tl9HVpWdfAenzfShrzn6h5h1vT6pkXsWjucByaEjmjO Ep/nxUhk6mkRawEkvZ2rMZ7/IgkiQ/KfWaIVwkGYHngmAUDeMcuHd3+70YIw50qlOokbuV/k5yW CVge3kM7/CpnqYDmiBU/n7A3crLTVVTN0roUGmeLUQIG0uxJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Zhao Qiang <qiang.zhao@nxp.com>, linux-renesas-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-wpan@vger.kernel.org, Andy Gross <agross@kernel.org>, =?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Christian Marangi <ansuelsmth@gmail.com>, Nick Child <nnac123@linux.ibm.com>, Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, kernel@pengutronix.de, Johannes Berg <johannes@sipsolutions.net>, Imre Kaloz <kaloz@openwrt.org>, linuxppc-dev@lists.ozlabs.org, Bjorn Andersson <andersson@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

(implicit) v1 of this series can be found at
https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@pengutronix.de.
Changes since then:

 - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
   converts ipa to remove_new() and introduces an error message in the
   error path that failed before.

 - Rebased to today's next

 - Add the tags received in the previous round.

Uwe Kleine-König (9):
  net: ipa: Convert to platform remove callback returning void
  net: fjes: Convert to platform remove callback returning void
  net: pcs: rzn1-miic: Convert to platform remove callback returning
    void
  net: sfp: Convert to platform remove callback returning void
  net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
    void
  net: wan/ixp4xx_hss: Convert to platform remove callback returning
    void
  net: wwan: qcom_bam_dmux: Convert to platform remove callback
    returning void
  ieee802154: fakelb: Convert to platform remove callback returning void
  ieee802154: hwsim: Convert to platform remove callback returning void

 drivers/net/fjes/fjes_main.c             |  6 ++---
 drivers/net/ieee802154/fakelb.c          |  5 ++--
 drivers/net/ieee802154/mac802154_hwsim.c |  6 ++---
 drivers/net/ipa/ipa_main.c               | 29 +++++++++++-------------
 drivers/net/pcs/pcs-rzn1-miic.c          |  6 ++---
 drivers/net/phy/sfp.c                    |  6 ++---
 drivers/net/wan/fsl_ucc_hdlc.c           |  6 ++---
 drivers/net/wan/ixp4xx_hss.c             |  5 ++--
 drivers/net/wwan/qcom_bam_dmux.c         |  6 ++---
 9 files changed, 29 insertions(+), 46 deletions(-)


base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b
-- 
2.42.0

