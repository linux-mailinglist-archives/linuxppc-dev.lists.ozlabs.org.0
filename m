Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C763513EB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 00:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq9kL3Ch2z3c7x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 08:47:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.171;
 helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq9jx1Gj6z2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 08:47:33 +1000 (AEST)
Received: by mail-oi1-f171.google.com with SMTP id s131so6904347oie.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 15:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q9huJcn8s6ZFvkhQOahKXB71N3KDAgwVMDPvWBisL6g=;
 b=Vh5ilP7fd2fRdZ18MCJM2x04Fc3qBSvSiZ9z5ay4wwFWKq7CEEuLCkilh1tGoGwfzm
 TbazVenT+A1bq23PYXBmCcvAU9FrFlDGdiZRBtqayrWAj+28GT0Mlp8QQuyi4Qr/kXmH
 dNiyiLhuHBn7vARLdm5MMcVkyrT8MmF3VmDeNFS9Be9tBvBwtIjhgB4SdJrueEU3y2Oe
 bZnaATSDTvhUCHHUcVWKJ8xpgzFP0M2ED+N9tQlDHIjookjekQudjoLYMfGAwyE93zGJ
 HcZSgVT0/Hy78Grt1QRhT4d6w+5x7AQeiXjLJFwiULtFYkSc/8wZer1V0ShJYUtAg0V0
 g9cQ==
X-Gm-Message-State: AOAM530/5lzo1P3afxOx8jNBbT6Vnb9LZCWWlTJ+A4SXUGuWH21omeh/
 snRqTYkaj/RXWk7OccPPLg==
X-Google-Smtp-Source: ABdhPJwQ+JcKDCCjOO6AHPTKM6j6zc+pbT0oXXUv6iLsfFX/+IFTobBDki78XdVQVepJo34vSAfOAg==
X-Received: by 2002:a05:6808:150f:b0:322:b58e:25df with SMTP id
 u15-20020a056808150f00b00322b58e25dfmr218208oiw.198.1651186049925; 
 Thu, 28 Apr 2022 15:47:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bk3-20020a0568081a0300b003257eb687bbsm582152oib.31.2022.04.28.15.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:47:29 -0700 (PDT)
Received: (nullmailer pid 488602 invoked by uid 1000);
 Thu, 28 Apr 2022 22:47:28 -0000
Date: Thu, 28 Apr 2022 17:47:28 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 4/4] dt-bindings: fsl: convert fsl,layerscape-scfg to
 YAML
Message-ID: <YmsZgE3sAA8MhxmB@robh.at.kernel.org>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-5-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427075338.1156449-5-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 09:53:38AM +0200, Michael Walle wrote:
> Convert the fsl,layerscape-scfg binding to the new YAML format.
> 
> In the device trees, the device node always have a "syscon"
> compatible, which wasn't mentioned in the previous binding.
> 
> Also added, compared to the original binding, is the
> interrupt-controller subnode as used in arch/arm/boot/dts/ls1021a.dtsi
> as well as the litte-endian and big-endian properties.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> changes since v2:
>  - none
> 
> changes since v1:
>  - moved to soc/fsl/fsl,layerscape-scfg.yaml
>  - generic name for node in example
>  - mention added "syscon" compatible in commit message
>  - reference specific interrupt controller
> 
>  .../arm/freescale/fsl,layerscape-scfg.txt     | 19 ------
>  .../bindings/soc/fsl/fsl,layerscape-scfg.yaml | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml

Applied, thanks!
