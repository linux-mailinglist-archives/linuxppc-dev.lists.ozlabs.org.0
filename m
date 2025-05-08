Return-Path: <linuxppc-dev+bounces-8428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B648BAAF437
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 08:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNJN1Bnfz2yrb;
	Thu,  8 May 2025 16:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746687508;
	cv=none; b=B0xiigwchD8hSYNM0fhdS1hW78nuxQ73QMFYu4r6ikGbz72Wn1CEG1lgNn9KyctSr9dZ0793Erg4XJ2W6mP6L/mm69zbAsDiRBlA+6mNNuP4IQAzgz/wscoxHTy+STqq8bvjmOwa0NpJkB48NIhfm+IWMqwNkatYBfit4KJSf5OfrzM1vAkxz6lrZzZUpsjXn4MrCgF50vPb3QspsMaJLlfebBZuO0mvmUebJaZe7H4EAQT4CXg42LrOYgofun2EOTP6KwtWqPhy4PFWXcLYZLZr2fBCM1H9Zu7FRcyC3c9ZmmQgd8uwaQMa/j5aBumlR/bPYkwjLmPDVPwQhEezaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746687508; c=relaxed/relaxed;
	bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUUKzHKLZdAVJgsMAzfhmCftLiet5Ee35uXA1O/n29XO2xZh3uwp0I18nnurWoq36LK+T8ipsmpP1ak928sueO3EL3WgUt214g4mhM5gU2jIc1j2HSrBBwOdZs8aUcpDa0fLEvqcVpH0mU2Hk/J/lWp4R+mfgUop4muk7P0/MJtYA0YHMBLxa2cCXAx1rQyhs1a+0N9srriIkeSDE/X56Wzi6Vlg+ZxT1VNXT2H6owtGhT73Ee0v2Z7O1rYVq/OBbNqDigwG+zD+QAn3giAOdHOhTf3/wVS6vowuDP5KJNvTPrkoMtoaqPR8dXf9W3QFzq8R1pmwW46UY5QkHGaINw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woOiLMhp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woOiLMhp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNJL0cq5z2yh4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 16:58:25 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so517260f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 May 2025 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746687500; x=1747292300; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
        b=woOiLMhp6kD698AMOFlx7csYT4vkse5+WdBbkq4rxDCc5csW2BtMG7jDYKacVM6h4T
         cPXlyDm7JFlVLXxtW8++8HYJ8QYRQ+SS+Y9f/mz7xY+QSRIz1CEAnaiaB3xYFhgXPGI7
         MrY+WxgYyYLI8q1TwJPaXmBAWGooY/Xr1KV9RE2lMT3yNLhH0c+QssGJndrY24iRTsBq
         pEByLBL+mC3cTJpoMC3BANbvUJ0ySnDhHU8I0ISlFt3SlBauC8YYyS9Ae6KjAhfLuiFE
         2MXXMNUaAANdYJjmukkQHR/7flXPgoengaO8CoUq1kT0+dyvb1BZ9Rs8F4z2hwF3IO5r
         0MHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687500; x=1747292300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
        b=FfYOshmEeCZokMn2a6pGLlh09UCCsRGUDCE1Z8u2RQtOpryZRmCsVYt8oQnBs7h8v2
         /orR9tBDV2LJsIeXkXk9ncwmvwIcDlc1yLzdgtoYlkW7SOfzXAiW1W8CNr+fgrLp38L9
         44qlZBypifq3rt4B6ZGsetCmqN5cP2YEbnU7oKYfK2Dpp1w3a+0kNYbHO9ODfMcn8Xyp
         FB0Ei2U60WqseaAnmY86EWQDSyf+XKJ5UESWvB0lR6t8iJDdM5a8QCcDnc75NBuQzClP
         DW4ujCZLnx1clpmJEHmpWwnJsu0aSDFRN1iIGQHr+jHT3+fkY4vEe0KArNw6G/wh/g21
         xcNA==
