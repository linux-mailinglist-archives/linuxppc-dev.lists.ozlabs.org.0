Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF2869F46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:43:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mnKF8/V+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkmZq5rFyz3vfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 05:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mnKF8/V+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkmZ46bm8z3vYC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 05:42:35 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-29954bb87b4so3262756a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 10:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709059352; x=1709664152; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6rCPg+j8C1jvS9yOkEQeWpFYDNNuRJYfgnyrNY8KDs=;
        b=mnKF8/V+UJEkxT4cuP5ul2r9M3tEMH10SEzVWrcRWFBSBYTzNjZvkCO1TxTtHrYy6s
         nFOVVVPDBCBYu0peFsqBHmvwXUcrB5/SUGEe580VR3fwLaMHwGrTL3zY88qTjXfHnvko
         cObxNNpui6M3ve9vOwM25labE+f1OvG2xHwZfH1IMykcdnHeMLhI5Sf8/LcgLkCJIlWG
         pXPdR2k6q3hkbmm2KCbSVKhzmrb1sJUAQ3WrODeBWEH3hw37uBr+Hh5QjLRQBa+L2hGH
         XjCN9dPApmUgMEku/berSbd+BXd01jx9T2ek1+tMN5As+ATkVGNtNf2Hoog5yZGuKJSd
         zhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059352; x=1709664152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6rCPg+j8C1jvS9yOkEQeWpFYDNNuRJYfgnyrNY8KDs=;
        b=JSKuwUaQ3n85xkydvFiuEz1zAWFG5EIk4HE9Y2Gbewh9jqTnliDetc3rKBX4IRM6br
         52ZEefG/GupDYJbEYg9dESh35Nk7fz5eN1ZKvK2EqcomZl5jCLVVRgrYXr4FgmnSgDRl
         6iuYjQkpQeZUXyvTj8Z50W8AWilg9O9FjnzlTjVQyeOg0PbcwoU3olLNeMNWfzVesEnt
         8qDay4xGwJcBaFYSJxol2j7dnwGIb1l1uRJACSeWgH/cTn88Q0RJ2HlUo7aP+YM9FIUZ
         U3JUJoyR/qMgGMTgXi/dabegmSlOW5XpgJXIwuxgSgMnemLY+Vud690x7w80bKA/p+bL
         FFiw==
X-Forwarded-Encrypted: i=1; AJvYcCVgpYLQz63id+BQz489EQkPz32H1QPRYfUO2tfKTGWFRXD5kJkjQgWIqJcTU1JdpaqDQclVZLPZMYd58+pIuZO9g+CsPqU1pJWW76tE9A==
X-Gm-Message-State: AOJu0YzG/4Dril30iucDMVh7pbleohvw+bbib2AgjVRg9Tr9gmzBUX0Q
	vkFTbvcUW0NoziKYfrcNtOka36FTSZoi/q+LD9KlG+pguHT6aJ19z108PROAHQ==
X-Google-Smtp-Source: AGHT+IHGnijMDtvZJeDBn9BB121pNvr/sMLOiP6/y+CYwXPpfHEAryi1aO3yqqkJry/L7BDxwUlTZw==
X-Received: by 2002:a17:90a:4285:b0:299:6a7f:cc09 with SMTP id p5-20020a17090a428500b002996a7fcc09mr7865801pjg.33.1709059351862;
        Tue, 27 Feb 2024 10:42:31 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id nr14-20020a17090b240e00b00299332505d7sm3758838pjb.26.2024.02.27.10.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:42:31 -0800 (PST)
Date: Wed, 28 Feb 2024 00:12:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v8 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240227184218.GT2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-6-64c7fd0cfe64@linaro.org>
 <ZdzEoXwU42rFCF/W@lizhi-Precision-Tower-5810>
 <20240227122141.GN2587@thinkpad>
 <Zd4bybN0malf5uBe@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4bybN0malf5uBe@lizhi-Precision-Tower-5810>
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

On Tue, Feb 27, 2024 at 12:28:41PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 05:51:41PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 12:04:33PM -0500, Frank Li wrote:
> > > On Sat, Feb 24, 2024 at 12:24:12PM +0530, Manivannan Sadhasivam wrote:
> > > > Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> > > > drivers requiring active refclk from host. But for the other drivers, it is
> > > > getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> > > > that this API initializes DWC EP specific registers and that requires an
> > > > active refclk (either from host or generated locally by endpoint itsef).
> > > > 
> > > > But, this causes a discrepancy among the glue drivers. So to avoid this
> > > > confusion, let's call this API directly from all glue drivers irrespective
> > > > of refclk dependency. Only difference here is that the drivers requiring
> > > > refclk from host will call this API only after the refclk is received and
> > > > other drivers without refclk dependency will call this API right after
> > > > dw_pcie_ep_init().
> > > > 
> > > > This change will also allow us to remove the "core_init_notifier" flag in
> > > > the later commits.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> > > >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> > > >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> > > >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> > > >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> > > >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> > > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> > > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> > > >  8 files changed, 63 insertions(+), 24 deletions(-)
> > 
> > [...]
> > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > index ed1f2afd830a..278bdc9b2269 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > @@ -729,7 +729,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > >  	struct device *dev = pci->dev;
> > > >  	struct platform_device *pdev = to_platform_device(dev);
> > > >  	struct device_node *np = dev->of_node;
> > > > -	const struct pci_epc_features *epc_features;
> > > >  
> > > >  	INIT_LIST_HEAD(&ep->func_list);
> > > >  
> > > > @@ -775,29 +774,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > >  		goto err_exit_epc_mem;
> > > >  	}
> > > >  
> > > > -	if (ep->ops->get_features) {
> > > > -		epc_features = ep->ops->get_features(ep);
> > > > -		if (epc_features->core_init_notifier)
> > > > -			return 0;
> > > > -	}
> > > 
> > > why remove this check?
> > > 
> > 
> > There is no point in keeping this check since we are removing the call to
> > dw_pcie_ep_init_registers() below. But I should've described this change in the
> > commit message.
> 
> Sperated patch will be helpful. This clean up does not related with other
> change.
> 

Well this is not a generic cleanup that could be moved to a separate patch. Due
to the changes in this patch, the use of the flag becomes redundant. So it has
to removed here itself.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
