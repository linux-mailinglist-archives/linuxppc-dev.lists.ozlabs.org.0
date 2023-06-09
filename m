Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE24729BBF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd2Jm2Vx7z3fdK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 23:40:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd2JB2dkfz3dyJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 23:39:53 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q7cL5-00015b-Sm; Fri, 09 Jun 2023 15:39:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q7cL2-006DQC-9q; Fri, 09 Jun 2023 15:39:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q7cL1-00CbL7-Ms; Fri, 09 Jun 2023 15:39:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 0/2] serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE
Date: Fri,  9 Jun 2023 15:39:30 +0200
Message-Id: <20230609133932.786117-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+cB9tyShgwjshIjt2kga32Gjjr1RbhwE+cfs5aJ925k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkgyuIVtr7pD4lotNXh/iORjiYvWbBmyyQyJxIF HC1uLy6ba6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIMriAAKCRCPgPtYfRL+ TpjgB/9KGK9p2YxZnajUVe2pDznpCZz8FORUS0Evd76KrUPGduGFLJTaXwjMMvN0AWuPBzOjtC5 xqiZ2wEdw7JtSVprH6JwO2S3KF3HjiK2t6eNl5zZrOCzOKNxK6HSDqqip6MWzbxVkWLJcU7dFRa ONyMkAAfiuXo0uZ6RrMZ80ZQOPUC/Byk/sK3B7/oFLnHN0ncWRpMT7o7t2sEjfpqCxDgRb/dwsP spJ1I2ZZaXDp0fdkvQLWNcYlg7My48FjhMnpvcTQiXZlXarg3B82UK3THIBIGwQd7ywC1J7IGiJ xJsz1n7YL7m/i2o1q5H4xSbUqWykOxc4UoxUXRsxkI9Irrfg
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
Cc: Rob Herring <robh@kernel.org>, kernel@pengutronix.de, Geert Uytterhoeven <geert+renesas@glider.be>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, James Hilliard <james.hilliard1@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, Matthew Gerlach <matthew.gerlach@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liang He <windhl@126.com>, Lino Sanfilippo <l.sanfilippo@kunbus.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this is the fourth iteration of trying to make the FSL workaround code
active even without 8250 console support.

The first patch is a fix for commit 66eff0ef528b (powerpc/legacy_serial:
Warn about 8250 devices operated without active FSL workarounds) that
currently is in tty-next. This patch originates from my v3 that was only
partially applied. (That is a lame excuse though. While the applying the
full series would not have shown this problem, bisection would still
have a problem.)

The second patch makes SERIAL_8250_FSL tristate and thus allows this to
be enabled also with SERIAL_8250=m. This is also the relevant change
since v3, where 8250_fsl.o was linked into 8250-base.ko.

This series is build tested on amd64 and powerpc with all 27 possible
configurations for

	SERIAL_8250={y,m,n}
	SERIAL_8250_FSL={y,m,n}
	SERIAL_OF_PLATFORM={y,m,n}

using:

	choices=(y m n)
	for i in $(seq 0 26); do
		perl -p -e "s/SERIAL_8250=y/SERIAL_8250=${choices[$(((i / 9) % 3))]}/; s/SERIAL_8250_FSL=y/SERIAL_8250_FSL=${choices[$(((i / 3) % 3))]}/; s/SERIAL_OF_PLATFORM=y/SERIAL_OF_PLATFORM=${choices[$((i % 3))]}/;" .config-pre > .config &&
		make -j 12 ||
		break;
	done

with .config-pre having COMPILE_TEST=y so this time there shouldn't be a
build regression. (Not all 27 variants are possible, so some valid
configurations are tested twice or more, but that's still good enough.)

The patches have no strong dependency on each other, so they could go in
via different trees. But given that 66eff0ef528b is in tty-next, taking
both via tty sounds most sensible.

Best regards
Uwe

Uwe Kleine-König (2):
  powerpc/legacy_serial: Handle SERIAL_8250_FSL=n build failures
  serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE

 arch/powerpc/kernel/legacy_serial.c | 2 +-
 drivers/tty/serial/8250/8250_fsl.c  | 3 +++
 drivers/tty/serial/8250/8250_of.c   | 2 +-
 drivers/tty/serial/8250/Kconfig     | 6 +++---
 4 files changed, 8 insertions(+), 5 deletions(-)


base-commit: 66eff0ef528b6d6e9a45b68f6cd969dcbe7b800a
-- 
2.39.2

