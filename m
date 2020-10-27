Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61829CCA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:19:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSMs4dZPzDqGn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:19:37 +1100 (AEDT)
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
 header.s=2020 header.b=0GnEbZql; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=LsJR1NJ1; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrq3XsjzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:11 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jttJQYUY921gdQBinUA2N0GBiq3HS7MmOYm/9rq3mlU=;
 b=0GnEbZqlXJZLQfjONDg/KSujsSvfMvUdN9MjzKaP55p1OEL8105JJGIQe6F3XVpxye4QRG
 RNPtf8SiqF6hXmGgkfl/1C/UqBtecqyV1R5ba28I2myfZGnsuvT0wtttW7aBU23i8cp0Kp
 KPePrRqnO5QD3zsNjl0yz3RIKPYR9IqDfkJJwLOramUuxXxYnkd8Z0mwa5+ATFm5MBsojH
 c1s8YWDtwJjB+Py3JzwS5Sia73LSJCXx75eylZj0Pz3x7x+1Nh9Y0AYUTJPGgc6ryex4na
 0xwLG2EUr3iK9u8qT5n0uUKslQ2EpAHI1jsLzfDpVY5F44gyFbKLZ6KAepUyjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jttJQYUY921gdQBinUA2N0GBiq3HS7MmOYm/9rq3mlU=;
 b=LsJR1NJ1kfuG7mH7WHiTgHjGj108g1qTNgV4c1oTVdGNGA/LhmC59JAAm3KDssv9bSM5bW
 AvG+0+npRHIheYCA==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 15/15] crypto: caam: Replace in_irq() usage.
Date: Tue, 27 Oct 2020 23:54:54 +0100
Message-Id: <20201027225454.3492351-16-bigeasy@linutronix.de>
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
 drivers/crypto/caam/qi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c
index 09ea398304c8b..79dbd90887f8a 100644
--- a/drivers/crypto/caam/qi.c
+++ b/drivers/crypto/caam/qi.c
@@ -545,14 +545,10 @@ static void cgr_cb(struct qman_portal *qm, struct qma=
n_cgr *cgr, int congested)
 	}
 }
=20
-static int caam_qi_napi_schedule(struct qman_portal *p, struct caam_napi *=
np)
+static int caam_qi_napi_schedule(struct qman_portal *p, struct caam_napi *=
np,
+				 bool napi)
 {
-	/*
-	 * In case of threaded ISR, for RT kernels in_irq() does not return
-	 * appropriate value, so use in_serving_softirq to distinguish between
-	 * softirq and irq contexts.
-	 */
-	if (unlikely(in_irq() || !in_serving_softirq())) {
+	if (napi) {
 		/* Disable QMan IRQ source and invoke NAPI */
 		qman_p_irqsource_remove(p, QM_PIRQ_DQRI);
 		np->p =3D p;
@@ -574,7 +570,7 @@ static enum qman_cb_dqrr_result caam_rsp_fq_dqrr_cb(str=
uct qman_portal *p,
 	struct caam_drv_private *priv =3D dev_get_drvdata(qidev);
 	u32 status;
=20
-	if (caam_qi_napi_schedule(p, caam_napi))
+	if (caam_qi_napi_schedule(p, caam_napi, napi))
 		return qman_cb_dqrr_stop;
=20
 	fd =3D &dqrr->fd;
--=20
2.28.0

