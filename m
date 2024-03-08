Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910E876145
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 10:50:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NiJFTgaG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrhHp21kpz3vX6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 20:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NiJFTgaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrhH52sbDz3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 20:50:07 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1499508a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Mar 2024 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709891405; x=1710496205; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+dKXhomeB6Ij6pEZAsrhigScw7Imo0KcKY8tqU3ajKw=;
        b=NiJFTgaGuRc0a5+8w1dGsKQEukmwW1YZZMZMwsRTVEjmmRpZy2UQ+vq8zuxj8NdYTH
         z285NIVtCY9F1NoN71UnSFJWI7pT5kxGWHTfdBGghcWixrZU6JMeP5/XbkpsbPHSK7Um
         H8ayVBd2one24mSE/gIrPvRC5C/JFxsNRTFHMl2nMPHRnATEQGfkbmjTEhxDsndfl18O
         hjM3VGZMjAt+EQcM5ImRlSbvrM3N7gmqE+D/+k9p31aJQF4WHss608gFjGORsqG2vOyJ
         SPyIfnbnT+9Y9KXXtjt5DmpiJW/IomlUIP/1dU/53SSivkBUrPWz6IeaSPdeBwoe4oOj
         iSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891405; x=1710496205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dKXhomeB6Ij6pEZAsrhigScw7Imo0KcKY8tqU3ajKw=;
        b=ODeWNVbUJLA7pGTEBgfb61vxnIRsEIpa2UoirBBM58C5VYbhgO/167HddqfU4nku+E
         k9WkD66cvK0k9OSrd75tOaY3cE/FUFej732bO5zY0WzlkZ7nvydKghWVbnecui10SIIj
         YA7u4xxBixhfosLJEIsqVfb+cooHLUKX7V17C44vmidyfKeFSCo95MSPilE7siWCZeE0
         8EPYQH/9Ycwd0im1kE453H9V7S3e8HxlzvK3MHEL2b3srnlvrXdslPmBI+gujXlvQFTc
         qpc4hEQDsqJ1+cqqZec4fxxpHi7GzrlX7HXm7FY/wG1R3hpzvLxGtoNTlXAKtCT3BqnO
         9nsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCQvWZzB8VR8am4cXDnwXTyUVjh01zbnC+i8DO2I/iax8MpawEZkR+ARHF9d23RuaE4QOcGy2ukw/Q6Z4aIQiCfQF51Mzo1SWi6mM1Wg==
X-Gm-Message-State: AOJu0YxIAFY7CkI8V9VbtcK+6cIm8bW6HwmjymPKh9aQtmGgz2Pa44bv
	6mGpQ5HeCWY2xF7sFq071xZVhl6xBirbvF2Yp/GlfnXaOOZNuwtDnBTxP6t+kA==
X-Google-Smtp-Source: AGHT+IEMW10NsMpl6QbbrMpGgV+z8bvUPkiIHa5C3nopapJCs9aJNBuwrvqex+LlxA53iZxgm5hkkg==
X-Received: by 2002:a05:6a20:160a:b0:1a1:4a45:c05f with SMTP id l10-20020a056a20160a00b001a14a45c05fmr12756809pzj.25.1709891405150;
        Fri, 08 Mar 2024 01:50:05 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090aea0800b0029bb8ebdc23sm374544pjy.37.2024.03.08.01.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:50:04 -0800 (PST)
Date: Fri, 8 Mar 2024 15:19:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240308094947.GH3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
 <ZeolaEIRYmKZjnvT@ryzen>
 <20240308053624.GB3789@thinkpad>
 <ZerUx9Vw_W997LZk@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZerUx9Vw_W997LZk@ryzen>
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

On Fri, Mar 08, 2024 at 10:05:11AM +0100, Niklas Cassel wrote:
> On Fri, Mar 08, 2024 at 11:06:24AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 07, 2024 at 09:36:56PM +0100, Niklas Cassel wrote:
> > > On Mon, Mar 04, 2024 at 02:52:18PM +0530, Manivannan Sadhasivam wrote:
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
> > > > With this change, the check for 'core_init_notifier' flag can now be
> > > > dropped from dw_pcie_ep_init() API. This will also allow us to remove the
> > > > 'core_init_notifier' flag completely in the later commits.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> > > >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> > > >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> > > >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> > > >  drivers/pci/controller/dwc/pcie-artpec6.c         | 13 ++++++++++++-
> > > >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> > > >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> > > >  drivers/pci/controller/dwc/pcie-keembay.c         | 16 +++++++++++++++-
> > > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> > > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> > > >  10 files changed, 90 insertions(+), 26 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > index 0e406677060d..395042b29ffc 100644
> > > > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > > @@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > +	ret = dw_pcie_ep_init_registers(ep);
> > > > +	if (ret) {
> > > 
> > > Here you are using if (ret) to error check the return from
> > > dw_pcie_ep_init_registers().
> > > 
> > > 
> > > > index c0c62533a3f1..8392894ed286 100644
> > > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > > @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
> > > >  		ret = dw_pcie_ep_init(&pci->ep);
> > > >  		if (ret < 0)
> > > >  			goto err_get_sync;
> > > > +
> > > > +		ret = dw_pcie_ep_init_registers(&pci->ep);
> > > > +		if (ret < 0) {
> > > 
> > > Here you are using if (ret < 0) to error check the return from
> > > dw_pcie_ep_init_registers(). Please be consistent.
> > > 
> > 
> > I maintained the consistency w.r.t individual drivers. Please check them
> > individually.
> > 
> > If I maintain consistency w.r.t this patch, then the style will change within
> > the drivers.
> 
> Personally, I disagree with that.
> 
> All glue drivers should use the same way of checking dw_pcie_ep_init(),
> depending on the kdoc of dw_pcie_ep_init().
> 
> If the kdoc for dw_pcie_ep_init() says returns 0 on success,
> then I think that it is strictly more correct to do:
> 
> ret = dw_pcie_ep_init()
> if (ret) {
> 	<error handling>
> }
> 
> And if a glue driver doesn't look like that, then I think we should change
> them. (Same reasoning for dw_pcie_ep_init_registers().)
> 
> 
> If you read code that looks like:
> ret = dw_pcie_ep_init()
> if (ret < 0) {
> 	<error handling>
> }
> 
> then you assume that is is a function with a kdoc that says it can return 0
> or a positive value on success, e.g. a function that returns an index in an
> array.
> 

But if you read the same function from the individual drivers, it could present
a different opinion because the samantics is different than others.

I'm not opposed to keeping the API semantics consistent, but we have to take
account of the drivers style as well.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
