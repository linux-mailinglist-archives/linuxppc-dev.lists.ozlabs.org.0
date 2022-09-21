Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C235BF6D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 08:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTm015LRz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 16:58:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zd9VKku7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zd9VKku7;
	dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTkG0Ksgz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:57:25 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id h3so5844962lja.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NK2N/b/QQywGXjYSUF1DR4DFgFeCcv8ay3tmMR7yQe4=;
        b=zd9VKku7G1ak2cVyYOpEVge/UKl5/MrmOGUtOuV36rnH2moft2SkAC/9tMMOJjqevW
         iij9gy5AkWzLqLBhcQtg1LjWDm4G7jMk8WimQOrNfN9u3qVCSv4AvFMcBkGlB/Z+DkrM
         44pP9yln+ruBWW3bjLElOcV+dH5W1qdMRKI9bGT5lqT/8i3qKkxJAdDmOLkLgCbIHLdQ
         yXDMxXv2Kyp4S00TH8ryrjxRPvWLMtROado73s+RWJl4EyKQFnQDrVSrFJ1qNp7NWebr
         brEd1UtiG4Qv3mueTQn9TpQaUJVc7FuasEN6YvoZj72MynPHRGdqSqPndsNjRBMnNICy
         zACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NK2N/b/QQywGXjYSUF1DR4DFgFeCcv8ay3tmMR7yQe4=;
        b=M8DkUV0Ci3J9cnLTTxZnM3b9xRuRM+QJ4mGBQkU0SRgE9+uk7peVBcU8xnKtQQHCYC
         U+uXUHBRlj06QxYclQG0+fJLAEtxRzayg1NBqX+rusujQN6NZK5mGfcCVfq4w5IcoxDc
         miH1ldsFAXlSwthhs2oI9TREdPL/ocTVNcZBQDJ3HiHyOPB2h0Xp7L/IbFeVH/hWjjvK
         QWoQ7WgwP49SjW9ZihsRjKA7zYd9/Ma5klMdc4dLxzVo5BQFgKIDl6YkyRpbC46DUpKC
         JgwsJpc7ezg7LRJ8Gw0WwwEMy1DFqsYzER0bTrjKu5VFR6qTpI9L7alhDCghqwxAq9DM
         OevQ==
X-Gm-Message-State: ACrzQf0Kc49WzGFwTpoixAskN142FXoixyTOjY8HiR+avLqXwmtjbnSo
	3nVt9sOAEczpWHrrQ5kyqYGWYw==
X-Google-Smtp-Source: AMsMyM4EcQa7KqdhM3o6+dyVA7n/gHX0GrxOqzZR52bpaVcu/jIZW6WrDc7SJVRTnVlFdh3dYeQywA==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id o10-20020a2e944a000000b0024f10bdb7e8mr8835541ljh.238.1663743441318;
        Tue, 20 Sep 2022 23:57:21 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p15-20020ac24ecf000000b00499cf3e3ebesm307999lfr.121.2022.09.20.23.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:57:20 -0700 (PDT)
Date: Wed, 21 Sep 2022 08:57:18 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Message-ID: <20220921065718.lafutkkgiium5ycu@krzk-bin>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920202356.1451033-3-sean.anderson@seco.com>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Sep 2022 16:23:50 -0400, Sean Anderson wrote:
> This adds a binding for the SerDes module found on QorIQ processors.
> Each phy is a subnode of the top-level device, possibly supporting
> multiple lanes and protocols. This "thick" #phy-cells is used due to
> allow for better organization of parameters. Note that the particular
> parameters necessary to select a protocol-controller/lane combination
> vary across different SoCs, and even within different SerDes on the same
> SoC.
> 
> The driver is designed to be able to completely reconfigure lanes at
> runtime. Generally, the phy consumer can select the appropriate
> protocol using set_mode.
> 
> There are two PLLs, each of which can be used as the master clock for
> each lane. Each PLL has its own reference. For the moment they are
> required, because it simplifies the driver implementation. Absent
> reference clocks can be modeled by a fixed-clock with a rate of 0.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v6:
> - fsl,type -> phy-type
> 
> Changes in v4:
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts:51.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
