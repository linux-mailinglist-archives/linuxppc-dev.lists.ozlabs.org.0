Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF37F0578
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 11:45:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SY6kB6tSTz3dKX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 21:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.47; helo=mail-wr1-f47.google.com; envelope-from=tanurelinux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SY6jj3dNvz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 21:45:27 +1100 (AEDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-332c09c0b0bso453646f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 02:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700390724; x=1700995524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy7JYUOTRdSJldSNKwdRHiPwhZnAINoOplh1pqVKi5s=;
        b=E+6L0Ml5MKn75lZW4Nvw+QvzNiaWwbpQXKpG1UCekOC5CN1uaBS4EY59Z+wFl//a8W
         LlpIJgWfGYrW61dnxsqgR83WLbYXKCD408a+Jcyptl7Kj++4YIUcUgFdor7Wr7iZbjil
         7p1m6tjcC6iSLeDrNr+HGbfN/1GxPzjCl4FBSWTYvDr+VWqaORzhV0XMC4CS2CNN0RPE
         ZMBKFcfLdRzwDHaL4wWXq6jaV7Uy0rESNjSWlkSMVEoOD2ie1t77oW80QDElQppXYAir
         8ZVGUjTtXX2pjhF7yrAWgVc8n4isqUlC4JrgS+m5TXixc/SqbMxDKwB5Y+XwxvEZVmTw
         U6gg==
X-Gm-Message-State: AOJu0Yxf/LLNtPMTAPWoZlVBhlhN6OJPMEx9Y0GemttBp612s/pOydfx
	wApfPpwp1KPUQYC/EiPJAq0=
X-Google-Smtp-Source: AGHT+IEC7OHQQ63+OIiNP/Y2msXT2JNv/AQECBNiGuXXWvbCMXs8Ertliu/zFXa6ljnqxG8GsPh0NQ==
X-Received: by 2002:adf:d1c6:0:b0:332:c6be:f327 with SMTP id b6-20020adfd1c6000000b00332c6bef327mr127636wrd.61.1700390723581;
        Sun, 19 Nov 2023 02:45:23 -0800 (PST)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id az30-20020adfe19e000000b00332c36b6563sm1502211wrb.101.2023.11.19.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:45:22 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_mqs: Remove duplicate linux/of.h header
Date: Sun, 19 Nov 2023 10:45:14 +0000
Message-ID: <20231119104514.25536-1-tanure@linux.com>
X-Mailer: git-send-email 2.42.1
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
Cc: Lucas Tanure <tanure@linux.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove linux/of.h as is included more than once.
Reported by make includecheck.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 sound/soc/fsl/fsl_mqs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index f2d74ec05cdf..86704ba5f6f0 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -10,7 +10,6 @@
 #include <linux/moduleparam.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
-#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/pm.h>
-- 
2.42.1

