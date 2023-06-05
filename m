Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA1E7226FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 15:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZYrH430Yz3ffH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 23:10:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZYqF2PLlz3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 23:09:42 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q69xM-0001WH-KH; Mon, 05 Jun 2023 15:09:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q69xF-005HiL-NM; Mon, 05 Jun 2023 15:09:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q69xE-00BOyI-UI; Mon, 05 Jun 2023 15:09:00 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 0/2] serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE
Date: Mon,  5 Jun 2023 15:08:55 +0200
Message-Id: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=efED1NBBshJCjtXaXpvTEIOYQwFkMPcUlShlRdzjsnY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkfd5jaEVvCEZommSXyTG8Eotcw/vYwgq1ooqwJ +LAQzQ3pFmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZH3eYwAKCRCPgPtYfRL+ TmwrCACC5YJ4ou0Bm0/ZORk01u+NPrk7NEQRTwKiRveCNvUqIgkJq5nkbm4JH/fUBh8nt6j8Sog y5Fm+vyV2+4B8hY4dmrRXD3GYbJzpbmBklsuWSiLE8xJvmXJAWyfcn3JiOaiwQwdtyAETBCaqTJ DIK4OX5t9hevZ1Zy0hQbvhL+rIn28McI95kOHiwXlm0AiH0uNzfomg+thLKcIhPfkWaYbiLShxo X5oKuhC2OvdjB6E++At3yQPVM0/InkgF/Uw1Q/vaFgQOL8cgn4V+wIDz5aIXX1J22l+vJGh+mFT kyuN8lADoLdvK3avgRsPKqAn0R5Fsn7Drbm1zUPU/eCfDxTa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, linux-serial@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Liang He <windhl@126.com>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, kernel@pengutronix.de, Matthew Gerlach <matthew.gerlach@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this is v3 of the series that now also copes for
arch/powerpc/kernel/legacy_serial.c using fsl8250_handle_irq().

For kernel configurations that already before were correctly using the
Freescale workarounds, this is the case with this series applied, too.
So in all cases the situation doesn't get worse. The upside is that even
with the 8250 driver compiled as a module (or built-in but without
console support) the workarounds are now applied for all devices but for
the ones instantiated in arch/powerpc/kernel/legacy_serial.c. (And even
for these there might not be a problem as they might benefit from
enabling the workarounds in drivers/tty/serial/8250/8250_of.c. Not sure
though.)

Patch #1 is new here. Patch #2 only changed lightly: I restored
alphabetic order in drivers/tty/serial/8250/Kconfig.

As patch #1 is needed for patch #2 to not introduce a build failure,
both patches should be taken together. I suggest to add them to Greg's
serial tree, but the changes pending there should not conflict with this
series such that taking them both via powerpc works, too.

Best regards
Uwe

Uwe Kleine-König (2):
  powerpc/legacy_serial: Warn about 8250 devices operated without active
    FSL workarounds
  serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE

 arch/powerpc/kernel/legacy_serial.c | 14 +++++++++-----
 drivers/tty/serial/8250/Kconfig     |  2 +-
 drivers/tty/serial/8250/Makefile    |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

