Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A3829CCAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:24:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSTh4K1ZzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:24:40 +1100 (AEDT)
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
 header.s=2020 header.b=TdWGDs1h; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=e0VEdDzT; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrr6y7dzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:12 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPrTRbGSyIvuvJCyC390k72YSDPVB8O/640PTvsYNRE=;
 b=TdWGDs1hpjYxSfUyBLnoh+B1+3HPYihXSJISoQ1oSrfCNo0EPrtej/iODEJ34sO7uVxpou
 nQ+0f176Us49f9CcnpfC7ETjnrIr693Inc5zfxsQNRcopcpxBBDSB/OV550x02qZKS04V/
 nkjFfezJKREtELiBAIOkD5BHjCGIzhjihglc5M1jFS89+wUavEoAk1SJnkjNcPWPXjjHfh
 nPO1WvdNk76JPFUk0rg7AYTiG/j00QAiZJnE/+GrzKI6ti/lA/aTDGLQ/56eYuIskYRNhY
 RqQ5mLKz4ojMj6MatVBG9kdUAMWpB2tYB92naGGBYByWdSIjdQNEKSd3gyivMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPrTRbGSyIvuvJCyC390k72YSDPVB8O/640PTvsYNRE=;
 b=e0VEdDzT2OE/YiWQWO7M2eI8CkzFcqYrjX8IZzQuU1bkr6hgVzAyHe6izRTXCRpuHvjxxx
 NbZivF5sYDkmhiDg==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 13/15] soc/fsl/qbman: Add an argument to signal if
 NAPI processing is required.
Date: Tue, 27 Oct 2020 23:54:52 +0100
Message-Id: <20201027225454.3492351-14-bigeasy@linutronix.de>
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

dpaa_eth_napi_schedule() and caam_qi_napi_schedule() schedule NAPI if
invoked from:

 - Hard interrupt context
 - Any context which is not serving soft interrupts

Any context which is not serving soft interrupts includes hard interrupts
so the in_irq() check is redundant. caam_qi_napi_schedule() has a comment
about this:

        /*
         * In case of threaded ISR, for RT kernels in_irq() does not return
         * appropriate value, so use in_serving_softirq to distinguish betw=
een
         * softirq and irq contexts.
         */
         if (in_irq() || !in_serving_softirq())

This has nothing to do with RT. Even on a non RT kernel force threaded
interrupts run obviously in thread context and therefore in_irq() returns
false when invoked from the handler.

The extension of the in_irq() check with !in_serving_softirq() was there
when the drivers were added, but in the out of tree FSL BSP the original
condition was in_irq() which got extended due to failures on RT.

The usage of in_xxx() in drivers is phased out and Linus clearly requested
that code which changes behaviour depending on context should either be
seperated or the context be conveyed in an argument passed by the caller,
which usually knows the context. Right he is, the above construct is
clearly showing why.

The following callchains have been analyzed to end up in
dpaa_eth_napi_schedule():

qman_p_poll_dqrr()
  __poll_portal_fast()
    fq->cb.dqrr()
       dpaa_eth_napi_schedule()

portal_isr()
  __poll_portal_fast()
    fq->cb.dqrr()
       dpaa_eth_napi_schedule()

Both need to schedule NAPI.
The crypto part has another code path leading up to this:
  kill_fq()
     empty_retired_fq()
       qman_p_poll_dqrr()
         __poll_portal_fast()
            fq->cb.dqrr()
               dpaa_eth_napi_schedule()

kill_fq() is called from task context and ends up scheduling NAPI, but
that's pointless and an unintended side effect of the !in_serving_softirq()
check.

The code path:
  caam_qi_poll() -> qman_p_poll_dqrr()

is invoked from NAPI and I *assume* from crypto's NAPI device and not
from qbman's NAPI device. I *guess* it is okay to skip scheduling NAPI
(because this is what happens now) but could be changed if it is wrong
due to `budget' handling.

Add an argument to __poll_portal_fast() which is true if NAPI needs to be
scheduled. This requires propagating the value to the caller including
`qman_cb_dqrr' typedef which is used by the dpaa and the crypto driver.

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
 drivers/crypto/caam/qi.c                       |  3 ++-
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 12 ++++++++----
 drivers/soc/fsl/qbman/qman.c                   | 12 ++++++------
 drivers/soc/fsl/qbman/qman_test_api.c          |  6 ++++--
 drivers/soc/fsl/qbman/qman_test_stash.c        |  6 ++++--
 include/soc/fsl/qman.h                         |  3 ++-
 6 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c
