Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A885E19D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 16:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg0sJ4Jsmz3vrS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 02:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg0q412lPz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 02:40:47 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi6-0003mK-6m; Wed, 21 Feb 2024 16:40:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-0024At-Ma; Wed, 21 Feb 2024 16:40:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-008uup-1v;
	Wed, 21 Feb 2024 16:40:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/6] powerpc: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 16:40:14 +0100
Message-ID: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=w8CaxvQLULcfUJpsIW0+aJBqjXR+zdf4QWfaDFYGJ08=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1hlfocsfT70ct6cBDzCF8Wfk9vStaN7qHm2Kw QniGPI3oROJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdYZXwAKCRCPgPtYfRL+ TofnCACCqo11ATTRPxgXEZbecXIFVgSQfAQ1oPtAAfPNaEsHrHjAypQ+82lEz7Ln5nZ4gKJXrAI OCvaxa7RNxcheIM62ItAszL7J1ey+SoY5RD4Et/E1jPFlqtDIv/i6c6iprv0NZklWSv4mUdfsBj uEAIhL9fc2ZVgItUDbZc48Pm8MWD92mkJolUtghtIzIFcL9aqJucUFYMh1Ka0oXOzQCQreCNJG9 r2Dd+Sgbuto+/9oC6khlchybzuzTqJI67S0jfClicOFglSpBipQtkquf3g9bDab4bnvaXSYbowk oVdGxLeT/a9euVHgcKPz55c0/K8vmm78UyLWBhTSlNvuwcAa
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Haoran Liu <liuhaoran14@163.com>, Rob Herring <robh@kernel.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all platform drivers below drivers/powerpc to
struct platform_driver::remove_new(). See commit 5c5a7680e67b
("platform: Provide a remove callback that returns no value") for an
extended explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that Michael picks them up all
together.

Best regards
Uwe

Uwe Kleine-König (6):
  powerpc: sgy_cts1000: Convert to platform remove callback returning void
  powerpc: gpio_mdio: Convert to platform remove callback returning void
  powerpc: opal-prd: Convert to platform remove callback returning void
  powerpc: papr_scm: Convert to platform remove callback returning void
  powerpc: fsl_msi: Convert to platform remove callback returning void
  powerpc: pmi: Convert to platform remove callback returning void

 arch/powerpc/platforms/85xx/sgy_cts1000.c | 6 ++----
 arch/powerpc/platforms/pasemi/gpio_mdio.c | 6 ++----
 arch/powerpc/platforms/powernv/opal-prd.c | 5 ++---
 arch/powerpc/platforms/pseries/papr_scm.c | 6 ++----
 arch/powerpc/sysdev/fsl_msi.c             | 6 ++----
 arch/powerpc/sysdev/pmi.c                 | 6 ++----
 6 files changed, 12 insertions(+), 23 deletions(-)

base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
-- 
2.43.0

