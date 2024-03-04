Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D775786FB84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 09:18:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X3qY4gkH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpBQr3nFCz3dTg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 19:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X3qY4gkH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpBQ62br6z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 19:17:32 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-787b0b1deeaso217670485a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 00:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540248; x=1710145048; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmWR/dQ/IEMHbjZi2RajMkmXPdKPqp6IFe8boeN75aE=;
        b=X3qY4gkHKhRUv9s8SjMq+ObHkE4TtQD5NXVhhwPVzvgeQpUK3NwdE/rPRmuWKavRB+
         rVuhb6zflLJsoJ7q8AO+BC0K71qw321mRuYby1CvXs8B1GmkvlC2th7J1RjgOE1RyZM6
         GYkiiEobTIs65HUdo7z3PO9y1qVAo4GwhkvPusRD8fcACJhz+l7Ce0SuJewVKPQU7pJA
         7il3VYBZkJefwXV6l1CwfI2N7377q4iUl/Mg1BUbaD0qDxPelsjI7Zp87brBoyqm7R0y
         Yh6uhGi5K5oJVF+3GtYnoZUOjD9vY+jYfluh1prDDSp0hWb/iH/1AxEeSizPgYhy+v5t
         kLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540248; x=1710145048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmWR/dQ/IEMHbjZi2RajMkmXPdKPqp6IFe8boeN75aE=;
        b=Hx0vjel8ZPlUPoZBnoIFDXCbCKwJQBcNokUkiuuXxUD2Rx4dFT9UyIDJzN7lptxndu
         RclirQRr58S20+naDAs40t5+YIOYwaV1TLXp8lKpFpJTDnHcutv84a+Xr2CyQ1/o4nbe
         WtS8UCgjtbZFw6YzfryMxL8SHYsS7dBtAfdI0pdD7d1ZeITmvc+4Q6829FT+9xtj+xTo
         5PArq/nCMFmHVUOzVt6OLG6FKiP1WTZRfmbXcVz47egFlb+j34IGSF1A48T8Ny1rC7Hd
         ExZ7R8ZJJb5sqhlhA5KTSzgvu4HtOsBXMI51tFu1iLtFYiEf2Gpyms89HGaqQQ5eom9o
         Y7jg==
X-Forwarded-Encrypted: i=1; AJvYcCWgICHb7Cd3o0ucW9jKZiwZSfsk4ZDGcAqcJYF5rMEOs3mwHp9BDpmkkOZwZrJqi0CvzW8OuixLvgHE0sKKcTsuTxNLN4CBk7PFNHOqNQ==
X-Gm-Message-State: AOJu0YznLWe/h+gHUC7/e1D+XmzqoADuKu3SD3+vwQFHtws+bEhNkXhc
	vRmA+82BP48x0RB3aQVpjvkMmzedrBg38NHFP/5e8MfZeZNywKXmr4RACat+pg==
X-Google-Smtp-Source: AGHT+IHj2odoO405rOYr1Gbd+eMsiiWMwBO5dmlWnp+hZP/p4is76K0Utr7rAm1gwPP1v5DFYu5Uzw==
X-Received: by 2002:a05:620a:110d:b0:788:22c4:c95f with SMTP id o13-20020a05620a110d00b0078822c4c95fmr3901107qkk.21.1709540248532;
        Mon, 04 Mar 2024 00:17:28 -0800 (PST)
Received: from thinkpad ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id t20-20020a05620a0b1400b007881ed0f87dsm1737718qkg.65.2024.03.04.00.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:17:28 -0800 (PST)
Date: Mon, 4 Mar 2024 13:47:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup()
 API for drivers supporting PERST#
Message-ID: <20240304081713.GH2647@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
 <ZeB7PQtkDSoCzE1Z@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeB7PQtkDSoCzE1Z@fedora>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-
 kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 01:40:29PM +0100, Niklas Cassel wrote:
> On Sat, Feb 24, 2024 at 12:24:09PM +0530, Manivannan Sadhasivam wrote:
> > For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
> > of the DWC resources like eDMA should be cleaned up during the PERST#
> > assert time.
> > 
> > So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
> > drivers to cleanup the DWC specific resources. Currently, it just removes
> > eDMA.
> > 
> > Reported-by: Niklas Cassel <cassel@kernel.org>
> > Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-ep.c | 11 +++++++++--
> >  drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
> >  drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
> >  4 files changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index 2b11290aab4c..1205bfba8310 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -564,12 +564,19 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >  
> > -void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
> > +void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > -	struct pci_epc *epc = ep->epc;
> >  
> >  	dw_pcie_edma_remove(pci);
> 
> Hello Mani,
> 
> In this message:
> https://lore.kernel.org/linux-pci/20240130062938.GB32821@thinkpad/
> 
> You mentioned that you were going to clean up the BARs.

Yes, I did and it is still in my queue.

> (Like I wrote in that thread, I really think that we should merge a fix for
> the broken "do we have a saved value from find_first_zero_bit() in the array",
> by using a "if (!saved_value[bar])", when find_first_zero_bit() returns zero.)
> 

Hmm, yeah that logic is flawed. Let me take another look.

> However, regardless of that, I do not see that this series (neither
> dw_pcie_ep_cleanup(), nor dw_pcie_ep_linkdown()), calls any function which
> will clean up the BARs.
> 
> Since e.g. qcom-ep.c does a reset_control_assert() during perst
> assert/deassert, which should clear sticky registers, I think that
> you should let dw_pcie_ep_cleanup() clean up the BARs using
> dw_pcie_ep_clear_bar().
> 

As I mentioned earlier, it is the job of the EPF drivers to clear the BARs since
they allocate them. I'm trying to reduce the implicit resetting wherever we
could.

The proper fix is to add the LINK_DOWN callback to EPF drivers and do cleanup.
I'm planning to submit a series for that after this one.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
