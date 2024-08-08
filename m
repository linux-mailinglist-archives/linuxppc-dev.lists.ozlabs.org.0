Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C794B788
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:19:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ey0H8fSc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdhk5JPPz2y8c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:19:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ey0H8fSc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWm44NJz3dJV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:48 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id CAD03C0003;
	Thu,  8 Aug 2024 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0t/o0co0d1KQA15WVvII8idKUoygO67sZkZArazSEUc=;
	b=Ey0H8fScvVWHJDOw4UD96x/pxP0Mvii7cO2j8RzqYOed14eVRrc+EQaMahc9azEqb6+GGI
	ymwgCyZEWAr1vr1iqrhzElJWNWn2EsTOYPUYVTqv0MVSYyrFGI54HmxqOnk5EM5CKmKkyn
	bMQNYRqf5yu8oLkwOBYeGHO1ZuC1xs2fxSh+i3/VQ8nGib1nNKqgeqAHABAfEkhuFRpqmC
	mzTTKU8411WW4fLodKecEhSwiCuY4X0rp/e0PRbey7UM8phfaJXzWAIMcV/ww6m4Vb+Y3D
	Mnp2pw5Fnt1E7pNq6Ro3eLvdOAXqwy9DCA9VupSXXV3maiHukulTzPiYvWzDkA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 00/36] soc: fsl: Add support for QUICC Engine TSA and QMC
Date: Thu,  8 Aug 2024 09:10:53 +0200
Message-ID: <20240808071132.149251-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This series add support for the QUICC Engine (QE) version of TSA and QMC
components.

CPM1 version is already supported and, as the QE version of those
component are pretty similar to the CPM1 version, the series extend
the already existing drivers to support for the QE version.

The TSA and QMC components are tightly coupled and so the series
provides modifications on both components.
Of course, this series can be split if it is needed. Let me know.

The series is composed of:
- Patches 1 and 2: Fixes related to TRNSYNC in the QMC driver
- Patches 3..6: Fixes of checkpatch detected issues in the TSA driver
- Patch 7: The QE TSA device-tree binding
- Patches 8..13: TSA driver preparations for adding support for QE
- Patches 14 and 15: The support for QE in TSA + MAINTAINERS update
- Patch 16: A TSA API improvement needed for the QE QMC driver
- Patch 17: A clarification in the QE QMC driver
- Patches 18..22: Fixes of checkpatch detected issues in the QMC driver
- Patch 23: The QE QMC device-tree binding
- Patches 24..31: QMC driver preparations for adding support for QE
- Patches 32 and 33: Missing features additions in QE code
- Patches 34..36: The QMC support for QE in QMC + MAINTAINERS update

Compared to the previous iteration, this v2 series updates device-tree
bindings and fixes issues detected by kernel test robots.

Related to the QE QMC device-tree binding, I kept the unit address in
decimal and the 3 compatible strings in order to avoid blocking the
review waiting for a confirmation. Of course, this can be change in a
next iteration.

Best regards,
Hervé

Changes v1 -> v2
v1: https://lore.kernel.org/lkml/20240729142107.104574-1-herve.codina@bootlin.com/
  - patch 7
    Removed redundant sentences
    Removed unneeded property names from property descriptions.

  - patch 13
    Fixed issue detected by a kernel test robot:
    cast to smaller integer type 'enum tsa_version' from 'const void *'

  - patch 23
    Moved channel compatible string to the first item in the channel
    property list.

  - patch 32
    Added missing device.h header for devres_* function declarations
    (issue detected by kernel test robots).

  - Other patches
    No changes

Herve Codina (36):
  soc: fsl: cpm1: qmc: Update TRNSYNC only in transparent mode
  soc: fsl: cpm1: qmc: Enable TRNSYNC only when needed
  soc: fsl: cpm1: tsa: Fix tsa_write8()
  soc: fsl: cpm1: tsa: Use BIT(), GENMASK() and FIELD_PREP() macros
  soc: fsl: cpm1: tsa: Fix blank line and spaces
  soc: fsl: cpm1: tsa: Add missing spinlock comment
  dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine (QE) TSA controller
  soc: fsl: cpm1: tsa: Remove unused registers offset definition
  soc: fsl: cpm1: tsa: Use ARRAY_SIZE() instead of hardcoded integer
    values
  soc: fsl: cpm1: tsa: Make SIRAM entries specific to CPM1
  soc: fsl: cpm1: tsa: Introduce tsa_setup() and its CPM1 compatible
    version
  soc: fsl: cpm1: tsa: Isolate specific CPM1 part from
    tsa_serial_{dis}connect()
  soc: fsl: cpm1: tsa: Introduce tsa_version
  soc: fsl: cpm1: tsa: Add support for QUICC Engine (QE) implementation
  MAINTAINERS: Add QE files related to the Freescale TSA controller
  soc: fsl: cpm1: tsa: Introduce tsa_serial_get_num()
  soc: fsl: cpm1: qmc: Rename QMC_TSA_MASK
  soc: fsl: cpm1: qmc: Use BIT(), GENMASK() and FIELD_PREP() macros
  soc: fsl: cpm1: qmc: Fix blank line and spaces
  soc: fsl: cpm1: qmc: Remove unneeded parenthesis
  soc: fsl: cpm1: qmc: Fix 'transmiter' typo
  soc: fsl: cpm1: qmc: Add missing spinlock comment
  dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine (QE) QMC controller
  soc: fsl: cpm1: qmc: Introduce qmc_data structure
  soc: fsl: cpm1: qmc: Re-order probe() operations
  soc: fsl: cpm1: qmc: Introduce qmc_init_resource() and its CPM1
    version
  soc: fsl: cpm1: qmc: Introduce qmc_{init,exit}_xcc() and their CPM1
    version
  soc: fsl: cpm1: qmc: Rename qmc_chan_command()
  soc: fsl: cpm1: qmc: Handle RPACK initialization
  soc: fsl: cpm1: qmc: Rename SCC_GSMRL_MODE_QMC
  soc: fsl: cpm1: qmc: Introduce qmc_version
  soc: fsl: qe: Add resource-managed muram allocators
  soc: fsl: qe: Add missing PUSHSCHED command
  soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation
  soc: fsl: cpm1: qmc: Handle QUICC Engine (QE) soft-qmc firmware
  MAINTAINERS: Add QE files related to the Freescale QMC controller

 .../bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml   | 210 ++++++
 .../soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml        | 197 ++++++
 MAINTAINERS                                   |   3 +
 drivers/soc/fsl/qe/Kconfig                    |  18 +-
 drivers/soc/fsl/qe/qe_common.c                |  80 +++
 drivers/soc/fsl/qe/qmc.c                      | 667 +++++++++++++-----
 drivers/soc/fsl/qe/tsa.c                      | 659 ++++++++++++-----
 drivers/soc/fsl/qe/tsa.h                      |   3 +
 include/dt-bindings/soc/qe-fsl,tsa.h          |  13 +
 include/soc/fsl/qe/qe.h                       |  23 +-
 10 files changed, 1549 insertions(+), 324 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
 create mode 100644 include/dt-bindings/soc/qe-fsl,tsa.h

-- 
2.45.0

