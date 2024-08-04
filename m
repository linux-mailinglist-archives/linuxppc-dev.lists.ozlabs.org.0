Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D4C946E62
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 13:21:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mXpJniDY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcHFr0V32z3c4h
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 21:21:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mXpJniDY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcHF650xsz30Vh
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Aug 2024 21:20:55 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52efd855adbso13185546e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2024 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722770448; x=1723375248; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=naFt/2TPrEyespmkdK+r5W6mEbQja09GmX+F0G7slfE=;
        b=mXpJniDYJwPuycUw0mfiy9a3bn6RZWRUHSFCiLCqFOy20Vh6I2WVpqZzDNY7U68VUH
         ZrGFooNR84P+WEiK1YVn9cth7Zrr3ZNldi0TWZm7e6R5CBnygGE43Fl4QlUvMy3JGzpB
         RN9UaPtwmw/RKn9ypwcx3NMwge2PF8rnG501gMpTsMMMRady2lFIC7gxmtRAA/IJlvAm
         r9V5Ut/xF0s3kzfgkpRQCfUVHrmYWqGeVdIZfaOjtU8c7VEYJBpVkJMNQuLEiOpwC3CJ
         LErbJXcz8H80mXr3Y2y2UUf7+OKvjcip0PVh6KBhUAkXYwGJzrr4AxdfBNGENhx5NQH/
         s1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722770448; x=1723375248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naFt/2TPrEyespmkdK+r5W6mEbQja09GmX+F0G7slfE=;
        b=ZUtwruXgh8bwPT0E51VCu0qouT0a7db9U0IPz6N+mrazfVRn6z08lGxB089bbEVrS9
         hmCIgtvrk0CHLT8ITY0WKskzQBDNvKJLjHW0EyKlNjipzw6pJ6MMN+q65My6MxwGGj3y
         5VfUeSfC6IgkWWscNOp2WZ3aTuwPIdgOUrAmPcwTuog4wNr32pU+4QufDehW+8b/XhM+
         8xWDuMLg4P4F0r6JOl5EYjy0m3nz0Sjx5SkLeyFmaEUt1I8Gv0Vi+9rv9mb2RPu64QqM
         gs45bHExDk1o7pLk9FcycqVsOd87bxa3SM/7qJGHnWt6+biqxh7qYp2bR+jqiGlzTkOi
         m/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbY0P4sllP3p4E1k3c9lf079S0YzHx0mOAF63m0J5HtrDIhqYO5k4s/Ljr+tdewUJb+qtqaK6tHphoWsNOXDfPV0LC3YguonRz49P2Pg==
X-Gm-Message-State: AOJu0Yz3X3ByYg3uwplo2Y7b66okKY0pMnhDrOIHZJo4FQP9cqGngEYN
	NoOBNcYp/ZRMEg+JuaYeKX4+6/cOIO2DU/QExyQGWiQbcjzI2iJ024H6yFjxvkU=
X-Google-Smtp-Source: AGHT+IEHe/6seqXfqn42WjLsKMvex/gmkgM/thAq3H7Adr078nULgpEFm5oaDNI8wXsWquQ9nKsg4Q==
X-Received: by 2002:a05:6512:2208:b0:52e:8475:7c2a with SMTP id 2adb3069b0e04-530bb36f8e8mr5290950e87.15.1722770447925;
        Sun, 04 Aug 2024 04:20:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e849a0sm319025566b.186.2024.08.04.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 04:20:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/476: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Sun,  4 Aug 2024 13:20:31 +0200
Message-ID: <20240804112032.3628645-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=HFIQE70Wsli1FhtMIKGsruMMilKtz27VZKS1nHQOi1k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmr2QA70BnoUcgjSR4pSyiyiKTK8LGX8/ACljrX WlEcsd8mxSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZq9kAAAKCRCPgPtYfRL+ TgnJCACP5UjthvLxSwCPBVuIuwfAcD4D0w6AL0QOqQj4aUWy+Jml8CPemsceoXCDiGWcGX9pJyA yV4FIcKyj9cVa+/55NvG3us9WbwXGnVkE6ca/YH4/Za8N7aD2kQ7Y7tzs4/ye94sbkIqGLTGRbs oCGgWsAhF7372FALA0BeH0IhGTMcMtXh58lsQzA09j06W2FrE9vvz+p9sUiy4Luv03f7EMi3g5M 7u8gsnPjLIQtby2AQQjTlWE1qodMAdkXvtrDhUXIRbZGgc1r2WURI+xR5/25+JJ/URm4gV2qeSg 9zWVHUpvbdy7YfkqKxiAZUPbp8Fbz2FfYaIfL9Jr4Jprt8Sk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver doesn't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/powerpc/platforms/44x/ppc476.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index 164cbcd4588e..e7b7bdaad341 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -95,7 +95,7 @@ static int avr_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id avr_id[] = {
-	{ "akebono-avr", 0 },
+	{ "akebono-avr" },
 	{ }
 };
 

base-commit: f524a5e4dfb75b277c9a5ad819ca5f035f490f14
-- 
2.45.2

