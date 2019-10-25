Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1FE4BA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:01:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47043t4KvVzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:00:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Lujjlyr+"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703d30t0hzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:10 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id q28so1628670lfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KpsQXq8uXz3AjuC8zFugbFdIMVLEeL/wAcaNezuzQIg=;
 b=Lujjlyr+AfXRRl+wGvn8Qvihn/KN8LWCqi4kolwlKQZ7qjqldAl04AGkDa5+2tsD/r
 yj6GGSKX09NBG8L94vYyMd0K4TnZcW1MStdU1wA1BSIa87qLvQlGrwuQZ4FYy9GlPjE4
 1nHwzz11Ni13Hg5j85JaC31Bke/wlaf4zEK5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KpsQXq8uXz3AjuC8zFugbFdIMVLEeL/wAcaNezuzQIg=;
 b=OSZXfdCM9YVbra9FsY+MW2wEUhJNodxeX3MNTakM4ryU5cC5Hx1ECNgZx16m6SkVi2
 XDGds9e4GhcD0EBUjR7mLq8v4PXg1LxO1GgyFb/D4L0yOc+kBkVOSTXKndRZEU39Oue5
 p+vuyw5bJCzgK1u6jkvFJEz+VtTgMzhtoBVu3irvXd4dashVrSMtRrfxHvpOSTip7X4R
 aEB7EoQ5MEBzcTwRrZP9iOHpjtKwnZkizoC1r/NWXnGVXadz70zFIzY5R4nqUTaSRST8
 5/YuThSLw5txmet8gcdjmHh++dXb7AW10u3NIgcXPPIBmb9D4JmS3syPyiTcnPWFLU/F
 WKLA==
X-Gm-Message-State: APjAAAXLgnB2EOulEL3nhVBYDMlLT0MBo7or/bXA0x0bABZ5j+mFRp23
 bAfYMGIrjYefvnPefqsIBaQwzw==
X-Google-Smtp-Source: APXvYqzQ4jZPtompIQ6wN1YvHfqQ3rKdaVk4lJJ+494PK+/61L3WRbLUt2K3EJ0JdAgAc1tvXnRrhg==
X-Received: by 2002:a19:5e53:: with SMTP id z19mr2490404lfi.111.1572007267800; 
 Fri, 25 Oct 2019 05:41:07 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:06 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 04/23] soc: fsl: qe: replace spin_event_timeout by
 readx_poll_timeout_atomic
Date: Fri, 25 Oct 2019 14:40:39 +0200
Message-Id: <20191025124058.22580-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025124058.22580-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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
index 60bf047001be..bcdec37b25ca 100644
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
+	ret = readx_poll_timeout_atomic(ioread32be, &qe_immr->cp.cecr, val,
+					(val & QE_CR_FLG) == 0, 0, 100);
+	/* On timeout, ret is -ETIMEDOUT, otherwise it will be 0. */
 	spin_unlock_irqrestore(&qe_lock, flags);
 
-	return ret == 1;
+	return ret == 0;
 }
 EXPORT_SYMBOL(qe_issue_cmd);
 
-- 
2.23.0

