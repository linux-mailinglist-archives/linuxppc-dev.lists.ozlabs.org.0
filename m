Return-Path: <linuxppc-dev+bounces-2957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9339BFE61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 07:18:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkX2T0pMXz3bjt;
	Thu,  7 Nov 2024 17:18:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730959897;
	cv=none; b=LBl8A2mDbfD9P2yKyfysAb4ORvazQDqiHMiNuqEsFw7C/9GB6bB2CmXV88X1f3SSn0V2TCmMLK8J3u+kHCNf835LtrjYhXGbthz2HvF+7z5C9O/SD6FYKkSF98xSZC9FMo6RUYj3rDkr+MrYBULpf3sXL9WXYyJ3Q5NMa8zH9q+jZzxzcI9iSARqko97o7UfA/UluZSxehCVplhEt9TMK9rl+SKNNMC8s6FwMfrP2Z3yY4T+M5Z7puYQoXE/DRAmLdSub8riZfSmToHvPsabcQrl+m2N3bpu8frIwcmY/99RAqZWH45vzzDtryka9ObrtTSU4b7QOeeGke09QwPQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730959897; c=relaxed/relaxed;
	bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O9WA/w4jWn2p6DHBKDzPthnQ2evDbl9r2tjaI7rC8Mk+L/wc1uMwU0/ggjzR/A1X6e+70oMqgcWzPg+Al8whXbxOtqEwCfRPxl7Z2j+NtCT1nU6FW4ktZwCsMI3Q7yPZPCDgHKljjAcT9QRQrZ7CyT+ByuLwIwWcvMzvoOeisE12U/Q8yZli7pqSM7kXPEhQiQPlLE9rCN7KY0JOE+rufrJwrDVlWSAtjpoiSQ9dOawg1OnVN3GdwB6dMx2P5u1DzgFxp0EU4f2Q2D/FlI3JsMayOZ5qlELDKhyf6D0LnLsLa654Qr51s5DeCpRSmcsPhUIZvn3wtPfWQW1z2Z3xmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dR1qWSdS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=xandfury@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dR1qWSdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=xandfury@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkWtJ5wc1z3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:11:36 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cf3e36a76so6336315ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 22:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959893; x=1731564693; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=dR1qWSdSYMegedeiTqrVi8IRdDghN7fSKJgFOwoMvrmbo86MM3J2ritETyLrM2YgKs
         HhKChODiE4nQb9GOxfmgobmD3fi64zeLFiDwnudGOQih7nzH3d99EzTz2U8lbDwxwaMx
         n19E/EI8pbOizRpOwZgr1gd9JdcKv/e1P6VhYPjJ/t90iFfjeLBQ8hrqSOIOolYF/L9Z
         g1frmg1hoQVY1osEJ/BbqPZ8blFSB65d3EE5dBqi2sBmfR4PY3Zvww4/Zf6gVWWhfV4H
         blHrxgaRwZwIneRZiMZi0GlTwL/h2YfaggtyffG5KY38aHT4DbIhG1VMa6Vk/gtN93qK
         sCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959893; x=1731564693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=UHhYFjWLuaNJlg6V8ORK+NaKRxvd2+T3qAb0Z5sAiMxRHQw6ekkJGfrxgDQ4EKLp7P
         K3HOBdG6PGenuHK8U3LHdV8Yk1Hft/H75nWsLy89a+XuQ1AI/mIL+eTdv+PQPxhtB2+z
         gDuMnM6Dv1Fcvtb7MPQk7VYx1vqMgrckRXz1eDAyOE9iDEoCCq8laxx+9g3lg2Fndc4f
         oXEScsdgyV+DdMCztxCoXYxMo9HGz2Jn1cu4UtwYZ3ITkp6onJ3fq8F2bqzlpHEc2v9w
         Qc3GYDCtRp0JMQlsYgUtm2KDLpM4Am81y+jFxbmxzOnpB3Dk/GUIyKhFxsaIk0N2QEOv
         AK6A==
