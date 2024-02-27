Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEF869F61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:48:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m9O+KwkO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkmj76fRmz3vfC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 05:48:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m9O+KwkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkmhQ5RVlz3dVj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 05:48:05 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e55bb75c9eso55242b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 10:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709059682; x=1709664482; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8ShmjsBfirtuVXn7YN7NE2+9S2ssUe4qcNu7gqy8zk=;
        b=m9O+KwkOpbEbg8jkMa9VJQWMZsEiB+EMkADwlZR2QY3TZChTaQ1ryTTbknZh7L6Be9
         pqYs2f5ujrme4O2CpeUiiJZdu6U4hZS++oPv+vj0gheOt4heMUdpoLQbkmeZcVuagbtY
         zN+dIcNcrrg0oP2TfK4PzX2x70oYfoAhR5akJe9XJBgxhek4+jRt0FilzI+vqTLiaAME
         Gayt03KjfParQ6K6Y9gWMob2bWNnt1j2iw7gVuRswTLY0eT0owSOS1+As6S6XEnexNo7
         /hGkqbbmsOv0V4NcZChCcZlfY+RgNDmVbR0II3dx0FiZL/LMyeQ4QuLPU2Y7I+62r5YD
         WPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059682; x=1709664482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8ShmjsBfirtuVXn7YN7NE2+9S2ssUe4qcNu7gqy8zk=;
        b=LKYV8gyfGQ85BiHYjyvWXfdhS2Dc+7RyPDbP3bPcd1wEn42VV9cVaVGGWlpJMQnU2q
         HmX0HLrei6JWVseIYiCTTn9nFfLIeacbSjzkQ3koHAvNLsg1Lbt64uelg49V7Sbl9U1e
         N0caq92Lu2/yWgiI3UeZp3mSzQ2M/tpicYW9MfZhQp+emaCaAcP09DOWJ+0FOXLFKwKM
         SyLgFaSOxtC5odam2RHG6llWP82EMPC3oEcDOoHrEjRIkAvYkwFkL2z6ccmDwHpmtne6
         lAQCgoqc/iTdU3Pr7zTc/SQ4XMexh/1MNnRlodeg4+is4lPJtBlKsx8VdrRfsaz7sCcT
         O8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVTanwtPAQu6YuojENfb6+hN4ov9E07iR7snN/UNvbLsf4kKEApuj5P3tjqdJb2W9jU1UDFaqa4+iJpivuGVYpoajeRY42pU9D4SNwz5Q==
X-Gm-Message-State: AOJu0YzDumuYem1zWlkKjIppZ2iW5UbK9wKieTDqlQP8+wFoEvzBZKw0
	ZEBRAVU3kVFcLZIRuhTRSLGviMFVRgJDDEERjnB6ryID4+1c3YIb+K2pmjLIqQ==
X-Google-Smtp-Source: AGHT+IGkys0fKbeS9Jt1kuxo+kV1ICMy26+vP7tNYAsfOhXbaH/LE978wltzQSZ6voKtVRqGdPcHyg==
X-Received: by 2002:a05:6a21:920b:b0:1a0:adbc:7a96 with SMTP id tl11-20020a056a21920b00b001a0adbc7a96mr3099279pzb.36.1709059682411;
        Tue, 27 Feb 2024 10:48:02 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id km8-20020a17090327c800b001d8f81ecebesm1845645plb.192.2024.02.27.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:48:02 -0800 (PST)
Date: Wed, 28 Feb 2024 00:17:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v8 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <20240227184746.GU2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
 <ZdzIada1H95ike0t@lizhi-Precision-Tower-5810>
 <20240227123230.GP2587@thinkpad>
 <Zd4dFyM78Nc1f7fk@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4dFyM78Nc1f7fk@lizhi-Precision-Tower-5810>
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

On Tue, Feb 27, 2024 at 12:34:15PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 06:02:30PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 12:20:41PM -0500, Frank Li wrote:
> > > On Sat, Feb 24, 2024 at 12:24:15PM +0530, Manivannan Sadhasivam wrote:
> > > > Now that the API is available, let's make use of it. It also handles the
> > > > reinitialization of DWC non-sticky registers in addition to sending the
> > > > notification to EPF drivers.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > index 2fb8c15e7a91..4e45bc4bca45 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > @@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
> > > >  	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> > > >  		dev_dbg(dev, "Received Linkdown event\n");
> > > >  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
> > > > -		pci_epc_linkdown(pci->ep.epc);
> > > > +		dw_pcie_ep_linkdown(&pci->ep);
> > > 
> > > Suppose pci_epc_linkdown() will call dw_pcie_ep_linkdown() ?
> > > why need direct call dw_pcie_ep_linkdown() here?
> > > 
> > 
> > I've already justified this in the commit message. Here is the excerpt:
> > 
> > "It also handles the reinitialization of DWC non-sticky registers in addition
> > to sending the notification to EPF drivers."
> 
> API function name is too similar. It is hard to know difference from API
> naming. It'd better to know what function do from function name.
> 

In reality we cannot name a function based on everything it does. The naming is
mostly based on what is the primary motive of the API and here it is handling
Link down event. Maybe dw_pcie_ep_handle_linkdown() would be an apt one, but
that's out of scope of this series (since changing that would also require
changes to other similar APIs).

- Mani

> Frank
> > 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
