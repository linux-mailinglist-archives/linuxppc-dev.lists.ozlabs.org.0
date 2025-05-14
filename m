Return-Path: <linuxppc-dev+bounces-8584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBBAB7186
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 18:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyJq00HWBz2yyJ;
	Thu, 15 May 2025 02:35:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747240507;
	cv=none; b=f/Y25aTlpCkg4V5uUY4PyUAvaFKkMH0EO04ckuf+CPSB4Jazdg/zjvyTF3pJU9Steopu71qrYSAp+68FZTt1YBvyRyIkw5bx+W1UzXFOswXMTTp1jDdQcgG3q3BhkIMPKH4dT+ic8J1q4bxHUsm6OCUwf6tuNQHeh8VhHHFNYHgUJFPTCShxxwkwb7NiZPYGWNjDm6ZKPdm//LZizPvrcXcf7kvFvNgEVGnjtNwN9L4gdX/vzG7F04zMXroKeEIQzf/pJ3zbFvqCRLTcCyC8MJ051/kLBEfkKGCpXSMwaOkDESV96q/ckjPn8kv9jMkNmSxgj9x7q8RtHUhZUVEJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747240507; c=relaxed/relaxed;
	bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LM8HQqQxnWoZDrlEQAsAlBZmur0wjSD7ORBMPxe0WBtlta4R1bl5ru6yyd9ARh0+VnjChOUrNJT/g4L6ioypEWWhu2u9npu298EVjDK4eBp2hJL9590ATOqNbiTz0vHMSbvSoBxL2ahQt7oP40/fE3E+RXgik9w8AoUjasiodJOTMVUrBWZ3Aikhfd37LLo3zn2b1md5tk6gb+JEYrsghVBxANl6erYH++TwqWkMglc+CxzV4O2pYmub7mfUXz/rE2b2LoN2TqmQzB5Q4v0CU+hWRMoKG/eQItvj1urV9sl4HqxPsnm4u00j4SGWg5faIq2HvebwxabykK+yAbbWQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hPK9lkx0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hPK9lkx0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyJpy46PXz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 02:35:05 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so4263062f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240503; x=1747845303; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=hPK9lkx09LpTcX0OeIyr29HEGHONbh8yvIwdmjiL2wVnCnNd3WyA24EJgLjVkjF+wc
         5rURh2XMAIzKX7fyQInSjN29f9FC1sFgmL/YvLWH626uTs5taUYQXVJJ0luqKoEc+TIH
         obOdLoWZXy9QCGWa9tRqC0VzfpYj1nYkyaY7C8U2DIaigY0L/2crDowX/ElB3mE2upeZ
         en3/FUAPHEPdQ9YkYZhR4HTRxvWlR2brwSOD5OLp73LYJ5rwAzKp1mAdB1y//cO2CQQk
         fr3dH6rYecziwfDJu30YIbaNOhqoZsIYR6Dn2n3u4EGbrdJkToIKMfEnjSedpc/Y3l9L
         dKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240503; x=1747845303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=hNor0aTNX14ahE4w79UjD4DEvsymyzBkqlo6HuYtyQtSG5HaaBv9DikZWHg4m9785h
         0wmtsl6L334klW/H6uMucKwDmY6APwxyGJeyyot6Z5PqYSkI3UeEcf2NMKAUnhlVcycv
         zJ/9AhLtw35fw+D62JswnB3qhw0yiaxLjxupHchFz0TGmupSMMBzL9kC5Becj6CpNwQN
         lP5n4oUvcetir7Xt7kglMjJMkA4cqJC+50AXs2yRXodlCXY+Gg2mB9Mqra7kVK49EJK/
         BmPiU5Gz4M7zFi7ir8QdlGXm6VKfx93aSBwVYc/gmKqgi0B/tD7duIS+lbxb6R40S1jb
         DJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVTojKHgJJCn23FFOoboyOkKwSmKXc5jlwbhq+sq4SYuXLdjtHSgqZU+IsqYRlaxkUMcnL/JlJoP6quUQw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyhm3ptjXv9/RQa7xrw3naPnttCpCRmz7Gd/cmFLDUGxMKQwewc
	IuxM99DZxnf6TgMhnR1uKazCOGCSclL4Tvo8c+GLP8Is9yU9bgztQSgZFIuFrw==