X-Forwarded-Encrypted: i=1; AJvYcCX7rgLvaiOB3XFGjJwr13Y8HAkd9WyZ4rkwx+ZUUNo4oRj/AbYpstlGA9F5YcZQvULUgB5O2f4U1yg7vn8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4kg4It8h9mIGwY7pWGgAkWvbw4jpZ1JL6hjpDkHlBuYhKMaiy
	u+iJlUy9lV4r9ufTqZa2cObligkKsYrIttlQd52TlIGyQG1rHoAT
X-Google-Smtp-Source: AGHT+IEhLX1Ix3kvbnhGTk3oM5FNMOle9lT4S2S6mmMGQXogZWZm53W55lSd+4P4hV9Wykx6SDq4ig==
X-Received: by 2002:a17:902:ec88:b0:20b:8ef3:67a with SMTP id d9443c01a7336-211785b1234mr10045595ad.7.1730959893349;
        Wed, 06 Nov 2024 22:11:33 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:32 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 2/2] Documentation: dt-bindings: Remove trailing whitespace
Date: Wed,  6 Nov 2024 23:11:24 -0700
Message-Id: <20241107061124.105930-3-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107061124.105930-1-xandfury@gmail.com>
References: <20241107061124.105930-1-xandfury@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove trailing whitespace from devicetree binding documentation files:
- regulator/regulator-max77620.txt
- interrupt-controller/nvidia,tegra20-ictlr.txt
- interrupt-controller/msi.txt

No functional changes. Issues detected using checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/msi.txt b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
index c20b51df7138..2109a3454cf6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
@@ -12,17 +12,17 @@ potentially including additional information.
 MSIs are distinguished by some combination of:
 
 - The doorbell (the MMIO address written to).
-  
+
   Devices may be configured by software to write to arbitrary doorbells which
   they can address. An MSI controller may feature a number of doorbells.
 
 - The payload (the value written to the doorbell).
-  
+
   Devices may be configured to write an arbitrary payload chosen by software.
   MSI controllers may have restrictions on permitted payloads.
 
 - Sideband information accompanying the write.
-  
+
   Typically this is neither configurable nor probeable, and depends on the path
   taken through the memory system (i.e. it is a property of the combination of
   MSI controller and device rather than a property of either in isolation).
@@ -48,7 +48,7 @@ Optional properties:
   not encode doorbells or payloads as these can be configured dynamically.
 
   The meaning of the msi-specifier is defined by the device tree binding of
-  the specific MSI controller. 
+  the specific MSI controller.
 
 
 MSI clients
@@ -117,7 +117,7 @@ Example
 		reg = <0x1 0xf00>;
 		compatible = "vendor-c,some-device";
 
-		/* 
+		/*
 		 * Can generate MSIs to either A or B.
 		 */
 		msi-parent = <&msi_a>, <&msi_b 0x17>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
index 2ff356640100..0c37e569e6f3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
@@ -12,7 +12,7 @@ Required properties:
 - compatible : should be: "nvidia,tegra<chip>-ictlr". The LIC on
   subsequent SoCs remained backwards-compatible with Tegra30, so on
   Tegra generations later than Tegra30 the compatible value should
-  include "nvidia,tegra30-ictlr".	
+  include "nvidia,tegra30-ictlr".
 - reg : Specifies base physical address and size of the registers.
   Each controller must be described separately (Tegra20 has 4 of them,
   whereas Tegra30 and later have 5).
diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
index bcf788897e44..7484c0728e27 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
@@ -65,14 +65,14 @@ Following are additional properties:
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,active-fps-power-down-slot:	Sequencing event slot number on which
 					the regulator get disabled when master
 					FPS input event set to LOW.
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,suspend-fps-source:		This is same as property
 					"maxim,active-fps-source" but value
 					get configured when system enters in
-- 
2.34.1


