Return-Path: <linuxppc-dev+bounces-14700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2492CAFD80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 13:01:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQcrP0Fhyz2yFW;
	Tue, 09 Dec 2025 23:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765281668;
	cv=none; b=GecIt0fQgxgKW1puU/AETql0XB4MpvnJDi5o1cTzGwLq2ickatySSNbmiT/fyxFzkGqKCR7nfCJEOd0qclnDWz+Okn9shNLu730qy5xXtMhd9nlyrTMTS4QfwS00WMoDc3btMRj1MHlprqNjaGaRdtKkRCefiHevBgCTMlwva7ty6r0TcYFhCQmnKT1ZIIXmUy2AHCjtnCbQ+slSh+T6B1zqkw+LyiFd6TZLvxpq4WMXmHcoicLOcu4BnutKnXDqqJczVSD0BbI1iQLOhfKXKt3LFYYgSiFLQoUBqs+wsYGa2O44fSgIWT6WvDJiSUCmEdF2o2WxJEvyC29jSkRRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765281668; c=relaxed/relaxed;
	bh=tooAGZtbgdZjjhD9HMU80T91Y7IuvPUrt9iA6ZDBNz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T4oaZk0i871+u0njTQ05lCFlX+BvGXCmOr1V+Pc4EQ/X4w7hkf0Kk1ONXOP1skBbLU+wjvDZ7j8OFmILi9zCoglDBR1rnugL04UuHRrxze8gScRueddXzCG3DSMkR+B+Ogfz0pBKJUwbrjicj/WQqG8X210bv99nXHF/sIipWTlePbpHdN3hhrZHO4i5jFov5uchMD71W5WA+3ixtEeSJA9hF4z0LBZbfBPpEHIr2DVmkL0erxoyNcHWxHhhuYmj75LmhLoHKF8SHWL2EfHwuQpZIx83r1kDBhgCVLYiARfJAa7S3RU4wIyzgfY72LOB18DR/ZAf682edDISlPtBiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QtFdf83s; dkim-atps=neutral; spf=pass (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QtFdf83s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQcrM3c8yz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 23:01:06 +1100 (AEDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b76b5afdf04so880730166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 04:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765281603; x=1765886403; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tooAGZtbgdZjjhD9HMU80T91Y7IuvPUrt9iA6ZDBNz0=;
        b=QtFdf83sii3RaO+NKHf/hYhqvD1dzPMBEWJgojL3ixk3OCjrX4nOWuKLgw1wAzyuXu
         03y9X59CwqSWLfwEwZPjS5X1K+QksFB/kW/mVDiy8bE2l+0XU6Ky9zW64j452gml4UJK
         gMEsMDafg9p0yJ3scojk6NjEtYeq2jv+5VcH2L1qKx9bWOrJYA6WoUiUA8wuMyKCWdBq
         3KsGDgU3PPOvwJhBD6+ibqKuxSIM+xxiawK8gL/tZATd7yHO6WD499/tB+KWvx98x/Cp
         62XATTiMpvmHg63y48VN3/g5WCtZ+ANZnPaFtAsnMfb3maR9mkX9Vc86BNf29owGbUAR
         DJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765281603; x=1765886403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tooAGZtbgdZjjhD9HMU80T91Y7IuvPUrt9iA6ZDBNz0=;
        b=r//OCS8qmqnbyLAVy0O8b2ikLMn1ZHq5eImKVD3wecAD3SVVr9yT9Hr6epfU7Sys+B
         I9lvwRTmG+l+SYjgkvEuQ5/51IYlL3j9FLHcvboxrVb3zF/DGJTv9oNaTA0rYf+z/39r
         /hzm5K6/saQYPLafjIxJIH/r2KZxlkuGO3ivDAVyCcF0aiDOPLCOAjfHagW4Xl8/bS6w
         li/RlL3wGIfGY1i74+X+DKY+eeUYcUGWwTIfvPyUx3fPd7Lh9viBQjg6bo0fNsR2ARYT
         hOtwK1wrZ+4vfLfQNRXmg+X24KLwix6/JdPqpz/3GSdqJTdIkl6yGSkKOZqCfZgDdqcs
         PS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWz67INERT7vxcSDpn33/2N7jh5wQ8ULqymRYszj5q+bxVoao13qSnzLQDQ1Qb5LKpT6LrqQGIMhn9/qLE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiMfTReO3aUaxhW7Qt3MhrbObOiEzA2Hiyi9aBGctBy2ScWaNN
	jlFfCmm9iCr9vgSok46h5QThXKUt/wWVTQ/vsrfghGf5X24+pxb8mJOlmpMmpC9Nt7RFlgQSXtb
	9xBBS
X-Gm-Gg: ASbGncsrOq3sQU0FYsN4bPgjhtmf22K01WcGdBGJWwnQ4B8YgXFq6nJQm/ioEHe4/0L
	gIfYeE38TVPlnYMqCk2ex6adginZO2K9ES/aO/OWTQ/3jAAwdJCXID5JZWuXlFIdZyS5YhZQ48M
	+Csj8t3xKNIWGSM/CHbBcyY03iN0CtdeohhQw6BVTuydum3QkLZ1HE5QDmdpvP3NT7HKCzFYmdW
	vL7wQSoPznutY1R+qSUb4pYbhSq4aU/pxi73bATreIk5N4TFKWJgyIyg0Xq68OS5ytSPatRCCzG
	xKmJ2GJ57pPShAwQqCdCqm0SuFloSsdiA9NL3HIEUHUFfZSvUXAeMPbdkmeijBiwyikAP2W5j4z
	9ZVJZ2v4CVa3PC1T+e06oE/ZFWa7Yatx6LvWcxpUI0fpPxSMKBK2N0HdjiLO6eXGL9WePKH1p+7
	739F25cTj0lGrp6zJvlctEjygEIKZrZUonFv+zxKDhOZFwmKgHl7s3kyH9XPTnCneaeBSXyglbc
	O8=
X-Google-Smtp-Source: AGHT+IFgETqaC11zCIghKXmz8a2Du8BZsnSjgwTiIV4/AwfFC0cLtuFvwMtSg09tu/Is1VZI3/5I7Q==
X-Received: by 2002:a17:907:9494:b0:b73:780d:2bcf with SMTP id a640c23a62f3a-b7a2432fd1amr1148519166b.16.1765281602948;
        Tue, 09 Dec 2025 04:00:02 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f4498947sm1338972766b.15.2025.12.09.04.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:00:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: Cope for unbound devices in fsl_mc_shutdown
Date: Tue,  9 Dec 2025 12:59:47 +0100
Message-ID: <20251209115950.3382308-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=D+TP//wjPltlG0/Y49/xfy2Rewaag9dC3HNcA+UOyQo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOA823BEGyNQrUN6u3myCd6N6bdWfKs1ZFblBd 9v+hzs9veqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgPNgAKCRCPgPtYfRL+ TkrACAClnqHkRti/GhhFX2g8Cvpp+VW727Q9wsexzhfcUxB92YXNil6Dm+HZ4l0OZfJL+kfS7Iq PZ4IczMKbeAfFFqJeUXTgKkWg60xVNYC/df+BvO54HN0CdCVqJ+daJTHsyKPdFqaX1X2Ej97bl2 6CSFgmk3HI7qRjSs0a4VsNqjb/i3hUn/g7aMe8FNDic/GATldzG4tHVp+1tvaCkyzrznEsxKcbX WB1e0lyK1o9u3aMyVpmLiWexLXMhiZ7U8BsIsM26IUptUEK0i4idQDjOW4PiZBSlk6m6sjIZhTz DYPjBQZ8qnSUwIoDjkZw3iGsb9muWbGbQhAKuSdF74Y3FtXb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Other than a driver's shutdown callback the bus shutdown callback is
also called for unbound drivers. So check for the device being bound
before following the pointer to its driver.

Fixes: ef980bda574d ("bus: fsl-mc: Convert to bus callbacks")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I pointed out this issue a few days ago in the thread that resulted in
commit ef980bda574d, but didn't receive a reaction so far. Given that
ef980bda574d is contained in next, I guess it's time for a proper patch
to fix the issue. Here it is.

Best regards
Uwe

 drivers/bus/fsl-mc/fsl-mc-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 6bc163d2ca49..c08c04047ae2 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -162,7 +162,7 @@ static void fsl_mc_shutdown(struct device *dev)
 	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
 
-	if (mc_drv->shutdown)
+	if (dev->driver && mc_drv->shutdown)
 		mc_drv->shutdown(mc_dev);
 }
 

base-commit: ef980bda574d3a2ebaa297def62f03d2222e6ef3
-- 
2.47.3