X-Gm-Gg: ASbGncuwhcro1LutbxyYhjevvETfLfWa5Z4tki82zKBCtTKN8Z7UBAcCszk5DJ5sVG4
	MUz+GcsBlHdqV32Rqtoe6K3CDT5OgWpVq60l8gqZwX/zhfUB93+tjnA0ZDzLWq05xeI5DlCN7w0
	01CCoDk649c9y8giXTap2k8EtFn5rSa+q9zkE2lqKTlEUsn48QdBnywS3UDDWbm6FggJcBTeczU
	Zhh38HYf5RFqbilS8N9MuikzXcDoD66Dvd0Sp1lY4D53ic/3823ANWHhy+D49raAvVLQ0Ea4A0X
	oE+tTGKvo+AeMy8TXNtdS8NyYMMBN0z7j/VSWq5EAUX/eAVUUmM7on6UhOyNE4ecpbALe/fuWew
	ZcufgbKSSQjmRsA==
X-Google-Smtp-Source: AGHT+IGj3+htGnEIyMivpivIivCnjfIy6Tideg6ovbKdF3ZUejVVtTS1+sX05zRZKNfgj9Ou9ozS3A==
X-Received: by 2002:a05:6000:1848:b0:3a0:b4f1:8bb8 with SMTP id ffacd0b85a97d-3a3496c38b8mr3799664f8f.34.1747240502599;
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2d3sm20577369f8f.63.2025.05.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Date: Wed, 14 May 2025 17:35:00 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <sotge26h35mcijcu3eqkbf7aimkwnxzhbgltoz74nfnefc7fjd@xct54hpv5ane>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-5-7050093e2b50@linaro.org>
 <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 14, 2025 at 11:52:13AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> > The PCIe link can go down under circumstances such as the device firmware
