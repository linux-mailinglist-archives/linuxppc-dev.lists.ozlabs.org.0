Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B11005A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:29:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GpDk2QC6zDqQV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 23:29:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="TWX9iBpw"; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmmz5q2wzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:03 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id a15so18981355wrf.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1C8bi+Glp22eU2mPHcIIhRfHNSQMvhbk1zxbdzRB++Q=;
 b=TWX9iBpwdpSNUgpJ/cUdC3Epzue8lAUKQth8hP+iX2zCk3JnB67JdPmo2cnMyzbduE
 aMo8BAZYKyCe25eCCHhnVtjFsg6NdBfAYdBSLpK6akVSb6dEwTAoUQ0168Nhq2K9wUQW
 zPnEeNERzqbndvpDwZzJpYA4bOmnl+GKVAuj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1C8bi+Glp22eU2mPHcIIhRfHNSQMvhbk1zxbdzRB++Q=;
 b=o8dCk14+i+va2l14KFKtjJ/f6QusZw2DSjb132JLrGi3Z0MCE6e6n8rvZqGa8k7T6B
 zPFyf0hvaCeSXvjtEqKQqEb2Kf6OKuHomfxhph8hzTiCSl5hjbwQtSeYnJnS91/ZsAoy
 5vF1rYmZYPbImaiItNjRZYlHLFO9EIKP+5YjA17sgJrXM+OgeCtlAQ0lOv5ebRcbm0R4
 mk58iNkz2xEAtnhOcTjUNhmZSSVjOT+xP2HwtXv5YxlmJbVfMeNvO1LYXebIVa/15tFz
 jbkvMuh5AHdv0eZvDJcI/SRiTaPSJSyhobm6Q/V2oGPTENKor1SDsMEAeV17zD6xAvoP
 /rjQ==
X-Gm-Message-State: APjAAAU81yqtJFmKWadtdMa3OeIbEwsmj0CgVDLk0BSMzrpUuodYs8Ny
 zRfkr/AgX0pdb9EndblVlMMSpw==
X-Google-Smtp-Source: APXvYqyU40TIEBeeNT1xotdOz5OkMurLXXVSorlX6DaEtGjrmXTvcB0yK0PqCzhmSIW/U7/u5ZYHhA==
X-Received: by 2002:adf:d091:: with SMTP id y17mr30844295wrh.182.1574076240560; 
 Mon, 18 Nov 2019 03:24:00 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:00 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 23/48] soc: fsl: qe: qe_io.c: don't open-code
 of_parse_phandle()
Date: Mon, 18 Nov 2019 12:22:59 +0100
Message-Id: <20191118112324.22725-24-linux@rasmusvillemoes.dk>
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

