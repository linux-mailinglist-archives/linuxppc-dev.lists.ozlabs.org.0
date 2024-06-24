Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917C919E07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 05:54:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KQhFpsDN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8l702pCQz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 13:54:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KQhFpsDN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W77x33sLrz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 23:24:53 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a725041ad74so60602966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 06:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719235484; x=1719840284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qNmpKJuYqjpPf8ANNBdO2N5OryrwiWb6w2l8lfusXk=;
        b=KQhFpsDNZyP0uHngc2BMM/3WPs/ywLI5szJjsRByY0PZBVqJlFlb7Nhe9XAZsAa8Jg
         KuogLGCMPVy2NN7uttmxLN4qlxmSb5q+27K2hjcQFUMJlDgbo82FvXNtgvwUQqVc4/nx
         DzRDAqPjuEMl58XmvskAYNr2Et3d5wHzvd/WaZGLkOBNoGS0MH2XI+tdRkdSpLjWamBs
         VK5dKzDql1JV4RFeXr6hOEg6SbBu+Ga1ZUe5dR7Y0zNOEbwxHFhvgDoSInQMo4/p3MJ+
         BKiC9GAZPfEfKSGqMrat5K1ZrPsIq84EXqHSZzJ0KpRW/6WIjOQ6ebDPcx79UH5E13Ow
         YvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235484; x=1719840284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qNmpKJuYqjpPf8ANNBdO2N5OryrwiWb6w2l8lfusXk=;
        b=q0ZH0cmfAEkV/bpImnr5DFWGsbHiLMlL9dBwEpi9mf0oOoLC5d0hU1ULSpVELGgIWj
         4JQVGbUIHCxRCXTDeRuxQv0LgIM5Htllss13S0lN1uP5ubhj6aSsNZTH22MtfH5T8uQL
         y3GLoiXKSwqgj92DEtfwYx4tYMSllyCIsNNWZXr5vroTW30cC937XMWR2+2TBLZlkUqk
         x05HnWGHtWTITNwEYm1+t6BzOwtACF8JExexrPUHHaWAgoQzfLC3ISyTYa0NFPxkAJua
         ywihD6DGztsFySUZBKpp6JCUiFvjj0lKy+6KFxeiIA5Q7O9G142urbUFiTGSZ5y06pFK
         FcIg==
X-Gm-Message-State: AOJu0YyhbhMwS+a6Sm3nkJnkFGYXmP+fyVkA+SLR0sRaJ56QQFleQjKQ
	kfA8mQOztQR2jgzwlqeKT5baapU7DNGtxyDpqImprla7+EaDu1zm8RMsHLfHDEQ=
X-Google-Smtp-Source: AGHT+IH5sdZC4fUoXdA9SbZYcEzF1JAGZSeiELDR0lPD2ttVCqNAj60gu0/0JD15lfwLA1qlYRoBUg==
X-Received: by 2002:a50:c307:0:b0:57d:4df:f7e0 with SMTP id 4fb4d7f45d1cf-57d4bddf37dmr3706685a12.35.1719235483812;
        Mon, 24 Jun 2024 06:24:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5d40:c7b4:b6ef:a1b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3040f3e0sm4666760a12.25.2024.06.24.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:24:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] macintosh: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon, 24 Jun 2024 15:24:33 +0200