> > crash, link instability, etc... When that happens, the PCIe slot needs to
> > be reset to make it operational again. Currently, the driver is not
> > handling the link down event, due to which the users have to restart the
> > machine to make PCIe link operational again. So fix it by detecting the
> > link down event and resetting the slot.
> > 
> > Since the Qcom PCIe controllers report the link down event through the
> > 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> > bit in PARF_INT_ALL_MASK register.
> > 
> > Then in the case of the event, call pci_host_handle_link_down() API
> > in the handler to let the PCI core handle the link down condition. Note
> > that both link up and link down events could be set at a time when the
> > handler runs. So always handle link down first.
> > 
> > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > reset the slot in a platform specific way. So implement the callback to
> > reset the slot by first resetting the PCIe core, followed by reinitializing
> > the resources and then finally starting the link again.
> > 
> Only one comment see below.
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig     |   1 +
> >   drivers/pci/controller/dwc/pcie-qcom.c | 112 ++++++++++++++++++++++++++++++---
> >   2 files changed, 105 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -296,6 +296,7 @@ config PCIE_QCOM
> >   	select PCIE_DW_HOST
> >   	select CRC8
> >   	select PCIE_QCOM_COMMON
> > +	select PCI_HOST_COMMON
> >   	help
> >   	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> >   	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index dc98ae63362db0422384b1879a2b9a7dc564d091..e577619d0f8ceddf0955139ae6b939842f8cb7be 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -34,6 +34,7 @@
> >   #include <linux/units.h>
> >   #include "../../pci.h"
> > +#include "../pci-host-common.h"
> >   #include "pcie-designware.h"
> >   #include "pcie-qcom-common.h"
> > @@ -55,6 +56,7 @@
> >   #define PARF_INT_ALL_STATUS			0x224
> >   #define PARF_INT_ALL_CLEAR			0x228
> >   #define PARF_INT_ALL_MASK			0x22c
> > +#define PARF_STATUS				0x230
> >   #define PARF_SID_OFFSET				0x234
> >   #define PARF_BDF_TRANSLATE_CFG			0x24c
> >   #define PARF_DBI_BASE_ADDR_V2			0x350
> > @@ -130,9 +132,14 @@
> >   /* PARF_LTSSM register fields */
> >   #define LTSSM_EN				BIT(8)
> > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > +#define FLUSH_MODE				BIT(11)
> >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > -#define PARF_INT_ALL_LINK_UP			BIT(13)
> > +#define INT_ALL_LINK_DOWN			1
> > +#define INT_ALL_LINK_UP				13
> > +#define PARF_INT_ALL_LINK_DOWN			BIT(INT_ALL_LINK_DOWN)
> > +#define PARF_INT_ALL_LINK_UP			BIT(INT_ALL_LINK_UP)
> >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> >   /* PARF_NO_SNOOP_OVERRIDE register fields */
> > @@ -145,6 +152,9 @@
> >   /* PARF_BDF_TO_SID_CFG fields */
> >   #define BDF_TO_SID_BYPASS			BIT(0)
> > +/* PARF_STATUS fields */
> > +#define FLUSH_COMPLETED				BIT(8)
> > +
> >   /* ELBI_SYS_CTRL register fields */
> >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > @@ -169,6 +179,7 @@
> >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> >   #define PERST_DELAY_US				1000
> > +#define FLUSH_TIMEOUT_US			100
> >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > @@ -274,11 +285,14 @@ struct qcom_pcie {
> >   	struct icc_path *icc_cpu;
> >   	const struct qcom_pcie_cfg *cfg;
> >   	struct dentry *debugfs;
> > +	int global_irq;
> >   	bool suspended;
> >   	bool use_pm_opp;
> >   };
> >   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > +				  struct pci_dev *pdev);
> >   static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> >   {
> > @@ -1263,6 +1277,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >   			goto err_assert_reset;
> >   	}
> > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > +
> >   	return 0;
> >   err_assert_reset:
> > @@ -1517,6 +1533,74 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
> >   	}
> >   }
> > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > +				  struct pci_dev *pdev)
> > +{
> > +	struct pci_bus *bus = bridge->bus;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > +	struct device *dev = pcie->pci->dev;
> > +	u32 val;
> > +	int ret;
> > +
> > +	/* Wait for the pending transactions to be completed */
> > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> > +					 val & FLUSH_COMPLETED, 10,
> > +					 FLUSH_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_err(dev, "Flush completion failed: %d\n", ret);
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	/* Clear the FLUSH_MODE to allow the core to be reset */
> > +	val = readl(pcie->parf + PARF_LTSSM);
> > +	val |= SW_CLEAR_FLUSH_MODE;
> > +	writel(val, pcie->parf + PARF_LTSSM);
> > +
> > +	/* Wait for the FLUSH_MODE to clear */
> > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> > +					 !(val & FLUSH_MODE), 10,
> > +					 FLUSH_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	qcom_pcie_host_deinit(pp);
> > +
> > +	ret = qcom_pcie_host_init(pp);
> > +	if (ret) {
> > +		dev_err(dev, "Host init failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = dw_pcie_setup_rc(pp);
> > +	if (ret)
> > +		goto err_host_deinit;
> > +
> > +	/*
> > +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> > +	 * non-sticky.
> > +	 */
> > +	if (pcie->global_irq)
> > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> > +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> > +
> > +	qcom_pcie_start_link(pci);
> > +	if (!dw_pcie_wait_for_link(pci))
> > +		qcom_pcie_icc_opp_update(pcie);
> This icc opp update can we removed as this can updated from the global
> IRQ.

Right. I forgot to remove it after keeping link up IRQ change. Removed it while
applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

