Return-Path: <linuxppc-dev+bounces-6511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130AA46819
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 18:30:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z31gq29ZWz3bmY;
	Thu, 27 Feb 2025 04:29:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740590999;
	cv=none; b=hDsRCKMMS8iBV7jdRS8P1claxdRoN78OGhOOVHOg2AtkH11c4Crq+44Bi0bSN1UiRZU5tBewXQ9ttBbDJehkg3uQ+1lZ+njjAzgcKnm/JGrmliJJvxv8C6ufAEN6sBIsawMIclvsYd3tbgBiIKa47XG9xcmmAyA1xnHPmFbWTxejWhc8wnQQ9mX4EB+zPICylNObX96CPXTsBxh8bRvFkcGfVLWkmTgpvA+ldp7zIORiYZiK/eTZZLGWslJtD0eteHstur9ZaeRwcK+m6wFSeh3mPYZQfc4zEjvG+LciRqyCe+/9KtunUA2AafXZRUJoRj0lEHv6Nqp9oaDCoBHD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740590999; c=relaxed/relaxed;
	bh=CnXueaCGmWbQDHgXGyE68GsbYb0dWQWLRSW2rtdWDmA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=barqDlZo6U9fKNdV/2cziWUMWdCm+s9001QMDaDjYeZR2e88tqBLxl2+dQFWr2ZLvTI/VDIebPe2IE6j/OM179rAz0A4yP0UI7srjYcqITnk52ply90FF3w8GUd16a8BDZPeeDf8EQFVHclFtK5O7TW0VVLB74NE8ehfRqhX375OGWMnn+GdJrih8OM6zm02DejPqHJLiXlQvhn2NllCZ8/WtGw/TsqMIxgqc2yblEi+Dy16gfXE0VhYWwZINcoLqtDBLNSVl3xHASfVJAcHyPeEz0ohrCkm4JPbAIk8H+L7YneecxQIPeCevSJCx8h9LxVFXTjwNvWAImNjyTtpog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LvuRHUyz; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LvuRHUyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z31gp1tLkz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 04:29:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72DE85C73F2;
	Wed, 26 Feb 2025 17:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1288C4CEE8;
	Wed, 26 Feb 2025 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740590996;
	bh=B7w6kz3z2eZZW+849CoU9pf/lvE0LeYWzWllU/FXywM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LvuRHUyzsDWBTphzSY4cpGJheves2OjCoffnc3zD1Cs3/7s9gDHGbCtO7REggRQHT
	 AI/MP3MumtyjhM1PsyE4/MBrWPyHkdXlnJYkNmcJz5XXpy7pIvhg1M+32QCSOizCC5
	 WycR9PU0apuL+WalxZdhnQCiglQ9C+E+Iwt4VKRv1OxHXjL+FPaSmlpOXQ3nQfq6Pa
	 4HibuZPCwt4hN5y/MLqcTV4mPBorAnabrbhKYjwtpoqoxT3PCAjeh3dbctv6Eud3Ak
	 cCqUEu1xn0TbvlZQvWjYiNBhQtjqkgSJ3Nvt+KLGtUswtYxweYIfAUHtQnD4x5yDuN
	 jIho7uCRXlAbQ==
Date: Wed, 26 Feb 2025 11:29:54 -0600
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
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, dmaengine@vger.kernel.org, 
 Crystal Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org, 
 Nicholas Piggin <npiggin@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Naveen N Rao <naveen@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net>
References: <20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net>
Message-Id: <174059099427.2999773.4836262903761680275.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: dma: Convert fsl,elo*-dma to YAML
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Wed, 26 Feb 2025 16:57:17 +0100, J. Neuschäfer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> I considered referencing dma-controller.yaml, but that requires
> the #dma-cells property (via dma-common.yaml), and I'm now sure which
> value it should have, if any. Therefore I did not reference
> dma-controller.yaml.
> 
> V3:
> - split out as a single patch
> - restructure "description" definitions to use "items:" as much as possible
> - remove useless description of interrupts in fsl,elo3-dma
> - rename DMA controller nodes to dma-controller@...
> - use IRQ_TYPE_* constants in examples
> - define unit address format for DMA channel nodes
> - drop interrupts-parent properties from examples
> 
> V2:
> - part of series [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
>   Link: https://lore.kernel.org/lkml/20250207-ppcyaml-v2-5-8137b0c42526@posteo.net/
> - remove unnecessary multiline markers
> - fix additionalProperties to always be false
> - add description/maxItems to interrupts
> - add missing #address-cells/#size-cells properties
> - convert "Note on DMA channel compatible properties" to YAML by listing
>   fsl,ssi-dma-channel as a valid compatible value
> - fix property ordering in examples: compatible and reg come first
> - add missing newlines in examples
> - trim subject line (remove "bindings")
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 137 ++++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 125 +++++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 132 +++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  4 files changed, 394 insertions(+), 204 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,elo-dma.example.dtb: dma-controller@82a8: '#dma-cells' is a required property
	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.example.dtb: dma-controller@21300: '#dma-cells' is a required property
	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,elo3-dma.example.dtb: dma-controller@100300: '#dma-cells' is a required property
	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


