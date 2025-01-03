Return-Path: <linuxppc-dev+bounces-4638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6194CA00B4D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 16:20:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPnMW2RwQz30Pn;
	Sat,  4 Jan 2025 02:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735917639;
	cv=none; b=nsHKihU0UCrteUMQPaWHjsFi974FV6SmHAIbpi1e1EHVlli18/zVjuj49d8e+pv6srVXHssYKjqR+MUZD40knaNBlycKXes7uc05rve5yoQNmA6yyY3Z834E0plzH6pO+IK+jYhHQDYYTcHDb/WzGdYyu8Pp44O3iV0PHgaR2srBUbJ851uoY1I4WSASNE7DYu6Qk8AvaBIIIasj/9h06uygmoD2esEqOjlQC1+JobJqBlTxlRt4QZWN/XQJspVOMFDTLQvIMeVanwoo5oM9izD5x+jubYP6SCpVrAjDkYz4auTsQpouww84Gajxhe2P5JTpyGSM9NxtXHmSLxrDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735917639; c=relaxed/relaxed;
	bh=7aO+4gSDN4cLE7zsk1GdzwfyS1fyTjG8ZTYVq2r6op8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=J38/3QihNMq1l7B6h0sV65PdRywVLZoGoegricSeU44MSmPGK2JGfrPt6OsI1gLRzHsLeCOaLl1tEWBIUUU7Ze9OYxNBxl9UWeu4isbfslCA6ys+SuJ0KW/tU7oL/D3zNf08BKRcDquizk4m4XKAjCE2kiU9RBP2AKD93BTeefhR1Up+UGr6L2t7+1hQl4ucR/Uk45I7ikbhYbwfdL+n5ETjPrUIazzyJef3U5kdkXupwdH2DaTXJMIbgkmCLMGNbHc84n2jVRDsYnIZaxtkXyltgir9L/THzVuiWgtf1sjjaT18SLkerml0Eq2ZFR0f/rm8U4S8zQ0lUQtTRQlL5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D2rQKvxs; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D2rQKvxs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPnMT6qKgz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 02:20:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 526345C645F;
	Fri,  3 Jan 2025 15:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BA6C4CECE;
	Fri,  3 Jan 2025 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735917634;
	bh=VgGwcmM6qzpMmgZw8FIJTOFY3r8rf3s4xkfXj0IlYUA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D2rQKvxsfjsgWmy5GaUJtBcojq1bVP3nczIjPkYNqQsl5OrX9he1lhuJ38KvyLVv7
	 soB1xx4UxcxySFpup1oiaMokaiL/1vwHOV7WeYxDmHGjD22dJsoNliSAVvHYb2EwTG
	 gCU8IwYXXCpH6taozsFE/+fKMykeCcXsYKtf5DDwQcsshnuxte/sCv1jqwxcvda1eQ
	 5pnsRiUqZDQb/dI7ietSVi5pg1hDki/Nfzast4H39aUFd2t22E0oAMesmHvuFU+fEU
	 +f5JDCsXhZrS8RwfUztctWAe9vfM/Bxj1+uuvJEUHeaIEUPJKF1MrIS0kBTFapqfK5
	 iyOIpNt3CPycQ==
Date: Fri, 03 Jan 2025 09:20:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linuxppc-dev@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
Message-Id: <173591745953.2305360.498526194729700257.robh@kernel.org>
Subject: Re: [PATCH 00/19] powerpc: MPC83xx cleanup and LANCOM NWAPP2 board
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Thu, 02 Jan 2025 19:31:41 +0100, J. Neuschäfer wrote:
> This patchset adds a devicetree for the LANCOM NWAPP2 board based on the
> MPC8314E platform, and slightly modernizes the MPC83xx platform support
> in the process.
> 
> This board is nominally end-of-life, but available to hobbyists.
> A U-Boot port is also in the making.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> J. Neuschäfer (19):
>       powerpc: Generalize MPC831x platform support
>       powerpc: dts: Extract mpc8315e.dtsi from mpc8315erdb.dts
>       powerpc: dts: mpc8315e: Use IRQ_TYPE_* macros
>       powerpc: dts: mpc8315e: Add labels to peripherals
>       powerpc: dts: mpc8315e: Disable peripherals by default
>       powerpc: dts: mpc8315e: Add missing #cells properties to SPI bus
>       powerpc: dts: mpc8315erdb: Add missing model property
>       powerpc: boot: Enable FIT image generation
>       powerpc: boot: Build devicetrees when CONFIG_MPC831x=y
>       powerpc: dts: Add MPC8314E devicetree
>       dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,mpc8314-gpio
>       powerpc: dts: mpc8315e: Add GPIO controller node
>       gpio: mpc8xxx: Add MPC8314 support
>       powerpc: mpc83xx: Switch to of_platform_populate
>       dt-bindings: vendor-prefixes: Add LANCOM Systems GmbH
>       powerpc: dts: Add LANCOM NWAPP2 board devicetree
>       powerpc: Regenerate mpc83xx_defconfig
>       powerpc: mpc83xx_defconfig: Enable NWAPP2 board features
>       MAINTAINERS: Add entry for LANCOM board support
> 
>  .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  MAINTAINERS                                        |   8 +
>  arch/powerpc/Makefile                              |   3 +-
>  arch/powerpc/boot/Makefile                         |  11 +
>  arch/powerpc/boot/dts/Makefile                     |   6 +
>  arch/powerpc/boot/dts/lancom-nwapp2.dts            | 276 +++++++++++++++
>  arch/powerpc/boot/dts/mpc8314e.dtsi                |   7 +
>  arch/powerpc/boot/dts/mpc8315e.dtsi                | 390 +++++++++++++++++++++
>  arch/powerpc/boot/dts/mpc8315erdb.dts              | 327 +----------------
>  arch/powerpc/configs/83xx/mpc8313_rdb_defconfig    |   2 +-
>  arch/powerpc/configs/83xx/mpc8315_rdb_defconfig    |   2 +-
>  arch/powerpc/configs/mpc83xx_defconfig             |  41 ++-
>  arch/powerpc/configs/ppc6xx_defconfig              |   2 +-
>  arch/powerpc/platforms/83xx/Kconfig                |   6 +-
>  arch/powerpc/platforms/83xx/Makefile               |   2 +-
>  arch/powerpc/platforms/83xx/misc.c                 |   6 +-
>  .../platforms/83xx/{mpc831x_rdb.c => mpc831x.c}    |  21 +-
>  drivers/gpio/gpio-mpc8xxx.c                        |   1 +
>  19 files changed, 769 insertions(+), 345 deletions(-)
> ---
> base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
> change-id: 20241231-mpc83xx-17c898a49441
> 
> Best regards,
> --
> J. Neuschäfer <j.ne@posteo.net>
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y lancom-nwapp2.dtb mpc8315erdb.dtb' for 20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net:

