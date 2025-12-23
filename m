Return-Path: <linuxppc-dev+bounces-14974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A1CDAD2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW8x1qCJz2yLg;
	Wed, 24 Dec 2025 10:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766475308;
	cv=none; b=WeQK3VaL0jzmfibQYpMerTDdNqgnBoCjD+Hg2xW+NPWWOwwiiwfcgTlR4Ikb920UIdrOmSGj8FeF/Rbp7Pmm6fBperrteFRhGkK8SxorRum0bKP7Y0gHAnq4LCc9J+5AAj3+RSL/VlrUII4fcS4aPB9pbQUlZwvRyngooDdkd7Z6PJ9e8SxgBZl2skGGvtA3VN545C/ex+2qvkh8B+ZAXaCyh9kHx7iaocV3hEeQc8xCbYZfCTBKmR4KjAF68J60Y04pOAd9c9Olkgg3qBrtRapaVODE8qg6xhOMpg81h6YhHE4N4y/xVMH6T7oYbWF0hSw2JYVIeNr3gy2AnIqDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766475308; c=relaxed/relaxed;
	bh=wMhrMczaTdzgw/2Epo64A6mnsiiunjOSoKZrxh5anZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CaVuzdT1woHdMKei2q7ADBKoC30gm7ovq5oVzkF4euPeOiw7ecmCt3BwWEU6J5zPoPzvbPhveLgI7558xu4TDY5XOmTOhB8Uc4thp2235hLEToigtUz1NIq76mbsU1QulkvJEm9LKPKjvm5lvzqApoQIUrK/8aEpgwH4+DsDiCoZuqtSMAc/5mj4gwoZOvy5x+W2yJ8uT6bpTT4F9Xm1JsK4enEqBh9W+FJyv3X7Wdytf6VvOaYHbtZ1q7crzckCELrL0ofxqjKTr6BQkxIWcDietTfVVMsu09zHTwoH3jsJNoGcRxg6NnJ3RPnG21HPFHMiExVO57u4ugmuUgrRbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mm7ULY/w; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=richard.genoud@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mm7ULY/w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=richard.genoud@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 541 seconds by postgrey-1.37 at boromir; Tue, 23 Dec 2025 18:35:06 AEDT
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4db6Gy5JjQz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 18:35:05 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 684144E41D59;
	Tue, 23 Dec 2025 07:25:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3455960716;
	Tue, 23 Dec 2025 07:25:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75C0A10AB08CD;
	Tue, 23 Dec 2025 08:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766474756; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wMhrMczaTdzgw/2Epo64A6mnsiiunjOSoKZrxh5anZM=;
	b=Mm7ULY/wGVXC8lzdvFLJBUjxYi5ImbP9zti3LmFFHF6jMWuC356Os15s/ubUvZWtGuqTU4
	/PSYzTOSIKwmTWY1AlGe5x2orL2N2XvE3jDDo+d/HxSp/v6FntCLbnZxk+ZlxXTaWPqW4M
	gjvsD2CSDbd2entK3EqdF567JWx/Ki1SVQpVKiRzg1yU5vXG72yXEMcEkVk65lb/3LC4H3
	gfYagEhJ+pIr5dtoWte/abNO2sXXxOiibhFaXiZ9TdVzl5MtbFtptlGFvLhnNQWA9WRSHa
	it+yftasZINrncpy9Q/fJQeNn+Yv3xO25rAGgZMvskNjXA/8O+XaKcCclPfT7A==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Christophe Leroy <chleroy@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	Roy Pledge <roy.pledge@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
Date: Tue, 23 Dec 2025 08:25:49 +0100
Message-ID: <20251223072549.397625-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
fq_table[fq->idx] state and freeing/allocating from the pool and
WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.

Indeed, we can have:
         Thread A                             Thread B
    qman_destroy_fq()                    qman_create_fq()
      qman_release_fqid()
        qman_shutdown_fq()
        gen_pool_free()
           -- At this point, the fqid is available again --
                                           qman_alloc_fqid()
           -- so, we can get the just-freed fqid in thread B --
                                           fq->fqid = fqid;
                                           fq->idx = fqid * 2;
                                           WARN_ON(fq_table[fq->idx]);
                                           fq_table[fq->idx] = fq;
     fq_table[fq->idx] = NULL;

And adding some logs between qman_release_fqid() and
fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.

To prevent that, ensure that fq_table[fq->idx] is set to NULL before
gen_pool_free() is called by using smp_wmb().

Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

NB: I'm not 100% sure of the need of a barrier here, since even without
it, the WARN_ON() wasn't triggered any more.

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 6b392b3ad4b1..39a3e7aab6ff 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1827,6 +1827,8 @@ EXPORT_SYMBOL(qman_create_fq);
 
 void qman_destroy_fq(struct qman_fq *fq)
 {
+	int leaked;
+
 	/*
 	 * We don't need to lock the FQ as it is a pre-condition that the FQ be
 	 * quiesced. Instead, run some checks.
@@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
 	switch (fq->state) {
 	case qman_fq_state_parked:
 	case qman_fq_state_oos:
-		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
-			qman_release_fqid(fq->fqid);
+		/*
+		 * There's a race condition here on releasing the fqid,
+		 * setting the fq_table to NULL, and freeing the fqid.
+		 * To prevent it, this order should be respected:
+		 */
+		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
+			leaked = qman_shutdown_fq(fq->fqid);
+			if (leaked)
+				pr_debug("FQID %d leaked\n", fq->fqid);
+		}
 
 		DPAA_ASSERT(fq_table[fq->idx]);
 		fq_table[fq->idx] = NULL;
+
+		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
+			/*
+			 * fq_table[fq->idx] should be set to null before
+			 * freeing fq->fqid otherwise it could by allocated by
+			 * qman_alloc_fqid() while still being !NULL
+			 */
+			smp_wmb();
+			gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
+		}
 		return;
 	default:
 		break;

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.47.3


