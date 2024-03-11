Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1AC8781EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 15:46:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zWWweWYI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttfk84Lfwz3dy3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 01:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zWWweWYI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtfjR3Z4qz3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 01:46:17 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e63e9abf6aso2383346b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710168372; x=1710773172; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WZeoUY9lDhr7yJPXp/YwXiCG8hTtAt9+Pvs1llVqw0=;
        b=zWWweWYI4s2wmdVwfKb/ALYwf2xjiDT4Y18w2cM57REuIay6cNUGtBTsf5aDDL6amb
         v64UlNK5nW5Nup+GY2+OdjYBzOj4aFkYKb2ZVgwJ1gsSkjS6iYn47h+s/hUJ66DPwgBG
         7//KyihYqroehfAuPBCTDO9n5K1XAZ0bULo2lTg28mfHDnNsRXstOGQHp2sdAiZlbmiD
         ig5uDkbbbyEBNjfeGK8IyfNRa8743QBd3Lrpi7fqTuY+beMiR3nET6wwz64ozHY7mLBy
         BriwnO4LxlzEQE1ciW1MczABVQXMwrGzN4f13kmJR7LfjXljK1DmFe8Ah/gCuOiiV4CI
         WCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710168372; x=1710773172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WZeoUY9lDhr7yJPXp/YwXiCG8hTtAt9+Pvs1llVqw0=;
        b=tIvoT0byji6R6S+LZ5BS5LKy4PTLjdXtfRKwUP7FqOJ6Lp81etEBNYsKnevKZzm/9D
         sf9E8A8Nf7nSWLes1klW3hJHad3hkifB7YVEy/d92TvY5RgQO5zza9w0NUesndH1YJik
         POIyeGP67ODe3xTImor8WbNB1EjCofSx93lDQcd/Z+0UlfFhxs8yZBVCMvW4vmOEc73q
         oaM6Y3ttmfCIqT5hgnGV7wU/2b0C+TlB+C+SqBrhh+epvdvDYKJSMJNvvzl3UvMq6t9K
         xBUiQ/GDFvDyBIYJ3h1182kxVNUlfUrQT+cNnW5/Tp1C2J3JlKYHW17DWGDMtiFPZ+eT
         SSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXnRlSHdZ75t6QynHJN8OVzucjS45tSM4y7mUc9k/qa8KwlxwZkaHlukcqGhqiHt03DKXY8J2jOR6ezS9wQ2KcTvX2vQAVsx5Hecgz4A==
X-Gm-Message-State: AOJu0YzxG7zihblVHNNdF2Ovd6Ys2ngo3esyLIDQdpXjb+yGHpX40WUq
	BSGA4X1r++aAiiQEyDRSbgAHxLzTbM0vsOSllqmsGaw1mOfFsfNhvrDE5VhvrQ==
X-Google-Smtp-Source: AGHT+IEkyoSv3cUPd2YD+Ord9GisLbDuQ3mTJgXZUAwKm1FrFZN401VY7NABhiAj7Fw9fR+qh9jZVw==
X-Received: by 2002:a05:6a00:2d20:b0:6e5:5a24:818c with SMTP id fa32-20020a056a002d2000b006e55a24818cmr7159193pfb.7.1710168372299;
        Mon, 11 Mar 2024 07:46:12 -0700 (PDT)
Received: from thinkpad ([117.217.184.48])
        by smtp.gmail.com with ESMTPSA id o12-20020a62f90c000000b006e053e98e1csm4427472pfh.136.2024.03.11.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 07:46:11 -0700 (PDT)
Date: Mon, 11 Mar 2024 20:15:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240311144559.GA2504@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <ZesRk5Dg4KEASD3U@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZesRk5Dg4KEASD3U@ryzen>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@
 lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 08, 2024 at 02:24:35PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:19PM +0530, Manivannan Sadhasivam wrote:
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
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 18c80002d3bd..fc0282b0d626 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -927,21 +928,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
> >  	if (ret)
> >  		return ret;
> >
> 
> Hello Mani,
> 
> Since you asked for testing, I gave your series a spin
> (with a driver without .core_init_notifier).
> 
> 
> There seems to be a problem that pci_epc_write_header() is never called.
> 
> Debugging this, it seems that .core_init in pci-epf-test is never called.
> 
> If I add debug prints in pci_epc_init_notify(), I see that it does not
> notify a single EPF driver.
> 
> It appears that the patch in $subject will call pci_epc_init_notify()
> at EPC driver .probe() time, and at that point in time, there are no
> EPF drivers registered.
> 
> They get registered later, when doing the configfs write.
> 
> 
> I would say that it is the following change that breaks things:
> 
> > -	if (!core_init_notifier) {
> > -		ret = pci_epf_test_core_init(epf);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> 
> Since without this code, pci_epf_test_core_init() will no longer be called,
> as there is currently no one that calls epf->core_init() for a EPF driver
> after it has been bound. (For drivers that call dw_pcie_ep_init_notify() in
> .probe())
> 

Thanks a lot for testing, Niklas!

> I guess one way to solve this would be for the EPC core to keep track of
> the current EPC "core state" (up/down). If the core is "up" at EPF .bind()
> time, notify the EPF driver directly after .bind()?
> 

Yeah, that's a good solution. But I think it would be better if the EPC caches
all events if the EPF drivers are not available and dispatch them once the bind
happens for each EPF driver. Even though INIT_COMPLETE is the only event that is
getting generated before bind() now, IMO it is better to add provision to catch
other events also.

Wdyt?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
