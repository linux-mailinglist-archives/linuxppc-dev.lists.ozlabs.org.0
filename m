Return-Path: <linuxppc-dev+bounces-71-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB09510C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 01:57:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OlObxjtY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk7bQ4dTvz2xpp;
	Wed, 14 Aug 2024 09:57:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OlObxjtY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk6Pp1glmz2xsN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 09:03:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11284CE1870;
	Tue, 13 Aug 2024 23:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801DBC4AF0C;
	Tue, 13 Aug 2024 23:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723590219;
	bh=lp7uSJRiTTBHrLo/DVE+4oyUfn9+eFpgssiOiAeRz74=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OlObxjtYKz5g50GL6TE5MQVvfbAGE4f2Yk7bubkJH+8i51mL+B78bBoLkQu1jMGEL
	 R1OmAu6Kg5WDIpDcRHsV60/O8zn8mIfzN8994M17jBLMY2oYQVk8+ryNj5HQn1olNW
	 nFcUZQkZZ+mWoSSfIA17i3ttkXjaQVKkIAxWfOgeVBJoko4rAhxJkDeflY80cdvvfu
	 ZomQ0+SXA1XSg53e4ka+nvEYdkNeg3MmuJ2gQfh3v/9FU7wdzG/P1dStqfo3xafckF
	 v+r//v3NpfLINC1unM9U0u+GH1d3wdfIQ9Bcn/AVNAu8su18LUa4QxsroyMipBrI1w
	 1T0wwGldtHHGA==
Date: Tue, 13 Aug 2024 16:03:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
 linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
 linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC
 DRIVERS), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: fsl: cpm_qe: convert network.txt
 to yaml
Message-ID: <20240813160337.638eee6f@kernel.org>
In-Reply-To: <20240812165041.3815525-1-Frank.Li@nxp.com>
References: <20240812165041.3815525-1-Frank.Li@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Aug 2024 12:50:35 -0400 Frank Li wrote:
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,cpm-enet.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,cpm-mdio.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt

Any preference who applies this? net or soc or Rob? No preference here,
FWIW:

Acked-by: Jakub Kicinski <kuba@kernel.org>

> Sorry, It is sent by accidently. it was already post at
> https://lore.kernel.org/imx/20240809175113.3470393-1-Frank.Li@nxp.com/T/#u

patchwork for one thing considers this a newer version of the previous
posting. So hard to tell where any discussion is expected to happen.

