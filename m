Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA28839D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:00:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464x1J1YxQzDrN6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 06:00:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kw+oLUAx"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464wzC3jlJzDrB0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 05:58:31 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w3so9146566pgt.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VCbCImaeM8b+lSq9b5GdAInVj6FUq3y4HZVgqjfUX78=;
 b=Kw+oLUAxF2xxa7RFNdoD7DmGpocjBPvMlHmmMmL5/etDe1Tt38kDjqNzn7BakcQozY
 hxSEPjM5Xm9RuXFZxikLSc712ri71mgNhwqMMCfZECvg5XFueWEjk+QBrjlJqvawY89w
 JVi+SILsovZ742bj7b6ctTI7RqJOMdc4N+qSmLINodL+CqdxPpFQyba7Dg1Veo8nxy89
 5g0lAZJkfGMsJi3MVaA71iAXyKgO2eo2fEe86jSPJzumEk90NqF1r35J3lhndVRigHvI
 1wfTydffNCtLrzfblDWprgfw5q82Y2pJpWtoln7iVuuKmCKAVE/ptSi3kvI9LiUpPOvW
 Ihig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VCbCImaeM8b+lSq9b5GdAInVj6FUq3y4HZVgqjfUX78=;
 b=o6oMrPkQnfNGZd9BfrXdxP074pFiqU6e/PtOU6XaDK+/effHyNvwQrnwD5606WDwqC
 FVjFaB2+erBVYQ79xPDCPJV55KaOTH/cQN1XkT8crzIQd9CdLcvuwdNVmHn3Tsv7gPTp
 HJriRe+TkbKudw7Y+oS9RkQR4tnyzB0j5AzOFHQiBIwjv2qP13S5tc/cmIMhDn63iDuZ
 +9vIDTBNtmQ9S+xElB3vMfJnbYHZOz7VMSqYVl66gKn3g95/l4eUMQBwW21AH0zAF8Bx
 UIlTFIOOriz6RVH1iGu18V2Zfzjbm51wSnzASqFjHABSOij+epRGfAIwCFTsuTtutP94
 qlGQ==
X-Gm-Message-State: APjAAAULiS76e2R51ZyzO+Q11xJEy/xrC0+L8pskVqRnF1klRvZLmYAX
 nDGCq6wXij1xjKybvU+ZO5A=
X-Google-Smtp-Source: APXvYqwr8vYcmauTzmL6JZ6snH2j18Lcbrgl3NoEzcj7F6farIZmKNhOtBqj2Vm5a48ynNus84SThw==
X-Received: by 2002:a63:60d1:: with SMTP id
 u200mr18948265pgb.439.1565380707327; 
 Fri, 09 Aug 2019 12:58:27 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 f197sm97530357pfa.161.2019.08.09.12.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 12:58:26 -0700 (PDT)
Date: Fri, 9 Aug 2019 12:58:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_esai: Add new compatible string for imx6ull
Message-ID: <20190809195812.GA8148@Asurada>
References: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
 <1565346467-5769-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565346467-5769-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 09, 2019 at 06:27:47PM +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx6ull-esai" in the binding document.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  Documentation/devicetree/bindings/sound/fsl,esai.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,esai.txt b/Documentation/devicetree/bindings/sound/fsl,esai.txt
> index 5b9914367610..0e6e2166f76c 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,esai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,esai.txt
> @@ -7,8 +7,11 @@ other DSPs. It has up to six transmitters and four receivers.
>  
>  Required properties:
>  
> -  - compatible		: Compatible list, must contain "fsl,imx35-esai" or
> -			  "fsl,vf610-esai"
> +  - compatible		: Compatible list, should contain one of the following
> +			  compatibles:
> +			  "fsl,imx35-esai",
> +			  "fsl,vf610-esai",
> +			  "fsl,imx6ull-esai",
>  
>    - reg			: Offset and length of the register set for the device.
>  
> -- 
> 2.21.0
> 
