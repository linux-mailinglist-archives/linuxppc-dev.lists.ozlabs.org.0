Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACE11F380
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 19:22:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Zwr05lhwzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 05:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CbiDXSDa"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwDS5BwGzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:55:20 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id c23so2624886plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G5UK5DwBUduQN5XnwW7khvuWSh3A6ZcbhwTioDRukl8=;
 b=CbiDXSDajwRpx8W14h4Me/LqDY31+yHYAfRzx0gJjjZCKzYKeU/z+dRgbh8G0FB8Kz
 n23u0oKZqKSzIYv+ZL33ayO6Nm2GUXWzXYlOWey+vH7BxOSNg1x5YuD+KX3DbDKrOn6L
 s5pmk0dhSJQD63OQQyVOnnG5MA+j9dwufNQjp4qEDTK3V5YkQwYrGSY+U3Pc6GbbZRxC
 CajxwBSj4cWprH+2jMO3kzlI61ws7Qkomli0Aczwwl3k6qQ00RIGGRQNNK5T1/gCZVZt
 gSTJw7QQeLaRrJDTor/KB3Wx5TNqwOMf490slViV18ZldipGn352lX01mW6xS17FsVQG
 TjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G5UK5DwBUduQN5XnwW7khvuWSh3A6ZcbhwTioDRukl8=;
 b=PJITYZWIQ3Bx5G1Bsn88z5TjGTDMhF8vR2r8NQRqAPQVpsCM0x+GxTfvn5RZ5uTNcy
 EuuKrUlu1vKaQGWUFHVBsFhv0HpNtLmU6qzuPL1Khp5lj0wO/thvNowD72I03kQwK+YT
 opJ3WJlbx/i4nqGzGqCFV+W3+mvyjB1gG3/OIEZFFWZJlRyygtcEEPRTb6h6UfaeMmfV
 SeHb8PqpyBtQshN9UoBY2NtxbsIQEqZca7SNR70eOOS1IUHIEgp7l5x1jWA3OTbeOXGb
 QxELqpGUByb+355O3fxWaCbsxGz9Z2cwNaAw1jCv4cUM/5Vbt8Y1s7UJCkBYavN+Bh/w
 VsxA==
X-Gm-Message-State: APjAAAV2k4TtZGMhuBQpnEWFz+ANX0vQZVTZGHhhM9PGb0VoLedOLPIV
 jHKPYhhZGnEodynIVBkWG1c=
X-Google-Smtp-Source: APXvYqxLeBRtno5UO/xbNsZnN4kmZhB035ExJnlkIwjScfYHKudBua3+fBmjaQTpdULAB/liHFw71A==
X-Received: by 2002:a17:90a:33e8:: with SMTP id
 n95mr7043968pjb.17.1576346118077; 
 Sat, 14 Dec 2019 09:55:18 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id g18sm16392573pfi.80.2019.12.14.09.55.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:17 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 09/10] soc: ixp4xx: qmgr: convert to
 devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:46 +0000
Message-Id: <20191214175447.25482-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 8c968382cea7..520babbd9037 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -375,13 +375,9 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 	int i, err;
 	irq_handler_t handler1, handler2;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq1, irq2;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	qmgr_regs = devm_ioremap_resource(dev, res);
+	qmgr_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qmgr_regs))
 		return PTR_ERR(qmgr_regs);
 
-- 
2.17.1

