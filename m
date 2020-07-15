Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D8E221032
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 17:07:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6LN05RySzDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 01:07:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ry5LXTgb; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6LD42ThNzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 01:00:36 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id a6so3071758wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3wqhk2njYGDUfvoMiCydF/NDRZ8ScZRwPRcCbCDujnE=;
 b=ry5LXTgbZguG/UbPzILmwKElT6GKBM5G62IceUKmo09VsGFygkrWJmWgxzQz76lEEo
 aLHL0cRraTsvdR/LF9LWJh8Nn97hMd8kAe8V9KrkvSQGoYDADP9sdQKyeuHqyLtMW4qh
 xxC3Cnlla8Xuh+J+2Lg6qknxvSzDUmlnLcpzBN4BMNtxp93AaETvkOjg4W+MEghbT+K7
 tMs8rXohsO3OmNxtnH9BrwkubgWjHesAcsO+i9SHL1vDvXB7M0P6atXH/VLCHaczu1dw
 fgFRit+KR6r3mQymLryq7vEcRXyldu5TlPdyPtlwAmp+O+asuZpqZnvlkaJrRexOm/PX
 RDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3wqhk2njYGDUfvoMiCydF/NDRZ8ScZRwPRcCbCDujnE=;
 b=O8rYTQ24j6QjiiiAVf0xswwCIdtOOKNcxMlG+VAuB67ITQbM5PgJ0L+6kvzinOkG7r
 G3xUDP/3UhvwJWwR9rmUh7gZ7Gjemi9Q1j7Ci0yTz0T5QLZCDCdqzrclM/tdyYjNO5dF
 GpcJrwPSrykFPwB3XXuzIzdnzBplx/+tXZvDUIM6ZgWGEwAL+8ACQMlwvkbp1RkrmT9D
 NN3kOSDzE/+klzuRhElw/EQHaqHsz1NZLbjulXO629PN6vJi1iuSdVMPMnIwPQ9mcHh+
 mckfS1cpKqQShWk5zaC8dr3SCI/ATUtCQ2QU+zbZgfCVq3J2P7irL0p8mJRCIW7Qj4bR
 gz1A==
X-Gm-Message-State: AOAM5336HDQqxNRyT+zO7VH0uSVOiTi3mYS8BR/Rt21wdXwgV2XudxoW
 muMyCD1UcqHcmTfVXw6EErfe5Q==
X-Google-Smtp-Source: ABdhPJwl5O0qynyiyO/vc5c/ivb3JgK51iUfxXzUA/hJSpiRsmDsyxdWa2OMgLVTth8tM/eUlUgRIQ==
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr12567153wrr.226.1594825230041; 
 Wed, 15 Jul 2020 08:00:30 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id l18sm4007435wrm.52.2020.07.15.08.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 08:00:29 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [PATCH v2 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling of
 'exists'
Date: Wed, 15 Jul 2020 16:00:09 +0100
Message-Id: <20200715150009.407442-1-lee.jones@linaro.org>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index faac6ce9a82cb..dbacdd25dfe76 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -92,7 +92,7 @@ struct fsl_asoc_card_priv {
 };
 
 /*
- * This dapm route map exits for DPCM link only.
+ * This dapm route map exists for DPCM link only.
  * The other routes shall go through Device Tree.
  *
  * Note: keep all ASRC routes in the second half
-- 
2.25.1

