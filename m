Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55912869049
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 13:22:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FZRPD9sy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkc7h0rd3z3dS4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 23:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FZRPD9sy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkc6v473kz2xPW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 23:21:57 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc49afb495so35171505ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709036515; x=1709641315; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fox2FOTrnn7H7ARtUpilsDQjBFro1sbb1UtQfPOSFHk=;
        b=FZRPD9sySwuoIY8NLPLF07AtjTdeNEprsGWQ1dQFj7ZNhWAHFcSl8J5ZxL89rFabY5
         n1uDLeSn5fNtEWD+X6N9J/FgpdJ5Kqib/MVfSDjuL5ntYxbGlt5D7oTJMBkLLaYns66I
         Ie6gOiuJE2C8nJwdC3UoYyyWER07DngfYvg5s4yNpeP2CMeS025x2Y+XJKx9NizusQrP
         RNovRh8bJfsBetvCXcCO7G2b+YLL8uQqhnod+kAvI10NndNn+ImIQj9VITM2ByiT4uE1
         MeSlAVivIvnU+c/xUTjRt+5Nd7HDlJJuy9vKZjX6E8Q3uqa1q25ck0EzWzUEvvqVW688
         N6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709036515; x=1709641315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fox2FOTrnn7H7ARtUpilsDQjBFro1sbb1UtQfPOSFHk=;
        b=vhkXQgKiz7KbNBRoAhq7elg4AhFHBexNw0NMFgZe8xa0ZPPEn19z2SbFDnprPTwzAF
         +I1L9NjsNcmetw2nDo/lvdc0yuc9i2BXMmb3y1hy0FW8zEw7XzgOjg3RbS/vWtwH3u5b
         kMxBLoMAzFlqiZFrdbCyPa+1as6ldW/QOk9feOC2UM7ita7wx9y+cqizaJKt0Y4nmSrA
         oQBspuHQZePchA8MdyKvGa655fxAqSzKgkf9uj/OxA4txUoqtxO3cSAiTqIW7KHIoY6M
         gpOy4Cq9FRZT31ifv5oMQrS+ge8k/1N8pyld1Uqvs/1/P3b1s5U8F695ekj/JMOhTaj7
         0uaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1webC1xcH8NYQnZqhd9Ezr/kFoHJYmegrI6vKK6+BU5RbiwkypylROjOCTlb98DLgLd+zVWCIscS+II2Z4QjER+l3oKMXDlqA6awWkA==
X-Gm-Message-State: AOJu0YyJfjpeMmvJBlJo+DZ3UZ5lyE5rQCwQ8nRSNkxBZJjfISaTaDnV
	gkTFzpAOQnLvTrs5lKHXYw1RtoUieuAqqprCtBW7qMZstqE9nsNJGC7M65S57w==
X-Google-Smtp-Source: AGHT+IHOZyIvtu9udPjddxeRBkjckef05G60ZrgUBTNS/Hn/UgLmDOmQzD5ShaYiOTnnINlgtxpJEw==
X-Received: by 2002:a17:903:181:b0:1dc:b173:f27b with SMTP id z1-20020a170903018100b001dcb173f27bmr4528891plg.32.1709036515334;
        Tue, 27 Feb 2024 04:21:55 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902b94800b001dba356b96esm1406270pls.306.2024.02.27.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:21:54 -0800 (PST)
Date: Tue, 27 Feb 2024 17:51:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v8 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240227122141.GN2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-6-64c7fd0cfe64@linaro.org>
 <ZdzEoXwU42rFCF/W@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdzEoXwU42rFCF/W@lizhi-Precision-Tower-5810>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshih
 iro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 12:04:33PM -0500, Frank Li wrote:
> On Sat, Feb 24, 2024 at 12:24:12PM +0530, Manivannan Sadhasivam wrote:
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
> > This change will also allow us to remove the "core_init_notifier" flag in
> > the later commits.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> >  8 files changed, 63 insertions(+), 24 deletions(-)

[...]

> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index ed1f2afd830a..278bdc9b2269 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -729,7 +729,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> >  	struct device *dev = pci->dev;
> >  	struct platform_device *pdev = to_platform_device(dev);
> >  	struct device_node *np = dev->of_node;
> > -	const struct pci_epc_features *epc_features;
> >  
> >  	INIT_LIST_HEAD(&ep->func_list);
> >  
> > @@ -775,29 +774,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> >  		goto err_exit_epc_mem;
> >  	}
> >  
> > -	if (ep->ops->get_features) {
> > -		epc_features = ep->ops->get_features(ep);
> > -		if (epc_features->core_init_notifier)
> > -			return 0;
> > -	}
> 
> why remove this check?
> 

There is no point in keeping this check since we are removing the call to
dw_pcie_ep_init_registers() below. But I should've described this change in the
commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
