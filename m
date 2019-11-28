Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE910CC7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:09:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P2dg639YzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:09:27 +1100 (AEDT)
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
 header.b="K2wEiOKx"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12q2hKvzDqys
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:38 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id t5so28869648ljk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzzyzsivy+YcXl/jyzCYf1SBk8p4BrEyK9ScDwPsYTY=;
 b=K2wEiOKx+dAnA20pPj/gC7k2WKFK03JPBFAMB2+x1KJ6IuQ/uzYy9NIfORoCqtv3pO
 dWqQg66agfm4ME7e+/iKZAKKQcUv7xPOdFY+K30U/ZIKEFr2OWIUlEL30xH0BCtMLQa4
 fBZ6XqpmIXYhwdW204OYq/yNppQkLMCsU8gWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzzyzsivy+YcXl/jyzCYf1SBk8p4BrEyK9ScDwPsYTY=;
 b=ca8nPq14Azu4qcs2u8h5L+YxLlYa3IRaMjv15Lv9O8/7Y4/I0P0+L8Bb92QOK/avoL
 Lx7y9BscP2PgXfmNpHnYmdZkZp2u0wnyxy3PodGyfmgoo721SOMENOe5aPyOzpLEPAfp
 uKKzfdA/HZvK2tUllpyLq8FDfJGpu2bTWMiARnCh7/m6foflSkDI4CEe1URc3kZ+5gO7
 Quqa3Aq3LBeMWYN9n/hhkqmyccS28yFe5HO2C1Cbifmb6OWohKY2mzit6uZYrIx862BD
 bCxgAIhv7FfYgdlEPevUGMVedZSgGqOARKbtBHGibUJyMfhmNsjCqeEF2VCjhIlauksb
 WI7g==
X-Gm-Message-State: APjAAAUJ6+cxFX+EcX+3eSNORomC176rBFburhkbu1bn/wNJ/SdF/aQl
 hfKCZvdcSKH6zNpVq+nA1vMNcw==
X-Google-Smtp-Source: APXvYqxcCZp9VC/hOwbAbqHS7Mi8diiPVBeVRdJba1gvlZ6qtvTT24K8z3rdfj6gIFE8XPjaG9eObw==
X-Received: by 2002:a2e:9f4d:: with SMTP id v13mr35083259ljk.78.1574953054971; 
 Thu, 28 Nov 2019 06:57:34 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:34 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 23/49] soc: fsl: qe: qe_io.c: don't open-code
 of_parse_phandle()
Date: Thu, 28 Nov 2019 15:55:28 +0100
Message-Id: <20191128145554.1297-24-linux@rasmusvillemoes.dk>
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

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_io.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index f6b10f38b2f4..99aeb01586bd 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -141,7 +141,6 @@ EXPORT_SYMBOL(par_io_data_set);
 int par_io_of_config(struct device_node *np)
 {
 	struct device_node *pio;
-	const phandle *ph;
 	int pio_map_len;
 	const unsigned int *pio_map;
 
@@ -150,14 +149,12 @@ int par_io_of_config(struct device_node *np)
 		return -1;
 	}
 
-	ph = of_get_property(np, "pio-handle", NULL);
-	if (ph == NULL) {
+	pio = of_parse_phandle(np, "pio-handle", 0);
+	if (pio == NULL) {
 		printk(KERN_ERR "pio-handle not available\n");
 		return -1;
 	}
 
-	pio = of_find_node_by_phandle(*ph);
-
 	pio_map = of_get_property(pio, "pio-map", &pio_map_len);
 	if (pio_map == NULL) {
 		printk(KERN_ERR "pio-map is not set!\n");
-- 
2.23.0

