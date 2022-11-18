Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5ED630346
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 00:26:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDXx33649z3dvf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 10:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDXwX3wwHz3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 10:26:18 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA8k-0002j0-BZ; Fri, 18 Nov 2022 23:47:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA8h-0058VN-6C; Fri, 18 Nov 2022 23:47:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA8g-0000Aq-Tx; Fri, 18 Nov 2022 23:47:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 295/606] macintosh: windfarm_lm87_sensor: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:40:29 +0100
Message-Id: <20221118224540.619276-296-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/macintosh/windfarm_lm87_sensor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index 40d25463346e..f37a32c2070c 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -95,8 +95,7 @@ static const struct wf_sensor_ops wf_lm87_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static int wf_lm87_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int wf_lm87_probe(struct i2c_client *client)
 {	
 	struct wf_lm87_sensor *lm;
 	const char *name = NULL, *loc;
@@ -173,7 +172,7 @@ static struct i2c_driver wf_lm87_driver = {
 		.name	= "wf_lm87",
 		.of_match_table = wf_lm87_of_id,
 	},
-	.probe		= wf_lm87_probe,
+	.probe_new	= wf_lm87_probe,
 	.remove		= wf_lm87_remove,
 	.id_table	= wf_lm87_id,
 };
-- 
2.38.1

