Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB986FB9C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 09:19:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=naQuZIwe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpBSp1FSlz3cG3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 19:19:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=naQuZIwe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpBS44HS2z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 19:19:16 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso886540276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 00:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540353; x=1710145153; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGaxan9MS5xxwpnuhzQOq+gU3MPaqevKCopu0R9YM7I=;
        b=naQuZIweo7uKfc93x9hERvxKCvYNFUk4so6h+b7ADsconH+C1xpfDodi98eX/FcbC7
         vhcQfrqZSBjhAfgn0i8vBcdx19YB31o9Yit+RdjudI9qMOUQP7KRa/HV4x3vK/wKWl1S
         VnWQqcuqdN3MPKbQOnZVQ0t9et/7grqlMMnCsCpyZh4Bka11Ke7VV7iO/lSONIE7ssS6
         3ogIHhVcr4lGw+K/VUJ0yTuq9BKJ9mV+3ZCisMoccDRc4QcfoVG1coFu+GQEWSVgHcdK
         CKBTXWmqpawOGnUohGK/d1rrZzXFnqLtk6ZEiaAns4iNgq9bzlsZYqJbeDVTUTdOgnmL
         e+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540353; x=1710145153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGaxan9MS5xxwpnuhzQOq+gU3MPaqevKCopu0R9YM7I=;
        b=BJrtLJPGJ1Zi7KdYKfl/VTWtrMXM0txobdIsWOL2+6RChVfW7tM56NsFE6TPWm41OK
         8mfPjxKe5qY6F5IMUtZmfZmur5xgVJ5Q/fSUOcFN0TKQfL2U2QMzj1TVWRFulrha56/u
         4byLdJxcGvMzPzxLm7zMPFnjU5hEQ64VYaLRGzL8LiVEx6izUXW1LKFvH15gBsbXTPxC
         RfFu2iKJX0UB5qNglJB1Bmn+bsqzcszXfGv7GHQablH9f0fkLxbRGyhxs/+8dxwhUyGo
         QFlBJUADX9N9OZkNEx66eQ1ge5OE3yA7MLe1wlQIkBIJTB4VgiwAOw8nZJMiaKsBNGef
         vipQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjDbVAAySfGs0Y1KUEr5DjCLEZtub8No+NhYZZHVDDx/2POVleTlpVy26s/EVhj/ekbHn+mfoBzvmNF/K1KdX//A2wCEMoVhWYhYoS3A==
X-Gm-Message-State: AOJu0YznhqRS587wDIHoeqYfwgTwmUwZ1ZBUikg5Wfz82KTWj+mifG64
	wET866zY95dkay6o/bkHeUUMLZ3QaDnOVjkK4VmohwrqBv8J6ouogGTawNqcCQ==
X-Google-Smtp-Source: AGHT+IHL1WHL+wc2Bkuxv4RuAVn4VY861FeJv8fqtZvJsgPjzKqwuQFKnCSzgHkDfczowkgJ09KEpA==
X-Received: by 2002:a25:7412:0:b0:dcc:79ab:e51a with SMTP id p18-20020a257412000000b00dcc79abe51amr6318413ybc.57.1709540353345;
        Mon, 04 Mar 2024 00:19:13 -0800 (PST)
Received: from thinkpad ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id ks17-20020ac86211000000b0042ed81f5297sm2298830qtb.35.2024.03.04.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:19:13 -0800 (PST)
Date: Mon, 4 Mar 2024 13:48:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v8 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <20240304081859.GI2647@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
 <ZeB-93jiX31cLJyP@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeB-93jiX31cLJyP@fedora>
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

On Thu, Feb 29, 2024 at 01:56:23PM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Sat, Feb 24, 2024 at 12:24:16PM +0530, Manivannan Sadhasivam wrote:
> > All of the APIs are missing the Kernel-doc comments. Hence, add them.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-ep.c | 92 +++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index fed4c2936c78..cdcb33a279db 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> 
> (snip)
> 
> > @@ -556,6 +606,12 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * dw_pcie_ep_cleanup - Cleanup DWC EP resources
> > + * @ep: DWC EP device
> > + *
> > + * Cleans up the DWC EP specific resources like eDMA etc...
> 
> I think that you should mention that this is only for glue drivers that
> use PERST# handling, so that other glue drivers do no start using it :)
> 

You are right. Will add the wording.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
