Return-Path: <linuxppc-dev+bounces-7022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A5A604BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 23:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDN5Y2hB4z3cVV;
	Fri, 14 Mar 2025 09:51:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741906273;
	cv=none; b=lDWYLUO0S5RjWzcODLGNmk1gfi1F81KdoNBQ5xE2tDgPA6B7XehkTcADL4OMIUkQOf27DNElgUaVoGKKEcL7FkDOOOtH67ZwXNWG68fd8hA6CaZIa+kNL+2C/Zz8R4jQ0wh0btBKVSAPCs9L8IvhYxkur9VNSmxw8+xyHd+fYmOuVl8t/35sreqEKz5pBRn9MOHYEvbYlLYTvyz6l699k4g4p6oaryMIoDfH/OYNLsxsFnv2Wve1n52RMEQGKuqW4Oi8TUwTMnbAAF1pXMm711ohpaedC7P/nV19cCroZ4LMuKcZ4u1L608525D7bj2Q4crRFJI12ZPbHstRL3B0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741906273; c=relaxed/relaxed;
	bh=bFj//wwZGBdovwHt+lYNXYpB+WeZJj/51UZ5Rm1r+1o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FhBlE36FX4fp/VXwKX6iX/B0jFxoPcRpMUX26O4pgPr4hgaogy5/pnwxOhCaeVwrrKiOsMv1KZjy/R46oIoJY/QkeNfu4O0yRijAEPgPMZHrg5WTo3Ce9gS1+CX4V6tWWyCckdge+ozDuEdIvUyu7kGVenkwRzwZ2dxij10xV4sY0igyJafRnRaTpYrPERnTIaJVOmbA0peJeuL+yqtLPWhKiFpln/wgPw57J2P77K7AmGK8L9e95ycg+ARAMkq+mXwaHJbpzCXkhL6kggtZad1uBprhy7iIkXLhcr4/fk07IQgTKDuyYDzcExVLNH/mJ78LCjfIk69oeizW51qNHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uo+ZoH8D; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uo+ZoH8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDN5X0rsFz3cV2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 09:51:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 223E5A471F0;
	Thu, 13 Mar 2025 22:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B44AC4CEDD;
	Thu, 13 Mar 2025 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741906269;
	bh=k+D1DYsJJtPHtdNWmrJpXnR7aYZC7cxXGtQBxIHdhTc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Uo+ZoH8D60bULMR/Z7T4I8xA3fsPkSjE5yfqOon/YjEcGXxMvg7YZb06xfS22P2Gt
	 cLUOdfmMfbFprxJw3OQVHZw9qNX9TyjM5ar7vOJmvWE8QXKqRVcFN9DXnhMn0fZCby
	 9LrWxJTFtMl90r4z2tcD5QX7wNpCFjZDRG0KGYLqnT56LJGqH+BQDqXArzCp2D6RlN
	 HYwKa77PcuqPXFopfYW9pjtBvQkpMoK+GBmriMVnC9MJOOAudxtawlUXYQU5xPYp6A
	 iKed2qW1JaTbayoeuKvba2liRmwE2dBV9Xp/MGwkmytGzpGwn7aWht1DKAyxZolXFU
	 d6t1jctx8+5CA==
Date: Thu, 13 Mar 2025 17:51:08 -0500
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
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Frank Li <Frank.Li@nxp.com>, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-4-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
 <20250313-ppcyaml-elbc-v4-4-55903722d9ea@posteo.net>
Message-Id: <174190626852.565.9247018798608897062.robh@kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Thu, 13 Mar 2025 22:35:47 +0100, J. Neuschäfer wrote:
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
>  .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>  2 files changed, 158 insertions(+), 43 deletions(-)
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
Warning: Documentation/devicetree/bindings/display/ssd1289fb.txt references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
Documentation/devicetree/bindings/display/ssd1289fb.txt: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250313-ppcyaml-elbc-v4-4-55903722d9ea@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


