Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3894729BC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd2KH3ksKz3fkx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 23:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd2JH0sg3z3f5F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 23:39:59 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q7cL5-00015c-Ly; Fri, 09 Jun 2023 15:39:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q7cL2-006DQG-Iv; Fri, 09 Jun 2023 15:39:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q7cL1-00CbLA-Tk; Fri, 09 Jun 2023 15:39:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 1/2] powerpc/legacy_serial: Handle SERIAL_8250_FSL=n build failures
Date: Fri,  9 Jun 2023 15:39:31 +0200
Message-Id: <20230609133932.786117-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609133932.786117-1-u.kleine-koenig@pengutronix.de>
References: <20230609133932.786117-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UaetvPn93yjffnvRpl05XP9ES/YlsYyRkVTXp98DFLg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkgyuPTpnk3tAaU03gC4tcNyer+VWIXMkAUiNKc HgxNljHuy2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIMrjwAKCRCPgPtYfRL+ TjC6B/9zeis0/Hsbg7mICcaw8jshAoTaOCKLITarBQvJoy4Nb5Hw7DfNETfz++t9Is22wt/mU2A VOivO/vxkzDxL6vyRZA5qXQIKs5XUMYrMcWZipTltj/SlD9TtmHZuGMcSHFllbNhfc+BaZASspf /SkuBf0luljF/Hsu942HEm64CDQmtpDHdSU0blz50GQaW1vYp68q6Hne6Z5IAixcoB+Tmq9JbLW zmPqv9bgtJMVb1tIEL/iSVC9M7q7EX531/lSkErdRjbFtYYUIgKUwI9IGBTEfaLiVn4LT9QK1Rb I1aVrbuc7xwtYXaVc3oXrEQD5cKgZWsItmLFDqT3GWW+Cseh
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
Cc: Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, Liang He <windhl@126.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With SERIAL_8250=y and SERIAL_8250_FSL_CONSOLE=n the both
IS_ENABLED(CONFIG_SERIAL_8250) and IS_REACHABLE(CONFIG_SERIAL_8250)
evaluate to true and so fsl8250_handle_irq() is used. However this
function is only available if CONFIG_SERIAL_8250_CONSOLE=y (and thus
SERIAL_8250_FSL=y).

To prepare SERIAL_8250_FSL becoming tristate and being enabled in more
cases, check for IS_REACHABLE(CONFIG_SERIAL_8250_FSL) before making use
of fsl8250_handle_irq(). This check is correct with and without the
change to make SERIAL_8250_FSL modular.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 66eff0ef528b ("powerpc/legacy_serial: Warn about 8250 devices operated without active FSL workarounds")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/kernel/legacy_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index fdbd85aafeb1..6ee65741dbd5 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -510,7 +510,7 @@ static void __init fixup_port_irq(int index,
 
 	if (IS_ENABLED(CONFIG_SERIAL_8250) &&
 	    of_device_is_compatible(np, "fsl,ns16550")) {
-		if (IS_REACHABLE(CONFIG_SERIAL_8250)) {
+		if (IS_REACHABLE(CONFIG_SERIAL_8250_FSL)) {
 			port->handle_irq = fsl8250_handle_irq;
 			port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
 		} else {
-- 
2.39.2

