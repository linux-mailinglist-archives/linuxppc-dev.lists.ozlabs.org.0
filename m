Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DEA2A225F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 00:28:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPXKz6z3lzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 10:28:39 +1100 (AEDT)
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
 header.s=2020 header.b=iUViDm8N; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=24m4nSr5; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPXCy5jHkzDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 10:23:26 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604272999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JCFBfexZTaTxNTJc/bdU0DkFV3ialzSAY95hXbQ9KA=;
 b=iUViDm8NvlIWcJSV36zfgPtmec6C8UofAUybKpXMq0+4u1mAdzCAp0Wt64uviukSsd5VOb
 zPfRieYKxNwIni3RPTGF+hT6wZYqTrAFFXJmiaFm0gNsNnZoXC+VCIRZ9SIiLN1NTEu/Qf
 LCrqn77SiTmUnx+ehl2EQjnbgDxHCa8MSxA1sYBVB+E8T/OslzjeuFdh0W46rv8fTJjUKB
 GJAZ12Gb+o/5DK6N2dp4/4itmTXhaHZDIBOBR9E/hOr+UMAIaqAb+T29xJ+G5SWaNwEiZI
 INLgqeAaMH9VcrHjoC/GmGzmDlkJMrdoOAReRH6dqYG68JsP8ER3GCwIDnjAVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604272999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JCFBfexZTaTxNTJc/bdU0DkFV3ialzSAY95hXbQ9KA=;
 b=24m4nSr5As29K9Az1qCoaLo2NV+Umtfhb0UjgQX17Y8Dl3GP0N35SLzhCUHME7cTXqQKnj
 IE/zY44MlDEqtdDA==
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 3/3] crypto: caam: Replace in_irq() usage.
Date: Mon,  2 Nov 2020 00:22:57 +0100
Message-Id: <20201101232257.3028508-4-bigeasy@linutronix.de>
In-Reply-To: <20201101232257.3028508-1-bigeasy@linutronix.de>
References: <20201101232257.3028508-1-bigeasy@linutronix.de>
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
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver uses in_irq() + in_serving_softirq() magic to decide if NAPI
scheduling is required or packet processing.

The usage of in_*() in drivers is phased out and Linus clearly requested
that code which changes behaviour depending on context should either be
separated or the context be conveyed in an argument passed by the caller,
which usually knows the context.

Use the `sched_napi' argument passed by the callback. It is set true if
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
index 57f6ab6bfb56a..8163f5df8ebf7 100644
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
+				 bool sched_napi)
 {
-	/*
-	 * In case of threaded ISR, for RT kernels in_irq() does not return
-	 * appropriate value, so use in_serving_softirq to distinguish between
-	 * softirq and irq contexts.
-	 */
-	if (unlikely(in_irq() || !in_serving_softirq())) {
+	if (sched_napi) {
 		/* Disable QMan IRQ source and invoke NAPI */
 		qman_p_irqsource_remove(p, QM_PIRQ_DQRI);
 		np->p =3D p;
@@ -574,7 +570,7 @@ static enum qman_cb_dqrr_result caam_rsp_fq_dqrr_cb(str=
uct qman_portal *p,
 	struct caam_drv_private *priv =3D dev_get_drvdata(qidev);
 	u32 status;
=20
-	if (caam_qi_napi_schedule(p, caam_napi))
+	if (caam_qi_napi_schedule(p, caam_napi, sched_napi))
 		return qman_cb_dqrr_stop;
=20
 	fd =3D &dqrr->fd;
--=20
2.29.1

