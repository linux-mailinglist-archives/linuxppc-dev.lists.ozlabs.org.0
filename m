Return-Path: <linuxppc-dev+bounces-7630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D8A86E4F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 19:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZg5Z1gkNz2ym2;
	Sun, 13 Apr 2025 03:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744477776;
	cv=none; b=mIQeX69pm75lt/124zHO1kS/1WqvM4Xba3mmChYrMzmk7OymMaMsm25oYAwyfikFIs5wI0bb1v9M52npD1Jh8UXkMo6EXnnsgl5L0xipL/e44LJuT3CgkNZ2FmMHnFr+6xPNKdLCTsc12dmytW99vayiIMYc9jMNU491RRHZOkW67CoPExegbKVHGqDq+Arnde88donAvjGjW6poMA6dWx2me6RIwB9r5VL9wsuF0k1JzaOF+5cG6IRaX5c/tOVcTJ+/vN/ZVngEnnZliw4TIMC9ffKPQw4tPLq4WaBaDVFnX8wjVg2+qc07hMko2uMmSS/ycFqLPpGsNF7ww3EI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744477776; c=relaxed/relaxed;
	bh=kzFdnT0JfG6g9S19fMLO94LAbSHHZlOjFGRwz1+oYsU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Bu0YcmxLCrB0s3CeP9r6rid0n6qBLGJzy6kL5musTV8jGrNj+OCYFhP3EZMil/ulof70cHLYexd+PMJ3lAbibtQrMEAChe0iZZ9+DUR/74UiWUt2lSAezpMh+MmF3+4m4l7ZZlF9MKpLlh4qQ3aamcVBwm1pC2MXyC0O0OR3ajnbz/PZUqM0G2r0xSjE62XrKkAyeoRem9b9eEVAHI63qS7y1O9p4dAV5Lhkq7boD9dPLz05IBIhuQQGAVt9YU6KRTt+acm/Uy8ms72E6PRB4g5bLXGeaT/f1KenXiNxg3AjM45IpxLCgwO7CZCfxxWCaEfdxCCAIRqwoRuQZSBqSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IWRVIa6s; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IWRVIa6s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 83934 seconds by postgrey-1.37 at boromir; Sun, 13 Apr 2025 03:09:34 AEST
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZg5V5qCLz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 03:09:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C56B4A44B;
	Sat, 12 Apr 2025 17:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08093C4CEE5;
	Sat, 12 Apr 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477767;
	bh=3ld2o6Mj/F94jH7yDDeMdOra5lZxxX/tPTJX7Yh+cYE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IWRVIa6sQUgho1AjQlyyF1dR2vufCEmTq5gfMz6DO89U8OuHsnIbwwUFu1fxxmr6+
	 BLz2rnOjdLDRYzOxg7nfywH0THh5hUeHHf1E/ZwEUFt/2pgaUo/c2Ng5kYhiKKNXFJ
	 Al+SEkYxWCrzi7MUCzebwi0KcDKaAUClL3IZEI34S7THE1Cx7GAUT8OtdTKm4x4xmu
	 wf/ddAueD5ctLxkxcb7AnVLoDyZbdiaU5BnTBRt2sGw+maqs/GpQOPjbsBw9I6gBpZ
	 q29EMBZGXGGSU4CbJYJ+x5ELE8ADYaX37sNResOcYTYCLnhx4IbIUclRItuVsF4wNR
	 x8LOU/42YAXxA==
Date: Sat, 12 Apr 2025 12:09:26 -0500
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
Cc: Maxime Ripard <mripard@kernel.org>, Crystal Wood <oss@buserror.net>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Richard Weinberger <richard@nod.at>, 
 Nicholas Piggin <npiggin@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
 <20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net>
Message-Id: <174447776475.1354537.103427368501741372.robh@kernel.org>
Subject: Re: [PATCH v5 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Sat, 12 Apr 2025 15:16:05 +0200, J. Neuschäfer wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


