Return-Path: <linuxppc-dev+bounces-10407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CBEB124DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 21:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpdgc6ftpz30Yb;
	Sat, 26 Jul 2025 05:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753472844;
	cv=none; b=N3xxxfeTSak7fIyQh/2ZsTYlIPGT86p5rX3DKAx21w+JJxPf7b//Wq93YY6uS7conGvtHT825BPZt7JttqbvErxGt12zf/iVbgXFCcQHbPmMf3JWs7sGb9Y1wNvuZEBX8HQR7Qj+pWKvN0sDiW7fHaCkwbJvG8mtExeCNJvV8FX9QLJBSiiWsbr9UpdH1xl/6vQB6yWA9TAWk4YlIotuh4HmH2ROTZFserKsCcH6Gn+qdN8367vFpFZON7T9Fkpuhagf4FjyJ3LPiQ621r/WI6PBha+ZR6Ms2VAlgVuDuzKnLU8n5VLBWyU5EbAoWzSLrpX8PLGd9UEgTrnr3XjF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753472844; c=relaxed/relaxed;
	bh=61XCRCfOhXsOpRvEnTwofG9n7532SZZSh5JywwwlCUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr8AZ6CsUxPLNUtAKvhmDvNEnx647viGxZEh53dFDNdMuCZepFRm/69PpAvneriCTnR4J70JEAgTDWFLhOBjEFE3uTTc9UYNFb/0en+iAv9xldAQjM5IPEaA16HUiC69qC5Q8R4cbikS5EBHUcevqKUP7JX97ISKiuGymjQkX7/gnluxQWZpWAmNO3Lzb9w1Fy1CwKA2JIqbGYD7kKcnguuZlv3OHA0ukb3oHHrcXbv6zEPqW2NGkT4XXZeGdpq01sqnrH5blATGxyM2axroEYie6TneNel0rqftDrIxEv5Db8ajnbeEDyn8QgPQOrSwBcvqUG8SE2zRcRb0tnouxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YIIqiaIO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YIIqiaIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpdgb6Gxmz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jul 2025 05:47:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 029A9601ED;
	Fri, 25 Jul 2025 19:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B26C4CEE7;
	Fri, 25 Jul 2025 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753472839;
	bh=mEjzP9TaXNL8JMZBOaOKVilLLRlX5WpZm35D+dYFv7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIIqiaIOHmnOPsekUorf5BEBcRj+fEFfAZDMVt9C8ukV0wZbtK5MHMjSySX0M5YL1
	 CKq170D/xgNjf1sSMPlJvD+ueVR1l99gaxpUEzhZZuRwM5fG7sV1/aIc3ySWRY9YAz
	 PeLTRMVf3ehqQzneaddt/2l4JBJXP1PY/C8JBJIWIHDUph5Kf66sO9Ft2YpwA3gYRn
	 mXPreQF4hIkv5GG87zPIDgRkH88e01KnB0KpYIf0S9vU58cn4UJE6ib2D9I5pZkVZs
	 mo9vodS9M0ZQHeDN9Z8BCfqY/NxGLtFmsJ/C80+U/Xw4Zjn3J914HpEuFbNj4O43Ss
	 8AWHBIN13FPYA==
Date: Fri, 25 Jul 2025 14:47:18 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference
 power-domains.yaml
Message-ID: <20250725194718.GA1727841-robh@kernel.org>
References: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 25, 2025 at 07:58:34AM +0200, Alexander Stein wrote:
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
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> index 03d71ab930d79..5b7c0a1905545 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -13,6 +13,9 @@ description:
>  maintainers:
>    - Frank Li <Frank.Li@nxp.com>
>  
> +allOf:
> +  - $ref: /schemas/power/power-domain.yaml#

This is not correct. The fix for the above warning is to add 
'#power-domain-cells' to the properties list here. You can't just 
reference the schema because you have to define the value of 
'#power-domain-cells' for this provider.

Generally, we only add a $ref to providers if they have child nodes 
(e.g. are a bus).

> +
>  properties:
>    compatible:
>      oneOf:
> @@ -75,7 +78,7 @@ properties:
>        RCPM register block is Little Endian. Without it RCPM
>        will be Big Endian (default case).
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.43.0
> 

