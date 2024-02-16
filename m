Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA930858004
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 16:03:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FFssp4x3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbwCr4DlTz3vbs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 02:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FFssp4x3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbwC23tChz3dVJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 02:02:22 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6de3141f041so1714971b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708095740; x=1708700540; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xjKDnEpyYeAmu9qtpq1bDPfT62b9+uwDJch6VEOZdNo=;
        b=FFssp4x3Gpi6fOZxEnpcNUr+K6W3N5JUmK4V2G0pqDv/iyGn4Lrn//prlI1JM3po2N
         9Gizo8FgHZa1zNQpZL63Ys34CvTKggd7hrotE72jLRw5pE6KcNckff4Nbw2o92xaXGlY
         7WRBXQtq/jCaMCenv2S/dKEaZGIISui+tKKBp1MUC9c6r4N7SVdqiPQ4nYWQL6Lesc/K
         kDrVPbDSzwB9WqBU2nQCeUZW5HzueT94tLI2BKlcODTvSqajz2IXMwyamgjwMw91xAVD
         SEUb1gO8v6JkISsPTUik6e7OH8PtMEZ5s7iCYfSlO26XNOmjXOS0erXXSml6BeGtQ3MC
         oT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095740; x=1708700540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjKDnEpyYeAmu9qtpq1bDPfT62b9+uwDJch6VEOZdNo=;
        b=v9n476lgTWXiPoqnIVR51enQru/6n1FFgCywe0xbHFeaQgggz8OJRgR3WYyFgNne9P
         YH6Y0qsGBVS10DjEW3aRBmlqC18AavmUHOIbAvefBxBm2D9FGMsSjHxJ+dP3ywJjkwVO
         JbNGjaL9xc90kGnXYmz2cJemuVxkfRAKYmvAIPndmDhWHu0+hGHy+FCSeDgTIcKkeSaL
         TMIkvgqapHOdivK7qUNna0dttEib49zAQVbB/fS0V69r5j6hvnGl4pnFDj5xBEFvK5vd
         OCoY1oY7bR4c1k20BA0rPFdtzvB5iSQ43L1dEeOxDixbhmTrdUwXMIjI3GYsFw0BlKNF
         5+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Q1elyCUNRnuyBxVXZvo5BLjU+aURCwIozxYxJ6BNea09UF1fk25f2FkXJcYmkIL8UCC/4Wt1I9bfGOTVL+uvL6t+R6NLS+qrCb2eRg==
X-Gm-Message-State: AOJu0Ywtx62oee3TP38+DHddbC7YrvcoEFG2wdzHmoLpFgmS64FwbJar
	9NS+0zCqsuiqvBTym/e/xoBptqYqXiuP9Avn+BfUmV1vpBJORQle7BTwaqp/Ig==
X-Google-Smtp-Source: AGHT+IFgr7DrTunbXNT4CmMkXBhBhF8q3qElLWukIPhZqe8IVzyyit1X3Y+109ONonjOTtTtsSuzVw==
X-Received: by 2002:a05:6a00:c91:b0:6e0:a9c4:3016 with SMTP id a17-20020a056a000c9100b006e0a9c43016mr5957902pfv.16.1708095738239;
        Fri, 16 Feb 2024 07:02:18 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id x5-20020aa784c5000000b006e080bbc92dsm27057pfn.177.2024.02.16.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 07:02:17 -0800 (PST)
Date: Fri, 16 Feb 2024 20:32:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v2 0/2] PCI endpoint BAR hardware description cleanup
Message-ID: <20240216150208.GC39963@thinkpad>
References: <20240216134524.1142149-1-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216134524.1142149-1-cassel@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Allen Hubbe <allenbh@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, linuxppc-dev@lists.ozlabs.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 , linux-renesas-soc@vger.kernel.org, ntb@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 16, 2024 at 02:45:13PM +0100, Niklas Cassel wrote:
> The series is based on top of:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=endpoint
> 
> 
> Hello all,
> 
> This series cleans up the hardware description for PCI endpoint BARs.
> 
> The problems with the existing hardware description:
> -The documentation is lackluster.
> -Some of the names are confusingly similar, e.g. fixed_64bit and
>  fixed_size, even though these are for completely unrelated things.
> -The way that the BARs are defined in the endpoint controller drivers
>  is messy, because the left hand side is not a BAR, so you can mark a
>  BAR as e.g. both fixed size and reserved.
> 
> This series tries to address all the problems above.
> 
> Personally, I think that the code is more readable, both the endpoint
> controller drivers, but also pci-epc-core.c.
> 
> (I will be sending out a patch series that adds BAR_RESIZABLE to enum
> pci_epc_bar_type in the coming week.)
> 

Applied to pci/endpoint!

- Mani

> 
> Kind regards,
> Niklas
> 
> 
> Changes since V1:
> -Picked up tags from Kishon and Mani.
> -Improved commit message for patch 1/2 as suggested by Mani.
> -Improved kdoc in patch 2/2 as suggested by Mani.
> 
> 
> Niklas Cassel (2):
>   PCI: endpoint: Clean up hardware description for BARs
>   PCI: endpoint: Drop only_64bit on reserved BARs
> 
>  drivers/pci/controller/dwc/pci-imx6.c         |  3 +-
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++---
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  5 ++-
>  drivers/pci/controller/dwc/pcie-keembay.c     |  8 +++-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 +++--
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 15 +++++--
>  drivers/pci/controller/pcie-rcar-ep.c         | 14 ++++---
>  drivers/pci/endpoint/functions/pci-epf-ntb.c  |  4 +-
>  drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++--
>  drivers/pci/endpoint/functions/pci-epf-vntb.c |  2 +-
>  drivers/pci/endpoint/pci-epc-core.c           | 25 +++++-------
>  drivers/pci/endpoint/pci-epf-core.c           | 15 +++----
>  include/linux/pci-epc.h                       | 39 ++++++++++++++++---
>  14 files changed, 106 insertions(+), 58 deletions(-)
> 
> -- 
> 2.43.1
> 

-- 
மணிவண்ணன் சதாசிவம்
