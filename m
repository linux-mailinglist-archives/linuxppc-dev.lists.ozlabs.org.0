Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF7E10CD59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:57:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3hk4CSGzDq9d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:57:10 +1100 (AEDT)
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
 header.b="gnMSL36D"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13G6p2BzDqsr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:02 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id a13so5672264ljm.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUBWPv3JkV5Q2rpwN8YKM1iLDpQKFkQg1V9KmI5YIqA=;
 b=gnMSL36DxoMRWV5dmkqn64lmHepkAi/UCIfJXPlQpgy26UZTuq1MviK2Qwq0XpyewR
 plZczgrN/M/mdswUw9R50HmZN2QjhZiXFk34AyfSzViZWRYCFTF5rtIK7G5qaiGCCR/K
 jIf31rx5xnRhK1BzOC7zTsNV7YczeL2VTJkhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUBWPv3JkV5Q2rpwN8YKM1iLDpQKFkQg1V9KmI5YIqA=;
 b=nZkT1kh+zFYDNNimilAyM7E2s+lAnqVTihDTbkf8Zme3BNHtC887oOXBUr9rQuLFRx
 L3+jNsKSV0XMjuSLmYTpYf5vILBti+jkS26IcKSqQy6Bpv3R0HYVQOXseNtzfkxu0Bbc
 2WIWDPmJqPmLq9b7OJuqgeVCFyCU26OuKVWZCa9WaBfkowHQX1MkICFzNwm62Dx+5+VE
 hmFQ4WUe+IDUVRPrSYL0tay9u7x+nNzIpBAMBGrxZBCgd4x20ahFiMTYyXLdeLpKe9Gf
 Jugw9A5zh2c5ZBYVrr5hDCZmqhXU47u86BRQetfs1NvcNH+dSwDPil9wH4q88EiL+Hsy
 slpA==
X-Gm-Message-State: APjAAAUrYbyGtx72osm4xDmlHRSwevS85xvCusBJ6xVpTzM3ZUoA3b4A
 AnnZ4L61ZnYAnozwvO6uORRPwQ==
X-Google-Smtp-Source: APXvYqxZ7tTPDopj2M7w11v+y/JLwNd0sGMUxyWwupXPa/c1vlU0GkGXVop9xXN6GCNtZPzQf300Zg==
X-Received: by 2002:a2e:b056:: with SMTP id d22mr22072255ljl.73.1574953079877; 
 Thu, 28 Nov 2019 06:57:59 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:59 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 42/49] soc: fsl: qe: drop pointless check in qe_sdma_init()
Date: Thu, 28 Nov 2019 15:55:47 +0100
Message-Id: <20191128145554.1297-43-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sdma member of struct qe_immap is not at offset zero, so even if
qe_immr wasn't initialized yet (i.e. NULL), &qe_immr->sdma would not
be NULL.

Reviewed-by: Timur Tabi <timur@kernel.org>
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

