Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EECF4FAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:29:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478kj746x7zF6TR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:29:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="eGaarsbw"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gR151xSzF6vY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:21 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id v8so6133606ljh.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHMD7aDRcAnceTlZ0tE45j1n7viMV+uwJbkB9Il7bT8=;
 b=eGaarsbw1EKw6pefhZScDY8YR32XWY0OK62VQmAXGwS02Lsok7Cew24ssbH7+23CdV
 pCNtXVY4hCMr1BBWQwaJnKG9A3nmttVVy/tw2ceMFowkpf0wPbzqZCdgPNs2LC+HYuL1
 fGPRoMpFjxf4hp3B19FgA4ZCX5/HrxQzcKJAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHMD7aDRcAnceTlZ0tE45j1n7viMV+uwJbkB9Il7bT8=;
 b=js1/OtxKQg4Dscl4hvNbLdlGZEwLFqyCO90kR3zRbXiY8ALxMYCvDQnLpDuAjWxK1P
 JdMi9zzSq0nHx/uuPbJ2/ALodWCcIaFABOv+NO5JxeovgX5kLpOxMI6FXWHyEY5IHBxL
 tS9u4fToclnRr+f9fRs/bHNDD1WZc3UcAVgWUq0e1bZ4xPEj9j5k/aO2uZNfD7FZTZDD
 4saXvyUyXC22dtjPvXSj+7eVQwqQnRFNPovSNG87gZWG9skP/FYcKoocW73sjl9m2+54
 SZZx/KGy05CgqBaaijoJkkYLVCfL+8LyvSY1UAOI0fjP6un1nYgFn9OHG/B2tZAGhMWv
 slUw==
X-Gm-Message-State: APjAAAXS46m9dnT5/WHXoFUiXVyWzLlVN6n3gBUCoj0RaD8X8JgvW0dq
 y6ypQwFyzZfQo4fbRcc6GE8KlA==
X-Google-Smtp-Source: APXvYqyMeD/Z3Mfx+EKRD5Ea/1OpAHbYHw/xX9JRktv3gCIUdIApbq1aUzUWDJoePEO2SvwM0dFnVg==
X-Received: by 2002:a2e:94d6:: with SMTP id r22mr6708575ljh.7.1573218138299;
 Fri, 08 Nov 2019 05:02:18 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:17 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 40/47] soc: fsl: qe: drop use of IS_ERR_VALUE in
 qe_sdma_init()
Date: Fri,  8 Nov 2019 14:01:16 +0100
Message-Id: <20191108130123.6839-41-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that qe_muram_alloc() returns s32, adapt qe_sdma_init() and avoid
another few IS_ERR_VALUE() uses.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index ec511840db3c..5bf279c679ef 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -365,16 +365,16 @@ EXPORT_SYMBOL(qe_put_snum);
 static int qe_sdma_init(void)
 {
 	struct sdma __iomem *sdma = &qe_immr->sdma;
-	static unsigned long sdma_buf_offset = (unsigned long)-ENOMEM;
+	static s32 sdma_buf_offset = -ENOMEM;
 
 	if (!sdma)
 		return -ENODEV;
 
 	/* allocate 2 internal temporary buffers (512 bytes size each) for
 	 * the SDMA */
-	if (IS_ERR_VALUE(sdma_buf_offset)) {
+	if (sdma_buf_offset < 0) {
 		sdma_buf_offset = qe_muram_alloc(512 * 2, 4096);
-		if (IS_ERR_VALUE(sdma_buf_offset))
+		if (sdma_buf_offset < 0)
 			return -ENOMEM;
 	}
 
-- 
2.23.0

