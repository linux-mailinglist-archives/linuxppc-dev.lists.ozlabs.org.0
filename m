Return-Path: <linuxppc-dev+bounces-10872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0619B22A94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:32:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1YrL3jNXz2xQ0;
	Wed, 13 Aug 2025 00:32:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755009170;
	cv=none; b=lj5a+nd8fQsQUs3y7AiRn5uO+i4Y10Jn9+9OtMHjoa/YCrxFe1b3w2MW+aXawY9NGPSDvRxYGXndiHRvMtUM9kcUTc+XePLcsp64juwJNfY2qu1JKsdZccD8vVD5Dgyca3JfwMClk91JEzvvLMY+m7JRtjoDmmas7dfEIS2qbJLelJLxSRXrnLuDg9t8m5C6nz7ZKfS1JuOZt5O71QBy/xH716wKE3ahvnHC9y8fyji5xfW64+8xJjHV7TGLssiho2KP9by8CX9a1/Sh6U1ZcHG+Bwg1aZt93OyCu3d5wTem/QpOX7xhmYMGfIus2mOL88cgqiPP9rxGZT034zbAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755009170; c=relaxed/relaxed;
	bh=QM/ExpRiQGiIvKcuq4d8ioQNq+y5f6GO8oNe3a6UauY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oEf3YE0TI7EVZZ3vB6zku95c5GpcbtDNwT99Lo0MQCaBwrcdSVvwPJJco/AI5Z01OyPMC5d/mN5bQkLEjcwJHwdB03DFMLUjnH1Ukk2sakwczQnOVOWPyL/Zth/jKhNjSnBRoIRqiTXsKwvHTW+FSxsC3MFb/aHNRVLQM0U0+9WWc1rGQ/FpnlUWyHbjXb8QbXaZQvfbGjuWkLNSiUu/I1Mzf8hRKAoTpJ24XhyWAOLELUYU86Htt77FVZT0eYaetDiTQ2+E/9KySQAJbC0krUDz56Gkr4tc5ioaCsS/u0ltp2G+a/QvHDFOPU4nYjTrIVMUZrbxrjbu93xBr+EI7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aknfxh3m; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Aknfxh3m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1YrJ66Ryz2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:32:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0964CA57451;
	Tue, 12 Aug 2025 14:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8632BC4CEF0;
	Tue, 12 Aug 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755009165;
	bh=fy2/TnxpQCa912cSSfOH0Jy+C/EZqNdGuJwRBGssE/M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Aknfxh3m9XKnn6/bFwYil95p5Oh1ky5mRX2z9Y7vzkTKQ/AHKRCTvEQMHpmkXm+Tj
	 RVlRERrOzBPUqwUL+dGLwUyyrGgZbd9w4UcJkBgfk5a49SLvrgo4H0XliowoCGFGC6
	 DqFwhS0ArYrsVlaU+Q7LKT1LZIe9SqxuzePXerFg39PBZxbaxUayacfXEt2YotHuvP
	 zyUNCJ7tnCProE7MW2ExXNDMFfk/Wk33sz1iJ9srNdOuspXxEHc/XEZVMZfvInlCn4
	 Xzna/m5QVKMOsKJkfvT5T8PidCMkD8f/LXZaVBtG4cMl4TnVXcUbl+BSJ5LHxC7/EM
	 gnsNMKui+Xhew==
Date: Tue, 12 Aug 2025 09:32:44 -0500
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
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Qiang Zhao <qiang.zhao@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
Message-Id: <175500916432.3488674.1706766155168772227.robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 12 Aug 2025 13:02:54 +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it for that those IRQs can then
> be linked to the related GPIOs.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml:3:1: [error] missing document start "---" (document-start)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml: ignoring, error parsing file
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 22, in check_doc
    dtsch = dtschema.DTSchema(filename, line_numbers=line_number)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/schema.py", line 83, in __init__
    id = schema['$id'].rstrip('#')
         ~~~~~~^^^^^^^
KeyError: '$id'
Error: Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.example.dts:34.3-35.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


