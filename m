Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48F36B1648
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 00:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX7P65RY1z3ccl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 10:11:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.50; helo=mail-oa1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX7NZ5jtxz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 10:11:26 +1100 (AEDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17683b570b8so444424fac.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 15:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678317084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZpzTxP9pW1iBHQk9wRx6hMBRNY1p1JwGR3VDx2jwqk=;
        b=F0drhM+yFRGeYfdt+qfcDXP4JW3V1nz1cQxQpuhAvHSg2+7FkJsUy00spmg9/IgJuC
         m0gJT+kg/qZWdXG+YEACGmOvLcWlOsgn7u7V1pwTJTbcme4PZI4O41SmgX+7qRynELcW
         RHUUjV4KJGQxph6MYIBzSMefIbVTiEmmSNmkHYftWG69uMyoxv7e9fbxLz5hDdXcQWxY
         bViTczfsEFnEqfRtU0QVxfHxoEk3v4vvqAaHu01zZ84GSMqRh7Od9EaKqxuCzmWtTL1k
         XCjv64+xFCC7WjyqTvTjktqZl9zfMdImwMx5n30dR/x3isp6aXk9cWBByXm1v6NbldH6
         Tlmw==
X-Gm-Message-State: AO0yUKU6oPYDMIP+x3jDifUHeQryNpbLxHZoT6jVcN9L8aLaM07mzQcc
	ewweVq2v2f/xvAlece1XWg==
X-Google-Smtp-Source: AK7set+GQezD3s44J8QbgIKux6j6r+1ND9bRslkRgIszTGTYlsmg8oIPSAKZbv6hx45+kb2D2todPQ==
X-Received: by 2002:a05:6870:b251:b0:176:26fe:d473 with SMTP id b17-20020a056870b25100b0017626fed473mr12265865oam.12.1678317084085;
        Wed, 08 Mar 2023 15:11:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t21-20020a0568301e3500b0068657984c22sm2019932otr.32.2023.03.08.15.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:11:23 -0800 (PST)
Received: (nullmailer pid 4048309 invoked by uid 1000);
	Wed, 08 Mar 2023 23:11:23 -0000
Date: Wed, 8 Mar 2023 17:11:23 -0600
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v10 04/13] dt-bindings: gpio-mmio: Add compatible for
 QIXIS
Message-ID: <167831708254.4048249.12955206935149233096.robh@kernel.org>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-5-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306191535.1917656-5-sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, 06 Mar 2023 14:15:26 -0500, Sean Anderson wrote:
> NXP has a "QIXIS" FPGA on several of their reference design boards. On
> the LS1088ARDB there are several registers which control GPIOs. These
> can be modeled with the MMIO GPIO driver.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v10:
> - New
> 
>  .../devicetree/bindings/gpio/gpio-mmio.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