Message-ID: <20240624132433.1244750-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3640; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UUmEoJxmAO34JtinxvV5zz+5Vb0YgSxjl6fepG/1hhU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmeXOSVpDpx9DHnLI+6umm9/IULSnytvkweBV7D HZ1EY4zaB2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnlzkgAKCRCPgPtYfRL+ TqVCB/0b4fEeIP5UXuWbQrUpr2Hk7NWOCaMQHBwy3xxcFewfYTY6gjW8IaA0YYkwO+T6UIIH+Ur ufguMdAObsKCYx+FcS4tp8adNkOSL7T+fAaS/C/SF+3jseaXKM6oIT7NNvUqL0Jap9vfsIU21OD d6g2UT21UkmkO0ucrWPNjjYPFBbLLj2fWT616V5061zDvmsyt8bUQ/HRDjF8XUNu23xz0uDMGHr uZl7UHzg9DVQv5VztDDWybD0gP2Bv3ElDtp8Bd8Q8dbbZmI7enLs4GGEst6q0wOIo54FCBzVt+p PuJfiKSywwYLVauQxBc/mqha8vlb8fVUBu7KS7Efo1GX/AQW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 13:53:28 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/macintosh/ams/ams-i2c.c             | 2 +-
 drivers/macintosh/windfarm_ad7417_sensor.c  | 2 +-
 drivers/macintosh/windfarm_fcu_controls.c   | 2 +-
 drivers/macintosh/windfarm_lm87_sensor.c    | 2 +-
 drivers/macintosh/windfarm_max6690_sensor.c | 2 +-
 drivers/macintosh/windfarm_smu_sat.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/macintosh/ams/ams-i2c.c b/drivers/macintosh/ams/ams-i2c.c
index f9bfe84b1c73..d5cdbba6e7c7 100644
--- a/drivers/macintosh/ams/ams-i2c.c
+++ b/drivers/macintosh/ams/ams-i2c.c
@@ -60,7 +60,7 @@ static int ams_i2c_probe(struct i2c_client *client);
 static void ams_i2c_remove(struct i2c_client *client);
 
 static const struct i2c_device_id ams_id[] = {
-	{ "MAC,accelerometer_1", 0 },
+	{ "MAC,accelerometer_1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ams_id);
diff --git a/drivers/macintosh/windfarm_ad7417_sensor.c b/drivers/macintosh/windfarm_ad7417_sensor.c
index 49ce37fde930..3ff4577ba847 100644
--- a/drivers/macintosh/windfarm_ad7417_sensor.c
+++ b/drivers/macintosh/windfarm_ad7417_sensor.c
@@ -304,7 +304,7 @@ static void wf_ad7417_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wf_ad7417_id[] = {
-	{ "MAC,ad7417", 0 },
+	{ "MAC,ad7417" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wf_ad7417_id);
diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintosh/windfarm_fcu_controls.c
index 603ef6c600ba..82365f19adb4 100644
--- a/drivers/macintosh/windfarm_fcu_controls.c
+++ b/drivers/macintosh/windfarm_fcu_controls.c
@@ -573,7 +573,7 @@ static void wf_fcu_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wf_fcu_id[] = {
-	{ "MAC,fcu", 0 },
+	{ "MAC,fcu" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wf_fcu_id);
diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index 975361c23a93..16635e2b180b 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -156,7 +156,7 @@ static void wf_lm87_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wf_lm87_id[] = {
-	{ "MAC,lm87cimt", 0 },
+	{ "MAC,lm87cimt" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wf_lm87_id);
diff --git a/drivers/macintosh/windfarm_max6690_sensor.c b/drivers/macintosh/windfarm_max6690_sensor.c
index 02856d1f0313..d734b31b8236 100644
--- a/drivers/macintosh/windfarm_max6690_sensor.c
+++ b/drivers/macintosh/windfarm_max6690_sensor.c
@@ -112,7 +112,7 @@ static void wf_max6690_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wf_max6690_id[] = {
-	{ "MAC,max6690", 0 },
+	{ "MAC,max6690" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wf_max6690_id);
diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
index 50baa062c9df..ff8805ecf2e5 100644
--- a/drivers/macintosh/windfarm_smu_sat.c
+++ b/drivers/macintosh/windfarm_smu_sat.c
@@ -333,7 +333,7 @@ static void wf_sat_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wf_sat_id[] = {
-	{ "MAC,smu-sat", 0 },
+	{ "MAC,smu-sat" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wf_sat_id);

base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
-- 
2.43.0

