Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0E444CFA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 02:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl5WZ3jFlz2ypV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 12:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p3l/JuOs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=p3l/JuOs; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl5KX0hPhz2xDT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 12:15:10 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u17so4511495plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 18:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg0zPJRWlVVMJp3FcD2PtNMkF9ls43+k2Njro2lpjXE=;
 b=p3l/JuOs6JibswuOWXbf72RJHPQYi9hszQygen8Cpfr/onDxBmmVPXqW/R2Txhn648
 Dc8abgTtHXIppQIcBSfjMpGS/vHf/epRE0tPrWP34uBpSA5r9o+S5Zaa+egoGNPLK/xb
 ChZHpQsRxsKTNJD/G7vUynYxKsK6kyJzJ6QVDV+gIKJnCS3TIYX6Fofj7D+MW7ZABxCu
 LnetaFF1lMpZKGmZt+jncsKnVK7PqMAUgrnjvA9xV0t+wetbayYDMljkcLrIy649AdWM
 S9Nxm1nDkIumuaXRfLA8PTLrIt59Iml5jCWQsxd5Qw/oMk0OBOJQ6feC3IYGnWMOk8Ky
 aLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg0zPJRWlVVMJp3FcD2PtNMkF9ls43+k2Njro2lpjXE=;
 b=Vd+XnDAQZelR5YDWObvAcRZWhped7ed7UarNxxWoXN8BN+Z0EJpiIvRZ1MyX34yPyL
 Ly57a/RnLWk+WIK8y5OKE9rs4AuhqKkk7oOKvtN3BF6DI5bDN1+yHQQbhwEZwtxb6WnR
 xLxwH36CZUDPaUA1n4/WYR+L99sDA24uggGmXvot9PvyAKg/HmgLmWB8JfBcRaE4GdId
 UhkwFJB58nULjtkVIdl0YY0u/HjyVIUUZsCKVMDbZQ/+jVqPBQmAB2zmRdAVscg54a/i
 IUc9YPAxFSwt7Ewm9YYm16mmMAanS7QPqtjCGme/K1iXpRqsThwa+ai1PR9LkASsjNuX
 Medw==
X-Gm-Message-State: AOAM531tWEJ/rWM2ahbkWoVr7o7d0/BvAeolirlFouQfOnbYAsO7KG9o
 D3MqP/Ypu2AjvvoMrQZZ1K1VNxHU9h0=
X-Google-Smtp-Source: ABdhPJxRgGQGeB3ZR4j/bxRyMBbKyh8C70dDm9soOjccS/9wDvZ8U9RIwf0MH7qjybLQoWtAHmJHkw==
X-Received: by 2002:a17:90b:33ca:: with SMTP id
 lk10mr10788629pjb.18.1635988506390; 
 Wed, 03 Nov 2021 18:15:06 -0700 (PDT)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id h6sm366407pfg.128.2021.11.03.18.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 18:15:06 -0700 (PDT)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] use swap() to make code cleaner
Date: Thu,  4 Nov 2021 09:14:56 +0800
Message-Id: <20211104011456.1027830-1-yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Nov 2021 12:22:42 +1100
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
Cc: zealci@zte.com.cn, yang.guang5@zte.com.cn, davidcomponentone@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/macintosh/adbhid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index 994ba5cb3678..379ab49a8107 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -817,9 +817,7 @@ adbhid_input_register(int id, int default_id, int original_handler_id,
 		case 0xC4: case 0xC7:
 			keyboard_type = "ISO, swapping keys";
 			input_dev->id.version = ADB_KEYBOARD_ISO;
-			i = hid->keycode[10];
-			hid->keycode[10] = hid->keycode[50];
-			hid->keycode[50] = i;
+			swap(hid->keycode[10], hid->keycode[50]);
 			break;
 
 		case 0x12: case 0x15: case 0x16: case 0x17: case 0x1A:
-- 
2.30.2

