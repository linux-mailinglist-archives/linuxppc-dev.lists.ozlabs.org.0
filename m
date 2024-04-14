Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BBF8A41F5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 12:52:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VoL+5pGZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHRwG2YPsz3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 20:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VoL+5pGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHRvV2QJYz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 20:52:03 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5aa241232faso2079449eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713091920; x=1713696720; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z86tADjA34jPDvp0sH69LSJjWH6CGCLDMrpq88/Jt4c=;
        b=VoL+5pGZ30CZ8a5qTlsfKtwgs7wb7DwgpcFYJEj5TXtmvU7wb6rFWKhSKDIHf5wnRa
         PSUp2eIdyyLGYT0R13JZ+mgsCBOvR4xRCNZe3RiXWZQ+YlWXFtfAS3D4xsWCtl7Cj50W
         3N5kyBQoc+wAO4kltVGp9TP+J0wzElzNOgBKLsFpT3nu6rGsDVfUlOMEpW0JaL3QsCV+
         CUPFeua3u1ksF3n0Fe2JEkaV5unxB4Rl0o1j2IbU3For/8sJDnM8aZCp9AqJZaibAwen
         Vf2wFy5XPcNNXak2wyC7ZXUAy2u1s1N8xiFNEteYEw9lE2OwiE+lVpvSgfQ3Ml55u4BX
         qFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713091920; x=1713696720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z86tADjA34jPDvp0sH69LSJjWH6CGCLDMrpq88/Jt4c=;
        b=w6h/svOA9SptEtG05SsM/1btrboRKMK2yuhbf7O5UGT/UKhSxlK1MGsrCmDMhTs/nB
         Q6GHjB3uJmFqnBBpw39m7EZLmbqDdvmClSZ8JfceM8abJgeSg1xeKcS7Z6YlU7P6/4pL
         27+t+UcAc38ySN0J14lI1tQhkR+1wBi1Y8PXaoW/lr3d+frut3j9mKeL7i460c+TDxhy
         biZ2Ie7sX3xYxuS/LSlaARHgHpVObf0I/mCtlXpYYqbAvabQynFzFDiT11ZWT0wBvQF4
         v6CQx6omU5MTKCukjR9ZdEOXa+NrPEhUcOtYCT3R0ny99YGiXHQmVH9hVbhsLEeUqMWi
         aLyA==
X-Forwarded-Encrypted: i=1; AJvYcCXxNVmrnK0umlsKh9XsdI+h4gRtnU5At+8hyVkm983JfT/IvBHaqsmC5f09TABqpqYhtUNzkIWmrso2hQaSNkBpR+4GX/apuQe2hh2EqQ==
X-Gm-Message-State: AOJu0Yz7d/+YP/m/KoQsSM+Q8usOABuTR6L0LiOUPH318ASIa/yinJwE
	+MhHw5Qy5txauiFLNvPJXLCIx5mJ/t6Z9H7PPXtrQIjNoGhhFlnzGnoAWiKvkA==
X-Google-Smtp-Source: AGHT+IHG73jN0JyTXE5YMG9IYvVbYRtG5PEk5LWJ00N9WZxttyYSYCMKrPxspcM2aGpT1bTva1r7xA==
X-Received: by 2002:a05:6808:218c:b0:3c5:eddb:47c1 with SMTP id be12-20020a056808218c00b003c5eddb47c1mr9182957oib.5.1713091919486;
        Sun, 14 Apr 2024 03:51:59 -0700 (PDT)
Received: from thinkpad ([120.60.136.171])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001dcfaf4db22sm5944167plb.2.2024.04.14.03.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 03:51:59 -0700 (PDT)
Date: Sun, 14 Apr 2024 16:21:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v12 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <20240414105148.GC2294@thinkpad>
References: <20240327-pci-dbi-rework-v12-8-082625472414@linaro.org>
 <20240412202216.GA14590@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240412202216.GA14590@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-ke
 rnel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024 at 03:22:16PM -0500, Bjorn Helgaas wrote:
> On Wed, Mar 27, 2024 at 02:43:37PM +0530, Manivannan Sadhasivam wrote:
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
> 
> Thanks for doing this!  I think this is a significantly nicer
> solution than core_init_notifier was.
> 
> One question: both qcom and tegra194 call dw_pcie_ep_init_registers()
> from an interrupt handler, but they register that handler in a
> different order with respect to dw_pcie_ep_init().
> 
> I don't know what actually starts the process that leads to the
> interrupt, but if it's dw_pcie_ep_init(), then one of these (qcom, I
> think) must be racy:
> 

Your analysis is correct. But there is no race observed as of now since the IRQ
will only be enabled by configuring the endpoint using configfs interface and
right now I use an init script to do that. By that time, the driver would've
already probed completely.

But there is a slight chance that if the driver gets loaded as a module and the
userspace script starts configuring the endpoint interface using inotify watch
or something similar, then race could occur since the IRQ handler may not be
registered at that point.

>   qcom_pcie_ep_probe
>     dw_pcie_ep_init                                             <- A
>     qcom_pcie_ep_enable_irq_resources
>       devm_request_threaded_irq(qcom_pcie_ep_perst_irq_thread)  <- B
> 
>   qcom_pcie_ep_perst_irq_thread
>     qcom_pcie_perst_deassert
>       dw_pcie_ep_init_registers
> 
>   tegra_pcie_dw_probe
>     tegra_pcie_config_ep
>       devm_request_threaded_irq(tegra_pcie_ep_pex_rst_irq)      <- B
>       dw_pcie_ep_init                                           <- A
> 
>   tegra_pcie_ep_pex_rst_irq
>     pex_ep_event_pex_rst_deassert
>       dw_pcie_ep_init_registers
> 
> Whatever the right answer is, I think qcom and tegra194 should both
> order dw_pcie_ep_init() and the devm_request_threaded_irq() the same
> way.
> 

Agree. The right way is to register the IRQ handler first and then do
dw_pcie_ep_init(). I will fix it in the qcom driver.

Thanks for spotting!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
