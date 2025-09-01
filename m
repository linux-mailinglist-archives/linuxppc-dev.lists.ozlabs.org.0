Return-Path: <linuxppc-dev+bounces-11589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F0B3EB6F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 17:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFtcw5Df9z3000;
	Tue,  2 Sep 2025 01:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756741840;
	cv=none; b=VAMoBsiq4Qy3cPtjmxnnBy8Mp0t/nMWBcsGv/ajQURraKnPbh79BnRW8PEA8drEaXliRSdKXsk/9vqOoxrAwJ9BJ8ZzpOV8b2KqWJL5ytk9e4ahPIoCMQb+qgpcFh1hsRcBSDDPKdyhEIZkn6NsHmgz2vOtLvY4Hxe8y0fu3kJHfFNMrF6Lh9IaGBpPDgssX3gsKwRaoelihWJxvfbwIwjNYlE2uzjHSbYf3tPZ5BGeebTH7jUs/5971QRrVx3MxKbztQH4I4iIzh7JbEZuVNi5juVKPtrCpDUr6VUJAm9xsUTkWUvBc0288CZRYOPqr97JzbbHBkOw46/x0deMrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756741840; c=relaxed/relaxed;
	bh=+NcYjXUcgSUfyONIom0k0pSDonkPMPGHVx9VdH1/2wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkWsrleh4NBazeJffL+3Aj3JUI164ca/V5sXX0jumf981lM0P9nfc/YQ52qqra7TZmMkmA03YLTZQSaANA0CsYgFHbcOFpcpBkjPpPpWdqCfkebTfx+9pzZYD9ckK+uO9YNuaezX29Uo/xnRnCZTBIFXDvuxEMUhaUcRHmf+2oamkUa0pSFt+mmXS3ZgpaBc/r0XtkVG31KKopEG97FFx6h+t0MvZX9xVZWCab1r4sQplSE5eTKpxhcbiCDMZhPzYvP9ssIXxbkcLvXw5iahftRcFmeSblfPP9d1iW/nQtsCfm9Oj2/R/Jc9aS0Z+RfuSaGw0wOuBk2p04/e6ltHNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFtcw1n7dz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 01:50:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndC21Vkz9sSh;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGxryqrUX_hV; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC0tmwz9sSb;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A7888B790;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MoqCpBZoSEHQ; Mon,  1 Sep 2025 14:05:34 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D60908B77B;
	Mon,  1 Sep 2025 14:05:34 +0200 (CEST)
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
Subject: [PATCH v5 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon,  1 Sep 2025 14:05:07 +0200
Message-ID: <cover.1756727747.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728307; l=2473; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OQso3M18Z5ORcR/fPWxtfj+ukdTn1jxV4K9Dtp+9ezM=; b=Sa0OBzCBpoGN4HMRxzJnWdq9fZNM5lvmxW/10//o9X7BqvBcy9RkfTft0Q6Nj/WX5r6Z8iMS8 woenspJQt4yAzoKwVux1Pqldu+JN1n3addpi4kD64aZS57VTiqX3XlF
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

 .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml |  76 +++++++
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  26 +--
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 209 ++++++++++++------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 +++++++++++++
 7 files changed, 438 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


