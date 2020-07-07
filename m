Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C0216FBB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 17:09:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Qp44zjKzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 01:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a3utOKUU; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5n3SNYzDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:38:05 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id f18so46801975wml.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceIee8YBFX9kzqJWoK/1iqOS7aaLJ7GoK8i5sFpusg4=;
 b=a3utOKUUtmKkFumgYHWsrcA1cg/wCdSJzx/eQgQLrrlD+gKnImbCleOaOXKOhYAKbQ
 wFtcCg0Zo07kbM7/6b2WCbMEHtqRx0z5z8x45mkeHdE3bvPHfdCb/TUOyMt7XXoEq+KQ
 o8/c8hFiFt4TI3ZC+VsiuM7fi3SZ8WfEOadMim+lOC72FVkmNDmll/pBDzmpXzouNgZF
 mUbq2kGI6/L1hRYrnhevYOeHjGlQmRVZAAtBN2SQ6pF+rb9isxab6LqIUpDrOsAI0MhP
 DQwJZds52dUHxrq1ypA88jHKSu/zyLTc4WUK+bTAjzBhJXhdv7fX8pvOqDcGdewSDIZG
 aGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceIee8YBFX9kzqJWoK/1iqOS7aaLJ7GoK8i5sFpusg4=;
 b=YeWWteg/q87uv3NWSH6jeAvMBy/Eyy474m+H1d09IkRMi3x9OmD3m0CHA2FbdDkgg+
 DOR4c0IaYKOD/P47tCxLBh2CvmDd1J8mDJxx/pY5zTkA9E2lXItCzkXZsDCZTLgqbtNr
 KtShSAHB6oQCrmvwVfHmMbKGcNiMZYfrKqyQ7blUb2g67PSZutIEEUVJEuDIIXr11fNj
 CjPgcE0mFHOu+c73CFzY50nAaghdIJ+9D4zF7IHlFVicrZerups0p1+MibtlYVEaQz4j
 9aoEtidCt6U/mJZB8WYee5PLyR+moAmkBcibAU5+WTb27Sz62mwuBKA9ITk28p2kcrmz
 WphA==
X-Gm-Message-State: AOAM531hz2zPxnTzkYd480YL0PTjbSFehgGXwkrNA5n5ARMhE2dE/bHw
 eG/z0H5qncyS/51NYYWXHoTH2g==
X-Google-Smtp-Source: ABdhPJwBhFtwMc09q5I1X/u5knzfYzz3vq0gulrDOAYoVOgPpYR9Udx/EMDFNfeERzWsGHW0kriQDg==
X-Received: by 2002:a1c:b409:: with SMTP id d9mr4245606wmf.99.1594132682705;
 Tue, 07 Jul 2020 07:38:02 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 10/28] ASoC: fsl: fsl_esai: Add descriptions for 'tx_mask'
 and 'rx_mask' to 'fsl_esai'
Date: Tue,  7 Jul 2020 15:37:24 +0100
Message-Id: <20200707143742.2959960-11-lee.jones@linaro.org>
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

