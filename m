Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD5A1005AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:32:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GpJJ5zV7zDqYB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 23:32:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="CRf+gbRe"; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmn21tkvzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:06 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id i12so18993509wro.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/C1Eg1dR+pzbI0uF0+AzerXAuAR/n78tvkDzoMBSgLI=;
 b=CRf+gbRezpDATz6c9R0mDvANO/QSuegvfk8Tajpqx2H0xRJkQoudvG/k8cPenj1OfF
 YhcVEbS+mvttjyvlLQ4/bmQnkwvSFsB1/Z2vKohH9lSn3GzuXb6KD2DTi0j+cj+cZ8IE
 xXF9M2X0cOPy12JeOjAezgGD65VW8DU2AZoKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/C1Eg1dR+pzbI0uF0+AzerXAuAR/n78tvkDzoMBSgLI=;
 b=jbmM5rD6ZC7ZYC+BkCopifLZQ0hIRjV9zkCg8Jk1mRCqBS7CXEG2FXIiTNwjLQvgKf
 gOGR2nUbTp3fIMM9I8UnI8IMMHEcNBgv+qi9TfPIdS7xroWrWYpuypYkMJNrygWa8//f
 aZ/kP0O7iSMDarpqOa9Nv3ZyKRDVUKm/KNqrv08TaqsIibMjo1z3CHkBfx9NJQuPUMGJ
 OYYkdinAREAfa4Rfvb7vngRIFro6JaxNZHlzf50kuh7+rFA1T7dDgegbUPb38QGbayGV
 UhxM9gtzqqmvcT4/Qnjl286y3O5THfjmy5UvP/OC6fH2Hp/CnX2WP3mJkrZY8rrgbuP+
 Ax6w==
X-Gm-Message-State: APjAAAVtBKkcrd7DYz3d5aDXbcNN26uGLnF5W9Vq2wb04uQC13xmfgqJ
 Pay9+hURuWQr0/cwVdiRUJxvYA==
X-Google-Smtp-Source: APXvYqzXsZpamBeEGMUxEhf7zjXrdrLG8X9SsNbwa395AChzzSBkUYi7pScN/Cb75JOsNmN8os6gHg==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr30699762wrw.64.1574076242263; 
 Mon, 18 Nov 2019 03:24:02 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:01 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 24/48] soc: fsl: qe: qe_io.c: access device tree property
 using be32_to_cpu
Date: Mon, 18 Nov 2019 12:23:00 +0100
Message-Id: <20191118112324.22725-25-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
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

We need to apply be32_to_cpu to make this work correctly on
little-endian hosts.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_io.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index 99aeb01586bd..61dd8eb8c0fe 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -142,7 +142,7 @@ int par_io_of_config(struct device_node *np)
 {
 	struct device_node *pio;
 	int pio_map_len;
-	const unsigned int *pio_map;
+	const __be32 *pio_map;
 
 	if (par_io == NULL) {
 		printk(KERN_ERR "par_io not initialized\n");
@@ -167,9 +167,15 @@ int par_io_of_config(struct device_node *np)
 	}
 
 	while (pio_map_len > 0) {
-		par_io_config_pin((u8) pio_map[0], (u8) pio_map[1],
-				(int) pio_map[2], (int) pio_map[3],
-				(int) pio_map[4], (int) pio_map[5]);
+		u8 port        = be32_to_cpu(pio_map[0]);
+		u8 pin         = be32_to_cpu(pio_map[1]);
+		int dir        = be32_to_cpu(pio_map[2]);
+		int open_drain = be32_to_cpu(pio_map[3]);
+		int assignment = be32_to_cpu(pio_map[4]);
+		int has_irq    = be32_to_cpu(pio_map[5]);
+
+		par_io_config_pin(port, pin, dir, open_drain,
+				  assignment, has_irq);
 		pio_map += 6;
 		pio_map_len -= 6;
 	}
-- 
2.23.0

