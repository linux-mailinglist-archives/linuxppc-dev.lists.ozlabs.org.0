Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F146F216A50
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:32:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Jdy1DNlzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 20:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yjtJryfp; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1JJX36HJzDqCc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 20:17:00 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id o11so44580753wrv.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=yjtJryfpQL6B6O+GfgFViYidP0Zfm2TNnBAeSexpzgadJ0xpgfrAVW4b+dn87kGz6C
 EZ20LZ2Ach4spz+6mWWhfonGFfs2/rcy9nw1nAUr6v3gjXQ3E0cGVWpLruB6V7BWcVKA
 NCL298eJZDj7ZhP4xvIuCDI1BvtD35Mo5E9bGkX6iUv4iYAAQPpZP38IaOr9k6wvCT0n
 Jauv59h1FuWhqhRbx4pA4BUC4us6dOrcZW5shkE7d6GTM45WW2uOaKGiuBEwVYlhIvDm
 Ht9quBZq0GIUYGteKk4rPBi59T6GO0mAXIXQ0Kg0IC8E0hgNv6gc97KOTf9D6n8+RNH2
 QigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=TOO9XVfXnOaos/WHVCyjcFR2xwqv+VURmS4JtXI1hOJIOy1cWsBG8tlJ3d5ABHfNxc
 NQyH6KtblqSIheOOd6nDP93MAsuDt5mFRbNtU9BtAit+kCaEYbsDdcpPC7mjN2Lt63Qp
 NewwI+4Y91R00mQGZ4dgN0ounuq/tb3sAKigf+UfFRsPlffvdKRuWyeTaqlbz+UUCOtv
 b68W7WzL0VEkMs0dXpEp/tF1KtZkyiY77g91WKKEWt1Uhs0RN5gQo6k4IoA1rlLAUlJn
 /u/S22RViPK0t2JEy3IVuoeGi3iby022SpNXfsvtgprJ6rXCiJ4B8Wl2U9ZeCgfDUnFc
 ezaA==
X-Gm-Message-State: AOAM532e8S2jIvkvdK2Jnk5TDH6Ye2ZAZJAxTtRV45pj68lfC4mrItSz
 w296sospmKnqWrMK2qPUV68AUg==
X-Google-Smtp-Source: ABdhPJwPGZGh7haWMlGt/1TcC8QGkDnJP2knf1a1NGX34zsnQYiFoWMcsNgAkfwT9eECzK95dCDJuA==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr50993417wrs.320.1594117017437; 
 Tue, 07 Jul 2020 03:16:57 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 07/28] ASoC: fsl: fsl_spdif: Use correct formatting when
 denoting struct documentation
Date: Tue,  7 Jul 2020 11:16:21 +0100
Message-Id: <20200707101642.1747944-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
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
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kerneldoc expects struct documentation to start with "struct $NAME".

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_spdif.c:104: warning: cannot understand function prototype: 'struct fsl_spdif_priv '

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 5b2689ae63d4d..7aa3bdec5b6b5 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -81,7 +81,7 @@ struct spdif_mixer_control {
 };
 
 /**
- * fsl_spdif_priv: Freescale SPDIF private data
+ * struct fsl_spdif_priv - Freescale SPDIF private data
  *
  * @fsl_spdif_control: SPDIF control data
  * @cpu_dai_drv: cpu dai driver
-- 
2.25.1

