Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926D875DA4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 06:37:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoGW5S11;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrZgL6NLmz3vZH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 16:37:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoGW5S11;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrZff1kGGz2xSl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 16:36:42 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1022718b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 21:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876199; x=1710480999; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t5usu+wIHjrQwBdpY/kUT6MzVOdZTbW6PSQFUQqDoaA=;
        b=NoGW5S1193EFOMLtuQIFDZtuiwD9Tcl1zslQCGpK6JLc0zcjsyoawMDDVcZi/xJpzZ
         UTHH2icK/zODG/crJcm6E+b+6s4hfsKnUJja8U5UhHVV9WNkkXSS9JRW8crFIyzkweeK
         9lRDL5nXHc8gjM9rE1x+JbPqTNx7W4DOjFhQ2RKg09nZNg/V9fnSeALOFFRyBtZiZgoI
         b5zkqw+Xp9eMCKA+gXaQnE5+pFKF93yxHXSt1VxHTfj7V/7V/JAOGOv0LiN61esQLwrS
         z1MLE1Byv0hYaLFRB0xu0IW2si2upWm3ggS41dM3luxQVvABOvphevHtRAu+TiUM25x/
         8w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876199; x=1710480999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5usu+wIHjrQwBdpY/kUT6MzVOdZTbW6PSQFUQqDoaA=;
        b=M9nN6Z+nxY7JW334zZBGedku2nhiRh9eudzSlud88jBD5uYB20nxvAHYNh8AiMJddO
         nGMBbRFBZQmjPdYo8lxBl1WEXN4hX7FBTKAlw15cBYVyaX92DcuGrYx8FHSyhK8OiJ7M
         ztqTjJp+SkDk87KJyvL5L2JdL9gIpcyHp9YNdcm9q+u1N7YcWQjqBE8VOBdQkQyDPEJW
         jz/bMisitOQe6p7FtIJgiIo0ZITmmOHBO5vgBSMrfUJSYMcUcNs3V3pxs+sbJyv+ADIc
         /TUFZ5ysb8FI/3ImUvyoJZ6ntAnvTnn3Qfya/PuZOlxgfwHBJrFbw0O1lXrqQuB20cZw
         YdNg==
X-Forwarded-Encrypted: i=1; AJvYcCVmoufCIUHRrRCsEcm4OJpxoVCZJ9MznD/guRyWsZ1SOHAT3BK+zvYOd6ycWA8bKQdds3OnB4lO8ND401ewb/nfbBwu+qdZWTEjS/mTRQ==
X-Gm-Message-State: AOJu0YzmiiJb3t+ED/GH50iaKNROxK90M3HEafjhhUjBZzQfvIPXCMEi
	+AJH7KKcjWyQ6NvP4gjAaV+rxvHaqvjLbHp5CnIu8MbpSe9OvvfEF9uOLni6oQ==
X-Google-Smtp-Source: AGHT+IHj0s/MgXdETk1px2mifakT3T/ik8rZsoVSs9rmOK2GEfO1NijLKPOfSrYwO+VEWrCBP34KEg==
X-Received: by 2002:aca:2b17:0:b0:3c1:f32e:8acd with SMTP id i23-20020aca2b17000000b003c1f32e8acdmr9318128oik.59.1709876198985;
        Thu, 07 Mar 2024 21:36:38 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id u20-20020a62d454000000b006e468cd0a5asm14446363pfl.178.2024.03.07.21.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:36:38 -0800 (PST)
Date: Fri, 8 Mar 2024 11:06:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240308053624.GB3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
 <ZeolaEIRYmKZjnvT@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeolaEIRYmKZjnvT@ryzen>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang
  <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 07, 2024 at 09:36:56PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:18PM +0530, Manivannan Sadhasivam wrote:
> > Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> > drivers requiring active refclk from host. But for the other drivers, it is
> > getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> > that this API initializes DWC EP specific registers and that requires an
> > active refclk (either from host or generated locally by endpoint itsef).
> > 
> > But, this causes a discrepancy among the glue drivers. So to avoid this
> > confusion, let's call this API directly from all glue drivers irrespective
> > of refclk dependency. Only difference here is that the drivers requiring
> > refclk from host will call this API only after the refclk is received and
> > other drivers without refclk dependency will call this API right after
> > dw_pcie_ep_init().
> > 
> > With this change, the check for 'core_init_notifier' flag can now be
> > dropped from dw_pcie_ep_init() API. This will also allow us to remove the
> > 'core_init_notifier' flag completely in the later commits.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         | 13 ++++++++++++-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> >  drivers/pci/controller/dwc/pcie-keembay.c         | 16 +++++++++++++++-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> >  10 files changed, 90 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > index 0e406677060d..395042b29ffc 100644
> > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > @@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
> >  		return ret;
> >  	}
> >  
> > +	ret = dw_pcie_ep_init_registers(ep);
> > +	if (ret) {
> 
> Here you are using if (ret) to error check the return from
> dw_pcie_ep_init_registers().
> 
> 
> > index c0c62533a3f1..8392894ed286 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
> >  		ret = dw_pcie_ep_init(&pci->ep);
> >  		if (ret < 0)
> >  			goto err_get_sync;
> > +
> > +		ret = dw_pcie_ep_init_registers(&pci->ep);
> > +		if (ret < 0) {
> 
> Here you are using if (ret < 0) to error check the return from
> dw_pcie_ep_init_registers(). Please be consistent.
> 

I maintained the consistency w.r.t individual drivers. Please check them
individually.

If I maintain consistency w.r.t this patch, then the style will change within
the drivers.

- Mani

> 
> > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > index 9ed0a9ba7619..0edd9ab3f139 100644
> > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > @@ -441,7 +441,18 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
> >  
> >  		pci->ep.ops = &pcie_ep_ops;
> >  
> > -		return dw_pcie_ep_init(&pci->ep);
> > +		ret = dw_pcie_ep_init(&pci->ep);
> > +		if (ret < 0)
> 
> Here you are using if (ret < 0) to error check the return from
> dw_pcie_ep_init().
> 
> 
> > index 778588b4be70..ca9b22e654cd 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > @@ -145,6 +145,15 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
> >  
> >  		pci->ep.ops = &pcie_ep_ops;
> >  		ret = dw_pcie_ep_init(&pci->ep);
> > +		if (ret)
> 
> Here you are using if (ret) to error check the return from
> dw_pcie_ep_init(). Please be consistent.

-- 
மணிவண்ணன் சதாசிவம்
