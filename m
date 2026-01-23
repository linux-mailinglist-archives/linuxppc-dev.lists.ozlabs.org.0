Return-Path: <linuxppc-dev+bounces-16232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD4jGHldc2l3vAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:37:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FB75289
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:37:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyGBF5qjgz2xKh;
	Fri, 23 Jan 2026 22:37:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769168245;
	cv=none; b=XJupR1MzbpNMOuEdpGnCImDEx0NhzZUJ6bOaGR635WJAYvp52/OsZBUspVLWBwC33w+AW5IE7Cr/xAtplivjKuR5e0r7GX9dmRKMiBBSWa86hYm3D0++hPrHULQ6/npuXwT3QxtPKtinbYGCxHMIzK32y7s7CAa3TN16epmkDIqRcvyUDkv/ZbrER21gfHxQ8jScGpAXyhnDpTcIljbKi7AM83QdTds5cF+bLHTayhdvcTmKoFMcOVSPzomuCfSGQwHdk3twra3dpMfcfMFS8T3zAjMtPZ1nJ1QAYwiqPtgTFoD7q4PnzIdIVFggKjNSN501QBr/nv0mNatqhDAfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769168245; c=relaxed/relaxed;
	bh=OWni5HW99nwatLe3bFxSkgJ092tCPIuDbEsFgoqJcfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRQ7hj1cxAqBcsEDvz85NMdnbgJzCxidMJppQrch3/JmM3o++6EbK8Qygt+LDeFKeMjsgRV0it9G/VO3gIYNHlPV+ADC61OuSpfoHSw/qx39qKAI0VmPZthKjozM6AwT+NGXdE1zOC/AXiWKimmYKe/8BOOpSB14XAGQqgvGyH7YPDCs9yMIVJUcAzytb3tbWbkgrIODVpZc5puOX1L1ePCrqOtZFEcswriai95+Dv0buJwncEQeG8ozOQI2eM4Bc9BdBcxax398NV8V3XtvVPewhm0YNm/ieaJbVkV6D/41y72bGXqqNwooS7g8ujU35y+KFFm1GyIwkwI2XrfQbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0OU2dkMo; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6o9/+xdX; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0OU2dkMo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6o9/+xdX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyGBC5lQ7z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 22:37:23 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWni5HW99nwatLe3bFxSkgJ092tCPIuDbEsFgoqJcfI=;
	b=0OU2dkMohdOjRwrZK6iO6qfrNE4FxZJc4SpwLNvy/5UjjIZ6HATJafTZi1s3O8yRcQKgRv
	HqtTaLCjIwZhHMCV5cFkE5NeAoRvrVz18Zw3lT3yghMM6ZgHgHSNpcSH8fF2cRt1oKpzUn
	kosVEx2qy66OIUCMmx+TaA6wn23hRO9fLG9xTdD2Akqur8X4F7XGhcv35LNXym1F+plyJe
	eMlcF0c3ChPfACaHa5awZtwncB97PtPH+U5wOs3bhlkGLvUdwpHhOvrOwO52GMotDcefvD
	fQtlN39AOk5y12doT8FMmIyselSFlrn8ZZmn1vdryBKd9IoUGX0RoGVmAK7ntg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWni5HW99nwatLe3bFxSkgJ092tCPIuDbEsFgoqJcfI=;
	b=6o9/+xdXLJRHeZtviycF1Lb87SBxXuNkoulzn6XM+QHkLtf9hE78qmZQfjeLDMv7i/byMu
	2QXo8NGNkEaXBZDA==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/21] bus: fsl-mc: Use default primary handler
Date: Fri, 23 Jan 2026 12:36:51 +0100
Message-ID: <20260123113708.416727-6-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16232-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:tglx@kernel.org,m:bigeasy@linutronix.de,m:ioana.ciornei@nxp.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.501];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ozlabs.org:email,nxp.com:email]
X-Rspamd-Queue-Id: 3D1FB75289
X-Rspamd-Action: no action

There is no added value in dprc_irq0_handler() compared to
irq_default_primary_handler().

Use the default primary interrupt handler by specifying NULL.

Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/bus/fsl-mc/dprc-driver.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc-driver.c b/drivers/bus/fsl-mc/dprc-dri=
ver.c
index c63a7e688db6a..db67442addad2 100644
--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -380,17 +380,6 @@ int dprc_scan_container(struct fsl_mc_device *mc_bus_d=
ev,
 }
 EXPORT_SYMBOL_GPL(dprc_scan_container);
=20
-/**
- * dprc_irq0_handler - Regular ISR for DPRC interrupt 0
- *
- * @irq_num: IRQ number of the interrupt being handled
- * @arg: Pointer to device structure
- */
-static irqreturn_t dprc_irq0_handler(int irq_num, void *arg)
-{
-	return IRQ_WAKE_THREAD;
-}
-
 /**
  * dprc_irq0_handler_thread - Handler thread function for DPRC interrupt 0
  *
@@ -527,7 +516,7 @@ static int register_dprc_irq_handler(struct fsl_mc_devi=
ce *mc_dev)
 	 */
 	error =3D devm_request_threaded_irq(&mc_dev->dev,
 					  irq->virq,
-					  dprc_irq0_handler,
+					  NULL,
 					  dprc_irq0_handler_thread,
 					  IRQF_NO_SUSPEND | IRQF_ONESHOT,
 					  dev_name(&mc_dev->dev),
--=20
2.51.0


