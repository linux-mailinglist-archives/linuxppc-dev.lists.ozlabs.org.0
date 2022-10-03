Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF825F3440
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 19:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mh6qG5V50z3ds7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 04:13:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.52; helo=mail-oa1-f52.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mh6pg2f2Rz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 04:12:41 +1100 (AEDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-12c8312131fso13732918fac.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 10:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=uRqCFgOMTpM36wCs+5DGyRVOIuiv4dTJX59+BmawhqY=;
        b=zKCcs9l+ebpTNfnpP8qXfZqytBw5pGJPLXOBI5gpus8GCLhI5BSKuK0LWAVeMpm3EG
         B4NTCmxDR5vXoospo38nxVHZiV/0NJYGsMksTioVlmfz0gn9T7qf+iuMTEx44Kqy2H/i
         Rdaki7TKamvEWoPxJyaAqci9KIBbPHabNWLoROEyxA3BgLhAZ72DCe6AtE9/sl5/olU1
         ZkuYHeOOwpdLRH9g3c5tMn8OdlFVQ8vMWxVsr2abM30Eda/TcJyKUMyAuaVkvztY3/bB
         VfE/d8hpquXNk95obVufuyXpzY4C/8CuYVWcbONMGr0+uG12gFfFVjOPxotTrH51Eh+j
         q9VA==
X-Gm-Message-State: ACrzQf0s9c6f9A3LzLmGOWQQWBwALdJP6t83oydnO/bAqs+StfESk3M1
	vua6j4KQMKjQQnkCIX4L8w==
X-Google-Smtp-Source: AMsMyM4/DXxwUHxEN186bkLWdJo11qUzRyKhmVDXYKgZWltQ1KnSjcboYvU0qrUc5MH1Xqo6wd3P2A==
X-Received: by 2002:a05:6870:59d:b0:f3:627:e2b0 with SMTP id m29-20020a056870059d00b000f30627e2b0mr5849192oap.47.1664817159014;
        Mon, 03 Oct 2022 10:12:39 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v68-20020acaac47000000b00349a06c581fsm2556020oie.3.2022.10.03.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:12:38 -0700 (PDT)
Received: (nullmailer pid 2461899 invoked by uid 1000);
	Mon, 03 Oct 2022 17:12:37 -0000
Date: Mon, 3 Oct 2022 12:12:37 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v6 1/9] dt-bindings: net: Expand pcs-handle to
 an array
Message-ID: <166481715716.2461840.14872629352743096411.robh@kernel.org>
References: <20220930200933.4111249-1-sean.anderson@seco.com>
 <20220930200933.4111249-2-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930200933.4111249-2-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Sep 2022 16:09:25 -0400, Sean Anderson wrote:
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
> Changes in v6:
> - Remove unnecessary $ref from renesas,rzn1-a5psw
> - Remove unnecessary type from pcs-handle-names
> - Add maxItems to pcs-handle
> 
> Changes in v4:
> - Use pcs-handle-names instead of pcs-names, as discussed
> 
> Changes in v3:
> - New
> 
>  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml          |  2 +-
>  .../devicetree/bindings/net/ethernet-controller.yaml  | 11 ++++++++++-
>  .../devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml   |  2 +-
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
