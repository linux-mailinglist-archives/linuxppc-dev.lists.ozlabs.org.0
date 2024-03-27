Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CB288D957
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:41:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tdBHej0d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4KsZ44rGz3vZJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 19:41:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tdBHej0d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Krp333Rz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 19:41:12 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e0f43074edso3533141a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711528870; x=1712133670; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3kBGo9rBQDVD8B/37mPPc4bOK2wXan+HIEhCfIghQeQ=;
        b=tdBHej0d2W2nbLjBURfcNzJaHu5R/2kLFxBDudX8hsrxccPRBFFawXMLySYZtyCVeb
         kPInM0MUCYGPC5t5szBdpmQBCBt2DQ3qUCMG6S7XDEkA5VAKB/H2cQxHbyGeoW5iiYtW
         Bgxd8ih7p9JOEpCqzLIsYr/o0DRHHZNxDC4574Su7e1FOaNNzdacFdDv9r36kqZb4cAs
         VwzRwjYxc4Rq2Y956FalrGOO+cEH/gI35ZEkhQ/12M3CH2ZkwM9UWAsY9pbG1WMhYDDE
         WjkyL5b4xo9v9zWWEOCs+7QKeOEN4F/h1dU4qyAGkwlRjzVyXsVHKnBbWyY9NGZaJzNl
         okQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528870; x=1712133670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kBGo9rBQDVD8B/37mPPc4bOK2wXan+HIEhCfIghQeQ=;
        b=eoQFWzb0HNV92TS7V3POq3mW8fDYBZGT+Bomf48FRW4AOBmIA9ZtOvehvYYAyC87aX
         4aL/K5vwxH8IRhQPGqOegbhJzoJ8Wv/heNORiRtlDmHTtJPhARiedPwdAqcmD9FzU8WT
         m8wEF7zC4ReWeR25+mxLdfMTt2qxuVZAOfGI//VvlcUvYDfkYZBSwLKK6p6SNs+djiIP
         s1gxdPKldOalZkGAsfFvvf4uXGu4MNOun26V0TnFOtuThjjjPHA2LWl3Mx8MkUR3b9Yj
         QOst3J7410G5UKk46c+ZYG3YvVgLii/PkHk0CwBloIqSQnwlG2ln6GkBQRYOSdCvv0Vw
         HyVA==
X-Forwarded-Encrypted: i=1; AJvYcCVpvAHvPKZm6s6ZTsVRGhyX85ZPYHukgTYtv748m2jhIYSdGjwnGe/aWCpXth+OoQGu0icb+ux3HjzOff/rsTKGn+pQthuRo1w0H209Cg==
X-Gm-Message-State: AOJu0YxAtCR3avRbiMWFsd4HSscsZqdmF0XiwDaMdHwjA6qupy6Ar5lj
	qvedTtQw6nDlw1ZR+BacW6PgGiy+gCayYL8YOQlhr5lObWdYxVd31gaLIyDKmw==
X-Google-Smtp-Source: AGHT+IH7Hg0Sm990ZknW0ZrRwtuXnVXRB36mHywm9jAemkPYppo81oiTIBfmm8SNo3JZTiDkMTN0Pg==
X-Received: by 2002:a05:6870:239d:b0:221:bd93:2940 with SMTP id e29-20020a056870239d00b00221bd932940mr2005103oap.27.1711528869823;
        Wed, 27 Mar 2024 01:41:09 -0700 (PDT)
Received: from thinkpad ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id m9-20020a62f209000000b006e6bf165a3asm7434651pfh.91.2024.03.27.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:41:09 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:10:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v11 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <20240327084056.GC2742@thinkpad>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
 <20240327-pci-dbi-rework-v11-8-6f5259f90673@linaro.org>
 <ZgPXpZgoMqVn8QHt@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgPXpZgoMqVn8QHt@ryzen>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingk
 ai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 09:24:05AM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Wed, Mar 27, 2024 at 12:05:54PM +0530, Manivannan Sadhasivam wrote:
> > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > the host to complete the DWC core initialization. Also, those drivers will
> > send a notification to the EPF drivers once the initialization is fully
> > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > will start functioning.
> > 
> > For the rest of the drivers generating refclk locally, EPF drivers will
> > start functioning post binding with them. EPF drivers rely on the
> > 'core_init_notifier' flag to differentiate between the drivers.
> > Unfortunately, this creates two different flows for the EPF drivers.
> > 
> > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > a single initialization flow for the EPF drivers. This is done by calling
> > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > send the notification to the EPF drivers once the initialization is fully
> > completed.
> > 
> > Only difference here is that, the drivers requiring refclk from host will
> > send the notification once refclk is received, while others will send it
> > during probe time itself.
> > 
> > But this also requires the EPC core driver to deliver the notification
> > after EPF driver bind. Because, the glue driver can send the notification
> > before the EPF drivers bind() and in those cases the EPF drivers will miss
> > the event. To accommodate this, EPC core is now caching the state of the
> > EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
> > notification to EPF drivers based on that after each EPF driver bind.
> > 
> > Tested-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/cadence/pcie-cadence-ep.c  |  2 ++
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   |  1 +
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
> >  drivers/pci/controller/pcie-rcar-ep.c             |  2 ++
> >  drivers/pci/controller/pcie-rockchip-ep.c         |  2 ++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
> >  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
> >  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
> >  include/linux/pci-epc.h                           |  7 ++++---
> >  19 files changed, 65 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > index 2d0a8d78bffb..da67a06ee790 100644
> > --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > @@ -734,6 +734,8 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
> >  
> >  	spin_lock_init(&ep->lock);
> >  
> > +	dw_pcie_ep_init_notify(&pci->ep);
> 
> This looks wrong (and I think that you have not build tested this).
> 

Ah, this is silly. Sorry, added the change in a rush :(

> dw_* prefix indicates DWC, so it is a DWC specific function.
> 
> I don't think that you can use this function for the 3 non-DWC EPC drivers.
> I think that you need to use call pci_epc_init_notify() directly.
> 
> 
> (Also perhaps rebase your series on v6.9-rc1, I got conflicts when trying
> to apply it to v6.9-rc1, because it looks like the series is still based
> on v6.8-rc1.)
> 

I rebased the epf rework series and didn't get any conflict. But will rebase
this one also and send next version.

Thanks for noticing my idiocy.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
