Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A694029CCA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:23:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSRn61kLzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:23:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=HCswUXFn; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=oAEOw6n2; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrr2vc0zDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:12 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdH9fbe/FwP3XeKGJ3l0Cm+b4e3o/aTEE/5T4JYIZFo=;
 b=HCswUXFnBU+7krIAiJOvKpJSk3khqzvmKXrOz1gM0erhfW+xw/741cfqlWqCbrRKLGLiBt
 2ZUaoSP5ox8MMXp4zr4zTdeIQdrQbLDd0lfErEBFbuXJjY3Sl3TG4/ouW5bIhvmTNIXpU2
 BTxYIVC5S4gOd9AbXC9lwhtY+aEdK+XsyZo+dmWM4PBHrMzxjgQL0BRejFLweIG6Bz/IjH
 nC8PmUrMrQF9GbZZGnV1R5kFKPY2Fs+ZajwTg/K7K2jZYCeoeZvjAFEvEq0xdkMubwsmn/
 UsR1mqQZqTsrHdN5Gr4QV7uqdaWF2X7OF6/NuBkY5fZeD4jNj5by8GNXbkDe4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdH9fbe/FwP3XeKGJ3l0Cm+b4e3o/aTEE/5T4JYIZFo=;
 b=oAEOw6n2K77vQLRBPQlNlkEg06bqlyVo2TatzLpimvX8utPK3aWhDMLaJa4tCTD6u/57ST
 kccvLXygOL73iBBg==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 14/15] net: dpaa: Replace in_irq() usage.
Date: Tue, 27 Oct 2020 23:54:53 +0100
Message-Id: <20201027225454.3492351-15-bigeasy@linutronix.de>
In-Reply-To: <20201027225454.3492351-1-bigeasy@linutronix.de>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Samuel Chessman <chessman@tux.org>,
 Ping-Ke Shih <pkshih@realtek.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, Daniel Drake <dsd@gentoo.org>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Leon Romanovsky <leon@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver uses in_irq() + in_serving_softirq() magic to decide if NAPI
scheduling is required or packet processing.

The usage of in_*() in drivers is phased out and Linus clearly requested
that code which changes behaviour depending on context should either be
seperated or the context be conveyed in an argument passed by the caller,
which usually knows the context.

Use the `napi' argument passed by the callback. It is set true if
called from the interrupt handler and NAPI should be scheduled.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Horia Geant=C4=83" <horia.geanta@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Madalin Bucur <madalin.bucur@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linux-crypto@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/e=
thernet/freescale/dpaa/dpaa_eth.c
index 27835310b718e..2c949acd74c67 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -2300,9 +2300,9 @@ static void dpaa_tx_conf(struct net_device *net_dev,
 }
=20
 static inline int dpaa_eth_napi_schedule(struct dpaa_percpu_priv *percpu_p=
riv,
-					 struct qman_portal *portal)
+					 struct qman_portal *portal, bool napi)
 {
-	if (unlikely(in_irq() || !in_serving_softirq())) {
+	if (napi) {
 		/* Disable QMan IRQ and invoke NAPI */
 		qman_p_irqsource_remove(portal, QM_PIRQ_DQRI);
=20
@@ -2333,7 +2333,7 @@ static enum qman_cb_dqrr_result rx_error_dqrr(struct =
qman_portal *portal,
=20
 	percpu_priv =3D this_cpu_ptr(priv->percpu_priv);
=20
-	if (dpaa_eth_napi_schedule(percpu_priv, portal))
+	if (dpaa_eth_napi_schedule(percpu_priv, portal, napi))
 		return qman_cb_dqrr_stop;
=20
 	dpaa_eth_refill_bpools(priv);
@@ -2377,7 +2377,7 @@ static enum qman_cb_dqrr_result rx_default_dqrr(struc=
t qman_portal *portal,
 	percpu_priv =3D this_cpu_ptr(priv->percpu_priv);
 	percpu_stats =3D &percpu_priv->stats;
=20
-	if (unlikely(dpaa_eth_napi_schedule(percpu_priv, portal)))
+	if (unlikely(dpaa_eth_napi_schedule(percpu_priv, portal, napi)))
 		return qman_cb_dqrr_stop;
=20
 	/* Make sure we didn't run out of buffers */
@@ -2474,7 +2474,7 @@ static enum qman_cb_dqrr_result conf_error_dqrr(struc=
t qman_portal *portal,
=20
 	percpu_priv =3D this_cpu_ptr(priv->percpu_priv);
=20
-	if (dpaa_eth_napi_schedule(percpu_priv, portal))
+	if (dpaa_eth_napi_schedule(percpu_priv, portal, napi))
 		return qman_cb_dqrr_stop;
=20
 	dpaa_tx_error(net_dev, priv, percpu_priv, &dq->fd, fq->fqid);
@@ -2499,7 +2499,7 @@ static enum qman_cb_dqrr_result conf_dflt_dqrr(struct=
 qman_portal *portal,
=20
 	percpu_priv =3D this_cpu_ptr(priv->percpu_priv);
=20
-	if (dpaa_eth_napi_schedule(percpu_priv, portal))
+	if (dpaa_eth_napi_schedule(percpu_priv, portal, napi))
 		return qman_cb_dqrr_stop;
=20
 	dpaa_tx_conf(net_dev, priv, percpu_priv, &dq->fd, fq->fqid);
--=20
2.28.0

