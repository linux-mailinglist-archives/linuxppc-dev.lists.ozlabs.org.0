Return-Path: <linuxppc-dev+bounces-7951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D7A9A04F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 07:01:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjkMT3chgz30HB;
	Thu, 24 Apr 2025 15:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745470869;
	cv=none; b=OYzZLLSn5ljZ4fhg50hqU05w9DEtwbD8db8j3HSt8BgRWf1xz/5pbRhAe9d9bBYPI9r3wY1JDHc9kuGMaMj3mYKX4OA5Mw6pl60i8cCH2CyZ+TBR4dPy+03uvEUcGwl0IcwSXyKagarV0Okq7e3L1kjkhtlnQ7l6wT0yCx0klZ4ob0u8FuxCiVVQV72ApjChdf2D1gfr/SZVUVDV3oUM2acnjGUUtoMiiitPtvbCtth2nEdIGIirFVcgcFXqiKOXLphkfJXXyZ1Cj8+jVTNGfMS/ExBgvnlvA+xzd73SHyU0RYkvsvhLDv4LFDBoPksjV1+qThGtQqezDolKGThdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745470869; c=relaxed/relaxed;
	bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMvO55Ow6AMJ8ojRsojoujEN0EQ+HlEiBxUqUj6yDahU48nAqCVQr7HnkAs7lpAQo7k30rj8h8n4wD6dNifOtDxQTgsP0nLPr1l8KWmmXw1LmckCeDlR+CUl4ZGNpstiDtBc+qUWgEgkm79sizTuOJANMBJrfwCB/enBCUYoM+2GnSFc9bcNnAgVgiPQFz5Eoki8r8xhsRSita0dcrS9dlZ0bOgvJExRoof/ah4tbfInXpcGwJIk42gc87g5lQ79qtFo/e+AhMb+6/GO0KMjaO94g6M5XhM6GUXxjas+O0zFlWBeXOEtv+b1/wyhfKolVO5ee235pJfZuuyeuP/LdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NUUBln4d; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NUUBln4d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjkMN5vBXz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 15:01:03 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227c7e57da2so4713895ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 22:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745470860; x=1746075660; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
        b=NUUBln4dilUHDJ6mybcQPGa3NvT/VXjhwR3rP0MsseotbmTJ0sfnW7bADxE9QimJJJ
         iVyee9ao2b8Rvcfy69OjKZ1hnNRQ/lMtkDFzblR0eOb2tPQ92LX6OlLKsp9PEaEINXyu
         XgMTH9oiwhNLShyaq0cYXTKteCUnPBCnfxIexM2TI0g7OsHmMNxwGf10m5vMGP1tj3K9
         hcOlDSqo9IutHewIVP2OUfvErg8RIcLBXymFAsK7JpmNvn3Hgqz/nBFpHZp8x1c2QGD5
         FlyGw3nmanMwZX42/KX9hoyYS+RUo9GhbZFpSA1g0YPY/qVLgJyELcZTYUIr3VFd0FT3
         Nabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745470860; x=1746075660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
        b=kBISEDCd3wOKgpHQy4L7SPKDRKl6uw1Ejz1NeM3B2fXV7W3JwmOKRU19pZuPv5xVp5
         7XF3NCjn+eDuP8GYN45chg4IIcc936eujHai4zN16T8uC+vHa59g3F/Q/JbncqbaQcxl
         U8Fu32P0fCbCqfNt5YbbvtrXn4jHxY2Ih/WO57CdgCgim1MLYfiXR95l/YK9chyQXAlA
         4qkLJqBU9EGy484U69c+loRBR4vbHejBjhznTs5/bvLdkfDnK5oTKNXpHHxgI6uvMuXA
         cPxUgxiRZ2gAYCBRyWjnjULpYMJjFLdDN5xn92gSsmMDT7jEBUAEPjfmMByABxW+Sh2w
         NvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwcen3dzhCxKumujXa96wyaM7rSiVH/2H0VZU7Ea923Mft28DarxeeDYsnKioioiCT6a3Wxvpl7SQiNjg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxKxIv/WQxDsRf6N0lVFGSIKM4dkkAkTAQHpsPupbFwFAp2mH4
	mkMndLQktfWZh++sQ/mIyv6Frvb5TIV8LUEm2W/kouBtz7asR6nz9e97I+V2XA==
X-Gm-Gg: ASbGnctC3Li2XmOkRPu/J7xazgFLEEbzPJuf+4YueToo8jA0H2RBIJ0gZ2C10J6ne6t
	YMYRUYbjko1gr5dMKUfFrcyEzR0mP/UWmhBZqkVaSMTk3TlTGRWUljdgnhlIL5PvyBJykjFmPu9
	QxFIE+8v0qQs+eqgNLLApGJ4f/Q72ufhEVRMvh4RZAfZnzGqRTRrwDyvOFL99bgyl1oDq1KpAZO
	s2M6wqSqvB0rvDZlDcs19o09A5nBGzNXv0fgaEEgkiml9y1eQG3Rc6Sh/JGa57Ap+enZPIH+jxv
	PUbuhbuT+kCNsm1nTU1m24TIW1AgLMI17P+nQbzlfIDZI5KCV00=
X-Google-Smtp-Source: AGHT+IFlCw2SuU4enXP7a4EpyWA+qrfkXjx8G9cFKLJd9YEAI7BU71q90hR3Gq88nNLPSs+CuzFQxg==
X-Received: by 2002:a17:903:94c:b0:220:fe51:1aab with SMTP id d9443c01a7336-22db3d71bbemr19486175ad.38.1745470860040;
        Wed, 23 Apr 2025 22:01:00 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f7fsm3794705ad.33.2025.04.23.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:00:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:30:51 +0530
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
Message-ID: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
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
> > in the handler to let the PCI core handle the link down condition.
> > 
> > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > reset the slot in a platform specific way. So implement the callback to
> > reset the slot by first resetting the PCIe core, followed by reinitializing
> > the resources and then finally starting the link again.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/controller/dwc/Kconfig     |  1 +
> >   drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
> >   2 files changed, 89 insertions(+), 2 deletions(-)
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
> > index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
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
> > @@ -130,8 +132,11 @@
> >   /* PARF_LTSSM register fields */
> >   #define LTSSM_EN				BIT(8)
> > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > +#define FLUSH_MODE				BIT(11)
> >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
> >   #define PARF_INT_ALL_LINK_UP			BIT(13)
> >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> > @@ -145,6 +150,9 @@
> >   /* PARF_BDF_TO_SID_CFG fields */
> >   #define BDF_TO_SID_BYPASS			BIT(0)
> > +/* PARF_STATUS fields */
> > +#define FLUSH_COMPLETED				BIT(8)
> > +
> >   /* ELBI_SYS_CTRL register fields */
> >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > @@ -169,6 +177,7 @@
> >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> >   #define PERST_DELAY_US				1000
> > +#define FLUSH_TIMEOUT_US			100
> >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > @@ -274,11 +283,14 @@ struct qcom_pcie {
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
> > @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >   			goto err_assert_reset;
> >   	}
> > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > +
> >   	return 0;
> >   err_assert_reset:
> > @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
> >   	.post_init	= qcom_pcie_host_post_init,
> >   };
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
> do we need to enable linkup again here, since all the devices are
> enumerated previously, the linkup irq will do a rescan again which is
> not needed.

Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
is strictly not needed. I will drop it.

> Instead of linkup we update icc & opp bandwidths after
> dw_pcie_wait_for_link() in the below.
> 

Why do we need to update ICC and OPP?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

