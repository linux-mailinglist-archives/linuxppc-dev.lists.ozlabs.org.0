Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575785D4A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 10:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfs7r31f0z3cGw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 20:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfs7Q1gQkz2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 20:54:25 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIq-0007GT-3K; Wed, 21 Feb 2024 10:54:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIo-0020pI-8r; Wed, 21 Feb 2024 10:54:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIo-008mZ2-0W;
	Wed, 21 Feb 2024 10:54:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/11] misc: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 10:53:44 +0100
Message-ID: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=4jrgDTIItOaqzUueSGfkLHel//P9YB1P9vaM2W3h81k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1cgqTOtIAO8z59oSIx/sIvhuKH1+b51NAFFWR 3bkknjc77KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdXIKgAKCRCPgPtYfRL+ Tk2MCACCKkCdjbNZyc29xxFm4VWa+DhS4+htkcYrw+AdxDNVtW4qk33M6GeSdZmSv2NHyRXr6/e eN0IlmfFp1fVqxEGMnYT8GDi23GMW10uOku+Lfn67lM0aeNnpY7zfosgREfEoNKbM/i5vWpoZHp brAQt+3AmSOat2+Ti1HlNfBW6HUGna/AG7Ymg44ojVw57dZg5/zrML+ZNcq0Z8aKVkDMojJ117Y NKTYvX4AR5Cq4ed/0UoJUPGi+OrhYSbO9+mj6sj298JriIeXAhhVaO7iRejCq4N53L4tXaePU3P Y1hef+xmfdWUvxcS+rNEwgwOHiSwDgSg4f56iCTdzP8ZN9FP
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Derek Kiernan <derek.kiernan@amd.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Michal Simek <michal.simek@amd.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dragan Cvetic <dragan.cvetic@amd.com>, kernel@pengutronix.de, Justin Stitt <justinstitt@google.com>, Frederic Barrat <fbarrat@linux.ibm.com>, John Stultz <jstultz@google.com>, Tomas Winkler <tomas.winkler@intel.com>, Amol Maheshwari <amahesh@qti.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all drivers below drivers/misc to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that Greg or Arnd picks them up all
together.

Best regards
Uwe

Uwe Kleine-König (11):
  misc: atmel-ssc: Convert to platform remove callback returning void
  cxl: Convert to platform remove callback returning void
  misc: fastrpc: Convert to platform remove callback returning void
  misc: hisi_hikey_usb: Convert to platform remove callback returning
    void
  mei: vsc: Convert to platform remove callback returning void
  misc: open-dice: Convert to platform remove callback returning void
  misc: sram: Convert to platform remove callback returning void
  misc: ti-st: st_kim: Convert to platform remove callback returning
    void
  misc: vcpu_stall_detector: Convert to platform remove callback
    returning void
  misc: xilinx_sdfec: Convert to platform remove callback returning void
  misc: xilinx_tmr_inject: Convert to platform remove callback returning
    void

 drivers/misc/atmel-ssc.c           | 6 ++----
 drivers/misc/cxl/of.c              | 5 ++---
 drivers/misc/fastrpc.c             | 6 ++----
 drivers/misc/hisi_hikey_usb.c      | 6 ++----
 drivers/misc/mei/platform-vsc.c    | 6 ++----
 drivers/misc/open-dice.c           | 5 ++---
 drivers/misc/sram.c                | 6 ++----
 drivers/misc/ti-st/st_kim.c        | 5 ++---
 drivers/misc/vcpu_stall_detector.c | 6 ++----
 drivers/misc/xilinx_sdfec.c        | 5 ++---
 drivers/misc/xilinx_tmr_inject.c   | 5 ++---
 11 files changed, 22 insertions(+), 39 deletions(-)


base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
-- 
2.43.0

