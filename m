Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5856291C86E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 23:48:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AORxbsxP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9pwG62HSz3cjX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 07:48:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AORxbsxP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9pvZ0vsvz3cWZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 07:47:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3F5C621E6;
	Fri, 28 Jun 2024 21:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03868C116B1;
	Fri, 28 Jun 2024 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719611270;
	bh=IBc0CYPamY7pDeJJ43X8GTYDFhvoT6MaIAE1S29b2d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AORxbsxPRWbzJug5vWfZZCe/qUA0/8exXctT+IVd9tbVaBss0yDcTFeLyO0Fv5jYV
	 RDuvgRHHtd+j5ETzBseezP80GYrHGtYivvyfS3XISCd8krIMQA9djIA/MTvYWbWCnP
	 zYu5/EOf60wwQL9y1KKLTFC3xNH1tuEeHnNeXcDVSyPa6J2UxoH4KUQGNNTbu4UkBK
	 a8xE5Y8gx5uqaCAK2gr7xeE+XJxfWvUM/xQGprmKn3uu9McHNzBRg/zR06SUJv8lHU
	 1M0sGMcGjEVxrKYQAHXNYHOjSwlfi99Qszj0KZYnzO9v5pGQq5CkgcUJqaQ4HgsDDK
	 nTUjlvGs6vDnw==
Date: Fri, 28 Jun 2024 15:47:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string
 for i.MX95
Message-ID: <171961126622.265750.10175458936157332851.robh@kernel.org>
References: <20240626071202.7149-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626071202.7149-1-chancel.liu@nxp.com>
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, linux-sound@vger.kernel.org, lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 26 Jun 2024 16:12:01 +0900, Chancel Liu wrote:
> Add compatible string for i.MX95 platform which supports audio
> function through rpmsg channel between Cortex-A and Cortex-M core.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

