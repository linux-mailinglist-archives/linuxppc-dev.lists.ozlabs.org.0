Return-Path: <linuxppc-dev+bounces-6514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08253A469FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 19:45:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z33Lt0WGDz3bpM;
	Thu, 27 Feb 2025 05:45:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740595526;
	cv=none; b=bmtH1ZxkCGxckKnc/1F4AUrIoP1SZGU+dbk1fQDC+otOWe/fo/msNNL8UN6RPRNHxYxXuWyrSgMm930f3/cFFIvIujbtqjD543QHtJPR4GCGdYfePotSsOhSWQOkG/b4AjW/ihPC8hWzxaH2PwMq13pKWZ4akO8cdamAOOUDJN71P5wpD/ok3U7apn0LH4gwGnc5l7BZrasW8v2kTOqISCgCkZVTM00yWr6NA3W6AuNDcupE7PbZgJfGjVVAd3/Gxx9wBvHJVEjoQdjgTOwsIuFPD2dg5K0YfKD0A6Gj4x5/f11lh5Yf7gwjxGPs6Jp5oxFPydIFp7XQ6I9Mqpvcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740595526; c=relaxed/relaxed;
	bh=RuOStWt3l4ZZzuXzPDRROWtLtvLv55mfuwOmyPfXbGk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lyMZ1mLFffl8dfmti44BeI+/tgCZ7jMVxHpySmsM+oUKAAQ6DPxzBUxfeDhnnIStdJibtxM3m88q9NQ8pJDH3heLScGKqTw0J72dICzT0qYy9DRR7sf/4/vhUYd4QyIzTARRXoZwpxHL69EXhC4FKFyhiuVLIF4vCjEkOwJi9Jjs8HfbAdMb/dm9qEym4PEDyMRZEdJ1bo4598oMusByvF9SfUXYvbdaBUjmzXpjW16rOOk71BfP1AB3/4PhPqSHF4z3YFL4u/zpWONz5Pp+2+WitL7nGep2Fib1hyKiWUdrvuI8evbsjCfW58x/ak9X1+ho9tFvjlem5ZIeV/pcjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d/DP6f2o; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d/DP6f2o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z33Ls1Wqbz3bmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 05:45:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 335836152E;
	Wed, 26 Feb 2025 18:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A44C4CED6;
	Wed, 26 Feb 2025 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740595521;
	bh=UQX5b9FThbfXC5EaNwBLuTStMWQtZPAMy+PEviHm4f0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=d/DP6f2odU0xWuLlFFE6Zghy4hWE6i8gZAxfVWux4PC8ZmGdjMjZUyo5cXfbbrofP
	 b7Fs29L3AM4mjfNhTIXqBtTUpfjtlgGg3Ctla5CcVJoRMmqUdIDYh/awr5+l9JRHP+
	 oKBBKsyH1pu9oZdl1XcmaeRdnVKkfFWKh3C8/3S1GrRs6XvjBR1hiIcHi0xF8xWxgx
	 a/4YLkYQJ8GT4MzblzTF7UiDVP0QmzKP8LW7rMQrQXepPrxc6gUkSzgCDakv1zjJll
	 fV/ffE8WEeNXc7t7YQDVPrgPxtPITI3UofFyM+5ychJLfeLwcDWl2oGBipyQTtznQ2
	 w50qawF7ElkMw==
Date: Wed, 26 Feb 2025 12:45:19 -0600
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250226-ppcyaml-elbc-v3-3-a90ed71da838@posteo.net>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-3-a90ed71da838@posteo.net>
Message-Id: <174059551786.3319377.4330281854518280945.robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Wed, 26 Feb 2025 18:01:42 +0100, J. Neuschäfer wrote:
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/display/ssd1289fb.txt references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
Documentation/devicetree/bindings/display/ssd1289fb.txt: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226-ppcyaml-elbc-v3-3-a90ed71da838@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


