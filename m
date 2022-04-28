Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A0513EA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 00:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq9j856clz3bxl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 08:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq9hk2Q8bz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 08:46:29 +1000 (AEST)
Received: by mail-ot1-f53.google.com with SMTP id
 w27-20020a056830061b00b00604cde931a0so4086322oti.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 15:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HfLClO0c3m5ysOvoYs15acVm9FGrl4E52LtituaKB/c=;
 b=1vlMQkuSdfG6pJ2Irsq5Gzyu08j4rbj1YwBRRkRm8An1AqYAnF4GaWJnjRlaSfnLyw
 GTXF659ojZ7cpnQ4P1+/TVZxMS8u/kA5s9YKrhkPcEcIu7tUYL5wcEMLPF/V9QI8hU13
 eKBaBc6TOh6AwFnmzl+cyI8JffYvCMsF0C5L/TidmfFoXJyKU+FO2iOLeQEB1UDq75/9
 bpyRRQY1dqZjDe0+MlcgNxddiGS8NprCohDiBQra4viBI7kJDDxfX7Rqc6oy6YIT2/ly
 7E7fUU8jEpjK+SQeAnePMVcFtffice6ferRRPEoU/bpdRxMvCEq0KcKUb6J/QJPKRGF7
 aetQ==
X-Gm-Message-State: AOAM530Q04QhjW90nFoT4A5f4DIwibdRqlkBtm/Mt5+Fg3p1V0ehpbW6
 RrhxZ+E56LfIH1ggf+nrtA==
X-Google-Smtp-Source: ABdhPJxlsAp0UyeRenAWEeWlFhn6JRT0WWSoTOr8ogVulmNOLZlOLjQYwvcFF6qzcEDtDrXI6maGPg==
X-Received: by 2002:a05:6830:4104:b0:605:b481:610e with SMTP id
 w4-20020a056830410400b00605b481610emr7799417ott.268.1651185984606; 
 Thu, 28 Apr 2022 15:46:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a8-20020a4ad5c8000000b0035eb4e5a6c6sm112724oot.28.2022.04.28.15.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:46:23 -0700 (PDT)
Received: (nullmailer pid 486861 invoked by uid 1000);
 Thu, 28 Apr 2022 22:46:23 -0000
Date: Thu, 28 Apr 2022 17:46:23 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Message-ID: <YmsZP41lvje+pBna@robh.at.kernel.org>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-4-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427075338.1156449-4-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Apr 2022 09:53:37 +0200, Michael Walle wrote:
> Convert the fsl,ls-extirq binding to the new YAML format.
> 
> In contrast to the original binding documentation, there are three
> compatibles which are used in their corresponding device trees which
> have a specific compatible and the (already documented) fallback
> compatible:
>  - "fsl,ls1046a-extirq", "fsl,ls1043a-extirq"
>  - "fsl,ls2080a-extirq", "fsl,ls1088a-extirq"
>  - "fsl,lx2160a-extirq", "fsl,ls1088a-extirq"
> 
> Depending on the number of the number of the external IRQs which is
> usually 12 except for the LS1021A where there are only 6, the
> interrupt-map-mask was reduced from 0xffffffff to 0xf and 0x7
> respectively and the number of interrupt-map entries have to
> match.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v2:
>  - drop $ref to interrupt-controller.yaml
>  - use a more strict interrupt-map-mask and make it conditional on SoC
> 
> changes since v1:
>  - new patch
> 
>  .../interrupt-controller/fsl,ls-extirq.txt    |  53 --------
>  .../interrupt-controller/fsl,ls-extirq.yaml   | 118 ++++++++++++++++++
>  2 files changed, 118 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
> 

Applied, thanks!
