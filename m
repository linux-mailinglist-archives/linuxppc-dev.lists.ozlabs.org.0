Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C56DBF4FBC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:32:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478kls58NXzF564
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:32:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="WM3db+UZ"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gR32qrPzF6wZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:23 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id r7so6148954ljg.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FL4wefDICHo32h9247H9jmqyY6zv5MUtAqMoiveQx9g=;
 b=WM3db+UZNX0xYRn8xFInkWCZ/gGBxlESeid8dXGQU2p17G2KmYfmQKEJM/6nxdjVkz
 dcCfwIBMRd3gygzYVu0IHJtJgUPU16y1N7AQMDT6+xP5d6gPmR+R/fMCMBXpDEu/jhZJ
 wIS2GKrKi2LdTuVlyChuB3CdPaAYkTSGlI7eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FL4wefDICHo32h9247H9jmqyY6zv5MUtAqMoiveQx9g=;
 b=YsQaFakJx8e3tm8M6p9VN0V5ny9XisePCrWlR9SP8y7OmG/JMreoCahYde3bL4zX6Y
 xwIlR3MS1Y1PNs9CvM/fRc2kluouiJ+uJuZs3/bZK2+ZXGXUFkW6yNko3Yw+yBIgTevZ
 9BFI270C7uBgk+LlQTnZVaufWMl5zVTZTfvB47L5nHqlFkOGVsj00SJSQUpAZW8/J88f
 lYaV6/oG2JpsWqar13k1NBj8nqai8KQ9FQ8I1zixwccmmi5duBtM2fabYv398l7cD1bK
 v7z97fPqgdtJhR3HNGjba0zt4uSgd4iV3jsLwd66/dcea2Wo8ddZEOD3kLhxdkkJZrSY
 sZig==
X-Gm-Message-State: APjAAAVdd9ImsJCmiKwM4cRG/Pigc3uPP0e3YwLAo9wJQzlXmgzIgmHz
 S4X4x8rTst8uEr21ZcdpIMbaQUH92T3qfC6y
X-Google-Smtp-Source: APXvYqzCkS9lqjETR7JbwYC8m9Tz96BZoapb1R12xn90SEX0h1M81nDkrgY6B1mLpdktlcuraWeZvg==
X-Received: by 2002:a2e:9a53:: with SMTP id k19mr5922502ljj.246.1573218139469; 
 Fri, 08 Nov 2019 05:02:19 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:18 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 41/47] soc: fsl: qe: drop pointless check in qe_sdma_init()
Date: Fri,  8 Nov 2019 14:01:17 +0100
Message-Id: <20191108130123.6839-42-linux@rasmusvillemoes.dk>
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

The sdma member of struct qe_immap is not at offset zero, so even if
qe_immr wasn't initialized yet (i.e. NULL), &qe_immr->sdma would not
be NULL.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 5bf279c679ef..96c2057d8d8e 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -367,9 +367,6 @@ static int qe_sdma_init(void)
 	struct sdma __iomem *sdma = &qe_immr->sdma;
 	static s32 sdma_buf_offset = -ENOMEM;
 
-	if (!sdma)
-		return -ENODEV;
-
 	/* allocate 2 internal temporary buffers (512 bytes size each) for
 	 * the SDMA */
 	if (sdma_buf_offset < 0) {
-- 
2.23.0

