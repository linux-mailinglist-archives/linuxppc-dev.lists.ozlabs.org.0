Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD17DC5D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:11:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vmcf5C0BzDr30
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 00:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="XF8lRfpS"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vmCm1mk1zDrVT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 23:52:51 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id t8so4608592lfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WqY3EZbKbSCMoeBriPS6VskekmvRpOlr9LtT3vYdVX4=;
 b=XF8lRfpSpXS43H8bXGLZxjGol569DjdpudtIDqLtYNaQX5nW/mNgEslchokWcYdbBT
 gZwtqZAGgisTwryr+nlyFucbhWiB56hccjVc9yC9gh4PhbNPAnAPL5uoWxrY+tN0edmW
 KqRirxHWM8yqGHgnHVp/yCKwpRJqIGeRL4JTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WqY3EZbKbSCMoeBriPS6VskekmvRpOlr9LtT3vYdVX4=;
 b=BPS1wLT8/jX6jlos7KnYp+nqnte8jc8KuhywirGD2c8rj9cOJar3fSFxpxU97i0rHb
 JPp6xehDIx2+k3TYM8Fzs8XWU0hXTteWn2uDQBBuW5eEvmnXI+wbI6hWG7DKP2IOjpHJ
 i4iCZCQjAOGKngzlxTguF5cFEhRgtuVBtPn2x4TBb4Q7BxNM3iChUVuXfwOET3UdzgeX
 S4LYfrHxarWX+ld7isE/yBT+9QK8VDI7z28k+6Umoq1f+3p09dSOAfLY0x9Nnv5vJ8Vu
 cA+VWHuJxTsannPj5L2cCJ7oYUbfcbEyNk5rrBgwfgrMzEGcV7gKURpIEytZolVb72/U
 DAbQ==
X-Gm-Message-State: APjAAAVQCnqZokJG5bMCLfe2Vrvi3hoEv8dZ/AexKXmdZH2in4xtdNTZ
 zd3BJojjMfgU2hvIffZieJV4Ng==
X-Google-Smtp-Source: APXvYqzfr8d1XGwlHtnCPHMvgh/gDAKdPrDLe/e9yGmcnVUmiy2hG/ezT9PzT3PwhiN1YF3sXeWfXw==
X-Received: by 2002:ac2:51d9:: with SMTP id u25mr6183432lfm.19.1571403168378; 
 Fri, 18 Oct 2019 05:52:48 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id m17sm7454792lje.0.2019.10.18.05.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 05:52:46 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 4/7] soc: fsl: qe: replace spin_event_timeout by
 readx_poll_timeout_atomic
Date: Fri, 18 Oct 2019 14:52:31 +0200
Message-Id: <20191018125234.21825-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
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
Cc: linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for allowing QE to be built for architectures other
than ppc, use the generic readx_poll_timeout_atomic() helper from
iopoll.h rather than the ppc-only spin_event_timeout().

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 60bf047001be..d18b25a685ca 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/ioport.h>
+#include <linux/iopoll.h>
 #include <linux/crc32.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of_platform.h>
@@ -108,7 +109,8 @@ int qe_issue_cmd(u32 cmd, u32 device, u8 mcn_protocol, u32 cmd_input)
 {
 	unsigned long flags;
 	u8 mcn_shift = 0, dev_shift = 0;
-	u32 ret;
+	u32 val;
+	int ret;
 
 	spin_lock_irqsave(&qe_lock, flags);
 	if (cmd == QE_RESET) {
@@ -135,13 +137,12 @@ int qe_issue_cmd(u32 cmd, u32 device, u8 mcn_protocol, u32 cmd_input)
 	}
 
 	/* wait for the QE_CR_FLG to clear */
-	ret = spin_event_timeout((ioread32be(&qe_immr->cp.cecr) & QE_CR_FLG) == 0,
-				 100, 0);
-	/* On timeout (e.g. failure), the expression will be false (ret == 0),
-	   otherwise it will be true (ret == 1). */
+	ret = readx_poll_timeout_atomic(ioread32be, &qe_immr->cp.cecr, val, (val & QE_CR_FLG) == 0,
+					0, 100);
+	/* On timeout, ret is -ETIMEDOUT, otherwise it will be 0. */
 	spin_unlock_irqrestore(&qe_lock, flags);
 
-	return ret == 1;
+	return ret == 0;
 }
 EXPORT_SYMBOL(qe_issue_cmd);
 
-- 
2.20.1

