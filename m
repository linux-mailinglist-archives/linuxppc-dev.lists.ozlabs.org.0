Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268FD91AA3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 17:03:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1qo+vzmF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W91zD5B1yz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 01:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1qo+vzmF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W91xg62vhz3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 01:01:59 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a72517e6225so642626866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500517; x=1720105317; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=1qo+vzmFZRhigKVCF+vSf4wiycLmjckJNnn8hiSVtV6tdEit8xy1/sQdC5yDDEjKDK
         q3zH4WhunROQVMnTIn+GjuluclZ9B2r/vW5qQdvvFlfstTMrHUto0NWNcrd26GxFdvdE
         P+e0BC/J2I1l9AWCqKjg/RSPOPt6aCt7ZhRHqViDOCiRTSYMnlbvOU/HuwSZ9uuzNEW6
         YQHIl2bG2NC1ggo76YpjfVBd4pSrBm7TiDktgguZ0zOsq1B2ky60a5TKmEyVr8m1ujQh
         Dy/pPQux1b00Es5fkwUTgv0dGCZX84vSfaS9PPI4yPVUW9jRJY/ll4Eltn7vSdj4Y/ZM
         S7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500517; x=1720105317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=Hzr0AmV3owEtefz9cyhVRk8gFGQSMklqew3TDICrl2fGhG9FK2KHW4uLRFaKnis2s6
         B2mVxYAGJx3CzEK0nJXCDIwDigc83p4WwFDil0GXnrwWCsWaIwWdnIDzZPiMvIkz3T7a
         ezcSmxkZURA5JPJNfqqOhhCuPIyDKPIx6ut9zEbB7Tr90BT1Sm02B39PGqH7jaoPtmn9
         BdZxQp+gf1bhAm0ERkRn+krfhDUS/fVeQVJGKOMjfDIKHpsTGVjOz/qNtccKEuicVbyZ
         jpjCUHAOH/0morcKjZmuZRODGNBcjPzW6wdzXzzFVEhGsXYhSgRz6shijiiSZJJDHquX
         rIWA==
X-Forwarded-Encrypted: i=1; AJvYcCXY8tJyPWvK6W4w83eVD9O4MkhA/IInGTkHc2mR5Hfg9IoB8nL8NG1hn6RA6z5mOoeZvyV3RWjpawbU6Kg90iRrmo3/m3sFqyOZi7ZuGw==
X-Gm-Message-State: AOJu0YyjvkhG3MVTZlqbaYmY1+t1/4CxoT9rBTmVr49GaVrM+02JhjwL
	8BEPeNn3vhMRb9TAcYG2dZfMPAJkNF3FzVnxp3x0EWNG5YDW77jQZVyzZsYDzNM=
X-Google-Smtp-Source: AGHT+IEWo8x1/iXINSSRXRjfHX6NuiOJZ+9H3uzsJ+4Q86IVM9o4hb3qxcQgbAHUbFD+wWnFiMHwIQ==
X-Received: by 2002:a17:906:4a12:b0:a6f:d085:9e32 with SMTP id a640c23a62f3a-a716593e3efmr933093866b.76.1719500516992;
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 27 Jun 2024 17:00:20 +0200
Message-Id: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Corrected property order
- Added maxItems to properties
- Fixed example
- Removed "N:: from the MAINTAINERS entry
- Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers

Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..32f208744154
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  reg:
+    maxItems: 1
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+    maxItems: 1
+
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@7c {
+      compatible = "nxp,lpc3220-dmamux";
+      reg = <0x7c 0x8>;
+      dma-masters = <&dma>;
+      #dma-cells = <3>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..79b44addc139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2384,6 +2384,7 @@ N:	lpc18xx
 
 ARM/LPC32XX SOC SUPPORT
 M:	Vladimir Zapolskiy <vz@mleia.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
@@ -2396,6 +2397,14 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1

