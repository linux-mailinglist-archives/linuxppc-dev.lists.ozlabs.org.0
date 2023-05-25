Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F80711892
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS0jp4NBlz3fGG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:57:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS0jL5lQ8z3fBm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:56:54 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2I0d-00084y-CT; Thu, 25 May 2023 22:56:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2I0W-002np7-E8; Thu, 25 May 2023 22:56:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2I0V-007xeZ-Ff; Thu, 25 May 2023 22:56:23 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Scott Wood <oss@buserror.net>
Subject: [PATCH] powerpc: Switch i2c drivers back to use .probe()
Date: Thu, 25 May 2023 22:56:22 +0200
Message-Id: <20230525205622.734093-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pjW/ibHfTrTzl39Yx6ZRkxChTENd5/DIbmG5vHKsdo0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkb8tuUsHEG+C58U1i9cttaB7quhIVihOVM8X8W WSDW+IA8u2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG/LbgAKCRCPgPtYfRL+ TicWB/9x5b4GV0qwIp1SWChtNDJzCM73v1MdA8Yrq/MuTJKVWuaKL6VtkrhyF7Bnj71PMsy5frP BJAT4P4VuweDPw0vWBMwlhxvCCdRSiCjEASLpekeQYulMm33DVyrNdl7Lgdd/DRfSkn1SkTalXC p54K27ZMgn5SlJVmadVoj4H21ojp3VjRqpnJ+yNn/exVKAky80kPvPDNCPTlpfKAdAmY6RPJJrr TQM6pv6yx9F3g89sQY9cxlsrr07dc7RFXRpKgE8veBAoTQW0FXC+rN7QKYzQ5LR42+9W5WI8nJA 7XI+wGOgVhlgwPwLb3IG00JcQsKiNY4YCDrVdf9SV1/9quAP
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
Cc: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, Rob Herring <robh@kernel.org>, Crt Mori <cmo@melexis.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liang He <windhl@126.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/44x/ppc476.c            | 2 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index fbc6edad481f..164cbcd4588e 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -103,7 +103,7 @@ static struct i2c_driver avr_driver = {
 	.driver = {
 		.name = "akebono-avr",
 	},
-	.probe_new = avr_probe,
+	.probe = avr_probe,
 	.id_table = avr_id,
 };
 
diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 77ed61306a73..4d8fa9ed1a67 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -211,7 +211,7 @@ static struct i2c_driver mcu_driver = {
 		.name = "mcu-mpc8349emitx",
 		.of_match_table = mcu_of_match_table,
 	},
-	.probe_new = mcu_probe,
+	.probe = mcu_probe,
 	.remove	= mcu_remove,
 	.id_table = mcu_ids,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