arch/powerpc/boot/dts/lancom-nwapp2.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /: failed to match any schema with compatible: ['lancom,nwapp2', 'fsl,mpc8314e']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /: failed to match any schema with compatible: ['lancom,nwapp2', 'fsl,mpc8314e']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: localbus@e0005000: nand@0,0: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8315-elbc', 'fsl,elbc', 'simple-bus']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8315-elbc', 'fsl,elbc', 'simple-bus']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000/nand@0,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000/nand@0,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000: failed to match any schema with compatible: ['fsl,mpc8315-immr', 'simple-bus']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl-i2c'] is too short
	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
	'fsl,mpc5200b-i2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/spi@7000: failed to match any schema with compatible: ['fsl,spi']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/spi@7000/gpio-controller@0: failed to match any schema with compatible: ['onnn,74hc595a']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8315-dma', 'fsl,elo-dma']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8315-dma', 'fsl,elo-dma']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,ns16550', 'ns16550'] is too long
	['fsl,ns16550', 'ns16550'] is too short
	'ns8250' was expected
	'ns16450' was expected
	'ns16550' was expected
	'ns16550a' was expected
	'ns16850' was expected
	'aspeed,ast2400-vuart' was expected
	'aspeed,ast2500-vuart' was expected
	'intel,xscale-uart' was expected
	'mrvl,pxa-uart' was expected
	'nuvoton,wpcm450-uart' was expected
	'nuvoton,npcm750-uart' was expected
	'nvidia,tegra20-uart' was expected
	'nxp,lpc3220-uart' was expected
	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
	'mrvl,mmp-uart' was expected
	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
	'ralink,rt2880-uart' was expected
	'mediatek,mtk-btif' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: serial@4500: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: serial@4600: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,ns16550', 'ns16550'] is too long
	['fsl,ns16550', 'ns16550'] is too short
	'ns8250' was expected
	'ns16450' was expected
	'ns16550' was expected
	'ns16550a' was expected
	'ns16850' was expected
	'aspeed,ast2400-vuart' was expected
	'aspeed,ast2500-vuart' was expected
	'intel,xscale-uart' was expected
	'mrvl,pxa-uart' was expected
	'nuvoton,wpcm450-uart' was expected
	'nuvoton,npcm750-uart' was expected
	'nvidia,tegra20-uart' was expected
	'nxp,lpc3220-uart' was expected
	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
	'mrvl,mmp-uart' was expected
	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
	'ralink,rt2880-uart' was expected
	'mediatek,mtk-btif' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@500: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@500: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ipic-msi@7c0: failed to match any schema with compatible: ['fsl,ipic-msi']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8315-pmc', 'fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8315-pmc', 'fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8315-pmc', 'fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
arch/powerpc/boot/dts/lancom-nwapp2.dtb: gpio-watchdog: $nodename:0: 'gpio-watchdog' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/watchdog/linux,wdt-gpio.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power: $nodename:0: 'led-power' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power: Unevaluated properties are not allowed ('color', 'function', 'label' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-link: $nodename:0: 'led-wlan-link' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-link: Unevaluated properties are not allowed ('color', 'function', 'label' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-data: $nodename:0: 'led-wlan-data' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-data: Unevaluated properties are not allowed ('color', 'label' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-eth: $nodename:0: 'led-eth' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-eth: Unevaluated properties are not allowed ('color', 'label' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power-top: $nodename:0: 'led-power-top' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power-top: Unevaluated properties are not allowed ('color', 'function', 'label' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-top: $nodename:0: 'led-wlan-top' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-top: Unevaluated properties are not allowed ('color', 'label' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#






