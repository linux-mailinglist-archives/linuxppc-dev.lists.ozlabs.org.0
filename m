Return-Path: <linuxppc-dev+bounces-106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2987C953774
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 17:41:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UoX/suEq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wl8Vt6TJtz2yfj;
	Fri, 16 Aug 2024 01:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UoX/suEq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wl8Vt4g6Rz2ydG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 01:41:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B42261EF8;
	Thu, 15 Aug 2024 15:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9565DC4AF09;
	Thu, 15 Aug 2024 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723736497;
	bh=IYrPvjIPCrdK+O+khvX9GO/S0HHhbYIZlD2G7HwxwsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoX/suEqbFCc9eipy4uawl816ieuugHDnZOH1Dy0CJALZwXYXjqlDAARjT4/Ck1BW
	 ipbp9vep6vC08m/Deegkfa/yeLqN2kXtlLPnA8TIioC1DqNE0TSFpQfSDg5kXS49Dt
	 RNc3TiiPTzk8PvxlfkmhuMkS256BvDL/xoiU05eWQX+sEq21GxZdKnLoiTvPEMslWY
	 l9MdQe8mN4uzyklODWBBQq4BRVlgjLYqimm6dX7IXAkSki/SM+xRfVykwkktln0iwQ
	 Im3xvPG5lEFMYUqOZdNel1W+iJI6ttaC623yUMbei6WMTtUSPqvCyhvuCYC4T1gsFm
	 +IAguXMYrhsew==
Date: Thu, 15 Aug 2024 09:41:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Eric Dumazet <edumazet@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: soc: fsl: cpm_qe: convert network.txt
 to yaml
Message-ID: <172373649432.1956601.11486565362846539757.robh@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812165041.3815525-1-Frank.Li@nxp.com>


On Mon, 12 Aug 2024 12:50:35 -0400, Frank Li wrote:
> Convert binding doc newwork.txt to yaml format.
> 
> HDLC part:
> - Convert to "fsl,ucc-hdlc.yaml".
> - Add missed reg and interrupt property.
> - Update example to pass build.
> 
> ethernet part:
> - Convert to net/fsl,cpm-enet.yaml
> - Add 0x in example, which should be hex value
> - Add ref to ethernet-controller.yaml
> 
> mdio part:
> - Convert to net/fsl,cpm-mdio.yaml
> - Add 0x in example, which should be hex value
> - Add ref to mdio.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> This one is quite old. The detail informaiton is limited.
> ---
>  .../devicetree/bindings/net/fsl,cpm-enet.yaml |  59 ++++++++
>  .../devicetree/bindings/net/fsl,cpm-mdio.yaml |  55 +++++++
>  .../bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml | 140 ++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/network.txt       | 130 ----------------
>  4 files changed, 254 insertions(+), 130 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,cpm-enet.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,cpm-mdio.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> 

Applied, thanks!


