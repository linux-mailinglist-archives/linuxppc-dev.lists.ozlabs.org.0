Return-Path: <linuxppc-dev+bounces-67-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB635950CB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 21:01:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaQGJ4ZC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk12M0NhFz2yGC;
	Wed, 14 Aug 2024 05:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaQGJ4ZC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk12L5jL6z2yDs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 05:01:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71615617C8;
	Tue, 13 Aug 2024 19:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF127C32782;
	Tue, 13 Aug 2024 19:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723575686;
	bh=renmw59HKxMX5MC5Hbv+XrZT1TC9Hrv/wjdkVhu1QGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaQGJ4ZCSgS//R/BPnue0w1ew0ivihpN0P8gDojYPDDh5WnD/D3v4XyvuUkh7yTFx
	 dO4E4klxoPzahE8evwJIg6hc16C1X6h4CP3LzNAyO5zXO5wW0IBc8L15jO3R4IC6sh
	 OyBENSWg6koViMKG715xqbjeeph02tqzUfkj8VcdJFQjm4yl18yVw971sLJbKUS6YV
	 EuGDNVfoXqHAkng9u2DiAjA+MT5EwsWGPZHlI61YHHd/aBTFNqS/de84/7xNW0S5Sp
	 PZzvB/cIVj+ZF7+FdMVa6yRpMwFfaQ6S7DF3n85wj7/vqiyiSz/Ufmjg50YtZXNrxW
	 weknuk/ErC8Dg==
Date: Tue, 13 Aug 2024 13:01:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 07/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine
 (QE) TSA controller
Message-ID: <172357568355.1494768.17469941704094420222.robh@kernel.org>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-8-herve.codina@bootlin.com>
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
In-Reply-To: <20240808071132.149251-8-herve.codina@bootlin.com>


On Thu, 08 Aug 2024 09:11:00 +0200, Herve Codina wrote:
> Add support for the time slot assigner (TSA) available in some
> PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.
> 
> This QE TSA is similar to the CPM TSA except that it uses UCCs (Unified
> Communication Controllers) instead of SCCs (Serial Communication
> Controllers). Also, compared against the CPM TSA, this QE TSA can handle
> up to 4 TDMs instead of 2 and allows to configure the logic level of
> sync signals.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml   | 210 ++++++++++++++++++
>  include/dt-bindings/soc/qe-fsl,tsa.h          |  13 ++
>  2 files changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
>  create mode 100644 include/dt-bindings/soc/qe-fsl,tsa.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