X-Forwarded-Encrypted: i=1; AJvYcCWb3mW3jhQfbmyE3oK+WbsG6/k/lUa61QBYQeQyebpUWhm3gAlM2a6uH6ubYDx9/nhx4A0gLUQaDfgkCnw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzm4EZptmnYlsZuKjiX+MT3rEjm7GNPwmW9T4TCptwphjDGiqdo
	v3DfEp97S14AU19evDFYT0JPmEgwOzp9vmufcec/gsQH+BZAYGdPJ36a5s2jGA==
X-Gm-Gg: ASbGnculKfONSoBQRDqvpQOkzXSNRLaA1A2EoTV0GR9oDiF74xaN30876BDdWAZTM6x
	l29MmmuyGAB5Oty+yljA/Bnd6aGaMsHjwQibJJENiGH6gNQopmch0YFD3nlswWrI/Whbty3Z9Rh
	sDbH7G1p9DrxsphT3z4wUD/69e8YtiwqaotwDrD7zEN7XB9X/whlHePHeA1+ryBxO/dL9XWyy5M
	Hf5ik2H5ZjPg5QZ6X63DZjzzAa9Yd3vm3AvhAop7Xt237WJqBuNdUp962V90ojm9WVxO0b1tiw+
	oTTiVvz7/YTqV5bZDp5EIJHsTPSmSqUwisQ62dk6E1PAr+wL4uGzxnQ3d2PKitSUvx/3qroBSJW
	HK6iVwqoKfB8+AnndbjEKaMw=
X-Google-Smtp-Source: AGHT+IE6fY7G6i3QYGrY3X5Ul1LizOf1wK5bHxiH9swb38pg5rW4p838LgWBRNHE0H7wg8cPl2p63A==
X-Received: by 2002:a05:6000:1449:b0:3a0:bc28:e0e8 with SMTP id ffacd0b85a97d-3a0bc28e221mr781184f8f.23.1746687500552;
        Wed, 07 May 2025 23:58:20 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b300873dsm6123920f8f.78.2025.05.07.23.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:58:20 -0700 (PDT)
