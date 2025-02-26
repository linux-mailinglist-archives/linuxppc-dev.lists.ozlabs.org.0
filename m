Return-Path: <linuxppc-dev+bounces-6513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD273A469FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 19:45:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z33Lq1JB4z3bnr;
	Thu, 27 Feb 2025 05:45:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740595523;
	cv=none; b=oEQiVSD3rbOK6y6SZR+w7EmiRqrsAoR2o6fgXW/zAnyCdmogQyCTbuHj/bGM/lKSPOnJFqhT49W/zcRUZP5MkkR92kYpVPrKGe7Uo3px+nPY/yl1gjBuGQw/qFM9ps/OnQYCjKFcz2zWBCtTVYtshBw8cxYh17GhI/91QzPsxGkhWeiacLryGintfEAHYasyb7jhf+rvs1muUnAez3LOdjb7eh/o+zIM9UjihvaStfTERwoE9VpqSUbI4MhnbPqfGveRdMCoAdJUKLiZH6iLJln5VFogd6vhlLQGkH2CuybGI6LCBNhgS1l9rRi+l9iJvd8k2mb+Vi2ARbvl3aRFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740595523; c=relaxed/relaxed;
	bh=yd54Ah0T2BxJh0MFM0nZrWd8P7lIWJMyEY2kDQCSojE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VAmoEqXZbejrFGTMwfrZinfrs+0+fF6MSi6SkZZClvQq1WmRor4wi8uKKzCMC1UX7jQr7DAroe4pU33GYVW89SZpIdLqXKvXq5nXBH+ltW9hYTZxAeHi9RIg08ksLJKvJDyRmruH8J52ETA8xCIcQYd02PWLEat1kN4tGd2FOCvkO/mJiUGrOyIEx0G51+UnVsCCnPBGCq/xHc+T1abtOo7MSRHf7H4KxOFmHZhMa4C4TuWuKqwT912qBVGlzFr4cdW0kdBDa9y5HTNXGptXlJirjkUM/Lit3zK8+kXuUcLL3x2m9TqjBr1AWV/Zf7pZrueZthMvmqsovrNRiGIR9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T+/xF3t4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T+/xF3t4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z33Lp1sN9z3bmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 05:45:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 159425C748F;
	Wed, 26 Feb 2025 18:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BF2C4CED6;
	Wed, 26 Feb 2025 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740595519;
	bh=ERGSj8UoLV6emwDjg3zTNHnsZejqQWg/I0zbv9GeNbM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=T+/xF3t4tpA/bM8KzWexhY5qNBzCXfgQ4G02MVaEvRJRJ/N+6fo6LnPJKg/zvWnu5
	 uRXENvWQ/Wc9Wmy5R66SK8d7kaOyHlJftocHLw6W8arDA4WvSwgO9D2ICWPuE9Rto0
	 Jze6dVjvEuoISfK82Q6TL5xD2iYG694Q4BT+ndjZiCvH8CbvpPMi6OhV85MkmJPE+G
	 uUbf0BKxHR3OQK8RUNv/e0CCeLMi927pPpjhAg3b3xQpPRSQJMS5cmbwYEFG+Vhr9R
	 SbEAFRrdq7X92lEobC3h6YeMsckxVCdbuV2e2xSDUieVI3foINpDmJUFpCjK97Dkfm
	 G8achp3TuJCIg==
Date: Wed, 26 Feb 2025 12:45:17 -0600
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
Cc: Richard Weinberger <richard@nod.at>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Crystal Wood <oss@buserror.net>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-mtd@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
Message-Id: <174059551678.3319332.12055848852503108874.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Wed, 26 Feb 2025 18:01:41 +0100, J. Neuschäfer wrote:
> Formalize the binding already supported by the fsl_elbc_nand.c driver
> and used in several device trees in arch/powerpc/boot/dts/.
> 
> raw-nand-chip.yaml is referenced in order to accommodate situations in
> which the ECC parameters settings are set in the device tree. One such
> example is in arch/powerpc/boot/dts/turris1x.dts:
> 
> 	/* MT29F2G08ABAEAWP:E NAND */
> 	nand@1,0 {
> 		compatible = "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
> 		reg = <0x1 0x0 0x00040000>;
> 		nand-ecc-mode = "soft";
> 		nand-ecc-algo = "bch";
> 
> 		partitions { ... };
> 	};
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V3:
> - remove unnecessary #address/size-cells from nand node in example
> - add Frank Li's review tag
> - add missing end of document marker (...)
> - explain choice to reference raw-nand-chip.yaml
> 
> V2:
> - split out from fsl,elbc binding patch
> - constrain #address-cells and #size-cells
> - add a general description
> - use unevaluatedProperties=false instead of additionalProperties=false
> - fix property order to comply with dts coding style
> - include raw-nand-chip.yaml instead of nand-chip.yaml
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


