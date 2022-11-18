Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F16166300E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 23:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDX5b0r8Jz3f59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 09:49:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
X-Greylist: delayed 60 seconds by postgrey-1.36 at boromir; Sat, 19 Nov 2022 09:48:36 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDX501kBKz3cKj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 09:48:36 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9m-0005UT-I9; Fri, 18 Nov 2022 23:48:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9j-0058tj-IN; Fri, 18 Nov 2022 23:48:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9i-0000Ve-P7; Fri, 18 Nov 2022 23:48:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 597/606] ALSA: aoa: onyx: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:45:31 +0100
Message-Id: <20221118224540.619276-598-uwe@kleine-koenig.org>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/aoa/codecs/onyx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 2d0f904aba00..4c75381f5ab8 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -990,8 +990,7 @@ static void onyx_exit_codec(struct aoa_codec *codec)
 	onyx->codec.soundbus_dev->detach_codec(onyx->codec.soundbus_dev, onyx);
 }
 
-static int onyx_i2c_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int onyx_i2c_probe(struct i2c_client *client)
 {
 	struct device_node *node = client->dev.of_node;
 	struct onyx *onyx;
@@ -1049,7 +1048,7 @@ static struct i2c_driver onyx_driver = {
 	.driver = {
 		.name = "aoa_codec_onyx",
 	},
-	.probe = onyx_i2c_probe,
+	.probe_new = onyx_i2c_probe,
 	.remove = onyx_i2c_remove,
 	.id_table = onyx_i2c_id,
 };
-- 
2.38.1

