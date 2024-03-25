Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DE88A418
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:18:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vo8wL1UK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3FQb35n3z3vX3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 01:18:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vo8wL1UK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3FPr0kdYz3cDw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:17:34 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6b5432439so3321852b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711376251; x=1711981051; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0j0+WJEClcsY1ZLRLTNOl6KxnRBJYlHp2TmN77gstlg=;
        b=vo8wL1UKzEzt03dBES1reWhxzN+6fT4F0YHlUSbxR1asJ29UvP2bLuiV2Mm9Bc9Bol
         sOLC4ZadLhk8RI+J4Mm8sIDTKCZMFvp5IQ3CPOY+g1RhmGpqEmGZ3fym6dsR8g/v70tO
         EOb1i1TV3cJIa8FJ3lsz+RY5gY3+YI5RPHXYlww3wTQhs8jbGwtJQJKjHgMg+IsZvn1Z
         f5OmKz23uJgl9POV6INineHmmUhmK2lIzm6uXKtbEi7yyR7Rg0ls1O0p2f6oACR4NZST
         zspDdC+ExmO8Uq6HR7fhBZihYmqaP1kYdCLhidnpaivfkhbXwfXVh01wPLsrnYW7Rc38
         wQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376251; x=1711981051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j0+WJEClcsY1ZLRLTNOl6KxnRBJYlHp2TmN77gstlg=;
        b=NqzPBsIweb0TcREhIQfkR+2qRSr19Zr4iiKrMghNVeJZwTShKrhKHsYUjvVnQPIK4O
         rCovt2JMo3aJWHR9HkKXw/EgttCDXcNurpVilEqtqgKYic4cICMmP3U33SiXUlTFHitf
         4ZJZqtEYwJSu5LOIcANo+KI7+8uddqHZi+zzvnkOWuvmlMHMUyeBDDqZm4x/pmcqQe6H
         zao/vFpQEjIhQ2fpSddw3YELWB9+J67a+1IMifq+w+aW2vUn5I2++F/FULsSW3Cv5cps
         PbIJC9kj3fUQQngJK+CkKeN450EMC7HK/VxgzxcQ95vk8cUrF4q44sq/LCjAh+P6TlbH
         uxlg==
X-Forwarded-Encrypted: i=1; AJvYcCU9eDCUJAKh8arvY2Lanja2xGTQy+QwqWclxaaBJkUtJoU/RPpMULFbkOoklULzwDOCBfhJz6IWY7ThOUyBYHeCUWYPkotemrsKPt4AmQ==
X-Gm-Message-State: AOJu0YwHhQDVknuBTiYft8ghRN6AQHdhKwbxir/cdgPbHfrVDFCeVa8Q
	LtRNwTm/y9DvYN+mMFAgtjACY9FiHD0rXAsawMJ1IOqJTJridSuE8zvH0uB7RA==
X-Google-Smtp-Source: AGHT+IGt81Wd5PNUHb9reJZgU/GFYtwbIn5716OPRltJ4cQey21mzq5YUv6LXvmRDnnlFilp9pVUoA==
X-Received: by 2002:a05:6a00:2345:b0:6e6:bb2b:882c with SMTP id j5-20020a056a00234500b006e6bb2b882cmr7821317pfj.13.1711376251041;
        Mon, 25 Mar 2024 07:17:31 -0700 (PDT)
Received: from thinkpad ([117.207.29.15])
        by smtp.gmail.com with ESMTPSA id x25-20020a056a00271900b006e24991dd5bsm4217943pfv.98.2024.03.25.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:17:30 -0700 (PDT)
Date: Mon, 25 Mar 2024 19:47:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v10 8/8] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240325141706.GD2938@thinkpad>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
 <20240314-pci-dbi-rework-v10-8-14a45c5a938e@linaro.org>
 <Zf1xTkuK8yBZXmQ0@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf1xTkuK8yBZXmQ0@ryzen>
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

On Fri, Mar 22, 2024 at 12:53:50PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 01:18:06PM +0530, Manivannan Sadhasivam wrote:
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
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
> >  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
> >  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
> >  include/linux/pci-epc.h                           |  7 ++++---
> >  15 files changed, 58 insertions(+), 18 deletions(-)
> 
> FWIW:
> Tested-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> 
> However, when looking at this, I was surprised that you never call something
> that will set:
> init_complete = false;
> from e.g. dw_pcie_ep_deinit() or dw_pcie_ep_cleanup().
> 
> I saw that you do seem to set
> init_complete = false;
> in your other follow up series that is based on this one.
> 
> What will happen if you run with only this series merged (without your
> follow up series), on a platform that used to have .core_init_notifier?
> 
> If you do remove and recreate the symlink on a platform with external
> refclk, since you never set init_complete to false, you could trigger
> EPF core_init callback, e.g. pci_epf_test_core_init() to be called,
> which will do DBI writes even when there is no refclk.
> 
> E.g. (on a platform with external refclk):
> 1) Create symlink to pci-epf-test in configfs.
> 2) Start RC, your EPC driver will call ep_init_notifiy() when perst
> deasserts.
> 3) Run pci-epf-test.
> 4) Remove the pci-epf-test symlink
> 5) Shutdown RC
> 6) Create symlink to pci-epf-test in configfs.
>    This will see that init_complete is true, and will do DBI writes
>    which will crash your system, since you don't have a refclk.
> 
> Perhaps you should move the patch that calls a function that sets
> init_complete = false;
> to this series, so that this crash is not possible?
> 

Good catch! But moving that patch to this series requires moving some other
patches as well. So in the meantime, I'll set this flag to false in
dw_pcie_ep_cleanup().

[...]

> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 18c80002d3bd..fc0282b0d626 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c

[...]

> > -	if (!core_init_notifier) {
> > -		ret = pci_epf_test_core_init(epf);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> 
> While you did fix up all DWC based drivers, the non-DWC EPC drivers that
> did not have epc_features->core_init_notifier before this patch:
> 
> drivers/pci/controller/cadence/pcie-cadence-ep.c:#include <linux/pci-epc.h>
> drivers/pci/controller/pcie-rcar-ep.c:#include <linux/pci-epc.h>
> drivers/pci/controller/pcie-rockchip-ep.c:#include <linux/pci-epc.h>
> 
> I don't think that they will work with pci-epf-test anymore, since AFAICT,
> you did not add a call to: pci_epc_init_notify() or similar in these EPC drivers.
> (Like this patch does to all the DWC-based drivers without a core_init_notifier.)
> 

Doh, yeah I completely missed these. Thanks for pointing out. Will add the
notify_init call in next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
