Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7713F900305
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 14:07:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cnuyrWzY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwg1c3zbrz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 22:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cnuyrWzY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwg0s5VXRz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 22:06:51 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f4a5344ec7so15789105ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2024 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717762007; x=1718366807; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k7NnO3DgcXmjQU2TFy5q5V0KcneMOGXb1GGo0qLmGSA=;
        b=cnuyrWzYphGKHKy/r/ukHOJraBFyqLR9fB5B8jxRnYRvefoKHz1U/QZAwIAJxFrO9n
         82jsu8k/5cMWJPSVJ0JAxXUNGdsNC3s2SaDMjYwMHuyYY3DBMbdHLJjJq7g2REaKe8E3
         cm20E+ZePtZD6oSDBCb4iW5Pm+kst/81FfnBG5+ChzLSpA32G2LCqIqJVep5SqJxu/93
         Einf/JGj62H0Cuw7GPwVadfC0u8HOSAL/OkDTxTNxo2xsOTpzF6LRPnPMZCYqxmW164F
         qEO8dj+GlP+05YsRdYu5UrHPbPtH/XrrYYQf15Jn4HeFqLD/1u37982mqMNQsrGmmcMT
         i44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717762007; x=1718366807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7NnO3DgcXmjQU2TFy5q5V0KcneMOGXb1GGo0qLmGSA=;
        b=OsW70uoNXtaqSLaROfp5aoOKRSP9IQ4HE3qEfpmVIsdnl6uI6PJdkVQL+KrlkDB8KG
         P8rCX3KP12+AqhQeI+Pt0s3Ug16Ej0q/8EkiN4vW0CF8rIXN5uGVkCJATuyjqElCmRxA
         8u5IBzwb+H8SqP+D8A2FADuNcGFD9dUZEqG8YCaZwmLhLRKa0HdOrlyRxYQyabAONZRR
         zn+HlqQnTznUS3eVCRKhbXVufEEB+PoTINH8B3PrIEVAFXgoM7mJQpb/1ZwgUMbGkKz0
         FkMThSIyQOal1e8DChFD2b7gVF2gh4JK80n4Em9oNU7Dg1jtJG0VOe5OTztGCHEkWXUH
         9N4A==
X-Forwarded-Encrypted: i=1; AJvYcCXLpLjkyKgxvByk7II6K0EpkR6M++0/TOY5bKqOu2eJ1MAHJ3Bz+vEE2SoYlH4lIg1Kcf5l11cbxZ2QyUz7r5sLQrkKWNx01MtPdE2XwA==
X-Gm-Message-State: AOJu0YzMb59WRhRpA8EHTVi7BVKVuQwpNKA69Y2MeftYcoAY3Pja3XR9
	TptdH6idl5zCrEGs3WuyTCiSryg0VS1xOPg5jJ/Kl+O6w4LSDK2yIG8JH7xKgA==
X-Google-Smtp-Source: AGHT+IHZn1FxYEr2n48jlTtRBDfIAQDg5hiBd+j5q8YaNLn1ULoVlYRkUzjPoDR891koRVR82SXEYA==
X-Received: by 2002:a17:902:e84e:b0:1f6:7f8f:65ac with SMTP id d9443c01a7336-1f6b8f075b0mr80949715ad.26.1717762006991;
        Fri, 07 Jun 2024 05:06:46 -0700 (PDT)
Received: from thinkpad ([120.56.207.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd761ac8sm32756425ad.54.2024.06.07.05.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:06:46 -0700 (PDT)
Date: Fri, 7 Jun 2024 17:36:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Message-ID: <20240607120636.GA4122@thinkpad>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <ZmLTcNz0FxAWRYcd@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmLTcNz0FxAWRYcd@ryzen.lan>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 07, 2024 at 11:31:28AM +0200, Niklas Cassel wrote:
> On Thu, Jun 06, 2024 at 12:56:33PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series includes patches that were left over from previous series [1] for
> > making the host reboot handling robust in endpoint framework.
> > 
> > When the above mentioned series got merged to pci/endpoint, we got a bug report
> > from LKP bot [2] and due to that the offending patches were dropped.
> > 
> > This series addressed the issue reported by the bot by adding the stub APIs in
> > include/pci/pci-epc.h and also removed the unused dwc wrapper as concluded in
> > [3].
> > 
> > Testing
> > =======
> > 
> > This series is tested on Qcom SM8450 based development board with 2 SM8450 SoCs
> > connected over PCIe.
> > 
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-pci/20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org/
> > [2] https://lore.kernel.org/linux-pci/202405130815.BwBrIepL-lkp@intel.com/
> > [3] https://lore.kernel.org/linux-pci/20240529141614.GA3293@thinkpad/
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > Manivannan Sadhasivam (5):
> >       PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
> >       PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
> >       PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> > 
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |   2 +-
> >  drivers/pci/controller/dwc/pci-imx6.c             |   2 +-
> >  drivers/pci/controller/dwc/pci-keystone.c         |   2 +-
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |   4 +-
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 116 +++++++++++++---------
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware.h      |  10 +-
> >  drivers/pci/controller/dwc/pcie-keembay.c         |   2 +-
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   5 +-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |   2 +-
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |   3 +-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |   2 +-
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c      |  19 ++++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     |  17 +++-
> >  drivers/pci/endpoint/pci-epc-core.c               |  25 +++++
> >  include/linux/pci-epc.h                           |  13 +++
> >  include/linux/pci-epf.h                           |   2 +
> >  18 files changed, 162 insertions(+), 68 deletions(-)
> > ---
> > base-commit: 7d96527bc16e46545739c6fe0ab6e4c915e9910e
> > change-id: 20240606-pci-deinit-2e6cdf1bd69f
> > 
> > Best regards,
> > -- 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> 
> Considering certain dependency patches have been merged to
> pci/endpoint and other dependency patches have been merged to
> pci/controller/dwc, perhaps it is best if you split this series:
> 
> Series 1 based on pci/endpoint: with patch 1/5 and 2/5.
> Series 2 based on pci/controller/dwc: with patch 5/5.
> 

Thanks Niklas! I didn't check the 'dwc' branch, so ended up posting patches 3/5
and 4/5 again.

Bjorn, if you are OK with this series, I can go ahead and apply patches 1/5 and
2/5 to 'pci/endpoint' and bank on Krzysztof to handle 5/5.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
