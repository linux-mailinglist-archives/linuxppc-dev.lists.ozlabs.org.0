Return-Path: <linuxppc-dev+bounces-3742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D29E28FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 18:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2nV83n0cz30NF;
	Wed,  4 Dec 2024 04:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733246432;
	cv=none; b=JyQjmoQx0wxA5s8N6AEW/h4hMhZoD2ZbSffOafZ58IgFkfDZsR44SNMcF5Oe1VVsoTf+BM46hF9hve9CWKQzyhgXHziJAKwWcpMRojWCedBF4DKZSxQXyxHEcSz8XfBTJxT2QKdnBDDMp1nGlNIptCpH3eYSNIL/g+Wy/B6PjRUaWTh7GjNFkS+McxbTIk8cffGrPUjjpa7IdJoGWXhUVQwuKH5Ub+mvwJx86OOMyisU8z7s13cGYnRz8GjLQVON6gDlwiCNT0NILX8D76XUmM+Nd0AGggOurHABb1sA7pQCoaL2/1Ho9o0fYjQWSHHeoXUNQJRQo29JrVq/p6m5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733246432; c=relaxed/relaxed;
	bh=7ZrraI2kA2TOw3GAEcozWYMZfRXVKIpZZc6IZ/Oyre8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9xweff1n4FdX4znfFlFn+GqUvkMo3QVCmUmIDD1cPAksLJXDsuKSwDfaXdwXyLUhv/Nu1VmcE0Kk+NaIgcZR77HwJybEZE5Q1/ZrFHwJ5MJHdy5uHD77VvoAY0Q3y1qttb5jW9tjDMKr4ySYwj5wVavk8ppVUzQkEC1MV5Xt0hoZqcUgf0auOMIPAqQb6D1AHV51YDD8OzoySfFyNn44I9zooDiDYxLNMgJupcycr915JGaNVfRZ4eTa+WbLgindOZK8+t4w/+E8GvQUvtdP+tsLqmKI3T6TGntVZ+1kU3V1qvUkMiHvSiuaUAhbACGNz8vI8His8r2wzcrceIq4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwVM1pPT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwVM1pPT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2nV72SPvz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 04:20:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECEC45C698A;
	Tue,  3 Dec 2024 17:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A538C4CECF;
	Tue,  3 Dec 2024 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733246428;
	bh=eu8MFWETCzi5mUkFpsHp3K6rE1uqUbw4E2pfuGZED5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwVM1pPTEPLNeSSEZQiHBH6Z4pCfskBgJS15+lqTzDaERICXmEXFijOJ+39t1WkDh
	 Mmlt3qH1R2/J7kbNEBBNa8OGc8uG848l+SDnviF7uZqXjdG+6gomChXIEF/PNj4fCq
	 5GCeweIH8jxGsQK2s4SgMyNMbL37kuMMLvFouyNks8GYnNWLHtFcvB3C2M1Utm+Pqo
	 wGYr9QK1ZMAted2QhGKiI8EVFxEmwMJ32HyX2UToWc2UDLugOmTOsf6zIFiDXXjOLj
	 mLANce+Qac3pq3ovswLVEsrczQCAZWTae2lEaiVvyOEdDjQTENw5PNhGigRUDjdGSs
	 vfE8MJ/J/hVCg==
Date: Tue, 3 Dec 2024 11:20:26 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes
 with "fsl,qe"
Message-ID: <20241203172026.GA1988559-robh@kernel.org>
References: <20241202045757.39244-1-wenst@chromium.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202045757.39244-1-wenst@chromium.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 12:57:55PM +0800, Chen-Yu Tsai wrote:
> Otherwise the binding matches against random nodes with "simple-bus"
> giving out all kinds of invalid warnings:
> 
>     $ make CHECK_DTBS=y mediatek/mt8188-evb.dtb
>       SYNC    include/config/auto.conf.cmd
>       UPD     include/config/kernel.release
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fsl,qe' was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['simple-bus'] is too short
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:compatible:0: 'fsl,qe-ic' was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is too long
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:#interrupt-cells:0:0: 1 was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a required property
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' is a required property
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
> 
> Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml format")
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> index 89cdf5e1d0a8..9e07a2c4d05b 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> @@ -21,6 +21,14 @@ description: |
>    The description below applies to the qe of MPC8360 and
>    more nodes and properties would be extended in the future.
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: fsl,qe
> +  required:
> +    - compatible

Update your dtschema. The select is no longer necessary. dtbs_check will 
also run 5x faster.

Rob

