Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85C87285F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 21:14:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=RkqfWiOc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq6H2448Pz3vdw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 07:14:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=RkqfWiOc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq6GG5dtDz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 07:13:57 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dc29f1956cso48121235ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Mar 2024 12:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709669633; x=1710274433;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSYXVhW6IE2D5ajlQEa1B1vvrGKQQuPtcjeRLrqLYrQ=;
        b=brO8+5Uc2rUkJM3qzoJuOkDedm1EkdfadP0yLJitf7kXH36op4xdAzgMTEJiuJZ65A
         SYs0xuD740vtTMtNsfu93AaTa//x0fGyBEWslaxRTagEx1t3B3GOt2RiGPOWHYUb/tpY
         pzcgdZ4rqDZD4Ixwu0eTss3GmkBRd4FEf3rJ2yl0/zIYK05PB1758PBQJMsDF8PnYZaV
         7adieIeL32avka2IoURIyB3K46rQI5UFEmtQ9/zcXLI2MxlM3sNi/oBTdW2FUJ0Yi3pZ
         tI4O8QnmwK+fmrTLQwF5EtSog9yHCyb6P+/xZPcJMTTxzTU+UF+lwRTErqHKqUbRRoPI
         0SGg==
X-Gm-Message-State: AOJu0YztxO/DWekAvECk9DSeYYYEkL2CxR+jFNnhY6p3p2KRj0cygEcc
	qLtynDhfDyKwNIqH4WT1otVwcvcZCfAPHfjqzBst0KfXhPVdiC4W
X-Google-Smtp-Source: AGHT+IF+RsAWrAMSe9G/BWeWxtXL6Wd1ZdhDRF1td5dyHKERADparXdgED8Dbw7TGeOs4HsS+NM/9Q==
X-Received: by 2002:a17:902:dac9:b0:1dc:696d:ec64 with SMTP id q9-20020a170902dac900b001dc696dec64mr3190315plx.22.1709669633114;
        Tue, 05 Mar 2024 12:13:53 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f7c600b001d937bc5602sm10926938plw.227.2024.03.05.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 12:13:52 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1709669631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XSYXVhW6IE2D5ajlQEa1B1vvrGKQQuPtcjeRLrqLYrQ=;
	b=RkqfWiOceETMbjQL91ZG0aOurtSdvq5mBrQbqJ54piY92oWTaufoIb8wOC5mRvyyuY/AQT
	hQk7r7wP8TRJbTDK2XD6IMh6VQ5XsxK09xU+SZQbqwdGUzlKSZ/s21mtzPPpn+W9qJW5JK
	X0FEoSEN/uHvATgSdfGdzK4hHwRFP/4Am2wqTIiricr2V3JVzhRZ4c2VKVIHHLp8LK5rPJ
	QCqY7rU1nIvbmlDvWfEJRhoc/LFwt+zoZcnFnpTODHlqIpDAgNm9tMxrqgzyzJaa5/Brt6
	33U+ntXeMsVky+a/gLsgcmRY3LqS0UYjCey/oJyerntyRnCsD+T3b63QxGrbNw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 17:13:48 -0300
Subject: [PATCH] macintosh: adb: make adb_dev_class constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-macintosh-v1-1-9c3f4f882045@marliere.net>
X-B4-Tracking: v=1; b=H4sIAPt852UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwNT3dzE5My8kvziDF3LJAMj8xQTQ+NEA1MloPqCotS0zAqwWdGxtbU
 AigoenVsAAAA=
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=5Wm0Feou8DRiXWce7bt01xh1tGKc1xLn2CN27Ctf2Ug=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl53z8Dng6WoFoM5acsfn4yA7f7mVNkc1g8tP77
 NL1/ln0DJiJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZed8/AAKCRDJC4p8Y4ZY
 pgaqD/9mPIcZD1XS4VoldtUUUrXLtC9ZNZCu1CfgJqdxcAUe1p33nP7P0z/H7GyH884PedWXE6Y
 L0YTOI53df6Pizx+ZHehIkVORAYAWvHAzdX06p0A1erCj9PqjPie0wnChZsF2/Olactz+TCarsr
 EgnWgo8SPwsBh56vTYt1eaSUNbxJ9ME/jV/AphAcMgPeLZ//iZlAD7cJli/+pZgIM+NSbjUHRKw
 1CuZnOCD/vgBD7wPYCsme580jfwnEzhpHwdrz7HDiR9ci/B2zyOK2VzkHsA78OLV45jsUywNJ1W
 jzH9MyYzxhLLv/cCnIQQy27YQgKKd/TQbdkYkCs1RvkDmjBh+IZpwlXBjhyLD9yaRZ6oLPLPwIs
 njMqNl74F20GvR9zTnpfUur9n8bsUJ+ciUgb7YLphtnJ8AFMAUTAuJf159STbAMqdh3cwcobkZs
 HolEPdkXPNggLGsm+hgOrNUcNjaQJbBdfHJbP/1A5o21WKkade4U09CXKSUiBoHRuOc0Vo7x19i
 ibWu6VhXJF0AXy6GfkfWgV4S8k3JePsVTDCbCoLuqJATcxULyR27Bo1XGJdnTpjNtRKFRHEJug6
 lb8HZUG2M3ImINPHiea3Xg14/wjyQtJOUnNU/7sybAoSATxtWN8J2S5UDPWFXOFXfdgxL3sBjOC
 QXWzD4OC8BnPJag==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the adb_dev_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/macintosh/adb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
index 057b0221f695..b0407c5fadb2 100644
--- a/drivers/macintosh/adb.c
+++ b/drivers/macintosh/adb.c
@@ -74,7 +74,9 @@ static struct adb_driver *adb_driver_list[] = {
 	NULL
 };
 
-static struct class *adb_dev_class;
+static const struct class adb_dev_class = {
+	.name = "adb",
+};
 
 static struct adb_driver *adb_controller;
 BLOCKING_NOTIFIER_HEAD(adb_client_list);
@@ -888,10 +890,10 @@ adbdev_init(void)
 		return;
 	}
 
-	adb_dev_class = class_create("adb");
-	if (IS_ERR(adb_dev_class))
+	if (class_register(&adb_dev_class))
 		return;
-	device_create(adb_dev_class, NULL, MKDEV(ADB_MAJOR, 0), NULL, "adb");
+
+	device_create(&adb_dev_class, NULL, MKDEV(ADB_MAJOR, 0), NULL, "adb");
 
 	platform_device_register(&adb_pfdev);
 	platform_driver_probe(&adb_pfdrv, adb_dummy_probe);

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240305-macintosh-9b027d413a05

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

