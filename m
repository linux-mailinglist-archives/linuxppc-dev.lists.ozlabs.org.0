Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38694F4E15
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 15:28:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478jKs5fHFzDr4D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 01:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="e/P1lD7z"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQd3Jr0zF6vT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:01 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id n21so6105963ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/C1Eg1dR+pzbI0uF0+AzerXAuAR/n78tvkDzoMBSgLI=;
 b=e/P1lD7zvmjURhmsvbX23QE+8ASowwEgb4BpM1IFfQWI91Tr3jDWiq0X6CrLk99wVN
 mPk6Txdn0NvIKorqKDh7HBcWVDg2Ic5Yi9fVd1R5QMWlVvOdwlxoWhTPHcB8cInVr8Dv
 yoknf6mGfRANkmWuDMLpwcTHs5OfxaRyfaFd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/C1Eg1dR+pzbI0uF0+AzerXAuAR/n78tvkDzoMBSgLI=;
 b=lVzRNN1BslYDSRU7Pz2HuwhspD+hvoNceRTMCh6qm8mwMuvUfUaGai95UG6gwL7uBc
 eYUR7jBnqF8nUJmH3kL4ddGuaP97jQriV4KGKEl7aplHrtodZO9drSknTjLvNy4KySVp
 ML9ObZFTxzCFRJl9FaFsnw8QiqztAGaz4ERH56JtBOLxNQAcykVV7GuU3YqWVut4hUKq
 UeUicpyW2EqpYOHQMQNdWjG9SgXimhZ6MklGGQf7RjFgjNpsbZ3syMb8ycSYBytDH4Zy
 5dWh06bn9b6pmvgmKEX9sRSsM2DHdqa0LEW3A/yqpJ/VnUQW1WYGut9n/YSHCEGlrqTp
 R4Dg==
X-Gm-Message-State: APjAAAWerNCUVl3aIS7fCkpWPoK1/EoPECQV6zKywAscpHcenMlEKHjD
 Bd1J+Q7B3edG4jRD8YQn02I/Jw==
X-Google-Smtp-Source: APXvYqxZ1oqYp4p6l2IsGiGO+a6bcfmX2jCuzyyob5hxO/rAt/CL2aEGqAw4ukWNphNhXQIN4rIjrw==
X-Received: by 2002:a2e:b5a2:: with SMTP id f2mr6611603ljn.108.1573218118236; 
 Fri, 08 Nov 2019 05:01:58 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:01:57 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 24/47] soc: fsl: qe: qe_io.c: access device tree property
 using be32_to_cpu
Date: Fri,  8 Nov 2019 14:01:00 +0100
Message-Id: <20191108130123.6839-25-linux@rasmusvillemoes.dk>
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

