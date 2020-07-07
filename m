Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003D216F73
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:56:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1QVg27PZzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fHAcXDu+; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Q5f1RPczDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:37:57 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id l17so43539590wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bZAeFSvmpf6EGc1Rrn0+wIXui3QoI3bJ6wz54zb8+8=;
 b=fHAcXDu+0UDjAnGsZCpwvS2l6qqAL8KmU4/hZ2TsI5PgHIV4qOmanuD2x2pHG+neQR
 rVDB6l2WKwx9LfjnXOERwPjwChvNC3rPwvPr+IZCPGw1hiH87JNKO9AYKyl98eB2EGUz
 EaMvmCzXOLeW7e/lm3xuIV1iuSBcuhwlYAnYJWnAcibJ0GskYWUh8FAWSVx+dzSMe7Jz
 jBt66d+DjwY3WlVfNoEWnRqDkhkUdC7RN3K82BNOCWsgmoSOCy83skF07gRV0M6X9XRK
 0HKwjDOHWQxu2qf4f+WgVopEsOm+Oursvksd+98NeUY3Xw6x/oVQqoKftaB0RuJU/SGk
 HRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bZAeFSvmpf6EGc1Rrn0+wIXui3QoI3bJ6wz54zb8+8=;
 b=OkW6ESF3yskgq4GnriytsAOKqUlv+uXLwbdgCT/hWlHxwE6Z6jI2uTWzaYEyjujW4V
 9dPCsA0z/UfxmZKD6PIaTmipNCiDsi4LD0TM+ldGFntTwcUo15whOJ3XtitzErN2xWsL
 9tC6yBT5dcxegp6hbCrbL0RGEpNMXDCvcRFXSvgU3LsiP5eQ/HuQ99sMKwHHg6R33ytV
 BXlubX3snZciIS8SqYWuxW9XUdzLs5HHeq4JgiBdcyAINmwGJ5nTpjXD0oHM+F2h1zAl
 w5gMwu7ajmxGjOoQLdLA47dl35Dlpr+HmJ9NXRmO0ikoPcbxCHMIzX+Safuc0MFzcWu1
 IIzg==
X-Gm-Message-State: AOAM533NANSjGI5qbDar0Hl5tTnFk+LELGkXwmYcAOjMIeh+0fj6r2qZ
 VlG1sFk6uwE0oav20b93rClXlg==
X-Google-Smtp-Source: ABdhPJxrmoWb0AoG8dtrTzwDrsrwfZ+hGey8KGQBrgisAT3KZ2gvAURvfT4TDuU3PO43BZl1AP9usg==
X-Received: by 2002:a05:600c:2154:: with SMTP id
 v20mr4914902wml.185.1594132673269; 
 Tue, 07 Jul 2020 07:37:53 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 06/28] ASoC: fsl: fsl_ssi_dbg: Demote obvious misuse of
 kerneldoc to standard comment blocks
Date: Tue,  7 Jul 2020 15:37:20 +0100
Message-Id: <20200707143742.2959960-7-lee.jones@linaro.org>
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
 Nicolin Chen <nicoleotsuka@gmail.com>, Markus Pargmann <mpa@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No attempt has been made to document either of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_ssi_dbg.c:90: warning: Function parameter or member 'flag' not described in 'SIER_SHOW'
 sound/soc/fsl/fsl_ssi_dbg.c:90: warning: Function parameter or member 'name' not described in 'SIER_SHOW'
 sound/soc/fsl/fsl_ssi_dbg.c:99: warning: Function parameter or member 's' not described in 'fsl_ssi_stats_show'
 sound/soc/fsl/fsl_ssi_dbg.c:99: warning: Function parameter or member 'unused' not described in 'fsl_ssi_stats_show'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Markus Pargmann <mpa@pengutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_ssi_dbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi_dbg.c b/sound/soc/fsl/fsl_ssi_dbg.c
index 2a20ee23dc52d..2c46c55f0a882 100644
--- a/sound/soc/fsl/fsl_ssi_dbg.c
+++ b/sound/soc/fsl/fsl_ssi_dbg.c
@@ -78,7 +78,7 @@ void fsl_ssi_dbg_isr(struct fsl_ssi_dbg *dbg, u32 sisr)
 		dbg->stats.tfe0++;
 }
 
-/**
+/*
  * Show the statistics of a flag only if its interrupt is enabled
  *
  * Compilers will optimize it to a no-op if the interrupt is disabled
@@ -90,7 +90,7 @@ void fsl_ssi_dbg_isr(struct fsl_ssi_dbg *dbg, u32 sisr)
 	} while (0)
 
 
-/**
+/*
  * Display the statistics for the current SSI device
  *
  * To avoid confusion, only show those counts that are enabled
-- 
2.25.1

