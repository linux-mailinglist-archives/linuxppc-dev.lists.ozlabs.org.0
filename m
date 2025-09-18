Return-Path: <linuxppc-dev+bounces-12400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25BB874AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 00:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSW7d5W33z2xnx;
	Fri, 19 Sep 2025 08:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758235837;
	cv=none; b=noAiKBwkeaUu1fchUrdAGR3iGb/5R8INon3xyjo9hBrF+DX3qIzo7K3e5FqSz+rHjkwffcTzdg1omYIA+9ta2zpfChl5H8nJ9j/0ynoINVwrYgsUE86IiJWpI+cIqKlap6hY2Yr3a6bW16MsWVTLonnjkTXlfVha9rFwnCt440xb1XShJdz3PfR5pOUzIThIlaSLvC7BKQnd2xO2pRuFxXCTPxjt4m74IBO/UoFnfNKs0G6TaszAodjdCEQB5obdwXDyvlwAkQt6jnGJiyaXsh7drlc51gQoj0MXDUWujYXso/1vAmK/f9garcl+27unX8lXoJppgNId03Kgm6EQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758235837; c=relaxed/relaxed;
	bh=DPFj/PUEJX2Mv5IIZorbPN+reFYeZuyiIswoEUsZNxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+SBqJDTPekFys9OabWkatQ+6tFuPas0AIHY/8j1SkqDvWlz1JM5DfPbzlkyqUIAc0SEJtT81HYJR583GqRgjAQut4lsW9VplIZMuz8iurK2YC6i2GX0loxbZztdnfS0XjnZdkRb2PVyA8dlhRv3KtHjef4dJAayrArA7CscAXxxj9a+t3xG101XcJCBB8BukOPBipdClr/ZfaIp+d1LdB8ZTAeIZW9PmTtuYPce2i8s1AIgSUxMnoIkHLbC3gRAVbisSe0Q2JPbdhV7XVG5lsSeEEIfwX75dLnb4BPpjJv+mTVtSDXjdSf9R49r+LPIy/updpMNCpN/2dZDc/3mCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSW7c6ZyBz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 08:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY10Mbrz9sfh;
	Thu, 18 Sep 2025 18:23:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sO3sKZP93SXY; Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY06MC6z9sff;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9AE08B776;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9SmYjYN9p3HL; Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D1588B767;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
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
Subject: [PATCH v6 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Thu, 18 Sep 2025 18:23:20 +0200
Message-ID: <cover.1758212309.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212605; l=2729; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OgCnUIlKw1JxR7kjRn4Et9d8YymbVWaWOnW11EryMBs=; b=kJ17167SdnC2brfs/6ZVeip2FJrVuZWNePg7vhRzccMHLW4xR2hWSncCA8JgOKj0R2u6IENLD yr/kbkEH4dEBRTTs5kh8I0ABfpN+NWO5uki35VvaGdsWBxh54sMSOg9
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for those IRQs then add change
notification capability to the QUICC ENGINE GPIOs.

The number of GPIOs for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 GPIOS supporting interrupts
- mpc8360 has 28 GPIOS supporting interrupts
- mpc8568 has 18 GPIOS supporting interrupts

Changes in v6:
- Changed mask local var to unsigned long instead of u32 to avoid build failure on 64 bits (patch 4)
- Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.

Changes in v5:
- Replaced new DT property "fsl,qe-gpio-irq-mask" by a mask encoded
in the of_device_id table
- Converted QE QPIO DT bindings to DT schema

Changes in v4:
- Removed unused headers
- Using device_property_read_u32() instead of of_property_read_u32()

Changes in v3:
- Splited dt-bindings update out of patch "soc: fsl: qe: Add support of IRQ in QE GPIO"
- Reordered DTS node exemples iaw dts-coding-style.rst

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (7):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports
  dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
  dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO

 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       |  72 ++++++
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  26 +--
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 209 ++++++++++++------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 +++++++++++++
 7 files changed, 434 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


