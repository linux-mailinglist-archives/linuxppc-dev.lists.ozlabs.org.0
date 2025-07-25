Return-Path: <linuxppc-dev+bounces-10400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A02CB11920
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 09:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpKCY6vxyz3bTf;
	Fri, 25 Jul 2025 17:25:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753428329;
	cv=none; b=PC8P0Lsa3fAd3OsCuh1rW9I6NlY1zYCliRtC76Efk8wFUHsp0MRpyNblO9bGeaE6oYK6UTscII0QDabP9WJOFGoz1FzBRaZe7r17GaPJ9SkC8T1AIf9jGOiCHzBkXiJsrbP9mxDVpNU4INIZZfakv14Vkk8X72BL0pa3bXJqQcxjH0qw1zww/w/66CadFCRGWpDdq3dQMkgNmwZA6n9kgjuNvn80HceCXjXgVS28BLeWfWsq1v4y8Ts6Wa6vF7BIL8GrQwFDbeYPqAI1Bcb23gDuau4Qy6cySGZNjJnmBLKLpSC1/Oe3t0aa+pAmhXca2hwd10zEkFMmS6n+PGtQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753428329; c=relaxed/relaxed;
	bh=MEBKrqUeEzwXrBEUWdwGDyrvG7xqwEQdSVNERLbH2iE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YKmZVtUzi6dYL0WMWajBqtHTyUpbO+29uFqS1h5AzSEr2+18v2/9eLM+4ur2D9UlCcqgWIMBHeCO4/anptNQNnhjibbNHGB+oh7BXrkk3bPwPdTShWIB0VnVzjpZTUafxZIGSMvQyEyHp16EKzHsk9mcPlWXyRiSv7BqdIEKMdgNMU59bECQPk3pAAatx9tWQDkffQjZD2nfORQVKkvQJXpqP9OTotl4OMrnpiO6IvmTZqCWxLP1KNit44UUeXryMLdBL5hiSOzK+EPD4pS5B2pOIqeIEKi8s5tK5t6tQOmsiewiKWTh64qq8Mlvl7jj7+qzPCwpTbHAU+rfPzTFAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bx/k4h7/; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bx/k4h7/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpKCY1jRRz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 17:25:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48344601DC;
	Fri, 25 Jul 2025 07:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1828C4CEE7;
	Fri, 25 Jul 2025 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753428326;
	bh=t6yI9W9ga2d5U86MGT4GedWz3RS3zaMqTHg3mi5MJtU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bx/k4h7/0kJYBlhEQVSht+043C0sEVgpEsRPYLKQWiLVmnTbJPWAr+KHTy/hYyJIi
	 qwiyuB8Y8/BgU1AqVuBIphEyLZcydKUM+/R49ZoIWTUAEJAquXda+czLEwhpKF/wWh
	 PA7Yu0pf6zA8QYTiYh8Lto9Gw6ZoUHBAHjv7AZwYJeYp3kpHjv7ktS02SshLBHZY74
	 MFZqRt3mGlqiKWoOfcSOfa1lgGm/OzC4EBxt0v1TeREA0+lD0dy+F0V4IeyXTvzYkd
	 00YIc+aln/jPDrvU08yJPBU1tIN2XFKojOL+7d1GUaiKIukguPsObThWPaUxT5P9M+
	 1nJrcY9n/nTuA==
Date: Fri, 25 Jul 2025 02:25:24 -0500
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
Cc: devicetree@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
References: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
Message-Id: <175342832496.81853.5141988537592299860.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference
 power-domains.yaml
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 25 Jul 2025 07:58:34 +0200, Alexander Stein wrote:
> dtbs_check for ls1021.dtsi warns about unsupported property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> But if removed the check warns about missing property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property
> 
> Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
> for power-controller node") explicitly added that property, add a
> reference to the common bindings to fix the warning.
> 
> Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.example.dtb: global-utilities@e2000 (fsl,t4240-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.example.dtb: global-utilities@e2000 (fsl,t4240-rcpm): '#power-domain-cells' is a required property
	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725055835.260930-1-alexander.stein@ew.tq-group.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


