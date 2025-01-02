Return-Path: <linuxppc-dev+bounces-4574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE29FFE50
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgK4B7sz305c;
	Fri,  3 Jan 2025 05:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842748;
	cv=none; b=k2JVo0jG1AFeEBY8Cupy+uER1C4EwnFXCBLk7CoGICm/uSed6T75EnVKOvCHMBus0FI66uJ5vAyhxuufFs+m+eqFSMyTA4RIOI5cbZSiw88nXi03DV5TwOYF3sIpbIZAiAE56+VaWO0UZmAHsq8+vp+si/LmMbnsLAMsdEuLmoy4XvfYoYWAQiH4YuWesHDl4KuDlJpomLLFUt51/HyUiELCQ+6++TaXnrfx523JOAr4zxG8535ItQaxGVNKZBEJOE/MwY7GhhvfM6hTfB3bJqQskFVIu0xw+eg3t81hWY2K/sktP14/K9ERp+j+ByW1cYPWmF6iNqBa+9RS6VXvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842748; c=relaxed/relaxed;
	bh=tvKYBUQJQm+MsJGQTE11/rXLqf+cBP/yZUlrAIDNSsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HxjkZk9ard4ZvsKSOlwDTsjZGw+2Xkhk5bw8nrO4jRnrcWs/DxhUUG7/lPNnn6d7Kdqwyz9krFSFP/FTZtkOkkbmJHmAwm5XXbcwNI/Ut0tzpMQDegWh3udAnq24S76TJUrDxfgrpaV2xk/E7lG451ImfpU3nx0O/a4iYimUosIb9MdnTdM3LhDxvLgFj1GWjaAl7uv+7f5WEyvNP/h80mnZrsJXUtErZZezBFG1dID+FiyzYgh1sBahIsIYa4pwc18/7+csaxzsjs4fet3YsRvh90tVW8M1Gy/hFWszyrFIeqcRFrgKaeRVRsYAa9IYIZpJ7gI/vzNOjuXUx/CY/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPF0n5bo; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPF0n5bo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgF6DG8z2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 974D65C5D0E;
	Thu,  2 Jan 2025 18:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93B63C4CED0;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=s9KOsJHPX8mNPryGVyICWhP1YoIx1vF2Sh4FXkHLgpk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VPF0n5bog8EFSaleFqb29oS++uwCjDIC7BwSFHDdXrkqJN2+jG3LoltSY2RYFi9fa
	 CUzxHsSZeeA4rreNpI48kKsdLO8HP1thzglWCGB9WWKlzwz9PMJSSmMDR36YE2pDmC
	 5APjLf8DXx74N5qIip/kwZphKJbC0IIjS5O1wuoTMm9lccsXVWjfW/s2lfx7jl0ixn
	 Lqt5GHpPTYH3dxN5l4EGzbBU/vcmZmIcOAE3jFWx/X6DIAFRwuZl/aUKQhOkMkw4sv
	 KFlKTpJOUTdzYPjj6wmBlKfvYnctUygK+EOFFohYSclGNFtBarHAfpmGyHWfM9z3A3
	 +Oco9ypSnykRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82451E77188;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 00/19] powerpc: MPC83xx cleanup and LANCOM NWAPP2 board
Date: Thu, 02 Jan 2025 19:31:41 +0100
Message-Id: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
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
X-B4-Tracking: v=1; b=H4sIAI7bdmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI2ND3dyCZAvjigpdQ/NkC0uLRBNLExNDJaDqgqLUtMwKsEnRsbW1ALn
 E2NdZAAAA
X-Change-ID: 20241231-mpc83xx-17c898a49441
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2877;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=s9KOsJHPX8mNPryGVyICWhP1YoIx1vF2Sh4FXkHLgpk=;
 b=Yes62fmOx2x2qZhQDLO1dreJSQZiMF9f1nnFMaGDZeK+FBloj2U8kviImy+hqs0K4bJ17FFXx
 oLI8tgG+VsmCNh41LCNbnc+oAla8AExIhxUWOPTE8qd9z8vIciFRu5Y
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

This patchset adds a devicetree for the LANCOM NWAPP2 board based on the
MPC8314E platform, and slightly modernizes the MPC83xx platform support
in the process.

This board is nominally end-of-life, but available to hobbyists.
A U-Boot port is also in the making.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (19):
      powerpc: Generalize MPC831x platform support
      powerpc: dts: Extract mpc8315e.dtsi from mpc8315erdb.dts
      powerpc: dts: mpc8315e: Use IRQ_TYPE_* macros
      powerpc: dts: mpc8315e: Add labels to peripherals
      powerpc: dts: mpc8315e: Disable peripherals by default
      powerpc: dts: mpc8315e: Add missing #cells properties to SPI bus
      powerpc: dts: mpc8315erdb: Add missing model property
      powerpc: boot: Enable FIT image generation
      powerpc: boot: Build devicetrees when CONFIG_MPC831x=y
      powerpc: dts: Add MPC8314E devicetree
      dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,mpc8314-gpio
      powerpc: dts: mpc8315e: Add GPIO controller node
      gpio: mpc8xxx: Add MPC8314 support
      powerpc: mpc83xx: Switch to of_platform_populate
      dt-bindings: vendor-prefixes: Add LANCOM Systems GmbH
      powerpc: dts: Add LANCOM NWAPP2 board devicetree
      powerpc: Regenerate mpc83xx_defconfig
      powerpc: mpc83xx_defconfig: Enable NWAPP2 board features
      MAINTAINERS: Add entry for LANCOM board support

 .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/powerpc/Makefile                              |   3 +-
 arch/powerpc/boot/Makefile                         |  11 +
 arch/powerpc/boot/dts/Makefile                     |   6 +
 arch/powerpc/boot/dts/lancom-nwapp2.dts            | 276 +++++++++++++++
 arch/powerpc/boot/dts/mpc8314e.dtsi                |   7 +
 arch/powerpc/boot/dts/mpc8315e.dtsi                | 390 +++++++++++++++++++++
 arch/powerpc/boot/dts/mpc8315erdb.dts              | 327 +----------------
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig    |   2 +-
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig    |   2 +-
 arch/powerpc/configs/mpc83xx_defconfig             |  41 ++-
 arch/powerpc/configs/ppc6xx_defconfig              |   2 +-
 arch/powerpc/platforms/83xx/Kconfig                |   6 +-
 arch/powerpc/platforms/83xx/Makefile               |   2 +-
 arch/powerpc/platforms/83xx/misc.c                 |   6 +-
 .../platforms/83xx/{mpc831x_rdb.c => mpc831x.c}    |  21 +-
 drivers/gpio/gpio-mpc8xxx.c                        |   1 +
 19 files changed, 769 insertions(+), 345 deletions(-)
---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20241231-mpc83xx-17c898a49441

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



