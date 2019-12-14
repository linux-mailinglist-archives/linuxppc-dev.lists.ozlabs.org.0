Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8162811F32A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 18:57:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZwGs6vpDzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 04:57:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IdnEahgW"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwD23Y4vzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:54:58 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 6so1198643pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ndfZOSOPMFzdlsJ4y++gytIs8MeUXglHTS0DvEbmTno=;
 b=IdnEahgWAR9M4ay1p7g7jXGNeleJSN/P4VE30OGOw9nwFkNumcqzoq8i3h9o4rIrUu
 Nurp0p2IiltqBDNFiqIVSHRXRwmvF75PwfIGvhnVdzMvWhV6G8AINxl2D9oEa1D6/pQe
 ytdcI6Wex7iWcRLeDfkXp+Vciij7n77J4rN6sIy1fw+8gTuR7m894EJ5/IyqVEaLOEJ9
 xtPABBFefL/DQZ3qA5wCEinKv2ZWtgxyx4/lRYaZDd5wYVFpm4aDjFQ0AHugNROjJzvb
 WPdwxO4zXX8wVPTvkieEKPZzux9cfO7YuHwXLHEni208k1iAUI8slHYwMcnswHyhf4nG
 ws3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ndfZOSOPMFzdlsJ4y++gytIs8MeUXglHTS0DvEbmTno=;
 b=R5ZDACA1j0reHTKxQ0Q49FmV2vrFY4hVwVVX22PSE1E5DBwV/tXMk7wRqVEuyWYOvy
 vC/e6NdlbSMX34WdpX7vPD0/lMwet7QqQLNqkcX/ir6H3ktziuVd1Ky/qof2ZWB1RWbm
 zp9NknGIXgiv3KMUORvTe4CmWCLtgmCXbJ1cfHcwxqyDW2rR9priDYU3ySlTWJMK4BlT
 CbeQX/3oxe5yX9vpSsMW+nizw2omYbGEbWabgH4ivYDLPBlmc1TIWnuNpvQQTNR/ySdX
 dYBpCM3atREoqqqQYiAn4nVmPri/kbqpvprxCaRhrEUN4jlygdGXLL2KrR9/SWovdTf/
 3qVA==
X-Gm-Message-State: APjAAAWnOSIu9KYW+aWLsUe6z3zNExfYIb7l6GXT4VkVdK6rj1ySWwmu
 8Z1QwWa5PHiaSKamnFnEh3A=
X-Google-Smtp-Source: APXvYqyntHYYzT5XK8Is3T2y43EjL546dQMIWdhxgNlwlneNp8k3SwJP9re1oPWgimXPNxBXbgGHIQ==
X-Received: by 2002:aa7:8d03:: with SMTP id j3mr6687115pfe.162.1576346096173; 
 Sat, 14 Dec 2019 09:54:56 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k9sm13731248pje.26.2019.12.14.09.54.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:54:55 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 02/10] soc: samsung: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:39 +0000
Message-Id: <20191214175447.25482-2-tiny.windzz@gmail.com>
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
 drivers/soc/samsung/exynos-pmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d34ca201b8b7..7da2701c871a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -110,10 +110,8 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmu_base_addr = devm_ioremap_resource(dev, res);
+	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
 		return PTR_ERR(pmu_base_addr);
 
-- 
2.17.1

