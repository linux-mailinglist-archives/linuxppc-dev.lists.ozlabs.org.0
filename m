Return-Path: <linuxppc-dev+bounces-5097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 862FAA0A9B2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 14:39:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWGhR2ySjz306S;
	Mon, 13 Jan 2025 00:39:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736689159;
	cv=none; b=IXF3aScBhqtkcjjmuB5q4o4x4uywv2XAM5o/vV5GzzMO0Nq31QrQbMcFpQm6+cs2KP8SxSV0ZhvdrEIKbjN+XkLqznPAB0aA+f7ptxjQDORlHA1oc2BO45byMfYV1xoA4rulsFKz+EpSOsjakqqsCJpdDe+/UIfKVWFyBKDPxdCb6YXepu3REHkkDjpCY02f4VOn61m5F9M27e/VdoValYuEd41OSKm2ULhi+MyxhCOn+UyI1KUFbtR67MdnusJUbfYoDiEIGeyNU7kJ9HqTtLqcG9hbOGw9rmu0NUD7HX0otSC9sM5Vg46oh9IAX4wUPsepeq1idg3kOI0R8xbd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736689159; c=relaxed/relaxed;
	bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDwki66is6AeJ5AwXh0uBG14ERCagjICBhCDlEDcFj5/fIS6HXx2iZeckIbTEj6ViZRM5kiAt1uoXSnbz2A3TNGykohDsbZ5VBH/r7KeCOaNEZPPfLJVsBcrIFo0ylfSkcniezUMS3amM1/rWL5lRae6/7CauXSTgeJwuChjtKgAWq+IhZgc/W+zN+f3aenUHn8zPPEYSDqBt1JktddI/3eLsMBrDv2whaeryp6jHelVDct9TL+xdY8yj4wTHffSthcrO7ks5NuLgDPcnIoNzkxXpI2vUCPNRuLgAml/glTPUmlfY/D5LWEchlGljQ369UeTybXCKuiPdoLh8O5Hpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A47gBgTD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A47gBgTD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWGhQ16ndz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 00:39:17 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4363298fff2so2925025e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 05:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689154; x=1737293954; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
        b=A47gBgTDX/eP1VXXbjZQ4wvNB99D3niWrVh4Sqt2Bgx7KG4QErEuzsGDNJ1kowb9ty
         G9U4M0msJWtQJ0CqmUSxl470qdcYBAxzSa4MbbTFkl914aeIo+dhvuJfCCTnzs/Y7yUX
         lB07+N4oUgQqV4LJ63pZhui/o1BCaicVFb0FtqThJFk99OPATxARm90Ed7RJD91aSImI
         Cj1u3y8WmDbX8/kgetEAGOoZV0MHzqSqByJtKWvTD30QXofh6U+cK+ZdeQas5aw2LJeU
         0QkU7UeGLJyczbD2iY4i6y8EdYuGrqlzeZ+yTM2ixHpTvToJtBHuEvLngVTYg77CLdWn
         Hp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689154; x=1737293954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
        b=XvvlC6fxr7qy4DxHP5a+dWxj/ec5+dzJhu0+5CxR8/M5XB+v3i/TqkySAbHXkXxwFa
         08gEcsUvo+FTTVi55F1grUc/AqMBkZWI6fNIHppB6grH3I6TqzeX7qfMVqRIJiIwgN+s
         2kPh1DtyN4m6qeuk7ZuvrucKxlQFluKJYmfbz07jVCFg2sOgEyqUCgzpbz6BPOBj9o47
         DYSK2iUUCVkCifsW/whteCJKMICMY0RHfKbKJjkHg8RqB5eAY42+85qy4Ln2knx8H5Pa
         h1qs08b023K9oYXxT8kBKLEHR+x3LT/00hXjzVX8utzzKVMyhZtt+1FjiEnEnDDJ2beU
         VKMw==
X-Forwarded-Encrypted: i=1; AJvYcCXRxV6ICjF197welcukB6okanbrVu4OJfDbYFzh+wk72KhC/hALNn8PjzrzQWfWGeH8DzcCGMKt2DGhNnM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYge7kgM9P4HUmoVmYYqRepR6EkZaRhxKWlVu+utFr8/FlBj96
	sH0DNnN2mgw207yuyz/d3iIeNXkMlpakPMysCyn245raVpNEVWYezn+PIsgG3Ag=
