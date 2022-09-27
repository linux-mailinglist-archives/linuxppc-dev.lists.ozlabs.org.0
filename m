Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A440F5EC7D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McNvr3D6qz3c61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:34:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.49; helo=mail-ot1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNv35Vpvz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:33:34 +1000 (AEST)
Received: by mail-ot1-f49.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso6530171otb.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zjI6ubeIbgQT2Yf0aGxPciDY+P2liDNjOEnL2+LkAyE=;
        b=5MrIZxT0QHI1KGAIFtz50PdCUc22BSVw4Rp/r+kfMEHZvNMXSuKY+ushjO1VRXf3Tm
         A/ajil7/vadrwo5T2CDEGRNLe6l5imKTrI8EnFrD2ggfPd4msuOvnD4mhf0Gu4fTbv4a
         mDe87sTbck2+cpKnXc7HjZwk83XPGte2gFbb+xvkOeVSld6TSviP6D1RE8bLO1XWn6Pr
         uHcsqRHQYJYtvkcWDZ61r+AH1mntDl/ByEwWRMGvFiMdDWRUfrz4vliRuSOstYaxlwUs
         DKCFGpdvJiJoOKY37SQGOaSCqvx5rKzNu02PlgCr62M5c33kyELtJdfXJ7m1wobX8CYT
         czOA==
X-Gm-Message-State: ACrzQf1oSoc/pRLWLrjRRdMlui8EKOpQBWni+9st2VK1wewQYnEL3XP5
	LoVKwpyVSoTb58+lVxY2fg==
X-Google-Smtp-Source: AMsMyM5eq9K8ICY6X0Mr3tOx3IJ4dvoj1unYKLRLY6r5PgzFpoQnkpXjPvXns1r165xN5VFsaDkAWw==
X-Received: by 2002:a05:6830:1d4c:b0:65b:5ca1:3c5c with SMTP id p12-20020a0568301d4c00b0065b5ca13c5cmr12714674oth.77.1664292812364;
        Tue, 27 Sep 2022 08:33:32 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o11-20020a4ae58b000000b00425678b9c4bsm744517oov.0.2022.09.27.08.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:33:32 -0700 (PDT)
Received: (nullmailer pid 4069847 invoked by uid 1000);
	Tue, 27 Sep 2022 15:33:31 -0000
Date: Tue, 27 Sep 2022 10:33:31 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v5 1/9] dt-bindings: net: Expand pcs-handle to
 an array
Message-ID: <20220927153331.GA4057163-robh@kernel.org>
References: <20220926190322.2889342-1-sean.anderson@seco.com>
 <20220926190322.2889342-2-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926190322.2889342-2-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 03:03:13PM -0400, Sean Anderson wrote:
> This allows multiple phandles to be specified for pcs-handle, such as
> when multiple PCSs are present for a single MAC. To differentiate
> between them, also add a pcs-handle-names property.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> This was previously submitted as [1]. I expect to update this series
> more, so I have moved it here. Changes from that version include:
> - Add maxItems to existing bindings
> - Add a dependency from pcs-names to pcs-handle.
> 
> [1] https://lore.kernel.org/netdev/20220711160519.741990-3-sean.anderson@seco.com/
> 
> (no changes since v4)
> 
> Changes in v4:
> - Use pcs-handle-names instead of pcs-names, as discussed
> 
> Changes in v3:
> - New
> 
>  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml           |  1 +
>  .../devicetree/bindings/net/ethernet-controller.yaml   | 10 +++++++++-
>  .../devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml    |  2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index 7ca9c19a157c..a53552ee1d0e 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> @@ -74,6 +74,7 @@ properties:
>  
>          properties:
>            pcs-handle:
> +            maxItems: 1

Forgot to remove the $ref here.

>              description:
>                phandle pointing to a PCS sub-node compatible with
>                renesas,rzn1-miic.yaml#
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 4b3c590fcebf..5bb2ec2963cf 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -108,11 +108,16 @@ properties:
>      $ref: "#/properties/phy-connection-type"
>  
>    pcs-handle:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

'phandle-array' is really a matrix, so this needs a bit more:

items:
  maxItems: 1

Which basically says this is phandles with no arg cells.

>      description:
>        Specifies a reference to a node representing a PCS PHY device on a MDIO
>        bus to link with an external PHY (phy-handle) if exists.
>  
> +  pcs-handle-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

No need for a type as *-names already has a type.

> +    description:
> +      The name of each PCS in pcs-handle.
> +
>    phy-handle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -216,6 +221,9 @@ properties:
>          required:
>            - speed
>  
> +dependencies:
> +  pcs-handle-names: [pcs-handle]
> +
>  allOf:
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml b/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
> index 7f620a71a972..600240281e8c 100644
> --- a/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
> +++ b/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
> @@ -31,7 +31,7 @@ properties:
>    phy-mode: true
>  
>    pcs-handle:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
>        A reference to a node representing a PCS PHY device found on
>        the internal MDIO bus.
> -- 
> 2.35.1.1320.gc452695387.dirty
> 
> 
