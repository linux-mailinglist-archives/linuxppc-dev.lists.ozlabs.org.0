Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BDF875DBB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 06:39:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YvR7zOWV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrZjp03t1z3vXc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 16:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YvR7zOWV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrZj333Xdz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 16:38:47 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso13586915ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 21:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876324; x=1710481124; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUybYaiPJClMOkVE2KcQ/JxyjAJYL0HAMjXF/A+2etI=;
        b=YvR7zOWVarHLWCp9KY2GwMAQyS8zLsoXjvW/fEGskoezFnZrtMj6JEhRzyAmzkHCLJ
         UWc8s1m6Tzs6DVtg7iNsZkWEy4/iWLX4W9z5InUJtZUQxa4INrtFQyea4RXw9ps5A7qF
         ZYyEzPgaekz2eluYH4YO++3j2zdwvGCvzjghWtkcNb0xdz8oJf44IjSoE71QoOG3Yjzt
         yg8n/p6SUpBturmKuYO9LoDTgbg7nzb24m3Nw3IGChg35ky2DUkpMqVY6EwsgHw/iHmV
         xVC+RCS9fS3aboYJUhLmMSCQWxc4Ek0b3UL2lZgg1Ij8qr9WVN/3Tyq5mD0XvyHphJTM
         4dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876324; x=1710481124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUybYaiPJClMOkVE2KcQ/JxyjAJYL0HAMjXF/A+2etI=;
        b=IIsg7FEurhgHOOpytx+T2qexhKt2Sh7V1HVZz6mIznIGSDuUIeQmXJrNmE1wV7msqC
         lwkS8F20eCHdo4Cqtd+dpBJvKeD8Tfbfx/QlAUJ6s8sHzDlEsEDy2psWsV7CHfZrBzZn
         UVPIMaD2v0ysNdEP9nIXs7X5IeEg74ORSoPyh5g/J404aNG/DCSVmydraZTlnfUlgKwO
         LU0k1+08l0eVizQLM28BOamGS6+kJkkjdP2r+01su9axA9SXQM5B2fCzqMVxomzBPQUs
         AuAjiijDK8oBm9i01uYaxbSo6a0w5H/3jUQgRVxsNKaRTURPHvKrv4XF4AcXdScR4vRE
         ooGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcVfrGb5dfmBjSRcVZKOIuQNV22gtLh8YoERckgTrxKdVh/p5fFwsV/pWGnWQ8xmi6Sl7dWv2/Qzf+xigjGFGQ85OwVhBMRpAZd1ZAFQ==
X-Gm-Message-State: AOJu0YyCIg+D4NQD0JVE9RE0fQqEkTaOE4FtC6J9K5UvYIRn+lkK7w9i
	pctKPioYNYK9Z8nrd/H4oCJ562+dGPjwITWDlqUNbSp8MA9Gxa6Ou/taXsenXw==
X-Google-Smtp-Source: AGHT+IFnxmsrp/JdPtnzlcbTNURcPyjpmM+tg6dX1wncoxt7+3e7o8Cy2Ru1ZT2zUpWAw+nYHfuG6A==
X-Received: by 2002:a17:903:1249:b0:1db:4419:e925 with SMTP id u9-20020a170903124900b001db4419e925mr11913418plh.1.1709876324294;
        Thu, 07 Mar 2024 21:38:44 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id f11-20020a170903104b00b001db717ed294sm923036plc.120.2024.03.07.21.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:38:43 -0800 (PST)
Date: Fri, 8 Mar 2024 11:08:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240308053829.GC3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <Zeos8kVxgchH9veF@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zeos8kVxgchH9veF@ryzen>
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

On Thu, Mar 07, 2024 at 10:09:06PM +0100, Niklas Cassel wrote:
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
> 
> You have removed the .core_init_notifier from EPC drivers,
> but the callback in EPF drivers is still called .core_init.
> 
> Yes, this was a confusing name even before this patch, but
> after this patch, it is probably even worse :)
> 
> The callback should be named from the perspective of EPF drivers IMO.
> .core_init sounds like a EPF driver should initialize the core.
> (But that is of course done by the EPC driver.)
> 
> The .link_up() callback name is better, the EPF driver is informed
> that the link is up.
> 
> Perhaps we could rename .core_init to .core_up ?
> 
> It tells the EPF drivers that the core is now up.
> (And the EPF driver can configure the BARs.)
> 

I don't disagree :) I thought about it but then decided to not extend the scope
of this series further. So saved that for next series.

But yeah, it is good to clean it up here itself.

> 
> Considering that you are not changing the name of the callback,
> and that it was already confusing before this patch:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
