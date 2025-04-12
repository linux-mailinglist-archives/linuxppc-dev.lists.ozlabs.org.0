Return-Path: <linuxppc-dev+bounces-7631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB3A86E4E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 19:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZg5b15fLz2yr2;
	Sun, 13 Apr 2025 03:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744477776;
	cv=none; b=aqE54de/ytoFmNeagYr1R4xtKv/aioj7YWY5sDHyYvuOp9qQBv4FPyt3r4V2xfRvy5/X5r7wVeRgqSJla7nWnM/l6B/5D5CpSdGcPEg5Z8/v6dVtNdJVeSzdJwYAvRwZeLLFXnHMqnVhuRmHY/IgXkdNXPHSszMamrHu3Om21+FSAEZoKNAHqvSp2SYjfhmJXqfCHRx/D946sg3Fk9Ut5h56sVf70f1NAyMOIGGWZYRhksZkVu+Sb2D53p1MskaBSZ4hZuzIrcFrzzGYJih+2NciYvNCXOwhI4gmB5VgALGDYivnVGWHsuts4HTxPZDkMm7GnYNLNALGEpHGiRZ5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744477776; c=relaxed/relaxed;
	bh=sRfG7NfsBI5rLkopsqbBFUZphr8cXyEofEEUpRXJIyY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=S5yr5IN2+en5yempvnTQGlb6rC6iIUCLitMGTKLEpSb7p4NiNuLnIJjHAaN66GlkMYSVtzKwdJfLggCA62mOpICFZ73mVmN+QHgg/wuevEJrhrs/Cn4icUC5+F7d1ADGVBTzwJ3LTxcwCY0R6ZAYiX853u3dbAg48e2rx6OGWeQCfJ4lkaANP1e7yF+UHn2DOpUj4VsozFmWVrCJaNvijTwG26KePpZF+mX0lV+MsGois0NpxE6EKEIGVFNp1QpxH0JHIr6xvEUzuMCsCyFQXSEi/9Tq9sA204V2qXXsCZPneQVyQF06QviuTDGJA1snp2nA+WzwHcz1714u/Tn8JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bTNCdUzm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bTNCdUzm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZg5T5Szwz2ygJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 03:09:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5ECF75C4910;
	Sat, 12 Apr 2025 17:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E59C4CEE3;
	Sat, 12 Apr 2025 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477766;
	bh=0AfTfcTDNqBJUpHIEtVuw3wm5u8+gYscdgy87EVwLo0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bTNCdUzmxxvUvgUTxZPk91QJEYLOn/6SYDZA9YhmnJhMv4FSdUDSPpTFN7KyqzTTc
	 lichVb7RzvhfUwCqZShO4DuvMaJbvuzq5hxcAXoWu4WhPeQpPW3mKn7yC1Qc9sB392
	 WMmGErm8sgwlelWXei+FtQU2iMzvRpOaNdq2xHpJ8Y83faSsBjLjoYXE4ELDBx/2Ml
	 XjM9zb+AIf3Y2hr4n/Hp3+0o3Py5qkqON3sRBBfl9+WIFlMeWAFd0raBvxKGEneTUW
	 r/YtAesh6pIhSOHH6kshLyB/KikFGLxmFxsH/MgYtMgXKitRXYdh4gZ+jvfXzlWt4Q
	 FnLIxTMjpo2zg==
Date: Sat, 12 Apr 2025 12:09:24 -0500
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
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
 devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 Crystal Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
References: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
Message-Id: <174447776411.1354506.14019622197188509443.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Sat, 12 Apr 2025 14:49:38 +0200, J. Neuschäfer wrote:
> This patch rewrites pmc.txt into YAML format. Descriptive texts are
> expanded or shortened in a few places to better fit today's conventions.
> 
> The list of compatible strings (and combinations of them) is based on
> existing device trees in arch/powerpc as well as compatible strings
> already mentioned in the plain-text version of the binding.
> 
> One thing I didn't handle are soc-clk@... nodes as seen in
> Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Rebase on v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> ---
> 
> Note: The examples include a consumer (sata@19000), to demonstrate how
> sleep specifiers work. I've heard that "unrelated" nodes in examples are
> generally discouraged, but I'm not sure if it's better to keep it or to
> drop it in this example.
> ---
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 --------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 159 +++++++++++++++++++++
>  2 files changed, 159 insertions(+), 63 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/fsl/pmc.example.dtb: sata@19000 (fsl,mpc8377-sata): 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/fsl/pmc.example.dtb: sata@19000 (fsl,mpc8377-sata): 'cell-index' is a required property
	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


