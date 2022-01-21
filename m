Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C896496771
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgXqv3b4rz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lhqbeFLn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=sampaio.ime@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lhqbeFLn; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgQTr1rSYz30RT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:54:54 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso12541946otf.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 08:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVA0ZWgzizXSbtVSNUIGHlKEL+CetSwxidS0XXuLPDw=;
 b=lhqbeFLn6LGWwaXmjOPj025/8uD2u6ghPM19YiK6cJI0mhCqlepHSe+COo5qrpuYrj
 Sl6tQM2aeFiwynHCEpE3AmawxvDoNYa46HXASqlYacYo/jQwc673zhFfithjVFOpFXq4
 wMa0NyFx/j25Ww4M4OL/nOUVvICnZ+Fk1posng1CxQ50V0w1A+I/ILNOAffBghZahGoA
 h8sg9o+LHpseXVWuqr9PKyzV/3hDbSpG2nLG2I2YSJk+g07XlsrvaurbNJYMGO3G37YW
 DjlvKNOAaIu0LDJVdA8MoxqUYd4NYzgYb/l9WBlYQWnYnu+5F+NGDNZRxUWtYq+HaI86
 GLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVA0ZWgzizXSbtVSNUIGHlKEL+CetSwxidS0XXuLPDw=;
 b=Yiab+59u7Bp3u+EoYnmk8yprHJKoDuqvlAPBG5SqURTHUArk4GmQemHJpNFUixqG8B
 tt2rNybo76LxKJWZhi9dYuN6T4XFoEBh21NU0ReCUl+Xz14HStqhXWrYFB3Y79/GhUaQ
 M2wcpCC4AO8bv5zhV6oHz6W2Qg9733DkzAr1uRx7Zvp+JUVoSXKDdtEeZHdf1LF8TPoL
 JijNEnjT1KuEt7xzDvukvjAWRIYdhz8Chim5v1lWzZ3uzGD+WMnn72otMtrbZiy9D78m
 IlXuIEZEq3jcHZUW5t5z7PiYUekskvXyVHcf0LP+0+66+Bjay9uZ6mbtttjFSHa5MTgP
 WMpg==
X-Gm-Message-State: AOAM530dD3uVoFzOAjPBKC7GX5wIf9AaSignwCLpStGMbtOl+dBWrNK7
 GDNDqkugIoUGumNnL8fw84c=
X-Google-Smtp-Source: ABdhPJzGe5RaMv9muOHI7TUblJz0zvxsC6HtZXqdKfF4KHj5o321mFmDbasyCgJoXNohCMLyfEp3ew==
X-Received: by 2002:a9d:60b:: with SMTP id 11mr3320985otn.384.1642784091086;
 Fri, 21 Jan 2022 08:54:51 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:cf72:4317:3105:f6e5])
 by smtp.gmail.com with ESMTPSA id
 y8sm1089271oou.23.2022.01.21.08.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 08:54:50 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 09/31] macintosh: changing LED_* from enum led_brightness to
 actual value
Date: Fri, 21 Jan 2022 13:54:14 -0300
Message-Id: <20220121165436.30956-10-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121165436.30956-1-sampaio.ime@gmail.com>
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 08:40:28 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Luiz Sampaio <sampaio.ime@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The enum led_brightness, which contains the declaration of LED_OFF,
LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
max_brightness.
---
 drivers/macintosh/via-pmu-led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-led.c
index ae067ab2373d..b0a727ad0157 100644
--- a/drivers/macintosh/via-pmu-led.c
+++ b/drivers/macintosh/via-pmu-led.c
@@ -54,7 +54,7 @@ static void pmu_led_set(struct led_classdev *led_cdev,
 
 	spin_lock_irqsave(&pmu_blink_lock, flags);
 	switch (brightness) {
-	case LED_OFF:
+	case 0:
 		requested_change = 0;
 		break;
 	case LED_FULL:
-- 
2.34.1

