Return-Path: <linuxppc-dev+bounces-5096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1B9A0A9AF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 14:39:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWGhP5M0jz30YS;
	Mon, 13 Jan 2025 00:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736689157;
	cv=none; b=HDi5Uvu/FnCBSilT020pehoiGp5KlxjasAV9hSw7RFcJuhkgG2sre1h0wMPHZPSo2orulU9/X7BAYHwVWDadoNvAzX62np2g5KEV8B6yxJFHq8lrPNRlqavuCC3poIs6BzpX/+2H+McZccpa2DHIPVL04Qor9ZZhkZ6yZ2AT9+bHekKD2siUxb11hI3MpnPOiDtu4YHQ3LuYR+D2jESu5Er9P85nN9Uc39vAvR6I1v8gzmvxFodDqQ2d41Rh10ADU82tIbuRejWpScUx6NAbjPu2elaMLe5eTI+meFhdw26D8awtm1xgTLaJggVHCEfeR+054mx+uiTXpGAC1MSDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736689157; c=relaxed/relaxed;
	bh=nQ3Whnc9k1Q+1OLPMm8+x6IOLTpBlsEtmK8zovMkXoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYOFejDENDCt64UReCWxbeDio0Twgq8UGwFam07jm6+/j0ZctCoB0wnbG7K56dN9KX9aZ/5AVUcKAx+25frDtLo3k9OLpjKDOfV1fZVeNPC+ARXHgzlJNiBqcF1C/0U26qkatZZFErWBPXE97yM4vU3Tj46PovrBuG5PvbtC57+q3obQrlpdDDHYMXyqF09E5AfXrkDC4lZsnaqZeQutY9+58N+DhyduX6pK6hpSBzj/XcspYp9kCe6LfmoFTEMfeBmNBfmEXNg/XVP5qfhuVQk266Sp/OitSyKg9xTOG9SMXaUNLaB9VChta4KLOh9JOeepiSfKwL/LKbygmTl/TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DRqS4FjC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DRqS4FjC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWGhN1fJrz306S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 00:39:15 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43658c452f5so2950935e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 05:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689151; x=1737293951; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ3Whnc9k1Q+1OLPMm8+x6IOLTpBlsEtmK8zovMkXoM=;
        b=DRqS4FjC7vCoaYxQc83+Q8wqwwEiA2Pq3Dxu6zNyTOxgJxITqAiAlpxZIlTLIWM6qz
         YeFsTDXHEXGQRLvHzCKNc+qZ+6tF4ewnGCojGPaiV7dZauZwkkqqXftejUCG265kWoON
         gCJZ8hfNO8zmH+URV52NttZK77fqKLKiENPUJKgzUsjxPnpD7gBgJ6h3g8qDXGBdNRdC
         tpGLUQD/sYdIU9Sa+yyU8OTr3BN1uubvPgBlwJXZAOvYeMwVT4RaGm7ErXBWJ4H4sJjy
         Fwp5E/oNNGeqSgFRUnJZne1/4cdVPR0TrO3j6GYr+gSMu5tjypUawxHrDfH6pvSjiPwv
         6alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689151; x=1737293951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ3Whnc9k1Q+1OLPMm8+x6IOLTpBlsEtmK8zovMkXoM=;
        b=v9pZKyP6CvVixbU8ARBEiy6FNLwuZ0aKZV0gedfU8djYbybMRkqgGP61c+ZzmEh5pb
         zaAGdnWRKgWXq4UK/mzkpnLZoWCsYP0qSqhMfKKbvmeFC0XyMkvKVKWavpeyjBj9jD3n
         EbjWxh39TpOkv6/cbADZ+adlsRDu2nMd1XPhl13R9s+MzcQn9qr7pAcs3fE7speuxq7J
         z+9nOqbDQlrXnjaTFg5VcPLPGgif0Ri5EsLT02hkMclVXQNoJsVHvY03CeJJgJn+uy0n
         kTl0u+XT5mZo4AHzu51q3CXPJO+H4371kZL+9kAvhQM2YaKex4kLpLvW9iCfcqKu+mtU
         OaUg==
X-Forwarded-Encrypted: i=1; AJvYcCVLQK/LpTvyZ5avIeXtCrTuB5iek9dDMQiQ3/90O8IDX7AV71/KDT+vL5MYlsJ5CEqpr5S8AP6hght0Ow8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0s3u3OOncwh5yIMWPTDpnNIVEB/1+UgfR9A5J/nxTpbrXJ1bM
	TPhyVCHalnfmp6fXn8GN7zEP/YNx3has3tVPt4iZw/pHNTcmYDMPHkT0ZU4dQy8=
X-Gm-Gg: ASbGncu7umXk3W8IazkPRxAswTc6diXiY2iyCIQ+oJJ0c5v4Wk+GkoPFL3iBkiNY7CN
	RVCtMHn6nu6u/vjRhUpwkBImvWLzzwEL+ZhJcOoJSR10iMZJlIl+OLgHTkChhKxyhghNFide/HI
	ZSks3tJacGWvyP0ZKnkWyEnxphfwcIAlwWVx2p8xS9MvjQ0/M2x0NJDCDzw49yfMT86srYrXRwV
	adV99HtqXIYo8aMElyECAMGwZvk4CqLtgxOh/+fGe/MZuC2Wqd3bJB2BX21/lmOsZigL/8/
