Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95849B56B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:55:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjpJj0ZVVz3bbR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 00:55:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=8JPKo2Wj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=clabbe@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=8JPKo2Wj; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjpJ20BSjz30L4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 00:54:38 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id e8so18271672wrc.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 05:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D4gfH4WoXONGxg/5IXwV1T9yFOu1r9ABY1KT+VoPdqY=;
 b=8JPKo2WjlraxmnR2DwEn4bWVh/fzxiqndxcVsEA7aguJiSy7qPVYGp5G629rqhJ+ya
 NpMVAJ2WoU7NDTUaCwdYK91UOXymf3RIPLwhBZJNhtG3IZNaxuUqZRwD9rRNMrb2/Dli
 RbGsBEf9gTWBlarMsAB7DlS8x2qcR4t1RGTIq78wGbBidt37ibQTnO02tQEf1xOO1eE3
 07PEV2T6VygC5zEmSmXjIsXal0FdPn5EoGVWuMQZJevN3FHedTH/mPZZ7CNInz2syswP
 jMliqh2D/6VwxWU/rjMmntOttFvcJxNEHvxvUA5KGN5Rg95d9Kdogat1/SBgZo+4oQis
 CqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D4gfH4WoXONGxg/5IXwV1T9yFOu1r9ABY1KT+VoPdqY=;
 b=HawcvoeVc6L5evOu6qh9sFa6yVJMuUtwtOzviw+JvYjAZtZU9LVAlR3vTnFDQaAqGJ
 +Yz3E1vTlA5b67MCZRIKQH4MWqRvHWZBiBrR2nFsgo2Ai9lv6ElXHK8m8fSFi+Zs5GfU
 xyOPXhjsWS+w7uSaEeTietl2Dfj/pUJiXATHSv+TcoM2vN+jssqMEb0hyUi4dezuA2mi
 rfS3zDDkBSccjuqtdRfomMLKiXOLmpmKL/CimvCdu5rSdX5WZqXW0KCnQOcGro1RNWI+
 34vLIguFfKlfFwIgh7aF2ht3xHEgF3RLzq4ooZ69DRXMODsn8erAlyKVioVu576XB6RB
 UZag==
X-Gm-Message-State: AOAM530pxs0ksattQZo8GVnxmXAA5dKdGBgzdazFvyofumRpuf2ahz54
 0+xqePDdlptIebm8fioTwbmbhw==
X-Google-Smtp-Source: ABdhPJx24SVgxveHSirOnsJuXcFCCz5p1muhRgFKnbcDI2KTmeitiwitdqyujOGmnsnrisBrPSpHYg==
X-Received: by 2002:adf:d849:: with SMTP id k9mr6133481wrl.380.1643118872965; 
 Tue, 25 Jan 2022 05:54:32 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 8sm468917wmg.0.2022.01.25.05.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:54:32 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: benh@kernel.crashing.org
Subject: [PATCH] macintosh: macio_asic: remove useless cast for driver.name
Date: Tue, 25 Jan 2022 13:54:21 +0000
Message-Id: <20220125135421.4081740-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pci_driver name is const char pointer, so the cast it not necessary.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/macintosh/macio_asic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index c1fdf2896021..1943a007e2d5 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -756,7 +756,7 @@ MODULE_DEVICE_TABLE (pci, pci_ids);
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver macio_pci_driver = {
-	.name		= (char *) "macio",
+	.name		= "macio",
 	.id_table	= pci_ids,
 
 	.probe		= macio_pci_probe,
-- 
2.34.1

