Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A23909077
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:36:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gKD5TXnI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14fy68N8z3cbB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:36:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gKD5TXnI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14dn6Gm5z3cXg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:35:41 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57a4d7ba501so2965977a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382938; x=1718987738; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9oBeI9t2GnUOwDqqWhnLz6JoWWhocuIEEtazuodx7Q=;
        b=gKD5TXnIRE3tPEZpm5bNhi+LE+b0RqMsEzj0WpQ81ZpBogRov4LkeIGHiZs08HU6Nl
         k5/5E8BiBhx1a44Yf56sbMpCFfyglHBueEzj6qXpMNENxB/4KpJxLMQrHVH/nrWHPRXM
         ibSB7Y9uaHJTAsfNLfCOJll0lu1UzJkk5aNUgY65qopZQ9JcnBcjTH20cpCWr1YSXnqL
         58Tyv0szRKEJI304iKLQ1ZkjeQBjzJvMt5S8bDiy20Cb33FwZKM+/Cxf76pykfatBy/B
         XuzOJUZFJdbsCFJdPEeFXiwIiLX8CSgVFMsd4Yp7dGDDujq5VLGcELUlHiWPOfmGpFsi
         E3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382938; x=1718987738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9oBeI9t2GnUOwDqqWhnLz6JoWWhocuIEEtazuodx7Q=;
        b=Q4voSIAQSFCKUL9WX6igc1h606ggHkDOvBpZG90HZ7GrP8UJDVWeP54hV+JX3AL81S
         T8ZjFPV+hPYMsip1XUrFCa+vKZ2loLCVu70Oq/1M0A4yRHhipkfGKPgxskklaFi8dnZl
         y2AEIWdiHcQBMX0o2ll61x0mglKuT+GUrGA1CQzN+tdE22RgJW+nxjpRMVTd3CN/s+e7
         +SkLYF6ucD1JyNCY5qFB4NpGdTo0hLJyy2T1P0B1M6JMil2U18hE+5IxvH5YlsU00DOb
         Vj2qSau93e6sQaG+Mub2hF4FpjuqCd7J6+hmkNqXtk2/n199yzmAkWDb8ILUTnl8fesE
         vn/g==
X-Forwarded-Encrypted: i=1; AJvYcCWeaqiAhweMjDx/GubL00uZ/iTpnYeXqQKkY1Wyl2FpA8hJR723rHH6vv7ptTH3ISevGP6bY71GhImpZgqbEDSwXKTSlprY2rFRHkEFsQ==
X-Gm-Message-State: AOJu0YxIkH4dnl2TgXEgu2XKy1MDwLjX9GgXinZ+n1MmrERdcXZ8aB2H
	Se+9W109fhKItwpcbgyjlpS1Wv+W6OlQPXFHhzGLn1cjAP5iP+6K7xRZp6za6xA=
X-Google-Smtp-Source: AGHT+IHnLwjsD9g/DM137764Vs7MfVOMBOwOsSoO0JMf1vY4fTQen0QFGoBNKv8y01TlfePSSWUDFw==
X-Received: by 2002:a50:c19a:0:b0:57c:7eb6:440a with SMTP id 4fb4d7f45d1cf-57cbd6497ccmr2425469a12.3.1718382938387;
        Fri, 14 Jun 2024 09:35:38 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:38 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Subject: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Fri, 14 Jun 2024 18:34:49 +0200
Message-Id: <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v3:
- Added '$ref: dai-common.yaml#' and '#sound-dai-cells'
- Dropped all clock-names, references
- Dropped status property from the example
- Added interrupts property
- 'make dt_binding_check' pass

Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..04a1090f70cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs, ASoC DAI.
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+  dma-vc-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      names of virtual pl08x dma channels for tx and rx
+      directions in this order.
+    minItems: 2
+    maxItems: 2
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - dma-vc-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      dma-vc-names = "i2s0-tx", "i2s0-rx";
+      #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.25.1