X-Google-Smtp-Source: AGHT+IHlqQUT4nJ5SQNBM6sybXZwL+bzxz0Y9M1+BN250gX4iG9BJx5WOU34PwgsHmMccXztrJhIFg==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-436e272c89cmr62461175e9.8.1736689151481;
        Sun, 12 Jan 2025 05:39:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:39:02 +0100
Subject: [PATCH 1/2] PCI: dwc: dra7xx: Use
 syscon_regmap_lookup_by_phandle_args
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-pci-v1-1-fcb6ebcc0afc@linaro.org>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=O/NOpD3CQ/1x8q7Y6t4lRJsHtiSHlvyOKne/i9Zp+mw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X4L014og7m5GFccNS9Q1a7ef8G6dskIt37N
 AtuFjYZz3GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF+AAKCRDBN2bmhouD
 1zdhD/9GJ5EK0dF1XS8FiJAKuNvLC2/kqb5mlabJRSMHZdEJCZ/GL7iydkfU9R1IKDjA66xKDmm
 hlNvjnRKN/hieQdFKqBKkIaX7u1J8XN81DlqeApDDVAvXODx9YSIhO9ohNVyS2TKVr8ijveqHRV
 xf1hkYIqg3PI+4hoBI19dAtKTe5fMuYqNGAef1GQif0M7Ft7R4pwIy8GOzXcwEwN/w2sxCihHI0
 dFdgfMR8fpJlfVyXIzExgvbuAQHETHiDkWsEMuFk026YaBiYaNFUUySyGVGlkMOA9W6sDHzBTVd
 dMq7AR+B+9ieQF6+urHXKTHdEulrR6e5GzgbtB/HP6Lg7moaY3WQWo55ApZSRtX3pIKxpkCCR5a
 sVwl4OKXXouOWzWCjNZJtSHMln7mbZL0AtDRu3woJlZLn3gfL+EPeSBbJUnzgUcOIfZ9eo8GAsG
 ntmiIBueXybLz+sA/pd+O1rFk5mWLdE9/SO4XfQmTTAcUSw7ZgxdlM1gGc3f7BNNSZZSBSRunX0
 2YlqC5NDhKq0MCNb9E3HwtK5DDgD0VRrfxyjd7wpqx/nWmLxq0+A1CtnkXo5AKgDBofZrafaiPD
 BFSuFhJASUudUf8dUahKZZsyJMXG063citE9ertMgorxFBCJvwmvganrycsTWi47bthL/d4KAxB
 REoi4dl1sllDW8g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 5c62e1a3ba52919afe96fbcbc6edaf70775a69cb..33d6bf460ffe5bb724a061558dd93ec7bdadc336 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -635,30 +635,20 @@ static int dra7xx_pcie_unaligned_memaccess(struct device *dev)
 {
 	int ret;
 	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
+	unsigned int args[2];
 	struct regmap *regmap;
 
-	regmap = syscon_regmap_lookup_by_phandle(np,
-						 "ti,syscon-unaligned-access");
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-unaligned-access",
+						      2, args);
 	if (IS_ERR(regmap)) {
 		dev_dbg(dev, "can't get ti,syscon-unaligned-access\n");
 		return -EINVAL;
 	}
 
-	ret = of_parse_phandle_with_fixed_args(np, "ti,syscon-unaligned-access",
-					       2, 0, &args);
-	if (ret) {
-		dev_err(dev, "failed to parse ti,syscon-unaligned-access\n");
-		return ret;
-	}
-
-	ret = regmap_update_bits(regmap, args.args[0], args.args[1],
-				 args.args[1]);
+	ret = regmap_update_bits(regmap, args[0], args[1], args[1]);
 	if (ret)
 		dev_err(dev, "failed to enable unaligned access\n");
 
-	of_node_put(args.np);
-
 	return ret;
 }
 
@@ -671,18 +661,13 @@ static int dra7xx_pcie_configure_two_lane(struct device *dev,
 	u32 mask;
 	u32 val;
 
-	pcie_syscon = syscon_regmap_lookup_by_phandle(np, "ti,syscon-lane-sel");
+	pcie_syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-lane-sel",
+							   1, &pcie_reg);
 	if (IS_ERR(pcie_syscon)) {
 		dev_err(dev, "unable to get ti,syscon-lane-sel\n");
 		return -EINVAL;
 	}
 
-	if (of_property_read_u32_index(np, "ti,syscon-lane-sel", 1,
-				       &pcie_reg)) {
-		dev_err(dev, "couldn't get lane selection reg offset\n");
-		return -EINVAL;
-	}
-
 	mask = b1co_mode_sel_mask | PCIE_B0_B1_TSYNCEN;
 	val = PCIE_B1C0_MODE_SEL | PCIE_B0_B1_TSYNCEN;
 	regmap_update_bits(pcie_syscon, pcie_reg, mask, val);

-- 
2.43.0