X-Gm-Gg: ASbGnctpBMn+wqjyyPKHX+LD9wgb20dMVZpycjc38LWmc7SWbVafsRNtd0CEp7K1bjN
	ody6882pv9Nt8a1n5Z9eIuzedQU/k0K5mhZByrQvJ5j2iixHHDKwg+uWKf8ofQRBuKqHjPAk6L7
	WieH2zd8D2549CSOZMrNlHJTwt5qSg1htLwJhpFrtB3cuy6T4nYhDqr5+3Qu101xzhxJtBSmIa0
	ZumVqodsT27/VgUXB3eshhXugjLK7IP6eMemW72twhkKiec7693y5TvCzN7adPKuhW/MJ25
X-Google-Smtp-Source: AGHT+IHa/wlOBb5BLOSfZHKhJOKZ66IHreWI0aFAGTr50Xgpw10Wi7ykrB23Ux8LPFxNTSCfVkbaWg==
X-Received: by 2002:a05:6000:18a3:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38a872d2e1cmr6158761f8f.1.1736689153919;
        Sun, 12 Jan 2025 05:39:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:39:03 +0100
Subject: [PATCH 2/2] PCI: dwc: layerscape: Use
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
Message-Id: <20250112-syscon-phandle-args-pci-v1-2-fcb6ebcc0afc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xwSxcTgpz0V5yXRtTiY4r8e2MzVXviCXnTPUR+OLILk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X583ThdqsNd+ai1Rg32YXT0CpzKBfUsuy7+
 rVM3hECbbqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF+QAKCRDBN2bmhouD
 1xFpD/wLpb8jbZTwROWh7xkacIWp36gfWl8++ftg72bpoJgL1J+cC+JgxcgMYugfFbWP6qRzmUx
 hiaUj96QLiicIo1r1hgKftiuvegGo9HdhvbMVhE+7l0G8O+LtC2e4p0oP2C/UkKFmQ9n3Cv370d
 6Lf7OMg8A5s9Ngoiz4e3Hm3GwAKIYBAbNLTu67FEYwqKABIVtqF17ylKCD2OkbLU3qq4Rci6t0S
 dTgPPWNFq2k2SD6nItw9XUmSythajF3r6e0Bpc4IMb1TnFaijuSvzkZwlMtXrmLUbz2flgLH1TS
 BuhYMNBhpDDaHyMdyrPv/dbwZsgzISRIXyIRttdR8cvTv0tDDnz0bS7tvqnBWHztTjLpA4wSgwQ
 SOokV7tpa4D4XdhoZ9w54GbaKwYvx57guoSBJxmoWaXmDxvejiAcONb6YZ9fM8KpVAdYlemsd0i
 Z5wMMCkDbNUJskVmpA290eOz6cLRUTCSl/Pq7YGLvDsjORqWvs+EsZ2VefmLQ+wIpM046++/UNV
 jzql0Rvpd0glIlC8i6MKRTFuJnxF+HjqVO5LlsMPSnug5oHwkIEUJHaMzlf/Q/ErJsZpR5Scfk7
 QIFMUrZkwPpRWIfXEM7fI2hgVP+OUrs/xnyDNgq9ltdcqBcWM5vMFkxa0yY/aaiuicwh0kiS5Sd
 wYC2d0drGiCb1FA==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index ee6f5256813374bdf656bef4f9b96e1b8760d1b5..239a05b36e8e6291b195f1253289af79f4a86d36 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -329,7 +329,6 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
 	u32 index[2];
-	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -355,16 +354,15 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
 
 	if (pcie->drvdata->scfg_support) {
-		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+		pcie->scfg =
+			syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							     "fsl,pcie-scfg", 2,
+							     index);
 		if (IS_ERR(pcie->scfg)) {
 			dev_err(dev, "No syscfg phandle specified\n");
 			return PTR_ERR(pcie->scfg);
 		}
 
-		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
-		if (ret)
-			return ret;
-
 		pcie->index = index[1];
 	}
 

-- 
2.43.0


