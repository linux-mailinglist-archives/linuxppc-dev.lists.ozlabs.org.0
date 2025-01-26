Return-Path: <linuxppc-dev+bounces-5564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A641DA1CD91
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 19:59:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh1711qy1z2xk1;
	Mon, 27 Jan 2025 05:59:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917949;
	cv=none; b=EgZ6RgoUqflevM9stqLj3s6C1XwrMpfCcxLRcub0XPxA4JmmLArs66OizbkzUObUPKwQCLjBULYHhme/ojwHC36iXv1P3Kt2fSZJLsYhxWRd8NgvjhQd7hAXwAeG6HArADR2kZ5cSIC5OkaSuciIo6F2mv3yLWXoABYbN2YMHfSKi5DxGCGrM5KA90Wi6ASqKU12MnVDyFKs2owBCykK3x+MGb7Ea3p8g3ze3Kv4mGBJcMqAw8kc7ADJh0KjUBf79y+sF8YYUw8BpzndmZ7jdPzn+llwNTH0TaTbP24CxJ6CNYFl893h72VyvglKOBhdtcim+kaCMQe9Dxa6Nl5Q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917949; c=relaxed/relaxed;
	bh=Rgu424WbP0zH0PIyIPxqLWYOrryTYaaY5pFzzOd/5+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FKdQyL9QEJjqDq3hTv7tCQClcdDFSdoHO2xlFZt8XMhf8xRo/2Gg5bUp1uCHWiaNcT5gnrHvyxBmnzEJshFab6wXJrTpMDnqgWl0lAAZWRkqYFVZuIjGHGJTGbMx9VQOLtrmDlR8B+nHxKODAn9nDm3wx+DS4rzWqewQQ4v5FfbCZ/KGinYM+WzzSEPOnqbWlXuwKQzBKEAC4dQ3pYX32v6prwTKNTUhD5c/P5rRmijgDcOgpSlgJwbY5p54iMjWWjNC+O76er7N8ee/8hQK/hzsr1GIL/wmdE+Umauc6b1rE1GajWoEnqtWC2U24Y/AiiV88qbT7rCiKlQbWQZHhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyXFvuKm; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyXFvuKm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1702xhDz2xdr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A87E55C2CB5;
	Sun, 26 Jan 2025 18:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B03EC4CED3;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=t7MiR81B+Iee46VXjw3fUJ5IYqT5cIbBOLroU8KM1fQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EyXFvuKmOEPqCcAclYtRc2Nf6D64xrAfFFHSZA0oJ5gamkDnb6Lx9KPgGTaKh2ZKh
	 StvXwLWvB4AXxrvQfCNYMVQ+vpVzioxQMMB5QA+tePMantmyW6B9rN0BRQvG1/FvWU
	 prHsgS/oe5U6OOHHZh5ZPSdmN7eKPsdtUb1nfbVEq0vPIx4qdqoqUXf6uZemN0OnPz
	 K8suGTkXNhL0Xx0Ng2m6CJ3yVE19C8LvGkQWvvwWjtIzah0W0CKFmEx6/EnIToChCc
	 AWYum0Cs2J7hzfAr6sBPp1fVniQybgbyId3cy5jTPg+VlAkwKGNgQLNyYIHuje6NCa
	 rNybsHqvM8Eig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66071C02181;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/9] YAML conversion of several Freescale/PowerPC DT
 bindings
Date: Sun, 26 Jan 2025 19:58:55 +0100
Message-Id: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO+FlmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMz3YKC5MrE3BxdMwuD5OQUiyTjtGQjJaDqgqLUtMwKsEnRsbW1AIw
 prb9ZAAAA
X-Change-ID: 20250126-ppcyaml-680ccd8b3fc2
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=2648;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=t7MiR81B+Iee46VXjw3fUJ5IYqT5cIbBOLroU8KM1fQ=;
 b=rX4cEDadyqjKuA8yYkLZevdyfcRaUdz4BHeJl10YNn4xTsKCjeCD6OKBl3O1tpdL5puknSF0r
 w3DGg25+T63CHz+RBokGYXZ8fMyOUHiLEo+aY9gwD/QBhE8TjlNwX8S
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is a spin-off of the series titled
"powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".

During the development of that series, it became clear that many
devicetree bindings for Freescale MPC8xxx platforms are still in the old
plain-text format, or don't exist at all, and in any case don't mention
all valid compatible strings.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (9):
      dt-bindings: powerpc: Add binding for Freescale/NXP MPC83xx SoCs
      dt-bindings: ata: Convert fsl,pq-sata binding to YAML
      dt-bindings: crypto: Convert fsl,sec-2.0 binding to YAML
      dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding to YAML
      dt-bindings: dma: Convert fsl,elo*-dma bindings to YAML
      dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
      dt-bindings: watchdog: Convert mpc8xxx-wdt binding to YAML
      dt-bindings: spi: Convert Freescale SPI bindings to YAML
      [RFC] dt-bindings: nand: Convert fsl,elbc bindings to YAML

 .../devicetree/bindings/ata/fsl,pq-sata.yaml       |  59 ++++++
 Documentation/devicetree/bindings/ata/fsl-sata.txt |  28 ---
 .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 ++++++++++++++
 .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 -------
 .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
 .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
 .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
 .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         |  53 ++++++
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 ++++++
 .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   |  83 +++++++++
 .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
 .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++
 .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++
 .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          |  67 +++++++
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 -----
 .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      |  17 --
 .../devicetree/bindings/spi/fsl,espi.yaml          |  56 ++++++
 Documentation/devicetree/bindings/spi/fsl,spi.yaml |  71 +++++++
 Documentation/devicetree/bindings/spi/fsl-spi.txt  |  62 -------
 .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   |  25 ---
 .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  |  64 +++++++
 21 files changed, 1212 insertions(+), 444 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250126-ppcyaml-680ccd8b3fc2

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



