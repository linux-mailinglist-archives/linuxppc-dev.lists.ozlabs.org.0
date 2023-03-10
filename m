Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C86B4750
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY89T5nLvz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:50:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.43; helo=mail-oa1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY8773zz4z3f53
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:48:19 +1100 (AEDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17671fb717cso6052621fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIEHlVrmVBM0unFLHI/kdGTckBhGv/jeyiKkRJBBR3A=;
        b=7AdJ/LneTbBaK8s/F2sT97rCCZqBd/GuVduFbPoPpr21LnCtGV4Jd1bkohuqnavdgL
         MlIrvo3zwI8HyGe8iVOaWc6gbpA990Eit5oxrvTXESsC5S9ZXRbX383icuTR9tlMo7m9
         uAUGecm/nyl3HDkoX2WADG5y8qZyFnnV5GkYZwIt4H5qe4orCVEP1lKoXOWGwf8dEUTb
         Fb+cVSzZwJLYGUUCeEI4M11o/s6YfvkVsPQD9lnVgjcHar/1oVPBKSPYH66YjCk9CE2v
         F1oTwrFGA2OcII6ph8mV6RxeR3CLjz0i32auW6gEEPE7K4sypWfC9gTrhwcIYnH8LvFA
         4vkQ==
X-Gm-Message-State: AO0yUKV7zAvcHbLYLl7BME9+oJnzwOtv9yZdTBppGLjsLm6mBBzZxdaF
	dfAtgwB8KcYE+ZMNyB0SiQ==
X-Google-Smtp-Source: AK7set/IS9GrXFd4RG+NEpTXnaefImj6w5XAH+i8hNCc/bshcut01X/HlqJgPkreh+GDTRd2zLI4jQ==
X-Received: by 2002:a05:6870:7011:b0:172:21eb:1c2d with SMTP id u17-20020a056870701100b0017221eb1c2dmr17207431oae.31.1678459697083;
        Fri, 10 Mar 2023 06:48:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w19-20020a4ae093000000b00524f381f681sm847024oos.27.2023.03.10.06.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:16 -0800 (PST)
Received: (nullmailer pid 1545110 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:23 -0000
From: Rob Herring <robh@kernel.org>
To: Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] soc: fsl: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:23 -0600
Message-Id: <20230310144723.1545069-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soc/fsl/qbman/dpaa_sys.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_sys.c
index 9dd8bb571dbc..33751450047e 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -39,8 +39,7 @@ int qbman_init_private_mem(struct device *dev, int idx, dma_addr_t *addr,
 {
 	struct device_node *mem_node;
 	struct reserved_mem *rmem;
-	struct property *prop;
-	int len, err;
+	int err;
 	__be32 *res_array;
 
 	mem_node = of_parse_phandle(dev->of_node, "memory-region", idx);
@@ -63,8 +62,9 @@ int qbman_init_private_mem(struct device *dev, int idx, dma_addr_t *addr,
 	 * This is needed because QBMan HW does not allow the base address/
 	 * size to be modified once set.
 	 */
-	prop = of_find_property(mem_node, "reg", &len);
-	if (!prop) {
+	if (!of_property_present(mem_node, "reg")) {
+		struct property *prop;
+
 		prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
 		if (!prop)
 			return -ENOMEM;
-- 
2.39.2

