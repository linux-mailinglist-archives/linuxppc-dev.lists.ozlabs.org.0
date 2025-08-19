Return-Path: <linuxppc-dev+bounces-11124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D157B2C55F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 15:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5qzs6l5fz3d4D;
	Tue, 19 Aug 2025 23:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755609849;
	cv=none; b=Y+3r35yCEsSSiEvWzllF5g5GTE2628bkYQS2J7oCeUGrbS1vC/VrKPIUn+w1+fK4CSRiGcoBIgiKG9R3z144u09/RLuxDn8zepCYbqe0pgs/hC6m9JEq5Jl4ZK82nFdWKF0g8Ek7rc5cl67q4+tFaxWB5HVUO3cxoU0bdTBDdUenfeLTJooXuLuBmBs9WFSp3r5GCXwjgG9Q17fMeGMoHpz7IdXvfs76KnzlfAKuQnx5+BMhszb+4g/51BysYb7kxIqBP+eczQsAX2BU1OnkOhztJyVoellDzV4j6QI+CZgdUp7pOHRVkd1XzfAtvrfFZ9QRxqIAerhvRXoUtLa2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755609849; c=relaxed/relaxed;
	bh=dC94HbjbZIou/94/bfCKcAs3uf+gkU3X2AP/y0yU9yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8VjLyKWFL4CzAzJGeQXyiBpmoQfNx96ecN7lPU49VFYZiGiCpdH3FYxPub5RurhHjo2TFJAgUsll8EKjS7gjFwI1JecJDWydTEkz9JePEPx0YIeGrju5Kk5d40dfkzxa3onMOvWZv6hWkVrzbhGCtWrxF+mK+zi7jYkRs1ZMPHEEWCv0hQ3vsGGV5Pn/YeRh+a5kfD4Efy8T+U+YSnTl283ZNGwliYy6e8mxh0FAzbno2DuiAltHtleStuX6+YCWMcXMDJxRIUeHYME+dAaju2Cry0ZATaKSsYOfQrtnnXH2/OyFLsHafXfX/XEXteL0OK2BDa6oofIAQff5emirQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S+j8zTCx; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S+j8zTCx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5qzs06XDz3d3M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 23:24:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C01261428;
	Tue, 19 Aug 2025 13:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7FEC4CEF1;
	Tue, 19 Aug 2025 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755609846;
	bh=oMo/cdh38YCbOBw4iwATq7ozwW1TpUbE0yXhbYlUgU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+j8zTCxQdkcMEhMaej6GiAgIOaXfofvg7es9Jp2PGsrXvywOcYTBRmEuFNsYF/G8
	 qIviixcV27EuzpLCP/Nry898wPulNLltPxo16ILqFJjYM1R5Du+rz8J7TWL0oQ73Lx
	 Whwuwctm1JUeUeLNkuYPDOxjtAwdXZOaMTUS1hGTWXYn597TaUkbprtT5KuRs0qqzT
	 +fBOqlgcskasEvnBNDu8U3MYiGCiDf+G1RHobrmRS2I7i2xvaFcNOsSsfmgjjZs+Xl
	 iM7QRM7IS/3barZzPVPJn10e8de0FtZU4lWfYLD2JnIikAi9RjwVlfyjyHiHYwfnmm
	 Uf6IF5fk5eAjg==
Date: Tue, 19 Aug 2025 08:24:04 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <20250819132404.GA84481-robh@kernel.org>
References: <20250818183427.3601986-1-Frank.Li@nxp.com>
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
In-Reply-To: <20250818183427.3601986-1-Frank.Li@nxp.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 02:34:26PM -0400, Frank Li wrote:
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

calls

Linux details aren't really relevant.

> +  controller, which used to reset individual device. SRC work as reboot

works

> +  controller, which reboot whole system. It provide a syscon interface to

reboots

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

