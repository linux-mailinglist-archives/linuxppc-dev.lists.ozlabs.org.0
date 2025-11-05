Return-Path: <linuxppc-dev+bounces-13817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A0C37CA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 21:55:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1yJy2qGBz2yrT;
	Thu,  6 Nov 2025 07:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762376146;
	cv=none; b=Ut9TsO2/wskIwwpdLfcQZwcytoeqJCcLE2wREOvzWnnPfQYtkUxqooN4RLrI8OuOMxKUBmxxOdiVuoPwuLom08DHfpic1T+W6pIrm5WAQ2jOtNzlu1OiwJ2ubCB8bfM5MCYq3JJmE5CCDkrDizPy9xmePJaHkABvqj9qpHAzq5WZTNzFm9nIkKVW5+iLM3+0JRNVwk3iIIl10RcsxX7psXL1zAVGgRKBLLHCANuaP5+pZ//5dT4U5hTsX/RTWcO6lLtMNKGG4l1nJBG4mu/IRgoE74sd8KYlv2u3weeFZr/qDH8tDAWvJ/zHiXZpuELnh6wYMfyeEFRba6+ZYHcDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762376146; c=relaxed/relaxed;
	bh=hhMs1hlDgsVZf1g+dek0j89GxNp2KKlLBpBDsBeutOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3XbLKcfxSqwXKv8NfiOyLAcqsqfyCG4zTyqX4ELFEj9p7zRIJ1L1xk0/drjCKnT/Y6nEi+XgPtTecoxh+shlwBzBHJVIbUuwPSQ89CU4x4YVU6fqjk+9qaMzkV7mUpbcj0DLsHz61URxi6ITcBcv35Oxw9Fh4prowfDKcadNpJSklKAOdlgANK5Hwtg0t8I8jJ8GVSVrK5/N/YaVx03+n1PgsDFFVOIma5SmH5ZEonQsAoBncdDDxDz8gVePR/8CoHzLaLvw4quOBzfOp73S1K3YNgmhPNjg87i2ogSO3+Ft71EAEQhnVI2NhOQmE/q/vZa7Js/Fgpb4pnMpc2hrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KqRWkeP0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KqRWkeP0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1yJw6DJvz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 07:55:43 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso278286b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 12:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762376142; x=1762980942; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhMs1hlDgsVZf1g+dek0j89GxNp2KKlLBpBDsBeutOs=;
        b=KqRWkeP0vAdLtrO8mNhyid6KMv4CqFCSrBrYLWIJyu681/iQFswtbShGRVhylrWusq
         Jd4wKUHv7+mbHOAhannsUPXCmS4Smn1i9OQiRvuIzaf6K7FdofJR7Sgqe0439WGpXAU1
         4P2QFNRRkTFHJQtbeRs+9jedKmMRSLfcw+uV8lnIgij3hoceZlksBJS6O6EeNPTU5N0e
         FmJwe/2hF6t5+UD+l83OUiHEKcBV01yaMlgYL8mXxbG73x+LofF9CvHKw2aeoWsmKEBS
         0co1zl0tBVTFYGL5RzOfhWZRwFEBqB8eeKmQek9rbrDA4XtzW1ZE472jVNmuYX26E7GB
         xPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762376142; x=1762980942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhMs1hlDgsVZf1g+dek0j89GxNp2KKlLBpBDsBeutOs=;
        b=hDtI5iN6tDd7vdjzHh/AT629IO9Qske95c2BuyFozZQbEfm8DiDhddIggENmzzVzVU
         kJrqFxyeJFyR1M3r8y3lO8uGjlJIrejBGeH4ff3LlBfOvMzQbOluJ2Y0TaiYA4gvsXv+
         9BJw6WPg2BgIqoDI1SVebn4vmoimSzLiI/a+zuj31OFgSPXa3juzHISliiHg/eL5IjoE
         GA8PE/pNbGmpIZry0XFjRHCTPZ9kN4FHGYlsZYA+zjc+CglCWc6lTwGtS3cG7M4g2oAv
         G60glBx/z5eZzVf19WMt7huLqRtWGi4w6NJLwHQ3f0ICtjeUhnKMBBwnWJXSX8gwPunr
         IJuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsqVtmtfbWU8QSnDZIj9EYAr79yr2wxBgvDdnInVEOMX6DPtSpjvUgGHOXZA7hDI1ok2Q/suD7P4/qVPI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxBR9NZo2i3pCHj/6Ebvw9os6sor1GmCS+6iSIoeGpuLirk15G
	FB1gNhwUdN4+8WMSxFXPxR5mR1Owy8Jloa8tcdNHVTJV+n22cxfdh5Uj
X-Gm-Gg: ASbGncteBJ9IBlbahSN5XG4AxgoDfdSoOA2U3YP+ACtLeWTysQHol/x1p7Jcqrm3IVA
	egzNFG6wyOPDVOokmbkl+/8uBzNe/6imijeNVzBpm1vU8JW3Us1HQNck2IcyguiouYDk1BOJtF6
	y8++8g0/ZOT9vRGMFmux+sTm5/bauytMhki2lV0hsqwvLwD/FpNygEpao0cE4ZLHrkkxLiTkzDw
	LzVDCeftdg9h7Zdqba0o90l+Bz83AFDJmVcusn5n5xGgDCKU2LE7CRwpTLFWID4cnDfhCIdCHKA
	61mAQ0eTxpjx1QAJ10F0e3Jid+y5Z44tFYU+4MYxPn2heSMdNsmEovVseNBJ7sfzmB5WyQ9Oocm
	NO6TeNsQOOX/+B7qbrxkeiNga7QBka8xWVE9W/6dZ3LA+Rd0=
X-Google-Smtp-Source: AGHT+IHPFm5cGv1tt4RmeePKjzvdzFbQmc/HUxeSszlk9l9aFCxxYkmCsNAadtWmj7V2HR6zSfhavA==
X-Received: by 2002:a05:6a00:140f:b0:7aa:bd80:f4db with SMTP id d2e1a72fcca58-7ae1c767de8mr5566668b3a.5.1762376141566;
        Wed, 05 Nov 2025 12:55:41 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7f661b71sm349766b3a.12.2025.11.05.12.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:55:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	leoyang.li@nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Revert "powerpc: dts: mpc85xx: remove "simple-bus" compatible from ifc node"
Date: Wed,  5 Nov 2025 12:55:24 -0800
Message-ID: <20251105205524.17362-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This reverts commit 0bf51cc9e9e57a751b4c5dacbfa499ba5cd8bd72.

simple-bus is needed for legacy platforms such as P1010 so that nodes
are populated properly.

Fixes fsl,ifc-nand probing under at least P1010.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi      | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi    | 2 +-
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
index fb3200b006ad..4f044b41a776 100644
--- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
index 5c53cee8755f..2a677fd323eb 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
index 4da451e000d9..b8e0edd1ac69 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	/* FIXME: Test whether interrupts are split */
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
diff --git a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
index 2d443d519274..f208fb8f64b3 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <19 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
index 2d2550729dcc..b540e58ff79e 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <16 2 0 0 19 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
index 8ef0c020206b..aa5152ca8120 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -52,7 +52,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index c9542b73bd7f..776788623204 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -52,7 +52,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
index 6bb95878d39d..27714dc2f04a 100644
--- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
index 65f3e17c0d41..fcac73486d48 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc";
+	compatible = "fsl,ifc", "simple-bus";
 	interrupts = <25 2 0 0>;
 };
 
-- 
2.51.2


