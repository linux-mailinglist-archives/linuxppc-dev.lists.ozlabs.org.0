Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA5904A16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 06:37:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=My0OBM2/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzXnj2w8Dz3cb7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 14:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=My0OBM2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzXn12q1yz3cQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 14:36:34 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6f95c2c1250so2595953a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 21:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718166987; x=1718771787; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vH+4iQ0Kxj/vMdKXd1GL4axukTJSkL87xzz/uOsZjd0=;
        b=My0OBM2/tsRz89qwqAG2ODa96k0uEk71MF8u/nERnNNX3hL/SXHzPQiUEggghTX1PG
         kSOb5WstVFJjkKikcHgXmpjB02nGLVARTPTutCI/FfEUxHFc/KsA41Je67h4Rn+lzXno
         UNpwTHTnBgJRmtrZZHntjWInY0zoh87phVMfgvm1oG0HCMWMPcCR+Y85jbNKt20HhnTm
         JXmjt+plOkX+gFJ4h+8e4Fz6ANxY2tPbFy6uHxRHA0FkaAD4zNZGXhVTQmyEf/TCRnvt
         oYZjDVssef7ND0cpBnUS5YrWp1P/nnQ2OuYmtwPGaeLF0z2tYEY04A/+RZ7jVmmIiF1+
         qdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718166987; x=1718771787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vH+4iQ0Kxj/vMdKXd1GL4axukTJSkL87xzz/uOsZjd0=;
        b=F/kmc7nQfqiNVjahAzDmqIIo5LuvfuyrakTIk3vBuUisl0Mo0sYTQD5G2AaR8UCCpT
         +IJ7ZH/mQfonpODIA0WfGkDttL7vHm8uCrAEdY42bnrDw2ubfzizHTvUIRLMEf/OB/fY
         3qL6dtbzRUwhtKqqlrIPlBrby9C1tkv/xCCb9LnnuO6dsD70VFe4nfkOewTUrHd713IT
         Fi0S6sdJDN+Vgc9ehKPF9d+cUJfAiO2ivV219GkPWuGnlr8LlF9HwyVlgkLhaNNPM27F
         zuK3pYkBDuOdwN2Kyvg/6LaGWnuSDzU1zBTHNmaQtj/nzLV9vPnjbYHzvfYNST/nqEER
         n3/w==
X-Forwarded-Encrypted: i=1; AJvYcCVL2mOoVyIR1Ig9G7+x55tiTrFjqmkMGQz4eR1PgoJwqc+z7//PbH317TWOf01F4jR1sQjK9tOzFtPzfPjCSxaKhojcavJ5YGJWTQ9jDQ==
X-Gm-Message-State: AOJu0Yyvrt0gtukEpgl0WnKcfKWoQTFRE0Pg7SaTn8O6sjSPfuBac1S5
	4K1dTuVgeglYkj/FVqdAgYrxbTf0PzJxPe4JQZD3DbrjPeL6+BssM6kAeSEQnw==
X-Google-Smtp-Source: AGHT+IF/i1Z4g1iXpug+xajahacKVwnIvfnsiSOznBlRwgjL1WHJ0xairr9brTYDWvv7YNpLZYuzDg==
X-Received: by 2002:a05:6870:d186:b0:251:46d:d32a with SMTP id 586e51a60fabf-25514b4e021mr927373fac.8.1718166986969;
        Tue, 11 Jun 2024 21:36:26 -0700 (PDT)
Received: from thinkpad ([120.60.129.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e9a52a3012sm5409033a12.30.2024.06.11.21.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:36:26 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:06:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/5] PCI: endpoint: Introduce 'epc_deinit' event and
 notify the EPF drivers
Message-ID: <20240612043612.GC2645@thinkpad>
References: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
 <20240611220640.GA1001976@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611220640.GA1001976@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 05:06:40PM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 06, 2024 at 12:56:35PM +0530, Manivannan Sadhasivam wrote:
> > As like the 'epc_init' event, that is used to signal the EPF drivers about
> > the EPC initialization, let's introduce 'epc_deinit' event that is used to
> > signal EPC deinitialization.
> > 
> > The EPC deinitialization applies only when any sort of fundamental reset
> > is supported by the endpoint controller as per the PCIe spec.
> > 
> > Reference: PCIe Base spec v5.0, sections 4.2.4.9.1 and 6.6.1.
> 
> PCIe r6.0, sec 4.2.5.9.1 and 6.6.1.
> 
> (Not 4.2.4.9.1, which no longer exists in r6.x)
> 

Ammended the commit in pci/endpoint, thanks!

- Mani

> > Currently, some EPC drivers like pcie-qcom-ep and pcie-tegra194 support
> > PERST# as the fundamental reset. So the 'deinit' event will be notified to
> > the EPF drivers when PERST# assert happens in the above mentioned EPC
> > drivers.
> > 
> > The EPF drivers, on receiving the event through the epc_deinit() callback
> > should reset the EPF state machine and also cleanup any configuration that
> > got affected by the fundamental reset like BAR, DMA etc...
> > 
> > This change also warrants skipping the cleanups in unbind() if already done
> > in epc_deinit().
> > 
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

-- 
மணிவண்ணன் சதாசிவம்
