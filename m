Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6215F0DB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfCX23YPlz3cf3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 00:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.181; helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfCWY5bMbz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Oct 2022 00:38:01 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id c81so4928714oif.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 07:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jevZr+HvLkIfabkJ9RHCFEAmFsQ/4U9+lScQ8KdTR4U=;
        b=MyXq9ALhCCaB4man8MrKAb4IrZiomKR0OSh4rw34uTeTgx2Yml75k0nKcm89tCp241
         2Rw3KaWZeN+UX6tZ4raTNJvvjcmBmBpWFKMEwvKjJXLR5Kh8XlJOnCalfEXgCq/RrQea
         SpTxxfYB3KwlrtWEyyBWxZrBIuGeI3hZkhm01wSMrybhdG4BdUUa67yJxuimv501yCGt
         TUsEk4LjnBZ3ZOsxJsxrKgovh9cqAq16nnbbzCh4YF4dv88DWvdac3V6D8Q2uI0q7+kx
         3vzVRzj+siUmuVNJHTEPB3gQTN/62gaLmStiAdKNjrVevcHfKW6FuYgb+xM/RKHzdBey
         Seww==
X-Gm-Message-State: ACrzQf3MtReXuu1UYOACkafQ6bKWpm7ZnJ6bEjY6mjyNdArgnxbJ0sHE
	fovUA8kzAjsFtiM9dd5eSA==
X-Google-Smtp-Source: AMsMyM5kZfkX/Nv7QtAjvly/AOG7XEZvqZmaaiCf9ocGcxeyK9zp/9aBEfwE7rKFBEIa44M8yyWlCQ==
X-Received: by 2002:a05:6808:19a:b0:34f:ddfc:5986 with SMTP id w26-20020a056808019a00b0034fddfc5986mr3930580oic.30.1664548677906;
        Fri, 30 Sep 2022 07:37:57 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g26-20020a056830161a00b00616d25dc933sm606700otr.69.2022.09.30.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 07:37:57 -0700 (PDT)
Received: (nullmailer pid 281631 invoked by uid 1000);
	Fri, 30 Sep 2022 14:37:56 -0000
Date: Fri, 30 Sep 2022 09:37:56 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v5 2/9] dt-bindings: net: Add Lynx PCS binding
Message-ID: <166454867358.281536.13914577954285422823.robh@kernel.org>
References: <20220926190322.2889342-1-sean.anderson@seco.com>
 <20220926190322.2889342-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926190322.2889342-3-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 15:03:14 -0400, Sean Anderson wrote:
> This binding is fairly bare-bones for now, since the Lynx driver doesn't
> parse any properties (or match based on the compatible). We just need it
> in order to prevent the PCS nodes from having phy devices attached to
> them. This is not really a problem, but it is a bit inefficient.
> 
> This binding is really for three separate PCSs (SGMII, QSGMII, and XFI).
> However, the driver treats all of them the same. This works because the
> SGMII and XFI devices typically use the same address, and the SerDes
> driver (or RCW) muxes between them. The QSGMII PCSs have the same
> register layout as the SGMII PCSs. To do things properly, we'd probably
> do something like
> 
> 	ethernet-pcs@0 {
> 		#pcs-cells = <1>;
> 		compatible = "fsl,lynx-pcs";
> 		reg = <0>, <1>, <2>, <3>;
> 	};
> 
> but that would add complexity, and we can describe the hardware just
> fine using separate PCSs for now.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v5:
> - New
> 
>  .../bindings/net/pcs/fsl,lynx-pcs.yaml        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/fsl,lynx-pcs.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
