Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E94EC431
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:05:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474P904pThzF6xg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:05:24 +1100 (AEDT)
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
 header.b="RVI8Jc7Q"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKj6Pl4zF4yw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:49 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id q2so3561794ljg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DamhDMgU5LUEj6+/3a9o1XbDY44tIM+8wHrJxcRu+uM=;
 b=RVI8Jc7QJXtUyehVy/2ZLH5KOcNtBY4ej4JTLrLF37ovYlpHfFGePEvhr0cru5jX5R
 DDSEMoiHcuFOPLrcqX/6yDYoWxYIK8sIyHPteoFu3x6hDugimd/A0m2Ca+fO2CBA9yPb
 r9nwKykJSVb5eDXL5KejAxr2j65tQDEYh8TcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DamhDMgU5LUEj6+/3a9o1XbDY44tIM+8wHrJxcRu+uM=;
 b=QLJ5hX4vNAI4lZb2BPJA4wskuraEBZH+KJ9LD0Tcs7wDN2oGT8crQT8eOL3lnILM4P
 P79vvWud1BlaIryOdR7qaZjRfiqBSC6G4eUxK2vdTJtjpb0h9X9Tq0KtCATSm3IMhlnN
 gqP4dcgemzbUeRFGbDQhlRKai7gxMRBGRELLO6BP6tlqT35stHIm0MJnp6NC3PSrrxC1
 xfXwfXdErjo0EppEzeqx2AAWZAVyDmQE+dOxCp1e9do1VZR2S6/wfw4pUxY7Cnbs1AAB
 dFUYCdTiy5PVRjcugY/feOW+Wl2Eiubl7RI5IrTNlHmFijYFXlD7AV3dS4ZaLwJ073Ws
 6KaA==
X-Gm-Message-State: APjAAAUVv0t+Hjtv24o3VAaVIHwza/fH/JqW1Tm0XoAsEmdCrmu1zLFQ
 MUrqCYxW1UjlxH1hMUATNIC+RA==
X-Google-Smtp-Source: APXvYqw/XER1Nto0CvwxA4E4I56dw+GeuntyRBlwL42+o6MVyOodP98DAt6WTc3CaR2+XC/LYdM7yw==
X-Received: by 2002:a2e:8204:: with SMTP id w4mr8267295ljg.212.1572612162716; 
 Fri, 01 Nov 2019 05:42:42 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:42 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 22/36] soc: fsl: qe: qe.c: use of_property_read_* helpers
Date: Fri,  1 Nov 2019 13:41:56 +0100
Message-Id: <20191101124210.14510-23-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
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

Instead of manually doing of_get_property/of_find_property and reading
the value by assigning to a u32* or u64* and dereferencing, use the
of_property_read_* functions.

This make the code more readable, and more importantly, is required
for this to work correctly on little-endian platforms.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index a4763282ea68..ec511840db3c 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -159,8 +159,7 @@ static unsigned int brg_clk = 0;
 unsigned int qe_get_brg_clk(void)
 {
 	struct device_node *qe;
-	int size;
-	const u32 *prop;
+	u32 brg;
 	unsigned int mod;
 
 	if (brg_clk)
@@ -170,9 +169,8 @@ unsigned int qe_get_brg_clk(void)
 	if (!qe)
 		return brg_clk;
 
-	prop = of_get_property(qe, "brg-frequency", &size);
-	if (prop && size == sizeof(*prop))
-		brg_clk = *prop;
+	if (!of_property_read_u32(qe, "brg-frequency", &brg))
+		brg_clk = brg;
 
 	of_node_put(qe);
 
@@ -571,11 +569,9 @@ EXPORT_SYMBOL(qe_upload_firmware);
 struct qe_firmware_info *qe_get_firmware_info(void)
 {
 	static int initialized;
-	struct property *prop;
 	struct device_node *qe;
 	struct device_node *fw = NULL;
 	const char *sprop;
-	unsigned int i;
 
 	/*
 	 * If we haven't checked yet, and a driver hasn't uploaded a firmware
@@ -609,20 +605,11 @@ struct qe_firmware_info *qe_get_firmware_info(void)
 		strlcpy(qe_firmware_info.id, sprop,
 			sizeof(qe_firmware_info.id));
 
-	prop = of_find_property(fw, "extended-modes", NULL);
-	if (prop && (prop->length == sizeof(u64))) {
-		const u64 *iprop = prop->value;
-
-		qe_firmware_info.extended_modes = *iprop;
-	}
+	of_property_read_u64(fw, "extended-modes",
+			     &qe_firmware_info.extended_modes);
 
-	prop = of_find_property(fw, "virtual-traps", NULL);
-	if (prop && (prop->length == 32)) {
-		const u32 *iprop = prop->value;
-
-		for (i = 0; i < ARRAY_SIZE(qe_firmware_info.vtraps); i++)
-			qe_firmware_info.vtraps[i] = iprop[i];
-	}
+	of_property_read_u32_array(fw, "virtual-traps", qe_firmware_info.vtraps,
+				   ARRAY_SIZE(qe_firmware_info.vtraps));
 
 	of_node_put(fw);
 
@@ -633,17 +620,13 @@ EXPORT_SYMBOL(qe_get_firmware_info);
 unsigned int qe_get_num_of_risc(void)
 {
 	struct device_node *qe;
-	int size;
 	unsigned int num_of_risc = 0;
-	const u32 *prop;
 
 	qe = qe_get_device_node();
 	if (!qe)
 		return num_of_risc;
 
-	prop = of_get_property(qe, "fsl,qe-num-riscs", &size);
-	if (prop && size == sizeof(*prop))
-		num_of_risc = *prop;
+	of_property_read_u32(qe, "fsl,qe-num-riscs", &num_of_risc);
 
 	of_node_put(qe);
 
-- 
2.23.0

