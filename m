Return-Path: <linuxppc-dev+bounces-2956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0799BFE5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 07:18:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkX2J0wvbz3bk0;
	Thu,  7 Nov 2024 17:18:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730959896;
	cv=none; b=XwqE/3wNoFgmxTKsjOge6hje4Vbh8GBzPPD5JBoJ0DBkfqwSgMf/gAm04mkUu2Iif2NXj5FYk7raYZZOLYzHX+Ld5PZydztYB+P5D+2AaOE8Ff/l8Ao3emhbZEP+oDA9fJ3yuiNXVCda2jOtKftv+dDlYKOZNiDJVEgRTNdBwayO4Mpiv6Jvb4KYUL6FvGWnO8/ydm970Hjzjj+D0S/RbdHYIRRGWzJgJJwWw5HKdhuLGjFwDp6IR7TjvprsVpa6N/DlT2hoETuxk8Rnm4t31tF7SxxnBNPU/uAj9hLySuujwxzFNGeEJSSciOb8Xx4VcLDqSRsUamaivbIqUBTFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730959896; c=relaxed/relaxed;
	bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OKv9ek7I29i6NOFAtjt472LcXXc7eH/JprCTQTTfX9Ql3otjWGl5Xrwed0djc7gT4hrplL2/OqvvNvLqOze28KJH4vhaPgZOvqlrWU/g1sEtFxtljHiLZYxNxJms0Pxg1wFkNT2hcAwltCfxXKiFJeKF0LwMO1zx9JhAG9VLK8OY9q42SMuMcMv67SdWKKP3ue9qt3zDZxLp8wubs7slSVgv2ASA24yiDGTnvlDXqUTlYcQCE0Vi5gR7mcny+XyjHpLICQNgO9hUG8dQqKQfexwErssnitg9u7fb0pzF7gg+/PtL5/WbmqOtDKxxdRzzwxsdZzvWl8W7KHJk95GQ2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LOLVvL2a; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=xandfury@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LOLVvL2a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=xandfury@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkWtH34wDz3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:11:35 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cb7139d9dso5952145ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 22:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959892; x=1731564692; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=LOLVvL2aOlWX1fSfKBLxeRiboscPg69vYDEiqwL6CoFqkysDtFeBjycNrY/qRCHSXx
         lDdrsv2VtXXuCDur/YO/jINYRLJHHrLvv/Qnfv6GKn2FIU3rG9W9T+fFGXq1T4Zylf2j
         M9d8TIqc0c9vkvWQxegl8ndKRzVGij3KDjlH8QWo6olP3qN6sZpVhlrxLdDpssEbXXlw
         gW5lfolQA9W5w+IBxTskekqqAUVz3QOnC6ctMlWBpGgrZqb6J43R7jR/5e+iB2YO3foA
         /iQeYTuV9AcwnZ/jHF7eWbvQ9xDADYmfCc4p1prM9nMWb8uzspX1R+fBwdIJqdi21PKB
         5dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959892; x=1731564692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=AuNuyoZ7BBX+T8tne4O6nAofUqJ7zubJDQ6FHpylmNgTo2BOq4FedQ8/ells/+u5Gh
         gY5103f4rUSwnrzI+yN5GdWdnhUDENkY3zLuiEXnPZlJcPyXhBVVBV409Pc/gzpKaiFA
         eukYTDqCjPw9uNfZOdq3PcO4xsA9g46yPzKobnuS0SqECp1hL6yi6z3P7S/EDgFA6znl
         F5YFgpW/s3ZpJn6HI49z2ZJxRD2/nLOKLq3fDUAkXF+K1GqBpS24vzbgmafZtY4qRqrT
         9sihf/+2jium5t2aYfg/da08clf9N9oOkjNJN6IoxBCI/WsWM/A+Ct6C/zzL+X21b595
         L4pg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8msFS+oid9MTWdtZoz8dE+uw0DNOZFB+Vw8sAA1lJDBNaPeB4BMzL+QRFDUHfOAUxLLer5UQ4B0YqbY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVcioFULKkzS2jYrRwp98lbeGWdwnig4c+t6j+yh1iC3eYLIFP
	xl+fRL1ohOjBb+9swm5qaDjyXivPe/5ddi6OOu4Vj8+Li5nfG3N/
X-Google-Smtp-Source: AGHT+IH+74hwtw/dolRKBe95lMKx0IkBL+BrHnQnQvcxznJIGMkm653MQz7fgmgSPs8j9V5HslOTGw==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-210c6c3ec78mr584066825ad.41.1730959891752;
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
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
Subject: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Date: Wed,  6 Nov 2024 23:11:23 -0700
Message-Id: <20241107061124.105930-2-xandfury@gmail.com>
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

Fix unintentional word repetitions in devicetree binding documentation:
- usb.txt: Fix repeated "two"
- mvebu-devbus.txt: Fix repeated "from"
- gpio.txt: Fix repeated "Both"
- pinctrl-bindings.txt: Fix repeated "device"
- cavium/bootbus.txt: Fix repeated "one"

These issues were identified using the checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-
 .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
 Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-
 Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index d82c32217fff..530420475a4f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -304,7 +304,7 @@ pins 50..69.
 It is also possible to use pin groups for gpio ranges when pin groups are the
 easiest and most convenient mapping.
 
-Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
+Both <pinctrl-base> and <count> must set to 0 when using named pin groups
 names.
 
 The property gpio-ranges-group-names must contain exactly one string for each
diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
index 8b9388cc1ccc..1983d7eabd2b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
@@ -43,7 +43,7 @@ Read parameters:
  - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
                         Mandatory, except if devbus,keep-config is used.
 
- - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
+ - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
                         to read data sample. This parameter is useful for
                         synchronous pipelined devices, where the address
                         precedes the read data by one or two cycles.
diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
index 6581478225a2..1bc655d285ce 100644
--- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
+++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
@@ -15,7 +15,7 @@ Properties:
 
 - #size-cells: Must be <1>.
 
-- ranges: There must be one one triplet of (child-bus-address,
+- ranges: There must be one triplet of (child-bus-address,
   parent-bus-address, length) for each active chip select.  If the
   length element for any triplet is zero, the chip select is disabled,
   making it inactive.
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 6904072d3944..500b76ba2ab3 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
 own binding.
 
 The common pinctrl bindings defined in this file provide an infrastructure
-for client device device tree nodes to map those state names to the pin
+for client device tree nodes to map those state names to the pin
 configuration used by those states.
 
 Note that pin controllers themselves may also be client devices of themselves.
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
index da13999337a4..682db2b561bb 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
@@ -3,7 +3,7 @@ Freescale QUICC Engine USB Controller
 Required properties:
 - compatible : should be "fsl,<chip>-qe-usb", "fsl,mpc8323-qe-usb".
 - reg : the first two cells should contain usb registers location and
-  length, the next two two cells should contain PRAM location and
+  length, the next two cells should contain PRAM location and
   length.
 - interrupts : should contain USB interrupt.
 - fsl,fullspeed-clock : specifies the full speed USB clock source:
-- 
2.34.1


