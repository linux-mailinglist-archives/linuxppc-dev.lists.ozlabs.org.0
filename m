Return-Path: <linuxppc-dev+bounces-15120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EDCED4AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 20:06:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhxBC6YBsz2xqr;
	Fri, 02 Jan 2026 06:06:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767294371;
	cv=none; b=OUJfyOGGJQoRpBjnRFEsA0pIY0kz3m8bOJsxB5TbctEfqKm9M1AFu2mFRGsqhyfDiPkBc1ritsAJu++t/2t1nrJaBuZ4zexDlO/qwL7Jsjknwu/etGsK20RXJ0kRPXt/P3KtKeK6KFxgB9X6Nu0/vKdNt6RAgF40hdtjQp9knEyBzndRWx9lNDtjw/3kXPWu0o1MXDUvzevtdiQK3+mRq+hAWGDhk/imt2rzxNHlVA8YY3kvXawYneiA/K8iUMsM8lSxZBj1g33bdw2LBjnIQstm0kpdwevJK78P1FT5ngixhgWx+e2bHVqt3moJsE7CBvHKuY6+2nYASH3M+ORbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767294371; c=relaxed/relaxed;
	bh=M1h99Lg9vPO9DvmWhYCCCHlK0u0PsQT2FmOJepUNf8U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FWyiuQL8ccojd/ELNVM4PG43SEAl0L5h9/fXew2MJVsrXFH1G8c1HH6gO9xeN8xJLMse7QoBUYDAiR+9gIKab6PMmMux7HdL3CqMEpJ6ZUsC5J8fgst2DT0kjTpw4WtFW+OjThT74LlQBUhuw67xSeG+NzlFe1zsBdzlfcYUOqsfbVpFKJGuBkSjDw2Yl5QmN+P9qsMS3AmzmD0Zf+2pQKnCYb1ZYV2B0Sbg1qFSpOJoorFB1az8w3xE8FWIt2en1L9cBPfqSSfWat9acSWDdD/pK2RKcI+l4YrZzBXE74X+qHAuTs6wDD9hb/WRjv4SpeW4Q053Ugkbu1F4Sa97VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b0uHkHFz; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b0uHkHFz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhxBB5qBMz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 06:06:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4070860017;
	Thu,  1 Jan 2026 19:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7332C4CEF7;
	Thu,  1 Jan 2026 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767294338;
	bh=mseGt6+VHgHN7F4TpAc+qL+VGig9rDMl7YN6BM1+ev8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b0uHkHFzr4KV7ajqa51J9yc08IaeWzmeQ80SP1tI5zE4dUUiwy4+hN6Da/ZNEoi43
	 bB/jsXsQEv3lQ8aUP6I3CCjT/pJkPedmr/g+/d+rYdjFqutNmvzCXvZKgMTsyokL5/
	 nu9fmXCLhIw/zSJ5gqDDMHN5HxrWljhATnNM9KCosZTgN6zpCBoMv78zqFbe3ho9Ld
	 fFMOAnq1tr4Bdiv6XG4UGl0XvpdMoyNHhgrg+uIfiKavKZTlaHIe2Al7Ig6wU8gOlI
	 CZUt30xPP0c9Ij0CVwGYupUOBvILl8ZX5mnbjFh/0SN7X06cBNkXCE8PQB14loNa4J
	 uK/hzwCPfgNrQ==
Date: Thu, 01 Jan 2026 13:05:36 -0600
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
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mtd@lists.infradead.org, 
 Naveen N Rao <naveen@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 Christophe Leroy <chleroy@kernel.org>, David Airlie <airlied@gmail.com>, 
 Crystal Wood <oss@buserror.net>, linux-kernel@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20260101-ppcyaml-elbc-v5-4-251c7f14a06c@posteo.net>
References: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
 <20260101-ppcyaml-elbc-v5-4-251c7f14a06c@posteo.net>
Message-Id: <176729433680.1704817.8344719442516572763.robh@kernel.org>
Subject: Re: [PATCH RESEND v5 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 01 Jan 2026 17:58:17 +0100, J. Neuschäfer wrote:
> Convert the Freescale localbus controller bindings from text form to
> YAML. Compared to the .txt version, the YAML binding contains a new
> usage example with FCM NAND flash, and a full list of compatible strings
> based on current usage in arch/powerpc/boot/dts/.
> 
> Note that the both the compatible strings and the unit address format
> are kept as-is, for compatibility with existing kernels and device
> trees, as well as unit address readability. This results in dts
> validation warnings:
> 
>   Warning (simple_bus_reg): /example-0/localbus@f0010100/board-control@1,0:
>   simple-bus unit address format error, expected "100000000"
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V5:
> - fix reference to fsl/lbc.txt in
>   Documentation/devicetree/bindings/display/ssd1289fb.txt
> 
> V4:
> - no changes
> 
> V3:
> - move this patch after the GPCM/FCM patches to dtschema/dtc warnings
>   due to missing bindings for fsl,elbc-gpcm-uio and fsl,elbc-fcm-nand
> - add "simple-bus" again, for compatibility with existing DTs/drivers
>   based on discussion with Crystal Wood and Rob Herring
> - fix fsl,pq2-localbus compatible properties based on mgcoge.dts / ep8248e.dts
>   (was missing "simple-bus")
> - add board-control (bcsr) example again, now using the compatible
>   string listed in Documentation/devicetree/bindings/board/fsl,bcsr.yaml
> - remove interrupt-parent property from example
> - rework the commit message
> 
> V2:
> - fix order of properties in examples, according to dts coding style
> - move to Documentation/devicetree/bindings/memory-controllers
> - clarify the commit message a tiny bit
> - remove unnecessary multiline markers (|)
> - define address format in patternProperties
> - trim subject line (remove "binding")
> - remove use of "simple-bus", because it's technically incorrect
> ---
>  .../devicetree/bindings/display/ssd1289fb.txt      |   2 +-
>  .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>  3 files changed, 159 insertions(+), 44 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:29.23-34.15: Warning (simple_bus_reg): /example-0/localbus@f0010100/flash@0,0: simple-bus unit address format error, expected "0"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:36.31-39.15: Warning (simple_bus_reg): /example-0/localbus@f0010100/board-control@1,0: simple-bus unit address format error, expected "100000000"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:41.31-46.15: Warning (simple_bus_reg): /example-0/localbus@f0010100/simple-periph@2,0: simple-bus unit address format error, expected "200000000"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:82.23-89.15: Warning (simple_bus_reg): /example-1/localbus@e0005000/flash@0,0: simple-bus unit address format error, expected "0"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:91.22-97.15: Warning (simple_bus_reg): /example-1/localbus@e0005000/nand@1,0: simple-bus unit address format error, expected "100000000"

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260101-ppcyaml-elbc-v5-4-251c7f14a06c@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


