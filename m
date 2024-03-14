Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2487B884
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:23:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=urDwczyI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwJkW0YvQz3dWh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=urDwczyI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwJjp5cZfz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:22:22 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc13fb0133so4766095ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710400940; x=1711005740; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Hg0QBhHNwXtR+/hf03RzKTokT9XhPWy1qXzqNjgPKw=;
        b=urDwczyIcgEc9YsC4073IW0NXLk2o/pwOk67G8ad1ngwqimD6+k+fvuey/jQodJJbT
         AT3AlBOmVO1mSl28HsxdwYSDGP6BOC2/q6OAMsaDqrGgK4d89Tz4mQNv0+7yJEFjk+m/
         w9L8agtQGuz93qWaSk3pjR5oUHey8J/ChopjA1lINEDxrBjOtJH13O0JOgvN5BG1zKqZ
         hhok/+AFZ1C/k9D6NW/Q8Iquxh2tPG9Y8XLKTdgtlNP5UR+YofsUOVO6nVwFzpkiORGJ
         PisZ9XZsUk/hlzIziOZyNEdq4NEetx0/zUBQdiLVd0sog/XKHlB9gKHnqoljHlE3Zgv3
         CvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400940; x=1711005740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hg0QBhHNwXtR+/hf03RzKTokT9XhPWy1qXzqNjgPKw=;
        b=WAnMF+6J+/3VBfynblA4jTJizFPxyPl9aFn1hMYxyXcRQnIfZhkRj8gw88Q+3/0fMe
         ymjpCZqTIihj6CGW3HBdbZg6yE/SymaXBWm8zgDGfYfy5/uU+o9DCeUc4ZFvbs6n7d0f
         Awc8UW+22/0mnEahTIsRe8P/+5RjQUm+N0YgWxBgVS2G88qOXZNBGaGwtVWFfiWhda9H
         f0w+l2KkjGEiAGTNCmqISinWgvwCBVu3QbxHxXEsD7EL49dnNAaGXRwgbdR9LUdO5exl
         tbwxlaWHG8iyvFYoF6A66tFJwlFnHdIqYw5WvBH/01y+vUHaDpseVO3YCzlLvFrzVc1F
         MQtw==
X-Forwarded-Encrypted: i=1; AJvYcCUScI3CIZACaD6WhILhBcrL4YeVn1mLzZyhy0idJUiNnEB/fHP8ebCANrABIRWp3T9ICM7tVntR+UTF5PK/yT+iz+WLXjMrayHk0KAK+w==
X-Gm-Message-State: AOJu0YxqJ0M7IY5P4m45sBpjDDI7iD//SlLpO8OvbaA76pQemAHGiD7t
	eP2HPDiBpHUZMPYKH6GiCoOAv4DmACuprYAQa/ggBS8rskV779qM6nOOW620jg==
X-Google-Smtp-Source: AGHT+IF/X3aYAW3IYlU6wCv/eec5+n3yuANXgesmj7Xvw84faSW1oJcJKTyrIR8e5yfg2eATFcw1LQ==
X-Received: by 2002:a17:902:7594:b0:1dc:cc77:5668 with SMTP id j20-20020a170902759400b001dccc775668mr937645pll.51.1710400939560;
        Thu, 14 Mar 2024 00:22:19 -0700 (PDT)
Received: from thinkpad ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001dddeb10d83sm881090plg.223.2024.03.14.00.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:22:19 -0700 (PDT)
Date: Thu, 14 Mar 2024 12:52:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240314072207.GC4831@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
 <ZeolaEIRYmKZjnvT@ryzen>
 <20240308053624.GB3789@thinkpad>
 <ZerUx9Vw_W997LZk@ryzen>
 <20240308094947.GH3789@thinkpad>
 <Zerm_LukciAYCZxD@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zerm_LukciAYCZxD@ryzen>
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

On Fri, Mar 08, 2024 at 11:22:52AM +0100, Niklas Cassel wrote:
> On Fri, Mar 08, 2024 at 03:19:47PM +0530, Manivannan Sadhasivam wrote:
> > > > > > @@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
> > > > > >  		return ret;
> > > > > >  	}
> > > > > >  
> > > > > > +	ret = dw_pcie_ep_init_registers(ep);
> > > > > > +	if (ret) {
> > > > > 
> > > > > Here you are using if (ret) to error check the return from
> > > > > dw_pcie_ep_init_registers().
> > > > > 
> > > > > 
> > > > > > index c0c62533a3f1..8392894ed286 100644
> > > > > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > > > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > > > > @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
> > > > > >  		ret = dw_pcie_ep_init(&pci->ep);
> > > > > >  		if (ret < 0)
> > > > > >  			goto err_get_sync;
> > > > > > +
> > > > > > +		ret = dw_pcie_ep_init_registers(&pci->ep);
> > > > > > +		if (ret < 0) {
> > > > > 
> > > > > Here you are using if (ret < 0) to error check the return from
> > > > > dw_pcie_ep_init_registers(). Please be consistent.
> > > > > 
> > > > 
> > > > I maintained the consistency w.r.t individual drivers. Please check them
> > > > individually.
> > > > 
> > > > If I maintain consistency w.r.t this patch, then the style will change within
> > > > the drivers.
> > > 
> > > Personally, I disagree with that.
> > > 
> > > All glue drivers should use the same way of checking dw_pcie_ep_init(),
> > > depending on the kdoc of dw_pcie_ep_init().
> > > 
> > > If the kdoc for dw_pcie_ep_init() says returns 0 on success,
> > > then I think that it is strictly more correct to do:
> > > 
> > > ret = dw_pcie_ep_init()
> > > if (ret) {
> > > 	<error handling>
> > > }
> > > 
> > > And if a glue driver doesn't look like that, then I think we should change
> > > them. (Same reasoning for dw_pcie_ep_init_registers().)
> > > 
> > > 
> > > If you read code that looks like:
> > > ret = dw_pcie_ep_init()
> > > if (ret < 0) {
> > > 	<error handling>
> > > }
> > > 
> > > then you assume that is is a function with a kdoc that says it can return 0
> > > or a positive value on success, e.g. a function that returns an index in an
> > > array.
> > > 
> > 
> > But if you read the same function from the individual drivers, it could present
> > a different opinion because the samantics is different than others.
> 
> Is there any glue driver where a positive result from dw_pcie_ep_init() is
> considered valid?
> 
> 
> > 
> > I'm not opposed to keeping the API semantics consistent, but we have to take
> > account of the drivers style as well.
> 
> kdoc > "driver style"
> IMO, but you are the maintainer, I just offered my 50 cents :)
> 

Those valuable 50 cents :) Looking at it again, I think you are right. We
should honor the API over driver's own style.

I've changed the semantics in next version, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
