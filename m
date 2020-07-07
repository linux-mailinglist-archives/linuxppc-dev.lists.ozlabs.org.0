Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C0216F83
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:58:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1QYZ6BTkzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:58:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lhNJKuTp; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5h05p2zDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:37:59 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id s10so45357005wrw.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=lhNJKuTp0CYdX9JvN+4GWjIHCd6ykjyYPgZscDP4ZJr3VhIQgn6l+v31ttYzo82MNJ
 9/FrRsudQ4kC1XEUyGzfI6aXU1wYt86SIEYwImLLbLkivHL+ZDpYENA6suz7PtNuVlLC
 Pi1aRNWquTNYhR+LvPy7//58CtbJRZefqWVbRDfubzrRxeTcDhnMoQlUrtt/uMD3ibnE
 /CH+Ukq5GCbNhM/5K3UFviwFYqEBkxwMJe4OG0YkJU5PmrdxXTKLKJdJGh7vwUriWyRl
 gAe7+yi6dotNXn5Fkf0yGEnFrBKnhin1xRZ/tfzjZGdhoAG1t95ogiyxYbvIwOPyD3qX
 YHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=bLp7DuCX6CMSQ+q65tIgEH0G+PBnUc+OKYH+OCM4A3nOOh414cRnXwrWo9f6KVZ3xb
 Wm5kB45vyoCjejA0FYTyAzZEjp/3JVQf8m0XJNF58bi/vhIgF+DGbuvqL1wSj5OJUQRP
 tXJKiSt77tlrr1fH8XbaSatQx2WW3NzUA/xTluJ6btBms8nsPGhgNbwWnYuQ+w0odA0x
 HO5lfavxRbijs/nRsQcRu2y9QVHoDM2SsvDgMsU/I3wyROIvctC1FP+cl4tXkjchv/LO
 gPsbYuxWuNd33RQAaJLvKHCzYfdBiRV+4DO8l0LiUjBRkzuZf924ZQxCi1uxN3o6Mm3n
 k66A==
X-Gm-Message-State: AOAM531510KMNxkn76ykLJZPSVHZTEcgV3SmBDLmRIDsznNjEsDCwGzw
 KCLvKixqBD5KMjf+dHPFkLy/kA==
X-Google-Smtp-Source: ABdhPJzLNQlLqusIHk2mLl1/WjSQ/SnrLnewJMjZfIAz00+9GI0iQljPIoAb6xWPa8CAe0qK4FdXSQ==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr18532930wrm.327.1594132675143; 
 Tue, 07 Jul 2020 07:37:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 07/28] ASoC: fsl: fsl_spdif: Use correct formatting when
 denoting struct documentation
Date: Tue,  7 Jul 2020 15:37:21 +0100
Message-Id: <20200707143742.2959960-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
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

