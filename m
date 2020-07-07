Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B21216A96
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:41:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1JrF43jKzDqpq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 20:41:01 +1000 (AEST)
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
 header.s=google header.b=VNmHdT5a; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1JJb4lRyzDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 20:17:03 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id f18so36485354wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceIee8YBFX9kzqJWoK/1iqOS7aaLJ7GoK8i5sFpusg4=;
 b=VNmHdT5aOvG5QcaUjgLr53ubScedW6+ksFA4XxzupsIrEYDcgzzUzddsvpTVB9+XBd
 Ry1c1rkjcL2OrFOHVSR5WsUH1Zte6YIqm83zgl4a8K4ORxMhKnyNnv+a+uocR+ceVe7d
 xSvPRKPxzLXNAG8kwS1XjuRA68zvHf8U6dL/SIXIee0ZAa7JMk85f5nO7LCsI2Nw0k0P
 Yrd5NXh0wSnDfPpx4/l6Q9a4OlDOxl6oJ1wrFcS002d6H5/bblBAdZvP2iJbJ1PiCx3s
 5HiwZQ/XzuOK93xWUiz73N1/WL6mKyRf1RVnJD+SfQcACuO9YfuphgOAaSE3clIFgaah
 BH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceIee8YBFX9kzqJWoK/1iqOS7aaLJ7GoK8i5sFpusg4=;
 b=HbUwtEl3bTznS5CqlWzJ7SfaLdQO2NAQIv/xVc5iv0LYrPueKb/ZIKKyoxS3LsJOG/
 hMIrdgxZtuYsXe1+KCFWDdcBqfqkj+/UmeZO8nPoV7uWBkB8GoS1EfMO1Pe1TrNYEfpL
 JbourK+/9GSHCua7fSj6dCcBdvZIonh3gfkFlaHAwXQYYX3VExmSJTykD7cvDV1QWNYp
 udtl0woeTlK3Oyv//kz1MGVT7VD+UeVGVcQmy65hWh/3eUhlP39qx6n3tVAQDCJJ2JaX
 4lGhJGe8J8sDK+qfezx2QP1OOcTlSSnOh8FJfKEdusfPnpdJ3Edk6ZgKLeUI7HkhIhcV
 LPIw==
X-Gm-Message-State: AOAM530G9HLlojdOK7FW8oM3BtzfgYE1uhhtupug2yxywYtTU2JoWytz
 7h1pXTMwuVuokg1duKqxghDquw==
X-Google-Smtp-Source: ABdhPJwX2C88MDS9oCo6CUBN9iE8kRApkiJqgBaHVMS9ZR3zrmhkp/rOi+eiD5PYlCH7fNBq+FuNpQ==
X-Received: by 2002:adf:c441:: with SMTP id a1mr52516736wrg.130.1594117020948; 
 Tue, 07 Jul 2020 03:17:00 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 10/28] ASoC: fsl: fsl_esai: Add descriptions for 'tx_mask' and
 'rx_mask' to 'fsl_esai'
Date: Tue,  7 Jul 2020 11:16:24 +0100
Message-Id: <20200707101642.1747944-11-lee.jones@linaro.org>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_esai.c:86: warning: Function parameter or member 'tx_mask' not described in 'fsl_esai'
 sound/soc/fsl/fsl_esai.c:86: warning: Function parameter or member 'rx_mask' not described in 'fsl_esai'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_esai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bb3c405df623c..3f67f4a465780 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -49,6 +49,8 @@ struct fsl_esai_soc_data {
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
+ * @tx_mask: tx register mask
+ * @rx_mask: rx register mask
  * @channels: channel num for tx or rx
  * @hck_rate: clock rate of desired HCKx clock
  * @sck_rate: clock rate of desired SCKx clock
-- 
2.25.1

