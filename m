Return-Path: <linuxppc-dev+bounces-7151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81FA65724
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 17:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGfs72YPDz2yqn;
	Tue, 18 Mar 2025 03:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742227402;
	cv=none; b=clEAvu+n9hi1cx2X+ZOXimylaOvDgIME7yt7PqK/7c0inUO432L/sqAsYZZewvmm09xR9tGEmuvVmRRGuATjC2BO13Zkekh/dc5ibpJbYhWbG/OpAi531ZoaCjxHvxADGbccH7+fLJkOIC2id8klak/bFYAPRvssutmX4oNrRNLZI+KEN8RS7GMxLDmTuJAf4wAnKdVUFU9sEZ5ZEx40Ho6piQNZQVGkOht1W0f8FntMpSSjG5zl166kQuLrH3/sJmXPSY2g0WIYn3XGDOE6HTJOLtto0Ua/Me4t5KwHmMnfRgmBcO6AIek0SaMCt2wYoDmofVl+QJT5H3MI9Wh95w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742227402; c=relaxed/relaxed;
	bh=EvCWXHGDGRK22a/o86gr4eBtrRdrXijGQFvFSGTFwnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb9vlxo+HVQ3/s+7AAlK9qnBMxep3cpbxuV9t0iWBBBuL3l4hgPvydj04+L/HCk7f14IGiClKlZwAdwpMS/iZR6+In9x95GWXAIe22tf2LqCM1bsVg0wszC1gP4WtOWIbotqtLZl7Lb2zKBAU2Wi+wN4+nbbShcJFkFexWnZMgej+zOt6RrL+IS1mhTQTz4ijNZrnP+cWVDf/VxRGwYuRyrJsYfn0vOVTHt8AeEJyxgG+ZnWJoEIxcsvRcgD1vMj8dpzbhDHYKPpGHuu26p9jtOISRsdXw6nLztWvT6NXfs7Uc1VruHLZh7asM9olVgwJlyHJLklBYUKobtaRco8VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYQ7aey9; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYQ7aey9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGfs571W1z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 03:03:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38397A45A5C;
	Mon, 17 Mar 2025 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ABAC4CEE3;
	Mon, 17 Mar 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742227399;
	bh=brfa3n5BnjS4QD+/ZuK3dFdFOzMD+7usaWnYZwDB2vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYQ7aey92vZohAV9PzPID7FcSshuLxYwtcSMAt3Qsi2z/KUDrwrLsi2Z7ZyYtOZAw
	 WlORpRoNPbTBQQan3TDe66NlKIqoduy0euUa9OMQuaqawTlynpwHEL4+BkHk4Qf9Gg
	 pE7T0MI9uu4KBOn9BqWLQ+iaXf8FgdXbhfCcNn8sefUMLFvvQC3QgARJA14Sa+WuFH
	 IH6k1g7PBmvraSOMzcMEgWVJuv4JyGDHxbIGC6oX7MLxAt+kWHfIKFasqDewCf0TLk
	 klAuTpvU0zitUzBE1XQbkFE0cnYY41IYWeMEX76TSVzuTTR73RON+qBcKrOmiXYHRi
	 njNPNMv8iNm8Q==
Date: Mon, 17 Mar 2025 11:03:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Naveen N Rao <naveen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Crystal Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <174222739794.60508.9641557469920880307.robh@kernel.org>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
 <20250313-ppcyaml-elbc-v4-3-55903722d9ea@posteo.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-ppcyaml-elbc-v4-3-55903722d9ea@posteo.net>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 13 Mar 2025 22:35:46 +0100, J. Neuschäfer wrote:
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
> V4:
> - no changes
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


