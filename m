Return-Path: <linuxppc-dev+bounces-11249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E6FB33DD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 13:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9SyY539pz3cgQ;
	Mon, 25 Aug 2025 21:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756120837;
	cv=none; b=jn36Ek8B4hpbYl0byfaZ2rwbR79N4rryG3+X3V93kQ14ZhNapp3g3qqQL8XCwIa0T2ln0MdrwP0yE5v+Es9rJQoiuw1OtVPo7g0fhN8urC8felA+inAdW4sHLpGMp8Tzz8fHO65OoSpJvQvUezWX+d1QNpf/XxHeU8dQKmOCzmwPDzSg6K/nQGA0l9pEE1sCSEaDrTtx28yRrMvWI95fR0LiwYuvBVveHlTtpsi1S9Xrim+GrFoywV/+lIJBsjrJlTRoeMgjjGGGrVAH4XY2Oct4j17Ji9OyNTrn8Jt9IevqlQX1m0CRry3ZT5mXx8bX+REY4SQoERrdAqNpmr/5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756120837; c=relaxed/relaxed;
	bh=ACH5U9dmCOjUKPYlykUZNIaOxITsGB26E2+zSyyJZ0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bs0M3rrSsTV2EnmTHS8Q8fXn2l7WeyQVdGylqek+g8ioGVxz78NXEnFe0NsnlWCWjCRQFhLI2QhpGDEErS/CU578KoyNnHXkMTKVKHOPNhLjNxm4XUXImqCLNdPDLgz73mAR2a0IWfBORAJSHU5L8F7tonY48xomaFUalsIsL5aNEYCtN15JXCx6X6JWcgeoKhosSH4fDoCBxpqUaufKQ6/i/DUqy/Dnt8+80cbsC6EiLHeuBbNc+XmavEIVslpnluGACa69nOHScWpMTvi/mH4Ls+2KtWzK+wNwB5xnMFfnAfvE8EUHOWbzlVa92WnvzkBrzUIcncgXUKnBEEvgGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9SyX6S51z3cgy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 21:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M286c6Jz9sSL;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxLSvRcp4PtP; Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M285rFVz9sSH;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B144F8B769;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 79Duc9-z2n-g; Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8845D8B765;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 25 Aug 2025 08:53:15 +0200
Message-ID: <cover.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=1967; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=9gU8poKsNJSgCMj5IC193x1flh8SKIRE7FBDWszpiWY=; b=s6s0Zoi/uoWVoB6Dpqtqh36eyBdZYPiQX7Lsm4T3peSJPKqTrsYBsGx5vTJQ1PXR5nzJtkHfw rRSUesOi+piCK4lY6+crj0YPYpBjOJvpltbn2OeKjzVgBzPFYDj69GD
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for those IRQs then add IRQs capability to
the QUICC ENGINE GPIOs.

The number of GPIOs for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 GPIOS supporting interrupts
- mpc8360 has 28 GPIOS supporting interrupts
- mpc8568 has 18 GPIOS supporting interrupts

Changes in v3:
- Splited dt-bindings update out of patch "soc: fsl: qe: Add support of IRQ in QE GPIO"
- Reordered DTS node exemples iaw dts-coding-style.rst

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (6):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports

 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  19 +++
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 145 +++++++++-------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 ++++++++++++++++++
 6 files changed, 322 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


