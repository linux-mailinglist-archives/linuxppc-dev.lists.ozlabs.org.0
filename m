Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEFF5BA95B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 11:27:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTTHr6vywz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 19:27:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
X-Greylist: delayed 1118 seconds by postgrey-1.36 at boromir; Fri, 16 Sep 2022 19:27:13 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTTHP6L6Yz302x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 19:27:12 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oZ7Ka-0007Zx-QB; Fri, 16 Sep 2022 11:08:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oZ7KW-00138f-QS; Fri, 16 Sep 2022 11:08:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oZ7KU-001Fs9-JN; Fri, 16 Sep 2022 11:08:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] macintosh/ams: Adapt declaration of ams_i2c_remove() to earlier change
Date: Fri, 16 Sep 2022 11:08:02 +0200
Message-Id: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=do/Kw3ytksfrqQaGzU6ZIwCzEv3D5tV24+6WnpVw9pc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjJDzutBJxZZLlx5FgG4dttMsbGJHJGQGjkSlGv9F+ 7SD8JbuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyQ87gAKCRDB/BR4rcrsCXMIB/ 9qMjSb53PiWux7vmHgutZ4Jd3Y5FiJjKKNgEhcd5hoo+CN7n7KhV3sT2sZIGxTcY3qmou30sfntP47 fuG7Z3dByG/++hQOzRFR4yyYHGIzefKuJEvXBjJVT6tFVRWYVviGPMEcXRX0Nni66SYNeWeYBpWBNO MfDRAQ3MtW4NHpRXmQUo9sqzaeGvJ8mpoASYnLwpbo954WaJXg3X16hYiBB2OjJCAVxdSG8tcQfoKd E6ilWWDpHqA/sGLWAITKpJR40r2xFErK7KVcad2nrV+d59kWM97b0bYofEVrUSN5SJukWB9uNLYTLW Z5CmNrDHFfTRH4suRzhLbOn6YrxhPN
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit ed5c2f5fd10d ("i2c: Make remove callback return void") changed
the prototype of ams_i2c_remove() but failed to adapt the declaration.
Catch up and fix the declaration accordingly.

Fixes: ed5c2f5fd10d ("i2c: Make remove callback return void")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

the kernel test robot found a regression. I checked the kernel tree and
(assuming I did it correctly) there are no other instances where I
missed to adapt a declaration.

I don't know how to proceed with this fix. Squashing into the broken
commit is out of the game as the commit is on a stable branch that is
already merged in a few trees. Maybe let it go in via the i2c tree?

Best regards
Uwe

 drivers/macintosh/ams/ams-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/ams/ams-i2c.c b/drivers/macintosh/ams/ams-i2c.c
index 362fc56b69dc..3ded340699fb 100644
--- a/drivers/macintosh/ams/ams-i2c.c
+++ b/drivers/macintosh/ams/ams-i2c.c
@@ -58,7 +58,7 @@ enum ams_i2c_cmd {
 
 static int ams_i2c_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id);
-static int ams_i2c_remove(struct i2c_client *client);
+static void ams_i2c_remove(struct i2c_client *client);
 
 static const struct i2c_device_id ams_id[] = {
 	{ "MAC,accelerometer_1", 0 },
-- 
2.37.2

