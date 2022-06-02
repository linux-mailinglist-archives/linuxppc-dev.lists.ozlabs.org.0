Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766B53B433
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 09:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDHNL70cFz3c7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 17:15:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kjIm42IQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kjIm42IQ;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDHMk69Cwz301N
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 17:14:57 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so8568036pju.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jun 2022 00:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T86Xkl4zAQRDqlX+Sbg7KzV+2Znm3kmGhJEJ2gH5oPs=;
        b=kjIm42IQKm9p8crvtuLlXRMrgIPGHqf/cbX5Jp1nkyGBMxpECnqZ5tNw4G30RPSxSl
         ihT2VakbiG/ZXL6SWwJp0zuQ7kQ8ePWf8/YKs4gc0Fj5aAxPTjQzdgDFlI52vn/qTfxY
         cjAU9JiqpoH+7H2BLO9XA48OAW57jwI7UKzmewXbkmcjWWnVmYin3Mh8utHbnOGfqaBo
         cD1jkJAmTugEOEEctTHVa+GoP0iAFf3DXCI9k5QRDWt42VAAe/Gcz7HYnjFTIvdHH2NQ
         D8R/hTPIsSDjcxWOgyKWl6jTZpX27yZUh6IbNcbzODpP3uB4O/YQ/UO2LD9O63doGyfL
         vvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T86Xkl4zAQRDqlX+Sbg7KzV+2Znm3kmGhJEJ2gH5oPs=;
        b=AWHJvGKzKi7pM3aiX7wjAZvOXHhnrsZ51wXs/ct/m1YBIlOOrOEvHrtllGkuf1YKcY
         BiFXQCFfqxQdgTQsv7/tU+sli41Sln0Eb2Lh1aAthgqXQTD5UR8uxTMwQJSU/rbCrhLi
         59/Udty42+rZG+tc41DaoiEHCC+uNbghgb8E2IVZHzjRLKI3rv1npoa5Xgcz+2rI3VrI
         gLiPAzW5TjXKYbAuf1PVx71kr90tgPe4jt6w7Z5V0LAdVBuPkpYpaNi6/g6rZidJY2cZ
         VvHUxvtv3YY+FS703K8qM+DZGSDB6p1rkfiQ6mBNT1bRSyHAVAzz4pHlGlBTVaH0FExr
         KaiQ==
X-Gm-Message-State: AOAM532MVb5zDAd3kIryEcOCWGMoWszHBZYTkKk08Zk34ZDm86TJ5gCl
	tPvb+aiLpO4mhSfh7RrpdhI=
X-Google-Smtp-Source: ABdhPJwZZAKpu/HC9yA8XNgWRXb+XzH/3iyXB2zHZjMV/93ih8NOdK4sZduf3oXx1JZX6HglGbpQ6A==
X-Received: by 2002:a17:902:f60c:b0:156:82c9:e44b with SMTP id n12-20020a170902f60c00b0015682c9e44bmr3519920plg.106.1654154093526;
        Thu, 02 Jun 2022 00:14:53 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709027ed700b00163cb0a8392sm2674737plb.168.2022.06.02.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:14:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare
Date: Thu,  2 Jun 2022 07:14:48 +0000
Message-Id: <20220602071448.277968-1-chi.minghao@zte.com.cn>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>, lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Because clk_disable_unprepare already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/fsl/imx-audmux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index dfa05d40b276..f434fa7decc1 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -71,8 +71,7 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 	ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -218,8 +217,7 @@ int imx_audmux_v2_configure_port(unsigned int port, unsigned int ptcr,
 	writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	return 0;
 }
-- 
2.25.1


