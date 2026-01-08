Return-Path: <linuxppc-dev+bounces-15422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D3D05B4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 20:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnDmH5g2Mz2yFk;
	Fri, 09 Jan 2026 06:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767898927;
	cv=none; b=l/7FLBuyv44/kGPCFspOt/3erztS6C5+jI8ksQSrDUnAkZ6CBuG37+uEPPx743jpLpNidZ89yX1V/xgsKIGTUeYUtpZZOjxNHrDk3+zBNeVzSIeLCWyZQA35Oxqa4m898HREgvTojTIxOEqIf57Ar1yhViB7hwBGujAVJ7sQ8lbwOGBANxs0AhulO9ze17CMOADXptWZvHY1EY81HPxlzISFqkk3X9FjZ9Zu51ad6EDSl9xlW19J2t4nHLNgjEHnq07bMjpT2igXLlHbu1nT7g3tD8ZCdhcY0egrJg3Ax41ZoxBqNOLbr7LD64irCKdC1rV0egwroQmqVK+sR+lr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767898927; c=relaxed/relaxed;
	bh=5Egeoauu85j4e+WeXxWLxZq8WExQ6Zh5dl8x5NP2WN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4sdvVCveAjYvM492insMxLKZmL9NMkHnteD/B8a03KzcEFrI4hyafCKG+TlaBxRtEkIKtZ+3m003HCxNSLX7zcfnNjgmw8moWIaZtp+fGdkQrYyaLnSF/o9X0WkNTEBX/w1y2Jja18hLdvNbS3JEyZTe3yqeMJhOYd/ESb6VEq5ey+MrQc/us50MdUG86AbnN+sc2tQ0mkmFKmLMvcSllkkin5g9w8xb7oMb0fpMT2IzDa+UmC8EwoXwDnKqcnfMAzT5DnjWsC7thCAR0kZDpdc72HBtc0cVuSVTbQhLuaqGCyNI2tThhwbCVrTLg7SO7Co0vUBAEBFarlyu0U6Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gds6PdVt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gds6PdVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnDmG4mJwz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 06:02:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF30140A00;
	Thu,  8 Jan 2026 19:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4478C116C6;
	Thu,  8 Jan 2026 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767898924;
	bh=cGVPGNzS5dackujqgZ6gZ4apORen6+dbC4SXpFIwMX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gds6PdVtl7nh9hqOKIShu4yNF5qDmklyNOic3poXva+cTt8kxVAIOWhkFHV2Xa5pj
	 bpx1EvHsEoP3H8+Cs9/i7L+ndXn+UEnKbVjOI1V4pCLxRwsc0VdWav/A308DJB3tfJ
	 qluxPbP6gsQX3M0vIW6GTkQ/Ogb3KlROpvCNtc9aDsRfPVs3kgddj5+OimSy9hgu8m
	 OIsykjiXH5OlQp2WNLD9mmY+GGRCtmOgOziJN0g0AX0oVqlgTwf3xwgjgtg6642HRN
	 THiJlE9WyGfKTcj+8NR0M7HkQp2wM3OODPhvGngwmozWB8VsPIC/0pU1VHOvoG6oav
	 CfldgY+DC16Cg==
Date: Thu, 8 Jan 2026 13:02:03 -0600
From: Rob Herring <robh@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
Message-ID: <20260108190203.GA780464-robh@kernel.org>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
 <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
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
In-Reply-To: <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 05:59:10PM +0100, Christophe Leroy (CS GROUP) wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it so that those IRQs can then
> be linked to the related GPIOs.
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Already? On a v1?

> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> new file mode 100644
> index 0000000000000..1f3c652b1569d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> +
> +maintainers:
> +  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,mpc8323-qe-ports-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#address-cells':
> +    const: 0
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#address-cells'
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@c00 {
> +      compatible = "fsl,mpc8323-qe-ports-ic";
> +      reg = <0xc00 0x18>;
> +      interrupt-controller;
> +      #address-cells = <0>;
> +      #interrupt-cells = <1>;
> +      interrupts = <74 0x8>;
> +      interrupt-parent = <&ipic>;

This doesn't look like a separate block, but just part of its parent. So 
just add interrupt-controller/#interrupt-cells to the parent.

Rob

