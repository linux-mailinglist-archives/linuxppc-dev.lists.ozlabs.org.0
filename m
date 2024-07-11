Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899692DF35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 06:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CGRH928n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKMny1wjrz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 14:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CGRH928n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=draconx.ca (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=nbowler@draconx.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKLVQ5q1Qz30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 13:55:41 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6b5dc36b896so3948036d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 20:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1720670138; x=1721274938; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pIcWyjw9IYHu4kuTe0xycmZTVH8wV1vhQbU1+CkNO+g=;
        b=CGRH928nhYbaPW8JUXc0yczzYN7YeYpOG/79S3P4LVcHZqGkATOix8YC81oz+WQ0Q2
         ivIQ2Y3ZwIPk1KCEYTJcr3fAb/w4N1jD9CylUm5vdvjFFWhu7EBWi6e2PYt7jUb2rJao
         bNLbq1l4aarg9kj0g3xgWbyUAd+Uiuw3HrmFinVlfYLac8vr3oxgyCe2i2+UgojvuEkz
         iiDzNMdOCLoJBWJHGEMhRZsxRiyJTF7+iQIh5k0AL85d1TyRvnGTfciBFEliMQF9yjnW
         1ug0i3hmSuv5+xBzVJHtoHZLD4VPBCsaCLsN2/ojmqDQRKVxchlWix5tWMyOj3s1P3U3
         ms1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720670138; x=1721274938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIcWyjw9IYHu4kuTe0xycmZTVH8wV1vhQbU1+CkNO+g=;
        b=Uyd9NJU6vDTHH45Pb3ZLe4HzO8nTkRqDd+LlFdZ43Xj1MArfERbepFmPUpOd+5M5qz
         cb8GMMa/O8LkCSQeexGk6BV/r2khSmWz2jBVZIqoQHDFqI9IujsLdm+SgRf8vx4EIfbX
         uZlB0l+W8O2XF2Sc4sq2DRfYuLP2elqm0ABVgL7kmHjme1xaAT8KIMmR8HREwwgy9SXK
         kKjMfqgtvEYCKF/cewzve7cgprgsKhJQrqFN6vTJEZ5K1tf/uLIcGRxuNieLrV72mXvw
         z8DnGiVMCJhkYC6fzE6elBdStfPXlpZ7L9U0dVE+x6zHVHsUQ7cMEvGwsMfpEf9fA9vj
         Fhnw==
X-Gm-Message-State: AOJu0YxxVDJC190okwZ24n5xMzhEO7I07aBE2NrHE//ETpJR78NhJTm1
	IoIQ0AfZxSn8UIoxPuGVKSKpIkURnqvayvwV7B6XhNsiL3s+QQl3qGYrl3Y6QIbKBwNcaEY7prb
	y
X-Google-Smtp-Source: AGHT+IHUanKTrvxWsgutkth46MOJQAC7PEN/Ze2tgw84+rWzoMukmZ0I6dT1lwAoFOhPv04it23FEw==
X-Received: by 2002:a05:6214:d44:b0:6b5:684:2d5 with SMTP id 6a1803df08f44-6b74e95464cmr6331376d6.4.1720670138264;
        Wed, 10 Jul 2024 20:55:38 -0700 (PDT)
Received: from localhost (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61baa2383sm21961866d6.138.2024.07.10.20.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 20:55:38 -0700 (PDT)
From: Nick Bowler <nbowler@draconx.ca>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh/therm_windtunnel: fix module unload.
Date: Wed, 10 Jul 2024 23:54:17 -0400
Message-ID: <20240711035428.16696-1-nbowler@draconx.ca>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Jul 2024 14:53:39 +1000
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
Cc: Pawel Moll <pawel.moll@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of_device_unregister call in therm_windtunnel's module_exit procedure
does not fully reverse the effects of of_platform_device_create in the
module_init prodedure.  Once you unload this module, it is impossible
to load it ever again since only the first of_platform_device_create
call on the fan node succeeds.

This driver predates first git commit, and it turns out back then
of_platform_device_create worked differently than it does today.
So this is actually an old regression.

The appropriate function to undo of_platform_device_create now appears
to be of_platform_device_destroy, and switching to use this makes it
possible to unload and load the module as expected.

Signed-off-by: Nick Bowler <nbowler@draconx.ca>
Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
Cc: Pawel Moll <pawel.moll@arm.com>
---
 drivers/macintosh/therm_windtunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 37cdc6931f6d..2576a53f247e 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -549,7 +549,7 @@ g4fan_exit( void )
 	platform_driver_unregister( &therm_of_driver );
 
 	if( x.of_dev )
-		of_device_unregister( x.of_dev );
+		of_platform_device_destroy(&x.of_dev->dev, NULL);
 }
 
 module_init(g4fan_init);
-- 
2.44.1

