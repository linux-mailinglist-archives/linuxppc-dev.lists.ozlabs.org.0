Return-Path: <linuxppc-dev+bounces-11154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B4B2CE5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 23:06:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c62F41YkRz307q;
	Wed, 20 Aug 2025 07:06:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755637576;
	cv=none; b=P3zwupdmvsNLLF5/WCfJL/XDPqYSjqgXhQzktWGZ828wiPhe5jdDWDSn2J1v06kUWFDph0GaFeNOFhc3Tx0MI8wrZI8OM7q6bBuI+h8YPLVt4ehMuRTK5lKfVqrS2gM2RkInjL3BZsNmRxh5I76Mabd1ygOM1bNKHCDEM/bETW3sn/xQFox2t4ws/vnP/8nNBCAG17JqrQW3stwIvC5/s5gGBjMLSfAENHe4gGLfcR8rhRR0v9fpwHCD4hxlKxICNd+C/paxY1I5q950WfL/henkSYJNE5m/Ie0D6dWgsF0+/luGONzgTmo/QA0+tTIub+zYYlalKkb3Yrke61/Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755637576; c=relaxed/relaxed;
	bh=92YCXkncC8mafjIE/bkZt8SEk1Hzf5E3KMeZS8Ny8sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN1URbRGEL8Gc9HidKYSfYE4ZwPGR5F3qy0W11iK2b4L18wMzHLG3sKdXJZxWU2tA9nq12AXyZdsTuYF99TTPDKsDh+w+ajLeB6IswF/tdLcfujX+gPAXTnMipzXV8JpXZcwSLdJVkJot0u6+KN+tP71sZK6Av/oxYPmoU9IBqPULSdelCzW8MudqIN5yReZKyHUEVrHdK1mO6zecOxEdwOB4VVtS8OH5sWEves5ceJxt9kXvNp04T9PT4+MfpDbrjVycobT3UCYJowghGVOq1eXoCqkHT5TpQDeT/xHgItqMEhMzIE0pt/oxZTpt92tMPpC3Iukzp+1a6hm6g7Jjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jlq1Np7Y; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jlq1Np7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c62Dz26WQz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 07:06:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D563E5C3698;
	Tue, 19 Aug 2025 21:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAF0C4CEF1;
	Tue, 19 Aug 2025 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755637568;
	bh=JFybjif0PA4bThPHFS5Y8/tz+/sdsAZ8BMw48NI4TXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlq1Np7Ye4pkVq+DvkC30NXf0evlSCoY07mDs0nXTxFZKxgu6ll6ry6C2tIS89ziF
	 hGFXPz4yDKRzwO+rQz3NiKuhPMDqv7mwsXOIHst8SEqyAnIYhPw7M0wSBfpZOQEASV
	 U6NXQbcbfXWUJL+pLy+QrC2pUeaLGWJaJA1rmMTu+gJm9tSNVETspHVxmkY4yRRA2n
	 ICuq08mzgcUFeLzleLmusbO7kKv+eo7ryG+oKIuu/e+waow+7nLTG8LVrWEsgbKhY8
	 sjx5apfhxFzP8e0K1+BX/mWOuFmYQMLV6gqbwsBcabW6DFBHAKqf83iukI+at43ICI
	 jiVyp+B4fLPIg==
Date: Tue, 19 Aug 2025 16:06:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <175563756689.1312101.13704825031197649543.robh@kernel.org>
References: <20250819165317.3739366-1-Frank.Li@nxp.com>
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
In-Reply-To: <20250819165317.3739366-1-Frank.Li@nxp.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 19 Aug 2025 12:53:16 -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual calls it as system reset controller(SRC), but it is not
> module as reset controller, which used to reset individual device. SRC
> works as reboot controller, which reboots whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add missed 's' at description
> - remove duplicate / at path
> 
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 

Applied, thanks!


