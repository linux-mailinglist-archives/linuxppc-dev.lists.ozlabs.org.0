Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6589E2465C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:56:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXZC1C8ZzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G/fB+QTq; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVScP1WG7zDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:57:56 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t11so7179090plr.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BUyJfA7GFxP9WYsjCnnZ5mhqqCfe8H9sguy9Hytfvfg=;
 b=G/fB+QTqCm8k7mhRijwIxwba+mTQode2Jl/2UU6gOPC0JsAFH/fIL8evc9I3tbrOyU
 cCqDbaJvuDHO40b6W/et7LZulgTWe+MXBEldXqlH9kbb0hJFj88uGimDxS1dTXO3N3sY
 YSMFtlclh4VZbFzrvqQL5ZcMHKl8JLRHqaKPtTK45jYZq61Vr+giBnUA7uGzZO8WwNqf
 Cy0dO0sXHnJ6g9HJp8InvVgcQbjh297hWRiwD9bR1lm2kN+X1wfCave1/wQyoCg2+v6W
 kDqd8EPX/VIG/qkduURrSkBgjlaSZ2HE1ihEUUUaxtHVNF5Tcv3kug/7chOYpLpi56BT
 x/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BUyJfA7GFxP9WYsjCnnZ5mhqqCfe8H9sguy9Hytfvfg=;
 b=likXlKq+m5JVSuQZG1aDUTHeqrbxJqHuEI0BMNCbyPOazc28sB+RAUlqpYJW5vXM5D
 H2rEC8GsNCEvWQhMBwFcewXM8Icg5XTelwkdWgKqv7bG2v/BKeNkII1nZKM1tcSne1cK
 GwmljXXRDjqy2AeOL+fdAH7YHsq1++ZePnBbKQPifBbGowDUYpF1Stx3ZOYqdO7m9Pvy
 meaKtjdbOgkVOOYqCu3Vew5oGcthy3ag0LH6ZWt5wZMrw91ylvLlZr+PimPH8p4dxYWj
 qUctC7bB9cBop1Pl2t6BVXlxuXIhK9j4k7pZk3VPZhi9GjOO+j3h1CUFsYm+TSvcQRy/
 daAA==
X-Gm-Message-State: AOAM531o3PHCLXLiYF4ronFuvllbN4bXxv3cRPfFTF3ztp4AunSL5UkX
 PWD8ODENf5B8uREdN9ZK+Rk=
X-Google-Smtp-Source: ABdhPJw7/y8A/avyYJkiysQnBIdqxOnFQJNr9WEE5nQtoVqyG0Vhc3lJVXthcnXO0rCAGGIqhorW3w==
X-Received: by 2002:a17:90a:13c7:: with SMTP id
 s7mr8101561pjf.233.1597654672671; 
 Mon, 17 Aug 2020 01:57:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:52 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 06/10] sound/soc: fsl_esai: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:59 +0530
Message-Id: <20200817085703.25732-7-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:57 +1000
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
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/soc/fsl/fsl_esai.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 4ae36099ae82..79b861afd986 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -708,9 +708,9 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xFCR_xFR, 0);
 }
 
-static void fsl_esai_hw_reset(unsigned long arg)
+static void fsl_esai_hw_reset(struct tasklet_struct *t)
 {
-	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
+	struct fsl_esai *esai_priv = from_tasklet(esai_priv, t, task);
 	bool tx = true, rx = false, enabled[2];
 	unsigned long lock_flags;
 	u32 tfcr, rfcr;
@@ -1070,8 +1070,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	tasklet_init(&esai_priv->task, fsl_esai_hw_reset,
-		     (unsigned long)esai_priv);
+	tasklet_setup(&esai_priv->task, fsl_esai_hw_reset);
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.17.1

