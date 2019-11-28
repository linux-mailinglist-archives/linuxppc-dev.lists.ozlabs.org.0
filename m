Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C410CC83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:12:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P2hd4GGGzDr3m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:12:01 +1100 (AEDT)
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
 header.b="Nb+BtkNb"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12r1WKbzDqrM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:40 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id s22so9821625ljs.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSlK9oe7tFf//4Qy2NfrnF4d5nSvsXgepmZkqSuzx3I=;
 b=Nb+BtkNbxW1BFcECDh6UFX0iJiRNDoxBTj+VizTAjinoSja93AqETCqS4cEavhjWkU
 3iE4Cmjv5xaW+1gHMEVlLUsnwNGjzQuPN/YY1M3er+gz3s6Fv9ckj1/4W2+YczmawVgE
 C7r/S6KFnTAvFtE/Z0rVuqdYCbgkcXiYE2CNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSlK9oe7tFf//4Qy2NfrnF4d5nSvsXgepmZkqSuzx3I=;
 b=TMW+iaY2L0A91zsHaEz8iwL4IDmoySNf+uEe9yvZj2IR+W5TzcZSt6VtmHj6C+xpSd
 JoDVUcWlhLr8xCx4xm9Xo8RJDxnV14bV5H/l1/T1Cly1NGfkOVXVddCy4iZg1csPjkgR
 6smo4M4AiO90aFzyA8f8Q11kjO4j8S+rzTtwFrUgPZLsj0YoiMXYacAnl7QP0aoxbJfc
 5Ewxe2t/gPUtl1YgKC9XJkFPh91XWvr3y95HB06PggwLE9sp9wyVqq5vRXkimFbmUA+M
 dgYDXy6Q8JKdyuMsP21VSjPemyDuvseQvYATDNGQnA80IY3ZGXP3C4QwUNuMYy9PfRes
 e70A==
X-Gm-Message-State: APjAAAUZLQUym+HmuTQzjqWQK0sAylLUwr7WNj1qNb668XBckoJm3bq/
 M/EDRkz7azj++W12tl/rtt9Ai+wUI5PxMlpo
X-Google-Smtp-Source: APXvYqy4JS+AOt1j8qqH5QrK5A1msfYt3pqh9XYlcQjLvsA4Cy/8OwTNm2hhTB7Om9p+bADuYHPpqg==
X-Received: by 2002:a2e:96cc:: with SMTP id d12mr34338565ljj.210.1574953056036; 
 Thu, 28 Nov 2019 06:57:36 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:35 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 24/49] soc: fsl: qe: qe_io.c: access device tree property
 using be32_to_cpu
Date: Thu, 28 Nov 2019 15:55:29 +0100
Message-Id: <20191128145554.1297-25-linux@rasmusvillemoes.dk>
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

We need to apply be32_to_cpu to make this work correctly on
little-endian hosts.

Reviewed-by: Timur Tabi <timur@kernel.org>
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

