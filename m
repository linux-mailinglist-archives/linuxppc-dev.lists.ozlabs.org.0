Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32A4F0950
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 14:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KWXzT2ZYpz2xnJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 22:20:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ASJ/uTPq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ASJ/uTPq; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KWXys2qJfz2x9c
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Apr 2022 22:19:31 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 c15-20020a17090a8d0f00b001c9c81d9648so6569257pjo.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Apr 2022 05:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=RShXJBNVQcxmpPDml0HJbk+LkoGJyZhOEELj1lVtbec=;
 b=ASJ/uTPqb3VVSeNcAbp/2MzxUbyvy50wiLrqZDmqGEYwccN7mrIFuq2OD45vQ6Cqd0
 5/SUkAf4QGZVRDwJhnFc6AR4Akd8JgP1Ri6SOd3GBHlqUzmn2nf0Wlm5E89DqxKOj7nn
 xKQdTmz/c/hKXtQ5BBsbm6DFU3CrpLDR9JfyWF4TOZonwBgKWNJUBVIFudEUScJgqto9
 1XFMuZhYlgHUvGg9TJne/FGV94UscJRufy3/bxlHDtcmRqnQ9vAPsdVlBR7aA694Ih57
 xqYbPEwz8xW0aoOWmbIF3In4VdnwmUsK03Tkj6Tk9AhUZny1MpIRAukpUqhxDp9kxkWO
 dw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RShXJBNVQcxmpPDml0HJbk+LkoGJyZhOEELj1lVtbec=;
 b=KwhChwh5JWxgHNpYU07GL8N1Fj0w4SFDjFOBFhS0LTdP5umet9gevvVCLqBruEBrFn
 +XCibqOd4BRt+0QMdsjfnefR5yHHhxFIyaDD/JBgVdP90QkJX39MhZmxg81bnHq4p5Sw
 DGLWncSJvZlOGVI2aquHRCa089VSRS16NdhzO5yWQV7fWNdtNnD2E2T183BtBGs4IN87
 JP+VH1/32z+IaF79+g9v7Mri/uhqjOS/K5lAoyoa19rlq/klGTMOtsuqkFABK2wIPoPo
 MAbuDXzoEA/a4u/C7HgOJOcAvF2O0xy7JyI2qjcZQc53VHq5DoK29a8PACky12J54IB8
 nifw==
X-Gm-Message-State: AOAM533BfWKJxLYdzroNoixJ4IfBYTqHOR+3rDswFcXHWH503jnXgWiW
 Pmu90H2BHYTdYDzWRz4B/1g=
X-Google-Smtp-Source: ABdhPJzJ180xuZCo6a/vyAI5wNXF0oUceznq7n1YZj4xX5GZFmrnqYFXuyvtiBLWAo0hSxO/XJ2jTg==
X-Received: by 2002:a17:90a:7403:b0:1ca:7de0:8cf9 with SMTP id
 a3-20020a17090a740300b001ca7de08cf9mr3869047pjg.74.1648988367280; 
 Sun, 03 Apr 2022 05:19:27 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 o14-20020a056a0015ce00b004fab49cd65csm8604019pfu.205.2022.04.03.05.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 05:19:26 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Paul Mackerras <paulus@samba.org>, Shlomi Gridish <gridish@freescale.com>,
 Kim Phillips <kim.phillips@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: qe: Fix refcount leak in par_io_of_config
Date: Sun,  3 Apr 2022 12:19:20 +0000
Message-Id: <20220403121920.4788-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device_node pointer is returned by of_parse_phandle() with
refcount incremented. We should use of_node_put() on it when done.
This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error path.

Fixes: 986585385131 ("[POWERPC] Add QUICC Engine (QE) infrastructure")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/soc/fsl/qe/qe_io.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index a5e2d0e5ab51..9f5f746bea88 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -159,12 +159,12 @@ int par_io_of_config(struct device_node *np)
 	pio_map = of_get_property(pio, "pio-map", &pio_map_len);
 	if (pio_map == NULL) {
 		printk(KERN_ERR "pio-map is not set!\n");
-		return -1;
+		goto err_node_put;
 	}
 	pio_map_len /= sizeof(unsigned int);
 	if ((pio_map_len % 6) != 0) {
 		printk(KERN_ERR "pio-map format wrong!\n");
-		return -1;
+		goto err_node_put;
 	}
 
 	while (pio_map_len > 0) {
@@ -182,5 +182,9 @@ int par_io_of_config(struct device_node *np)
 	}
 	of_node_put(pio);
 	return 0;
+
+err_node_put:
+	of_node_put(pio);
+	return -1;
 }
 EXPORT_SYMBOL(par_io_of_config);
-- 
2.17.1

