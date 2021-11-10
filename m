Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613544B996
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpm2f16Gbz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:30:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HoUfE9FM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HoUfE9FM; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpm1w3qWgz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:29:22 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id r28so657973pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEzErmitUUc1WCRwF90GY08l0xszb/xghqlykO8h5XQ=;
 b=HoUfE9FMPs9FbWg+kuLPHy/L4ScIui5grCU8JXDkrj4jNnMmSBVDJH9ybI+5cI5KyM
 kiyqA9oGfmaiIp0bg7woJAxlerKajDVP0Qk/XBfycWTsDVEnm1Ig5L4uf/WmUu841bRT
 aNkR/veAg2w3ULbimJTbQGJEpcF5Bo9bGvdaS3Hf7dsxkwwBaE7ip0vnfwZv8XFHmCcc
 e57WL3zXoxDqavdn1mSjovQXAXN0QC3Tk6KmEJPh+BtWVmMDtqURDnpB9os97UMcTwr0
 BAlnEEVb28PTC+hW82HQT5m9w4tC7U+/pinOH0TFk24abX3MYyx4ZcJMfaNlYxmeY9Q0
 km0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEzErmitUUc1WCRwF90GY08l0xszb/xghqlykO8h5XQ=;
 b=Q6H6Pv1xCdvmqG5JRLGlbXN9qJrQM2Dv0lOfl4cvKttAcjmIYtC+3XZ5JEw0Llxkjw
 IyScWRTUYVgehC7kNKkMC3KPy39YEJYehdQG33SupvS2sSpk6KQh5D8T+DVRYdt3ENxG
 f0pvQbzGpR/B8TkSbCsbmpwdyAuP7jMWL6ltMMaLrgqj1UQZ6OrW5sXc2ZJD/XtZr7uX
 q0ykTbfFZVcMz7xLbzkKYDvzkxpqGcPn8lxVwLZNjkpzvaU44oxEmYZDHaFASxCXpQAQ
 2ljQhCFeMEUWV3CVZ41hdOxMkQW2Wc8UCCWgjxIc2RUjZL/V7fviHhuDWcOmZh0nstvn
 /iqw==
X-Gm-Message-State: AOAM533I/RFEF4ju1j+mAjvb+7uqf1tw8yRpn/HkpCs8hW+CwGuZQ+eM
 0tp/Y2CPAN5dk03pzdE+VJc=
X-Google-Smtp-Source: ABdhPJye/VUSnlCLCAknWO+RWaynEg+Kow/VhPktmT23o2DuN4Tmpy6jXdqg82E0C967zkissHr4bg==
X-Received: by 2002:a05:6a00:1a50:b0:49f:fc2a:fa9f with SMTP id
 h16-20020a056a001a5000b0049ffc2afa9fmr8630020pfv.43.1636504159274; 
 Tue, 09 Nov 2021 16:29:19 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id f185sm9515716pfg.39.2021.11.09.16.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:29:18 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: nicoleotsuka@gmail.com
Subject: [PATCH] ASoC: imx-hdmi: add put_device() after
 of_find_device_by_node()
Date: Wed, 10 Nov 2021 00:29:10 +0000
Message-Id: <20211110002910.134915-1-ye.guojin@zte.com.cn>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 Ye Guojin <ye.guojin@zte.com.cn>, shawnguo@kernel.org, shengjiu.wang@gmail.com,
 Zeal Robot <zealci@zte.com.cn>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./sound/soc/fsl/imx-hdmi.c,209,1-7,ERROR  missing put_device; call
of_find_device_by_node on line 119, but without a corresponding object
release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 sound/soc/fsl/imx-hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index f10359a28800..929f69b758af 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -145,6 +145,8 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	data->dai.capture_only = false;
 	data->dai.init = imx_hdmi_init;
 
+	put_device(&cpu_pdev->dev);
+
 	if (of_node_name_eq(cpu_np, "sai")) {
 		data->cpu_priv.sysclk_id[1] = FSL_SAI_CLK_MAST1;
 		data->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
-- 
2.25.1

