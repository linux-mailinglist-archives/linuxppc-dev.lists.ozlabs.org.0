Return-Path: <linuxppc-dev+bounces-11117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81921B2B88E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 07:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5dFy56Nyz3cmL;
	Tue, 19 Aug 2025 15:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755580838;
	cv=none; b=BTL+h/ESMTqQulSOia+dEqQGUFx3/ZFt2UpGBFpe0izw68+re+3bVKnlfvYDb4nP6OB7mbdHlPu7GNXZfxDS0Vnd4qgGjnUO56ggsy0JCkX/IYDbftUG3rvdHF3hsRcV29zn09gNSzVMZzciHVEuDAyI91lDwFp0kVYWJN8KLOzURJl/IklhQhZg5RqqEiPlEjUYLZ960k/k5C3vnbTUv5oxdAJvfS7gfLYL3UMno+mvtHL9iz5OhKNFKKs41gmU6U5iGLwhXia4AKcvDAdYi9LS2mc9Dn4X5NtsxHVP8hdE6PWhyIJIy/xH0SZl4stw+zqGaAwDD9Z4YiNDvV6ziA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755580838; c=relaxed/relaxed;
	bh=nGAq5y1YthkCCojB7chAyhWy9Ut5m2mSfzzsnreDc/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=javTGRgq6OPMejuaRn5oCM1l+W6Lihi4ztqtqB1Njj/RqchebdRD58A/SkyZozoZzq3QLZipGwQ6NcIF35qhlFnavqHQDvKRS08xSILTMxFq/r2z0Lw3EcOyG/NLZz0IF19+TX09/Mo9kPxInQ6cZAqv0U2if1O4TTl/IIC/cCA8ltbXq9doUo+TdmTZNEmvZS7RTOT+YffVW/3KSlFhy6XwkilIbFwW/hwo+i/MSEuk2jfs+4IBXGNHvJEt2xJiHyri5ZM9MJ3TIb7uZ8W++FzAOmE78JE3lVC9r0bqhzIF6o3kicm8+xvrMcgUi4JJWAg0fcB2O/NnSgJC5ei95Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5dFx62mjz3cm7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 15:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sY4xgJz9sWj;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKGrlbOf_Qrh; Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sY45ysz9sWh;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 767258B765;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MrqQklRryYxw; Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E0F48B763;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
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
Subject: [PATCH v2 0/5] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 18 Aug 2025 10:45:53 +0200
Message-ID: <cover.1755506608.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=1744; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=0zMxvMtVDYI3C0qUdfZ4EOBxyOcB0ghTKA2N/7FYUng=; b=tL7X0n2yGtytrRK48Qz0+3gJn380KbagfKlBBXXWBcvgq0NLI5zZcEzp21zG1+Ed5JQcE+B8J 79JqZWIKUf0B1fKRLDVzvS9O6zqRvtkttEaDYwlmtNYrscdF30FdLSz
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

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (5):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
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