index ec53528d82058..09ea398304c8b 100644
--- a/drivers/crypto/caam/qi.c
+++ b/drivers/crypto/caam/qi.c
@@ -564,7 +564,8 @@ static int caam_qi_napi_schedule(struct qman_portal *p,=
 struct caam_napi *np)
=20
 static enum qman_cb_dqrr_result caam_rsp_fq_dqrr_cb(struct qman_portal *p,
 						    struct qman_fq *rsp_fq,
-						    const struct qm_dqrr_entry *dqrr)
+						    const struct qm_dqrr_entry *dqrr,
+						    bool napi)
 {
 	struct caam_napi *caam_napi =3D raw_cpu_ptr(&pcpu_qipriv.caam_napi);
 	struct caam_drv_req *drv_req;
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/e=
thernet/freescale/dpaa/dpaa_eth.c
index 06cc863f4dd63..27835310b718e 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -2316,7 +2316,8 @@ static inline int dpaa_eth_napi_schedule(struct dpaa_=
percpu_priv *percpu_priv,
=20
 static enum qman_cb_dqrr_result rx_error_dqrr(struct qman_portal *portal,
 					      struct qman_fq *fq,
-					      const struct qm_dqrr_entry *dq)
+					      const struct qm_dqrr_entry *dq,
+					      bool napi)
 {
 	struct dpaa_fq *dpaa_fq =3D container_of(fq, struct dpaa_fq, fq_base);
 	struct dpaa_percpu_priv *percpu_priv;
@@ -2343,7 +2344,8 @@ static enum qman_cb_dqrr_result rx_error_dqrr(struct =
qman_portal *portal,
=20
 static enum qman_cb_dqrr_result rx_default_dqrr(struct qman_portal *portal,
 						struct qman_fq *fq,
-						const struct qm_dqrr_entry *dq)
+						const struct qm_dqrr_entry *dq,
+						bool napi)
 {
 	struct skb_shared_hwtstamps *shhwtstamps;
 	struct rtnl_link_stats64 *percpu_stats;
@@ -2460,7 +2462,8 @@ static enum qman_cb_dqrr_result rx_default_dqrr(struc=
t qman_portal *portal,
=20
 static enum qman_cb_dqrr_result conf_error_dqrr(struct qman_portal *portal,
 						struct qman_fq *fq,
-						const struct qm_dqrr_entry *dq)
+						const struct qm_dqrr_entry *dq,
+						bool napi)
 {
 	struct dpaa_percpu_priv *percpu_priv;
 	struct net_device *net_dev;
@@ -2481,7 +2484,8 @@ static enum qman_cb_dqrr_result conf_error_dqrr(struc=
t qman_portal *portal,
=20
 static enum qman_cb_dqrr_result conf_dflt_dqrr(struct qman_portal *portal,
 					       struct qman_fq *fq,
-					       const struct qm_dqrr_entry *dq)
+					       const struct qm_dqrr_entry *dq,
+					       bool napi)
 {
 	struct dpaa_percpu_priv *percpu_priv;
 	struct net_device *net_dev;
diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 9888a70618730..a92bd032fc36a 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1159,7 +1159,7 @@ static u32 fq_to_tag(struct qman_fq *fq)
=20
 static u32 __poll_portal_slow(struct qman_portal *p, u32 is);
 static inline unsigned int __poll_portal_fast(struct qman_portal *p,
-					unsigned int poll_limit);
+					unsigned int poll_limit, bool napi);
 static void qm_congestion_task(struct work_struct *work);
 static void qm_mr_process_task(struct work_struct *work);
=20
@@ -1174,7 +1174,7 @@ static irqreturn_t portal_isr(int irq, void *ptr)
=20
 	/* DQRR-handling if it's interrupt-driven */
 	if (is & QM_PIRQ_DQRI) {
-		__poll_portal_fast(p, QMAN_POLL_LIMIT);
+		__poll_portal_fast(p, QMAN_POLL_LIMIT, true);
 		clear =3D QM_DQAVAIL_MASK | QM_PIRQ_DQRI;
 	}
 	/* Handling of anything else that's interrupt-driven */
@@ -1602,7 +1602,7 @@ static noinline void clear_vdqcr(struct qman_portal *=
p, struct qman_fq *fq)
  * user callbacks to call into any QMan API.
  */
 static inline unsigned int __poll_portal_fast(struct qman_portal *p,
-					unsigned int poll_limit)
+					unsigned int poll_limit, bool napi)
 {
 	const struct qm_dqrr_entry *dq;
 	struct qman_fq *fq;
@@ -1636,7 +1636,7 @@ static inline unsigned int __poll_portal_fast(struct =
qman_portal *p,
 			 * and we don't want multiple if()s in the critical
 			 * path (SDQCR).
 			 */
-			res =3D fq->cb.dqrr(p, fq, dq);
+			res =3D fq->cb.dqrr(p, fq, dq, napi);
 			if (res =3D=3D qman_cb_dqrr_stop)
 				break;
 			/* Check for VDQCR completion */
@@ -1646,7 +1646,7 @@ static inline unsigned int __poll_portal_fast(struct =
qman_portal *p,
 			/* SDQCR: context_b points to the FQ */
 			fq =3D tag_to_fq(be32_to_cpu(dq->context_b));
 			/* Now let the callback do its stuff */
-			res =3D fq->cb.dqrr(p, fq, dq);
+			res =3D fq->cb.dqrr(p, fq, dq, napi);
 			/*
 			 * The callback can request that we exit without
 			 * consuming this entry nor advancing;
@@ -1753,7 +1753,7 @@ EXPORT_SYMBOL(qman_start_using_portal);
=20
 int qman_p_poll_dqrr(struct qman_portal *p, unsigned int limit)
 {
-	return __poll_portal_fast(p, limit);
+	return __poll_portal_fast(p, limit, false);
 }
 EXPORT_SYMBOL(qman_p_poll_dqrr);
=20
diff --git a/drivers/soc/fsl/qbman/qman_test_api.c b/drivers/soc/fsl/qbman/=
qman_test_api.c
index 7066b2f1467cc..93eb86923e44f 100644
--- a/drivers/soc/fsl/qbman/qman_test_api.c
+++ b/drivers/soc/fsl/qbman/qman_test_api.c
@@ -45,7 +45,8 @@
=20
 static enum qman_cb_dqrr_result cb_dqrr(struct qman_portal *,
 					struct qman_fq *,
-					const struct qm_dqrr_entry *);
+					const struct qm_dqrr_entry *,
+					bool napi);
 static void cb_ern(struct qman_portal *, struct qman_fq *,
 		   const union qm_mr_entry *);
 static void cb_fqs(struct qman_portal *, struct qman_fq *,
@@ -208,7 +209,8 @@ int qman_test_api(void)
=20
 static enum qman_cb_dqrr_result cb_dqrr(struct qman_portal *p,
 					struct qman_fq *fq,
-					const struct qm_dqrr_entry *dq)
+					const struct qm_dqrr_entry *dq,
+					bool napi)
 {
 	if (WARN_ON(fd_neq(&fd_dq, &dq->fd))) {
 		pr_err("BADNESS: dequeued frame doesn't match;\n");
diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbma=
n/qman_test_stash.c
index e87b65403b672..9b8caceedf7f3 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -275,7 +275,8 @@ static inline int process_frame_data(struct hp_handler =
*handler,
=20
 static enum qman_cb_dqrr_result normal_dqrr(struct qman_portal *portal,
 					    struct qman_fq *fq,
-					    const struct qm_dqrr_entry *dqrr)
+					    const struct qm_dqrr_entry *dqrr,
+					    bool napi)
 {
 	struct hp_handler *handler =3D (struct hp_handler *)fq;
=20
@@ -293,7 +294,8 @@ static enum qman_cb_dqrr_result normal_dqrr(struct qman=
_portal *portal,
=20
 static enum qman_cb_dqrr_result special_dqrr(struct qman_portal *portal,
 					     struct qman_fq *fq,
-					     const struct qm_dqrr_entry *dqrr)
+					     const struct qm_dqrr_entry *dqrr,
+					     bool napi)
 {
 	struct hp_handler *handler =3D (struct hp_handler *)fq;
=20
diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
index 9f484113cfda7..fe3faa2d64f16 100644
--- a/include/soc/fsl/qman.h
+++ b/include/soc/fsl/qman.h
@@ -689,7 +689,8 @@ enum qman_cb_dqrr_result {
 };
 typedef enum qman_cb_dqrr_result (*qman_cb_dqrr)(struct qman_portal *qm,
 					struct qman_fq *fq,
-					const struct qm_dqrr_entry *dqrr);
+					const struct qm_dqrr_entry *dqrr,
+					bool napi);
=20
 /*
  * This callback type is used when handling ERNs, FQRNs and FQRLs via MR. =
They
--=20
2.28.0

