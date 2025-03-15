Return-Path: <linuxppc-dev+bounces-7100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44861A63199
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 19:31:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFVDv1C7Jz30VF;
	Sun, 16 Mar 2025 05:31:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742063487;
	cv=none; b=cEweZ1NHjxlklIFP3MZ5vALd4+2JOPw8ha6sjPoO9+AV+UcU+Fa9lHtardNr8IkiR+eSDnu//fBcox9JjAaTqZGGWNh4IAjLABG3CmKPk5Eblyw4VWuHqBkySLKV4xrlJHKIe4o945R5stBt81mDetzbqHo5/oA+CKWNtLjwE9A8RIJCIhnSpuOZriZdVyquJM2pxLrLqs21AO6r75B3JcGRkzO16OE0nb2ifoP+aIt1JgS44sJiK2P2Kbln+0Sjps77TEQ2L93jMtij2CyjGrYQ5CHgbmCsQWNrmfO9Um8pAsrCbKVC9StfCEKxE/ianbtZgJQ3od0XvpFEoDMsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742063487; c=relaxed/relaxed;
	bh=Qrzpty4MmN5oZ3EulUylXubNBMmi7/D2ReYsWzILiCs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DW9PO3QfHAyCqjAY7UmY/00T+81JVm7S22urdnCVL21tF/17MJ8shCU5S1UsG4Q7Z0H2MBOskMHEPlA0/VWkqdQS9HDtX0Eqwo4L4fyqxX5JUHWKfOOiyXeS3nWjOoAXzjko+lKjHZfPl/8gVT2nlN+iVNZsZnMyWHZo9G3BBng3osu73gfGpy5tLX/4pwviZVIBRzmCdygiTyieuP0A6X2xAJwr6JgJsgi/NVAtz+6ZRInA6LyeDpvwhYFg7wQrMYyYZPJ+vF+vjJMjBG272zgFtaUVAlGxX4+vVzCR6zZk5ow1GnLLn2YyCvLG900YsPAcL8AgpqPOejuEHVShvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYHEAY/M; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYHEAY/M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFVDt09gFz306S
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Mar 2025 05:31:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E493E5C01DB;
	Sat, 15 Mar 2025 18:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DE0C4CEE5;
	Sat, 15 Mar 2025 18:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742063482;
	bh=0vfRuOck6enEATJsxwnNJ97w8R1LMXCI2iLptXnQIU0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NYHEAY/MlCKSqP3IBOlMPfNYkjroro5RKtI3W7/xGpH4ak32s3UztdI7UqFLOEKr5
	 VYnlEw6gUkiP2DcpIHMgscMlL50A84eTecOIy+sMi3B0NkLhQCzSMfhH5adzm5V64s
	 in6+RuKSPJ7ATi7kQz9a9WVR7C19T7A6Y+SR+1UNQLLSDXlYrBsxvfbim8P79IRrMy
	 CSb0iOjc0S0pXBw1fYyjH7oTqSmpgwvF3qiCSjZ7fgORRQeQfsM5zEInfePjpnmjR4
	 eF3R877fUET0tUeWkysztKsL6DkB/Fdl9GkunMyFo+Gf+GALvu5vQmNesSrjqwcDMV
	 if4uWd9d4MNKQ==
Date: Sat, 15 Mar 2025 13:31:21 -0500
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
Cc: Naveen N Rao <naveen@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Crystal Wood <oss@buserror.net>, 
 linuxppc-dev@lists.ozlabs.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kernel@vger.kernel.org
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net>
References: <20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net>
Message-Id: <174206348097.159805.1044453003821020231.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Sat, 15 Mar 2025 18:27:05 +0100, J. Neuschäfer wrote:
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
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 --------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 159 +++++++++++++++++++++
>  2 files changed, 159 insertions(+), 63 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/powerpc/fsl/pmc.example.dtb: /example-0/sata@19000: failed to match any schema with compatible: ['fsl,mpc8377-sata', 'fsl,pq-sata']
Documentation/devicetree/bindings/powerpc/fsl/pmc.example.dtb: /example-0/sata@19000: failed to match any schema with compatible: ['fsl,mpc8377-sata', 'fsl,pq-sata']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


