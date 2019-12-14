Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74311F359
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 19:03:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZwPq36xNzDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 05:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="etYuhZFI"; 
 dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwD75CtWzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:55:03 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id s35so1123589pjb.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+BU/Ff9gTll4l1H4cHIf9pN8etRhbZ4P9b/IJDTytGQ=;
 b=etYuhZFIpCXV1kkHjldlFQSwc0TrxbWNSKhQinSIxVhNYBw8CEktZpcQFrLkDDF5K5
 +Hsam8gZ8taAgwKYcXtKae2DICNa/JmCyH3kvS7XB0zTRIY0TJHSeG68zdGm045/AUbR
 1Z1XSJoe2L4CqIeUX/+NIBoVqUBpAjYl91Yp/GeG2BvYdHn3A+WyBoXkLvsfKCYYcnbm
 JaTVP6TRg7evuPWJApVMdGiJG7Rfl3BAD4FOd0aTybSzCnxYWajApbMeCYieL/hV6qvf
 k6jIqlBdfGrtylYtS7K0+d2ygq+dZJ9r7ke8j7C2GWhYAbp2yLZxuLkpvIQusP4V85Qp
 ZO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+BU/Ff9gTll4l1H4cHIf9pN8etRhbZ4P9b/IJDTytGQ=;
 b=aRzYb69446taNSI9WGBYvbi0NT1Bu0kKgXksTNPe5hGreD1DcWgUWwl5UjCs15+nZn
 wOUp1onYiHRXMY2mkFxRZZSI84ij9w/6cgndXH0qgWN5WNg5Iy5sSTtiYaa4l/ohbwck
 bPz1Vz7bV6wNe6kn0kgZOgFQX5k51UupdSQTWWYGZ5sj10zMCsgeyfHRHQPvj9tGHnZR
 D397hLIq7F8FO1AnpwrnV0zcTXK0BK5ztgxSAoOd/WQqTCU6JVwpoRg9WcpZxlH2mlnx
 31g1AFaiC9YcyXo1SrFrtjVuPNndZ/h1smU7wJD2brTiP0Xd1ze/WfAUChjaG4OxVMT3
 kVQQ==
X-Gm-Message-State: APjAAAVPUzeuOewec9NonR5RG8K2C09WY7ixZLiiXl/D0ccwyv6Bp/iu
 mXurP0yjoen3fuy0rA4UAQE=
X-Google-Smtp-Source: APXvYqzDtz2PbMdoWI7FnmJ/zsXx+7KES2ydK86NxuECS3KFBEaYhRKYIxzKO0i61f2CWAU0CDUJ4g==
X-Received: by 2002:a17:902:9048:: with SMTP id
 w8mr6142048plz.294.1576346101451; 
 Sat, 14 Dec 2019 09:55:01 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id d22sm16263997pfo.187.2019.12.14.09.55.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:01 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 04/10] soc: zte: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:41 +0000
Message-Id: <20191214175447.25482-4-tiny.windzz@gmail.com>
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
 drivers/soc/zte/zx2967_pm_domains.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/zte/zx2967_pm_domains.c b/drivers/soc/zte/zx2967_pm_domains.c
index a4503e31b616..9f2a274d2759 100644
--- a/drivers/soc/zte/zx2967_pm_domains.c
+++ b/drivers/soc/zte/zx2967_pm_domains.c
@@ -113,7 +113,6 @@ int zx2967_pd_probe(struct platform_device *pdev,
 		    int domain_num)
 {
 	struct genpd_onecell_data *genpd_data;
-	struct resource *res;
 	int i;
 
 	genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL);
@@ -123,8 +122,7 @@ int zx2967_pd_probe(struct platform_device *pdev,
 	genpd_data->domains = zx_pm_domains;
 	genpd_data->num_domains = domain_num;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pcubase = devm_ioremap_resource(&pdev->dev, res);
+	pcubase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pcubase))
 		return PTR_ERR(pcubase);
 
-- 
2.17.1

