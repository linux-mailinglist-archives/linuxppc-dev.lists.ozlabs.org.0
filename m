Return-Path: <linuxppc-dev+bounces-10873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C85B22B05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1ZDs3cY0z2xQ0;
	Wed, 13 Aug 2025 00:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755010237;
	cv=none; b=FZATky39IJzKWyPUGRrBWt7zW18u544m50Q+nrPVCDiw2vD8fD3Dfv4vJR33CvBmVXkf0RvXL5+Qm9qnDYmXhP9Y0cGVTZ0AthgRxdXd6bIUaW7vKkoLqimSdo6GGgHfTwmq4hUZCogHaC7POYvpD++r4U06bAxl3c4lbx12+H0F5xgxBf4ECZkZG2QJHmJL97doil0LHiHN0Pm95pPsXFvgVk6gmPzo/GN3obc+KtM7L9WZWOX7VLy1Ig4tDcsI/HcJj+4o4wn9c2Fqre0/RtPcAbHlDEzjQ6iWMjn9xSOvixmv4jtzWkJ1/ITH2jK8wK/09Bq/H1cY+xL2nxmwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755010237; c=relaxed/relaxed;
	bh=Oi0Xxx1TJ8BNWP99I7t9epnQK0iYBf9hcB6LTNITS28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aaxO2S5uy+YjX00qhSvObGGqTUHf3uAc/mrm+S3LyxCOn7mNLHDB7mFmHd4lMtBk3BxjhzZ033hMX3+acej5l8MANFV5R7jdyLphC3Ke2arpmvLQve+JgZgTbvafeeceEsCIFxJw9yTeF26+g/hRJZVjCSYxP4WNLBx8KXnz3jGmx8rk4K/lG5wz1zGo6AR9Wzgrc66IugPA4OC1ZEQi77sHblLvYeVFmmHV9pAXSh7VaeGjkdGOuFjhePHczEyx1DSZLl5GKDWEGQt1602rQdr0bDisxTGA8RIUdrYD0nn1rj2Z9b+2pUwTgCuetp9AiXE5eOENAqyAssWGxd7KlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1ZDq4gw9z2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBM3vkpz9sSq;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olXeWImUxYKy; Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBM395Mz9sSj;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 56E5B8B764;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MNwkCkkNJAtR; Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2D138B763;
	Tue, 12 Aug 2025 13:03:06 +0200 (CEST)
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
Subject: [PATCH 0/4] Add support of IRQs to QUICC ENGINE GPIOs
Date: Tue, 12 Aug 2025 13:02:50 +0200
Message-ID: <cover.1754996033.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=1268; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Cv+al3RkR0a6hj2nZdT3jnct2NEsZKUY1Yamq/g80o8=; b=fFl+7sV7wvWfoxhth6KvVgNiahxwX5fogT8IfnRNTZTK/9CrJvm+FZscOIx5Gp5mTTYv+jMxX /4BNU07obY7DwKrRVoPtg/YU1mQp3Qpsf7Va6nL30foeAvVGTv6Sg5z
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

Christophe Leroy (4):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports

 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  63 +++++++
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 108 ++++++++----
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 ++++++++++++++++++
 4 files changed, 293 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


