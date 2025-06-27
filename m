Return-Path: <linuxppc-dev+bounces-9847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EF3AEACF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 04:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bT0Ll2Bpdz306l;
	Fri, 27 Jun 2025 12:46:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750992399;
	cv=none; b=RMKFt96kxzvI5EHj6UKkYWkzo16jyJs3EKfJDy6n/mhPRkmRJZ0kP8h07p8K36XUEiC4WWfTZUG20LnPCh5FErR8KLmcPcGVwaRQ2mfblbElNovU6Wm7E55Zfla4PJ51QCWowjICIQWHRy6FVeLLUM8DsqQmgNC2Nx4cY9sjn+pWecD5pgOuilcYeeKkXEyX+snkpNwHw4Kgaq6WdX3uhd6fufMqKAVjFQC8DDHIEzCHnOxNJqE3BMemL1QdbJx64KtwGTw+2M9yQUm7t93eHZS4ThZXnfRRn0XglVZDqkXIVmh0e/TZRjkNivqo+J+npX5XSyh/+AOUglAjUO88/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750992399; c=relaxed/relaxed;
	bh=KSpGqoGHw4jdEeeuHnbaE8bdrNxce2rGRpAWn9ZiGh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7FkjZZPYTD6LwRwX/fRY9fD86rYXgYPKnigM5R/Ae+2QiWO6S/83tMj5tJN/Xak7eJFBOR45Q8ReM0OCNHD5fXATEHT+8logoQlWwfIDNIGNZ26EKyISGHu5pm5qIU6weyydqiegy1sJNcQ+pxzKIhfu/mRCLhBJbm7hq5skZ4eeGjqzyLRKtaQ/adg4GGf14czzVpqQX4eimfWZ5HTKLEsAHvBEKuOZAth3vxlkfmJwqe5wHjCA62xsvxZsJBPgItjjh+u1au+gp3m7NNTM4dcbFoaR2ejMrdboqtSc+tiva2gUrY5b5Xk8woPXjQSglPlHMQDowUfjIor9mIkzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FUmEdZKy; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FUmEdZKy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bT0Lk11PBz2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 12:46:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A45286111F;
	Fri, 27 Jun 2025 02:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF0CC4CEEE;
	Fri, 27 Jun 2025 02:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992394;
	bh=LQms1tNsqpQ+nXQaH2KYlSJYLllazDGuxMMHkBk5CDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUmEdZKy5Pt85iIZINjlu6Rlw+WTOVjloMjWfOUMo1LHk6H53Te0c1wsyd8N4vhTL
	 53kUWt5yc9a3iKDuavEg64TN6Q43K99IAq3pPC9PcKgpI2GIS6qBzQuYO1on5nVrYR
	 s/RG/HdAzJaAfI7nPRGHfihNXYmCSy6JFzq/V+1VKJVbAVezkkf5RpbZ9e37qV1vuL
	 2x0VbbiTZXMQQOMyud6dJRU217TdKsz5QbnJHwoljbfbZAha6cxt4d2MdAbgZaAfB2
	 vYXACkfMBqv7cZhM2n833mbduEvSFugpShoskJ6/RhxH1RGxrtHdftTa4CBFseiqjV
	 XaffibLNkkX2A==
Date: Thu, 26 Jun 2025 21:46:33 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <20250627024633.GA1656962-robh@kernel.org>
References: <20250617155231.2023977-1-Frank.Li@nxp.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617155231.2023977-1-Frank.Li@nxp.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 17, 2025 at 11:52:30AM -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual call it as system reset controller(SRC), but it is not
> module as linux reset controller, which used to reset individual device.
> SRC work as reboot controller, which reboot whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> new file mode 100644
> index 0000000000000..cb8aa510a21f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#

Double '/'

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale vf610 System Reset Controller (SRC)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |

Don't need '|'

> +  IC reference manual call it as SRC, but it is not module as linux reset
> +  controller, which used to reset individual device. SRC work as reboot
> +  controller, which reboot whole system. It provide a syscon interface to
> +  syscon-reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-src
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    syscon@4006e000 {
> +        compatible = "fsl,vf610-src", "syscon";
> +        reg = <0x4006e000 0x1000>;
> +        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> -- 
> 2.34.1
> 

