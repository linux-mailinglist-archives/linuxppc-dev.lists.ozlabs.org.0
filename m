Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE896944F39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 17:30:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pXD4C236;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZXw96JBsz3dVC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 01:30:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pXD4C236;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZXvS5wFmz3cWN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 01:29:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCA206288B;
	Thu,  1 Aug 2024 15:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68527C4AF09;
	Thu,  1 Aug 2024 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722526178;
	bh=puWdf7XOQ82xIwfbjQMYWSQLeyYJDxkHb/kNQjcEp+Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pXD4C236Cpjg4MYKyaRBUvgRUGom3TDzHr6iNivPTt1wylzAwvUw1TLS0TjJ/QBsb
	 7J9ksz+RXLNUd+BMyb4qbkR8nOxPO/ZUFaxZKFFjDNcZKQvD7E9tvy9wmql40UNMFx
	 qvQiIR28Sjo1rB/WfBCKrgkH7aWoy7iyw59VcOFvR3kKdP0yHfz4vzBsiGr+B+EPpN
	 NAKwY14E21IdghQhSBqmS3PeQ5oTczopQuV32fxZZp7iriD+9XV4yiRrK2yzhYAGkl
	 apEzphqC3P+IamsxzIv304stODKH3BMTOCYrDbFkHqwG8wqgWFC5EWdLV+RmqlxCfW
	 HIVO410WcppEA==
Date: Thu, 01 Aug 2024 09:29:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pawel Dembicki <paweldembicki@gmail.com>
In-Reply-To: <20240801051402.584652-1-paweldembicki@gmail.com>
References: <20240801051402.584652-1-paweldembicki@gmail.com>
Message-Id: <172252600854.120726.11435337505075430756.robh@kernel.org>
Subject: Re: [PATCH] powerpc: dtc: update P2020RDB dts
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 01 Aug 2024 07:14:01 +0200, Pawel Dembicki wrote:
> P2020RDB contains multiple peripherals, which isn't added to
> devicetree:
>   - Switch: Microchip VSC7385
>   - PMIC: Renesas ZL2006
>   - Temperature sensor: Analog Devices ADT7461
>   - Two eeproms: 24C256 and 24C01
>   - GPIO expander: NXP PCA9557
>   - reset gpios of Ethernet PHYs
> 
> This commit adds it.
> 
> Some refreshments was done:
>   - fixed link in ethernet-node
>   - platform drivers nodes names
>   - added 'gpio0' label in pq3-gpio-0.dtsi
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  arch/powerpc/boot/dts/fsl/p2020rdb.dts    | 85 +++++++++++++++++++++--
>  arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi |  2 +-
>  2 files changed, 81 insertions(+), 6 deletions(-)
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


New warnings running 'make CHECK_DTBS=y fsl/p2020rdb.dtb' for 20240801051402.584652-1-paweldembicki@gmail.com:

arch/powerpc/boot/dts/fsl/p2020rdb.dts:326.22-329.4: Warning (pci_bridge): /pcie@ffe08000: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: nor@0: $nodename:0: 'nor@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000/nand@1: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000/nand@1: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: ethernet-switch@2: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/dsa/vitesse,vsc73xx.yaml#
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/i2c@3100/pmic@11: failed to match any schema with compatible: ['zl2006']
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: gpio@18: 'gpio-controller' is a required property
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/powerpc/boot/dts/fsl/p2020rdb.dtb: gpio@18: '#gpio-cells' is a required property
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#





