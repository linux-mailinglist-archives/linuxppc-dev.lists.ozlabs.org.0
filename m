Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C18668416
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 21:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtGbS1MTrz3fDc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 07:38:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.178; helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtGZw1Yyqz30DC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 07:37:59 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id n8so16275762oih.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 12:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te3B7QXiN9a5dOliEetl+fEAA7YyitjOHHWZmEchd3w=;
        b=stgnDJ7tAhHLw42zgsCtcMml+0E8GQxyzphKerrz3s9RTqoMEF6pOoN5xD36vjB0Y5
         vAsQ9IMv4BthUT7q6gmPSu22rdwq46kdhnByf8KDRb+RWChXWmEE6Zq0bgCCi17XbTz4
         GSHoINb9CrXvrrpNJwVpiiUr7MIkVV99dvGDGYiUZGYp1ItdNElP9pS1MS30sbdbmf6U
         O8HNuBInJ/4jZRFTWzFroo4nbZZDWd4CBqbdYypcL0iJU/6+0bjUzCqBOEj+c35ajb+P
         CWrxNaKuSTe/2A3ftNHHJBhKpEGdjdB65uw1q5aIP5Yoch1nVFb9jA82QZLrj9yOLH+2
         Fkgw==
X-Gm-Message-State: AFqh2kpFCNH+nKJYV5H5OMSNLlwjvTYeL7I6QZHPw/hhfAi7j/Ymurmk
	PKR5vnl58cAspiY+Y2PC5A==
X-Google-Smtp-Source: AMrXdXtC9JDQSCNr2mBpmyaH+oX/tQisTbLPdzKuWPbRgBBSAol/1Q54L3bzvRFV7wQZ4EvPIFzPhA==
X-Received: by 2002:a05:6808:f8f:b0:364:9fd7:4fc with SMTP id o15-20020a0568080f8f00b003649fd704fcmr1212036oiw.50.1673555874866;
        Thu, 12 Jan 2023 12:37:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x8-20020a9d6288000000b00661a3f4113bsm9393754otk.64.2023.01.12.12.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 12:37:54 -0800 (PST)
Received: (nullmailer pid 126537 invoked by uid 1000);
	Thu, 12 Jan 2023 20:37:53 -0000
Date: Thu, 12 Jan 2023 14:37:53 -0600
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 02/10] dt-bindings: phy: Add Lynx 10G phy binding
Message-ID: <167355587246.126242.1070313368786035671.robh@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230000139.2846763-3-sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 29 Dec 2022 19:01:31 -0500, Sean Anderson wrote:
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
> ---
> 
> Changes in v9:
> - Add fsl,unused-lanes-reserved to allow for a gradual transition
>   between firmware and Linux control of the SerDes
> - Change phy-type back to fsl,type, as I was getting the error
>     '#phy-cells' is a dependency of 'phy-type'
> 
> Changes in v7:
> - Use double quotes everywhere in yaml
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
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 248 ++++++++++++++++++
>  1 file changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
