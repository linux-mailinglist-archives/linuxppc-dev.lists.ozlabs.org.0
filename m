Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27536850100
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 01:10:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=HtWBl8Cz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWrjF0S3xz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 11:10:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=HtWBl8Cz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWrdC3v0Tz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 11:07:27 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-363f0b0a4fbso2213905ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 16:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707523644; x=1708128444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZNl1Nye2ncQoYBtuTJZGLa+1bUaHxQW2hW4pvSwI+0=;
        b=AgxjCoHUdXDLt02XJTtkWcwbKRIWL01eJlcii4iIfbjiJAR6CIiWrjU490D/09vVSn
         rshdpNC13WZoEIBNbeogm19duzx9skyKBpYJpMG3AjI61CH394qNi4EbRZIrBvizWJOE
         SmvrTJlBCyk/mcZ+JR3xqckzbLyMKnG4DWPdq/wis81HkfnO2BCF92TtFIHfxd8oJ7nM
         4ZdCFUx2pUbbCE18p37iY9tX/8Blc3wxFTDIJVNcJH8wvypAicjSXHbGXjUT7tKnuM8+
         s0hslqTavibxKql70tSGv/+Kj42Z+myKAijsY0QBGNdfnFO6JL3iyE4LpuT7yeXCPtGZ
         UKxg==
X-Gm-Message-State: AOJu0YyhkpSIfHDydW4rNuYnwQRStf9lgnJVKLQH8pjKFCEUDRCYV32W
	a5VfXPUZJ31zmGJeBgylYGFeiJZDyozOO0Z94LV2cJlL0Qx49aKW
X-Google-Smtp-Source: AGHT+IFjWpejum1p1/vdv1BGjtXN7B5mtVZFb0/yATzFOsqKSf6bGLt8FVbkzi7VkX/JMk9PwVL5yg==
X-Received: by 2002:a92:b745:0:b0:363:d9eb:c2de with SMTP id c5-20020a92b745000000b00363d9ebc2demr915116ilm.6.1707523644142;
        Fri, 09 Feb 2024 16:07:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfkrikHMdzjZpt1BDV82uhnXds79HetY/KS5BbA2g8Q10MbHNtUiMVhwiBdAAqIh55En/wRQE2nTBjHhyauscgehZw4+FgP+lSGTCoX3fXAcQ110T/tRCWCGtjApJLlLM0XddSowx+prC6A8jy8Y99y1lMetwn/+L8g8odVu2zsKA7Eds5VToqiJ1CPOl3DdmFiy4aO1F4rHoqAm/cDzPcV+KPBTMwlv/U1HAYAiJhEE892L8LHhyzvSmij7Aak0sov3vJ8iMIzFiGcBIW
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id b30-20020a63715e000000b005cfbec9f8b4sm2386759pgn.54.2024.02.09.16.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:07:23 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707523642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZNl1Nye2ncQoYBtuTJZGLa+1bUaHxQW2hW4pvSwI+0=;
	b=HtWBl8CzqrlCIcxNQ3PWSqy+/Hz2YnVuaJ1AEpd3zB7827MKw6DQ41MXb+Xcjnn/2a+el8
	4w4WayEjE+I5AuEIKjwnljv3PRPAiWsNGnBXEM/4R+B/I0ul9MmW9PkdeD1HTuVhxYkqrz
	C0xP1qjyM+SnWR+JFroMjUqnDDFuQtntH6Qx/HcRoCHwq7U6W9vlgh5bT50CPEL6Ecjzz3
	c3LmF/tdM+VttOVMSOf1poQ7ADJy1sbChwuWZ2W3xLkEKv/WxfIHvk6OETicluAH7vkgty
	LT4N5pK6y99VREHyNg5CSaw8N+BNJzxoxBaapAtRqsq8zlNmyV2tHfPs+6Tsbw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Fri, 09 Feb 2024 21:07:19 -0300
Subject: [PATCH 4/4] powerpc: ibmebus: make ibmebus_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-bus_cleanup-powerpc2-v1-4-79a56dcaebb1@marliere.net>
References: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
In-Reply-To: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=qfzL4dZjlBHFtDwhGgCc6fcqy06lU4Edb3ekIeLug9k=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlxr5QhN6gVJXkQevkdbSE1nkvWBm2oOqJEqMg2
 Zyb7GyHtAKJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZca+UAAKCRDJC4p8Y4ZY
 plKpD/sEnqDg91vGpaoLiboM7638MBJIZ2SOARbckZ2DGmj5329s1yfXSuuBSC+qEJ7nYhPWFY0
 +gHWkY2T7cxt3u09NE7CEjIpwN9OggvTja9uT+iHOvrJJZ/IKy3zbNQ1wuQgAHoFVlD8iIDJ6k3
 mR2Zz/DZSCPvVOVkWEXsc0Ixn4VOYOkbcznucst/fRpDlj2iL0gtjp4K1jrU79Q4IYqeWArf50h
 TD80+tr9T8PzVacUf60/NQ1IFVXLWgGK2SAZg/+NTcl0fPmZNbmstWYMejBk1UubcVT6Mk+1uz3
 CgxnNR7uHPDLpxXXV8NhvdrbqswBuHQQYdcRcPfmsyyJKD2n5Ez0s7QWqu6bh0ZgVoTxB6Ft+lV
 hNV+MLWZtK6C+yJvQmuclcewGmh0UXp79iBw27zv9bcmW5LoHmdg1b51+U+rWeByILHqyXtyWy5
 hzkhRBwq5wu2dddmmXV1SZDsKOuJzfH0yfS19IxAasxoTlBkJ4Y0hmwyxdbjqWdeg29SgmrxIxT
 px6msPaISJFtpHr4ZPt4HMRYbTtzUzYkMwE3BV1Agj5/SZ/QfONLSZKtfBOzVdY9V1aOfOUAYDg
 iMusaepwXHJQmsDkD19+A7VOHIAvbhuui2vDngA66iBfVqR1kMYRtsYTVQiGxwc93s1Cc6/rsKC
 PxlD2hang6QavZA==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the driver core can properly handle constant struct bus_type,
move the ibmebus_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/include/asm/ibmebus.h       | 2 +-
 arch/powerpc/platforms/pseries/ibmebus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ibmebus.h b/arch/powerpc/include/asm/ibmebus.h
index 6f33253a364a..46fe406f461c 100644
--- a/arch/powerpc/include/asm/ibmebus.h
+++ b/arch/powerpc/include/asm/ibmebus.h
@@ -48,7 +48,7 @@
 
 struct platform_driver;
 
-extern struct bus_type ibmebus_bus_type;
+extern const struct bus_type ibmebus_bus_type;
 
 int ibmebus_register_driver(struct platform_driver *drv);
 void ibmebus_unregister_driver(struct platform_driver *drv);
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 998e3aff2457..4bb611afaba4 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -432,7 +432,7 @@ static int ibmebus_bus_modalias(const struct device *dev, struct kobj_uevent_env
 	return of_device_uevent_modalias(dev, env);
 }
 
-struct bus_type ibmebus_bus_type = {
+const struct bus_type ibmebus_bus_type = {
 	.name      = "ibmebus",
 	.uevent    = ibmebus_bus_modalias,
 	.bus_groups = ibmbus_bus_groups,

-- 
2.43.0

