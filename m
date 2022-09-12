Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4585B61DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRHJJ0PT4z3c81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 05:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.53; helo=mail-oa1-f53.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRHHs1nnlz2y8L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 05:50:00 +1000 (AEST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-127d10b4f19so26199411fac.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 12:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=WOtGK76hRewU1QooFGTAv4sMui+JsERKP+VFBuwDcNE=;
        b=ZThOvJzozJOuOU2qFM8G9ssvFtO0J8pOaRjGJVBmPVkV6OWXZuG1KRS8gNtYz1+Kuk
         Ldoz25mkF91w6dl1YXuVdvcIRCsnw5afZ78xFa42TKj6IVoGeYILL2RzeuXOr+Fy6MJO
         EyqMjqYz3oh+m1qcJlTCEKoi+WtNgMdZGIBbPhfBhMUhf6I0eEqz71ldDVc4ajseorGp
         isxJ1aKVtYRv0vs8dtBhGI+TT6UcPYM1ocSXyCPAXciXnehGwfnMKrI4Pbo9M5aaqX17
         22T1IsjItOEPFws+1pb8lpdHvetuD2D+9Tqd8H1qg6B9fNHzxGbOjLDtoYnTonIj2trM
         V+8w==
X-Gm-Message-State: ACgBeo3aY6EmBM6Elr/rd+3k8MD2hiWXevoyiNLYpUFme0BJwYsriEPk
	T7AxOED6KcqsyFrYi8qurw==
X-Google-Smtp-Source: AA6agR7Iy/SIPE6vlqf90Htx5gWZAzMAyaiURTrk8MO8EPAXdDWJI+/GfdC3pq3qc2RMgABz6ZQj3g==
X-Received: by 2002:a05:6870:7089:b0:11e:a4e8:e669 with SMTP id v9-20020a056870708900b0011ea4e8e669mr5164oae.156.1663012198534;
        Mon, 12 Sep 2022 12:49:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j16-20020a056870169000b0011e73536301sm6002348oae.52.2022.09.12.12.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 12:49:58 -0700 (PDT)
Received: (nullmailer pid 1723465 invoked by uid 1000);
	Mon, 12 Sep 2022 19:49:56 -0000
Date: Mon, 12 Sep 2022 14:49:56 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Message-ID: <20220912194956.GA1718874-robh@kernel.org>
References: <20220902213721.946138-1-sean.anderson@seco.com>
 <20220902213721.946138-2-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902213721.946138-2-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 05:37:14PM -0400, Sean Anderson wrote:
> This adds some modes necessary for Lynx 10G support. 2500BASE-X, also
> known as 2.5G SGMII, is 1000BASE-X/SGMII overclocked to 3.125 GHz, with
> autonegotiation disabled. 10GBASE-R, also known as XFI, is the protocol
> spoken between the PMA and PMD ethernet layers for 10GBASE-T and
> 10GBASE-S/L/E. It is typically used to communicate directly with SFP+
> modules, or with 10GBASE-T phys.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - New
> 
>  include/dt-bindings/phy/phy.h | 2 ++
>  1 file changed, 2 insertions(+)

A corresponding update to the schema for phy-type[1] will be needed. A 
GH PR or patch to devicetree-spec@vger.kernel.org is fine.

Acked-by: Rob Herring <robh@kernel.org>

Rob

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/phy/phy-provider.yaml#L19
