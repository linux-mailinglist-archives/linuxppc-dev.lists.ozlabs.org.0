Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F9842E0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:41:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBLrAF3v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPcWr3hy2z3cS5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 07:41:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBLrAF3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPcW56n6qz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 07:40:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08B7E61069;
	Tue, 30 Jan 2024 20:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D70C433F1;
	Tue, 30 Jan 2024 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706647225;
	bh=Tziik9bKi4tX2YkRAA2j4gTiRkT+EbSxGXtn+OgXeg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBLrAF3v+scJrwZ4tZtmUo8NS5KdBeub8PBKcLvqvbdbj6Q7RqEatgXoOa0HyyOGI
	 JYTVQ/zrhEnt74X2C2f6KbCMrlf/ejWZ9Yle+YxkQSN0DPOqprZmgL8w2WhqFkd7dI
	 V8ZkqzRcvNJX/158pWnnPFg/3xahgXnj9eUP+vUpNinC7sBe+SzJWaJiy26/IA/4Nj
	 ayuo181THVN7pSuhlVE9QqSP95SBjGQPNZYTiglthoFTM5Pku+kTGFSgsy2UnKgWzu
	 SKFbwQq+1V3uTV424Reop3y46Wg3f48peoHMhVEG6W/3Cf+FrVjzMmYIqDbNhXGIEp
	 zNjKHSpuiwl4w==
Date: Tue, 30 Jan 2024 14:40:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: fsl: narrow regex for unit address to
 hex numbers
Message-ID: <170664722118.2304751.35687320401186535.robh@kernel.org>
References: <20240123083505.21029-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123083505.21029-1-krzysztof.kozlowski@linaro.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 23 Jan 2024 09:35:05 +0100, Krzysztof Kozlowski wrote:
> Regular expression used to match the unit address part should not allow
> non-hex numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml        | 2 +-
>  .../devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

