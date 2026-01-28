Return-Path: <linuxppc-dev+bounces-16351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDClHT/deWnI0QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 10:56:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EF9F10C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 10:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1Hj66cg2z2xm3;
	Wed, 28 Jan 2026 20:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769594170;
	cv=none; b=f9A98iIxx13gGJ3HWWwsxEOjMSful7ieI6xt+Ld3nzSZuiMJph29M+uPGvgxhayCH08PI0+dOr2vZ/l/vIONGH4fuIxfXuNEY42WP5v3V/T/TtuBy73OnAjj4QkLa4r6Ch+NpjpwgNd6B4wFxCzX/qGadJiCsEYN0zSfYQMkBya9RBNQJBGCzIWiW1/prnb03xbwhvBuHi23IOC/XNCEwxCg16l5dBk7IHNN0TmtO+SN7Gxe8b8ANFnvs2kZb0f/UbmnnUH6A0IgmUP9f5ML537HvOjEfczegGcPLcAFedyMxWDZX5ZtK+PV3KVKMSDTJzkGBqORh5y/nyuM1e8kLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769594170; c=relaxed/relaxed;
	bh=IKkhJFSlDPDWBwrmIbzE9ozrrgoANZfOeT947Sp++R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoaLWkT/+6p+I9tF6ejBvOpVaWVV1EzVzVbbugl9CaKYfhUVCcnlcpOr7/cvlcMQBvROMMh1ZTQG84lYUsP1py8+fTA6LHHm3giz68rJU2diKgEDlgUkZgvgSr+6aSGlIIgOVb0Mtz3BDNFKB8iId7mj9IZMRAKUq29mzUB5EKGyBYqkmFXgTDkoO6cKJlD5ZnV+xi7wPK4f8qR1IYne4K++j36Yk98gLkbvH+wz6r9MGXBWsJMWOyZ3/6IStTuiO+2FRbE0LxX5Xxl8cLF23pFh2PtvDSYgfVirUuDRVFUPbqHzQ054avPgfitOxqN6e1idrLzcH1VTuMCQQkruWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gZhLyDmU; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sy+8hJO5; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gZhLyDmU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sy+8hJO5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1Hj46DJdz2xT6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 20:56:08 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKkhJFSlDPDWBwrmIbzE9ozrrgoANZfOeT947Sp++R0=;
	b=gZhLyDmUiwiJU/sYXX7aZEe1CsXZvv97eKfANU75x8MqzuTeuw/D7uyIMeJi3mQO3Upi33
	A7TxyKjKbLnegA9CxXipXICM8rU8AhM9LY+9RaGY2eycdwruEZuAW3tI+cWfmUVHIKwvOf
	CSYNlzMpT6NH2XWB5OlS6lWVqje5fC48xfY0TnZfH8IApIFOJ/mzlveNGmjtYne6T3acDk
	KzAo1o/1e4qU4gvhd265h4CiaSiRa57IJQ3lJoIsDqnqBGIDQ7rN5OOtj/x9ajizbAIEyv
	JLSrEffsOKArmwGJjyyhMbmAXfY3LdPgK8WhPi6msJgxNrTze/zHFrVFspKVyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKkhJFSlDPDWBwrmIbzE9ozrrgoANZfOeT947Sp++R0=;
	b=Sy+8hJO5EOsJkAdaw7z2pz2wRBoyvXuXJsblQKNMT22NnKn80IrltvmEoVeCqyETUPw/Aw
	mRmi/3rd3mIediBg==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/20] bus: fsl-mc: Use default primary handler
Date: Wed, 28 Jan 2026 10:55:25 +0100
Message-ID: <20260128095540.863589-6-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16351-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:bigeasy@linutronix.de,m:ioana.ciornei@nxp.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: C31EF9F10C
X-Rspamd-Action: no action

There is no added value in dprc_irq0_handler() compared to
irq_default_primary_handler().

Use the default primary interrupt handler by specifying NULL.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
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


