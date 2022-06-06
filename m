Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D253E029
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 05:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGfMN1Z6Hz3brQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 13:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZc4jxqz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZc4jxqz;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGfLh435Dz30Bl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 13:37:15 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so16812984pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jun 2022 20:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NLfIMDkhs8AhvETPVq+iAr24dyts/oFKMffXp6KK4SA=;
        b=dZc4jxqzQaYU6bNMX/oVrNpUuokhFNbSbjUF4Y4tn2uSgQi1wHF3KHqBN33PkyCgaC
         o7U9LIU2UUUYS1Pwu0A3M3cuGouUxUjzLuVyKc2wAC54r9ZJ8Qgx8S58EbPPGJTvhzj2
         nM+BTiEUYm/8FsYSHj5CvG3sdN4NGKGAJeNOc9EHx1kAgnAMadQUI/OAyMHosvsUiC4p
         kClEL8slmh2XMxZ29Y2e2BTs8KFlRoBq+prV65AP55IP0m7I35s3Bm5wtM/92RllXP24
         kp7BPPoNdsdSCvD05MwhaiAEesC289nQTsRnpEfyn7OLr+2a6MPp+7gehUyVtKnVbNn0
         mf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NLfIMDkhs8AhvETPVq+iAr24dyts/oFKMffXp6KK4SA=;
        b=juXdAaawR1Lp1nm6UDdn/BsKKw8hjN0bv0X0FYEOJp3b2BiqhI4vV+lvZhg77rfTsI
         y+bGesUNED4Zhcz88sKuUlGxfn2ExFtk4QJtMmO16DfqXdSsOLAcX/XyebIaCEv/b0CC
         X1xiGO7k9bf0qApYRwrceKm7DqwIUtIZSxFwjrD5LzQtg2B04rfYBW1R9EpMFlFRMi0h
         thT3Yl7eoPndhwbVeaHKE7vu5IULM8MR/NnLu9NJMDmood2EWuNZnmMtZ7lo6eoMx+j2
         eqqJUL5PVHmpl33tX20wFsxfTcMFfd2kUzZ81Hs2Uh/7o17X/SCEqaLC5Itvp6jfbFkj
         2LpQ==
X-Gm-Message-State: AOAM533+EjuEbKNW2PEdVm+U8LT/IujbItlQyC3Dg8J+IsY7Y/WH2vvE
	orCf6z9hwqmg77wx89obwjY=
X-Google-Smtp-Source: ABdhPJzHskn/0nDuJUNh+kkv/i2TwqL9zwM4+pDSLRb9NT1RjQFYEHsVEWABjF0pgTAaI31VavBwGw==
X-Received: by 2002:a17:90b:4b4b:b0:1dc:8724:3f75 with SMTP id mi11-20020a17090b4b4b00b001dc87243f75mr58394066pjb.178.1654486630864;
        Sun, 05 Jun 2022 20:37:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b0015ee985999dsm9443596plx.97.2022.06.05.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 20:37:10 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH V2] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare/clk_prepare_enable
Date: Mon,  6 Jun 2022 03:37:05 +0000
Message-Id: <20220606033705.291048-1-chi.minghao@zte.com.cn>
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

Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
v1->v2:
	remove the check of audmux_clk before "clk_prepare_enable"
 sound/soc/fsl/imx-audmux.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index dfa05d40b276..3ba82adace42 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -62,17 +62,14 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 	uintptr_t port = (uintptr_t)file->private_data;
 	u32 pdcr, ptcr;
 
-	if (audmux_clk) {
-		ret = clk_prepare_enable(audmux_clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(audmux_clk);
+	if (ret)
+		return ret;
 
 	ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -209,17 +206,14 @@ int imx_audmux_v2_configure_port(unsigned int port, unsigned int ptcr,
 	if (!audmux_base)
 		return -ENOSYS;
 
-	if (audmux_clk) {
-		ret = clk_prepare_enable(audmux_clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(audmux_clk);
+	if (ret)
+		return ret;
 
 	writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	return 0;
 }
-- 
2.25.1