Date: Thu, 8 May 2025 12:28:19 +0530
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
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <fxgmyq7rqgxw2omtkfj4zvzqgbfjhafin3dt2yevs4siwol62w@5cz6pfxixd2h>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
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
In-Reply-To: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 24, 2025 at 10:31:00AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
> > 
> > 
> > On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > 
> > > The PCIe link can go down under circumstances such as the device firmware
> > > crash, link instability, etc... When that happens, the PCIe slot needs to
> > > be reset to make it operational again. Currently, the driver is not
> > > handling the link down event, due to which the users have to restart the
> > > machine to make PCIe link operational again. So fix it by detecting the
> > > link down event and resetting the slot.
> > > 
> > > Since the Qcom PCIe controllers report the link down event through the
> > > 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> > > bit in PARF_INT_ALL_MASK register.
> > > 
> > > Then in the case of the event, call pci_host_handle_link_down() API
> > > in the handler to let the PCI core handle the link down condition.
> > > 
> > > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > > reset the slot in a platform specific way. So implement the callback to
> > > reset the slot by first resetting the PCIe core, followed by reinitializing
> > > the resources and then finally starting the link again.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >   drivers/pci/controller/dwc/Kconfig     |  1 +
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
> > >   2 files changed, 89 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> > > --- a/drivers/pci/controller/dwc/Kconfig
> > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > @@ -296,6 +296,7 @@ config PCIE_QCOM
> > >   	select PCIE_DW_HOST
> > >   	select CRC8
> > >   	select PCIE_QCOM_COMMON
> > > +	select PCI_HOST_COMMON
> > >   	help
> > >   	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> > >   	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -34,6 +34,7 @@
> > >   #include <linux/units.h>
> > >   #include "../../pci.h"
> > > +#include "../pci-host-common.h"
> > >   #include "pcie-designware.h"
> > >   #include "pcie-qcom-common.h"
> > > @@ -55,6 +56,7 @@
> > >   #define PARF_INT_ALL_STATUS			0x224
> > >   #define PARF_INT_ALL_CLEAR			0x228
> > >   #define PARF_INT_ALL_MASK			0x22c
> > > +#define PARF_STATUS				0x230
> > >   #define PARF_SID_OFFSET				0x234
> > >   #define PARF_BDF_TRANSLATE_CFG			0x24c
> > >   #define PARF_DBI_BASE_ADDR_V2			0x350
> > > @@ -130,8 +132,11 @@
> > >   /* PARF_LTSSM register fields */
> > >   #define LTSSM_EN				BIT(8)
> > > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > > +#define FLUSH_MODE				BIT(11)
> > >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > > +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
> > >   #define PARF_INT_ALL_LINK_UP			BIT(13)
> > >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> > > @@ -145,6 +150,9 @@
> > >   /* PARF_BDF_TO_SID_CFG fields */
> > >   #define BDF_TO_SID_BYPASS			BIT(0)
> > > +/* PARF_STATUS fields */
> > > +#define FLUSH_COMPLETED				BIT(8)
> > > +
> > >   /* ELBI_SYS_CTRL register fields */
> > >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > > @@ -169,6 +177,7 @@
> > >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> > >   #define PERST_DELAY_US				1000
> > > +#define FLUSH_TIMEOUT_US			100
> > >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > > @@ -274,11 +283,14 @@ struct qcom_pcie {
> > >   	struct icc_path *icc_cpu;
> > >   	const struct qcom_pcie_cfg *cfg;
> > >   	struct dentry *debugfs;
> > > +	int global_irq;
> > >   	bool suspended;
> > >   	bool use_pm_opp;
> > >   };
> > >   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > > +				  struct pci_dev *pdev);
> > >   static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> > >   {
> > > @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> > >   			goto err_assert_reset;
> > >   	}
> > > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > > +
> > >   	return 0;
> > >   err_assert_reset:
> > > @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
> > >   	.post_init	= qcom_pcie_host_post_init,
> > >   };
> > > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > > +				  struct pci_dev *pdev)
> > > +{
> > > +	struct pci_bus *bus = bridge->bus;
> > > +	struct dw_pcie_rp *pp = bus->sysdata;
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > > +	struct device *dev = pcie->pci->dev;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	/* Wait for the pending transactions to be completed */
> > > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> > > +					 val & FLUSH_COMPLETED, 10,
> > > +					 FLUSH_TIMEOUT_US);
> > > +	if (ret) {
> > > +		dev_err(dev, "Flush completion failed: %d\n", ret);
> > > +		goto err_host_deinit;
> > > +	}
> > > +
> > > +	/* Clear the FLUSH_MODE to allow the core to be reset */
> > > +	val = readl(pcie->parf + PARF_LTSSM);
> > > +	val |= SW_CLEAR_FLUSH_MODE;
> > > +	writel(val, pcie->parf + PARF_LTSSM);
> > > +
> > > +	/* Wait for the FLUSH_MODE to clear */
> > > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> > > +					 !(val & FLUSH_MODE), 10,
> > > +					 FLUSH_TIMEOUT_US);
> > > +	if (ret) {
> > > +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> > > +		goto err_host_deinit;
> > > +	}
> > > +
> > > +	qcom_pcie_host_deinit(pp);
> > > +
> > > +	ret = qcom_pcie_host_init(pp);
> > > +	if (ret) {
> > > +		dev_err(dev, "Host init failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = dw_pcie_setup_rc(pp);
> > > +	if (ret)
> > > +		goto err_host_deinit;
> > > +
> > > +	/*
> > > +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> > > +	 * non-sticky.
> > > +	 */
> > > +	if (pcie->global_irq)
> > > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> > > +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> > do we need to enable linkup again here, since all the devices are
> > enumerated previously, the linkup irq will do a rescan again which is
> > not needed.
> 
> Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
> is strictly not needed. I will drop it.
> 

Hmm, I just realized that if the device gets removed and link down happens, we
would still need to have link up to enumerate it once attached.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

