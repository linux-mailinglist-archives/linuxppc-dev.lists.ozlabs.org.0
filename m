Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6612B44CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 02:07:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XNjS3JtdzF3Vg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 10:07:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QDkTBI8O"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XNgG2DDvzF3Sy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 10:05:58 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 205so976220pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=baniowhMYStzAeCarx/sh1i/50jPhkdSEMhte1BfHf4=;
 b=QDkTBI8OkV9+U41zSTFDRaG+W3egIuzxRz5itZnmQdqrzqvVJ8Xtln9xvMRJtZZjAK
 Tf56eIYGeByJ/f9FMO1zhyFYtwHRPXBRkTWMbmQGlqq3G3yU9pHj+uSYli5/GZ2nleUy
 i/3w9QBIgH5LhrPkNazF09K1o3/kld6DobWO9umsAeSvaC87oMZySdj5KuagsyM648lf
 OubKTWGcOBcWG6V+aDyDnxDiiJxNQFzItsHH/ObXq/tFCEeB/ETPIn4kxoWfIPMMCsCL
 pctGdCVVklBnwf7LWRT18d0e/QIKy88Af+qvGjHVxB4EFtB+asGhCDW9cYjes0Ty4p9q
 SaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=baniowhMYStzAeCarx/sh1i/50jPhkdSEMhte1BfHf4=;
 b=LT2huAfyPcNLm4T3oNvf7okFAEb4VnN3b8mNGDy3teOdnxoLengOUFB3ArELRUDlNb
 yem34qHjuVvXc6LYLYP2zbh14oTXCPJOHzRLaEEz0lyxGcVtJF9R7DZjeu8f0rPxkBQP
 ZK7VxQsraE0rxZ2yD4XhO5EfdER7+DOQisiFV0qKYmyRT4/YiclnPTXgrItBJQ9uhnxj
 4zKfe7891oESoXL+iB/Vn2OGYlDd4pOC+BRe5BnKwXt6cqKr4MHaEop4eeqWxmlxWcw3
 Qwlu7Io9nmleZSfQTP5CZFuF5IEgg1J9sRiEcg5S1eQqmF8x/VoZwSVNi+ct50vc5tJw
 +AuA==
X-Gm-Message-State: APjAAAUEJethXtABHAfcrtdwJdaOCjLYY8O0hU7rVq6je6luU499aYY7
 mYTyjicNa+XU5evUCZwKIuY=
X-Google-Smtp-Source: APXvYqz0PeZSDBSC5l5eljSy7AY5XnFCmp2VRvGuofWHCSx/srcu18Ht5AdkvIVeGwgA6Y5TqKZvzQ==
X-Received: by 2002:aa7:9835:: with SMTP id q21mr570191pfl.122.1568678755003; 
 Mon, 16 Sep 2019 17:05:55 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h18sm266844pfn.53.2019.09.16.17.05.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Sep 2019 17:05:54 -0700 (PDT)
Date: Mon, 16 Sep 2019 17:05:36 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V2 1/2] ASoC: fsl_mqs: add DT binding documentation
Message-ID: <20190917000535.GE12789@Asurada-Nvidia.nvidia.com>
References: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2019 at 05:42:13PM +0800, Shengjiu Wang wrote:
> Add the DT binding documentation for NXP MQS driver
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
> Changes in v2
> -refine the comments for properties
> 
>  .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.txt b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
> new file mode 100644
> index 000000000000..40353fc30255
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
> @@ -0,0 +1,36 @@
> +fsl,mqs audio CODEC
> +
> +Required properties:
> +  - compatible : Must contain one of "fsl,imx6sx-mqs", "fsl,codec-mqs"
> +		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs".
> +  - clocks : A list of phandles + clock-specifiers, one for each entry in
> +	     clock-names
> +  - clock-names : "mclk" - must required.
> +		  "core" - required if compatible is "fsl,imx8qm-mqs", it
> +		           is for register access.
> +  - gpr : A phandle of General Purpose Registers in IOMUX Controller.
> +	  Required if compatible is "fsl,imx6sx-mqs".
> +
> +Required if compatible is "fsl,imx8qm-mqs":
> +  - power-domains: A phandle of PM domain provider node.
> +  - reg: Offset and length of the register set for the device.
> +
> +Example:
> +
> +mqs: mqs {
> +	compatible = "fsl,imx6sx-mqs";
> +	gpr = <&gpr>;
> +	clocks = <&clks IMX6SX_CLK_SAI1>;
> +	clock-names = "mclk";
> +	status = "disabled";
> +};
> +
> +mqs: mqs@59850000 {
> +	compatible = "fsl,imx8qm-mqs";
> +	reg = <0x59850000 0x10000>;
> +	clocks = <&clk IMX8QM_AUD_MQS_IPG>,
> +		 <&clk IMX8QM_AUD_MQS_HMCLK>;
> +	clock-names = "core", "mclk";
> +	power-domains = <&pd_mqs0>;
> +	status = "disabled";
> +};
> -- 
> 2.21.0
> 
