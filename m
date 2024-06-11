Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FDF903BB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 14:15:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fHe3IBXz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz71L1W2Nz3dWF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 22:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fHe3IBXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3lh3ZRpz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 19:48:48 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so1144617a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 02:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718099325; x=1718704125; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3URf1bqoxt6RvPsq+unfHOhtdPyrUcD08+rrLeED5Co=;
        b=fHe3IBXzYH2ZX5RaJKpx+T4KRfmZ3G7Y8yDB6fSsprk1PyacVEXEJHrFJy4GFAdJGK
         kNVOlQHeyH8h4DsXeju1sMf3i0R4iimkP2Nx650rciKvcjiODG4FMTXNqHtw48PEm95w
         0W8jbVtYFa32tMULgel6OHComH/uS16FiDdLZ92wi8QhDuZV3QBI2caIhzmRrEZ/J83E
         sTu6WcyAAzi5G6vdXzy7J1I5kOJG0UjEMZMHNQlVP6YAyWxNKONExwwquDkyLVdO2WLn
         /WDMTHEnBiF3wj9dtmWsrh+Q4BfJqMmLiWt+iXToWc5ABFqQomRpCuWu3G0+3I/eiBA8
         wSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718099325; x=1718704125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3URf1bqoxt6RvPsq+unfHOhtdPyrUcD08+rrLeED5Co=;
        b=DA/O0yob1MRk6dBb4yv0mYItgxtMqPt7ohdaXNHFCa2+t5b9hbYm9qjLp+v3mEj5L3
         UslTCMH4jE1H01dWHH+IhL9qD5pfiPhxyt7ByvDCpWNWvm1ec0rQj2EIGn5VwHQ5ly0o
         2Ifg8HUlr5lSdT8tXKuAnulFQkmXL4H2NzgMiKgGeUo56tMQAOH1fPdDpA8Gn78gdYxZ
         GEUsUhNY0zmv29PYmrxFuYLVCTNfXwSU34lxjG9Ahg+tegbxwnfDUyoYcICNmaU7lEZL
         laolSWgB0PRhNxpe7GiW2v079D2doqmM+DspxNOtNJvAz19tBZyL+bacbZyROGrjM5j2
         ORow==
X-Forwarded-Encrypted: i=1; AJvYcCUBFFfw3VDOmC5fAi7aosJvDseWxTya23wIt0GT9CnkdXrpkwAXAMAm1LrQitZZXSdVnFKpC5B1H1sTpiev9JxzPwH+ztgm3qLJ9HJ7GQ==
X-Gm-Message-State: AOJu0YzogNapq99JJu52WId8F3FLOMAkpSzCsEf3nFQtlnVGtxhDx3hp
	2eYF2mrNyi5FHOM/Ou25/UYMyUgAhnslYflrejs6KlLN2E7+vf+H2d+urFOKIs8=
X-Google-Smtp-Source: AGHT+IF14ZNnXOfobI/WB8lXVND+Ohqa5JoXFDW/TfmN1pVZr0QdPr6CGSC0zuZrHL1qY/x7lEYXOA==
X-Received: by 2002:a50:d712:0:b0:579:e6ff:c61f with SMTP id 4fb4d7f45d1cf-57c508fd7f6mr11085689a12.25.1718099325105;
        Tue, 11 Jun 2024 02:48:45 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae2340f6sm9059647a12.90.2024.06.11.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:48:44 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Subject: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Tue, 11 Jun 2024 11:47:52 +0200
Message-Id: <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Jun 2024 22:15:15 +1000
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..66e48d8a5a1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs to interface codecs and other audo devices.
+
+maintainers:
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    i2s0: i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      clock-names = "i2s_clk";
+      status = "disabled";
+    };
+
+...
-- 
2.25.1

