Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FC829E24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 17:02:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9CH7637Zz3dGx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 03:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9CDv18TRz3cR4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 03:00:15 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNajS-0007JG-A4; Wed, 10 Jan 2024 16:43:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNajQ-001jUV-Tu; Wed, 10 Jan 2024 16:43:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNajQ-006c4D-2j;
	Wed, 10 Jan 2024 16:43:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/7] macintosh: Convert to platform remove callback returning void
Date: Wed, 10 Jan 2024 16:42:47 +0100
Message-ID: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=UH9oocdbFr6FrYsYir1wfN1k0wKKPJBWYUPiclOmAyE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlnrr4vT/fcslf3Png75vHSdfFtEXQIf4ZgsIwE gkLUur0132JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZZ66+AAKCRCPgPtYfRL+ TvABB/wOX3mUXD7DERVtVadjsJkSVspw+GGQbS2xZWyxnylCvUNifPR086DsOrZzZENIuz0OcKg B+fIyRk6gjrZqM4FIIjsc/1TO2uuSMk7Pv/LvhPt+XPmLpYA1+mTXygvwoNI3qBm1q0PVZcm8tr za8V9LZFEHJ/J/EA3ksjFzy/ocafe+qwEcME1rorknGwHDpqngz3FOgY4emziEZSs9U5kJWsEJA qxV5Nuam8FcJ8cKKyz6xhIFPoBRMoJyl/FyrlnWL4JJVRtL7XTiG4xLjrpp/rx9eeYaN1T1wbZv bDmStugTvHTWwlm88P62UG3jHsXHyJrwf1QoOJaAqJcUpGDp
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
Cc: Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all drivers below drivers/macintosh to use
.remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
callback that returns no value") for an extended explanation and the
eventual goal. The TL;DR; is to make it harder for driver authors to
leak resources without noticing.

This is merge window material. All patches are pairwise independent of
each other so they can be applied individually. There isn't a maintainer
for drivers/macintosh, I'm still sending this as a series in the hope
Michael feels repsonsible and applies it completely.

Best regards
Uwe

Uwe Kleine-König (7):
  macintosh: therm_windtunnel: Convert to platform remove callback returning void
  macintosh: windfarm_pm112: Convert to platform remove callback returning void
  macintosh: windfarm_pm121: Convert to platform remove callback returning void
  macintosh: windfarm_pm72: Convert to platform remove callback returning void
  macintosh: windfarm_pm81: Convert to platform remove callback returning void
  macintosh: windfarm_pm91: Convert to platform remove callback returning void
  macintosh: windfarm_rm31: Convert to platform remove callback returning void

 drivers/macintosh/therm_windtunnel.c | 6 ++----
 drivers/macintosh/windfarm_pm112.c   | 6 ++----
 drivers/macintosh/windfarm_pm121.c   | 5 ++---
 drivers/macintosh/windfarm_pm72.c    | 7 ++-----
 drivers/macintosh/windfarm_pm81.c    | 8 +++-----
 drivers/macintosh/windfarm_pm91.c    | 8 +++-----
 drivers/macintosh/windfarm_rm31.c    | 7 ++-----
 7 files changed, 16 insertions(+), 31 deletions(-)

base-commit: 8cb47d7cd090a690c1785385b2f3d407d4a53ad0
-- 
2.43.0

