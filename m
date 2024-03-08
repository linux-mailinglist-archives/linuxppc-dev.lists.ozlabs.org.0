Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB087612C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 10:45:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZXIVK6kO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trh9809Thz3vb8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 20:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZXIVK6kO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trh8R6BDcz3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 20:44:22 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e63e9abf6aso515077b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Mar 2024 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709891060; x=1710495860; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdMdoK0AVaUo9V+wul4fyguoktaqDabkYBWscL2ezsE=;
        b=ZXIVK6kOATpP5d3ht7zS842ZyfVW66fyrY8XgMCDgPwzM21EgwYtkZPjHDS5Sw4vVI
         7a/mas0pJHypVATl8o2OAYQln0rm9ogM3rHt+ncmvQjbhwDWMh3hJ5hC/YD7v1N+34+6
         QHpA86Qx/D41AutbZVqdw0HSMYvExJkf7xdRhy+6gL5KamOHLnqZqrNG77wHV6L6dNLS
         b1dzLNsPnp+GkABrkfxyAwJHKidracCwtNVhrpI5FpYFka219/UrzYqKKOTbAMu1YcaV
         oDg50ZUlWfvxyLD9RFk/jg9fV69wNCLg84RgsrXGFmgi1PsATuDdhO1oKSK/Hc5IT7KV
         qrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891060; x=1710495860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdMdoK0AVaUo9V+wul4fyguoktaqDabkYBWscL2ezsE=;
        b=MbWCqHPHsyHwc4FywJDH0fFmLmUIFD6F5n7w/5O+5/cxpClqSFKm6v0UovpjbwKbr0
         4pLpMJfUP3akR4cNfA2GnA+xFoSrasrEMq+YOyAMUoPZ7AQO4F7yqZz7y+KsXsLfym0w
         5JDRZ83oWDxNJmrL6K9H1slqI56aG+6LWEe6nvDV1oi5X+L4ib/rxWtxvaJVhD6TmDho
         Sk7l3Sp7wwIJ3uEOzZ1hoyJ+niV6eCHWt1orMid1iy64h6sJ1yCtERzt6W44u4QOLRYL
         sg3cRmaRpd4phv70zzf4ROUacrhSb9RnscG2DFFChCnAx0lVs/C7pXoAC3YAUyC7VM/m
         JYzg==
X-Forwarded-Encrypted: i=1; AJvYcCWMDY35R8PSTQaNIJ8TVUPwGXCr7xvGmX5goEx45zcN2/vDnEN1WGzkwv/EgDsINFbOUb676smeqI56SA5nFwEe9GlOvPc8HTmwHGw8oQ==
X-Gm-Message-State: AOJu0Yz8DS02KzvANkz7Hp+Pp9+mnWwHLDlcOajgvHoAkyWLMq2A5fZf
	GpMADDGHmEslw+iwkQpWIfFeNxZ55CsVqGpfGLDS8k43hOwtMKckQ0BVKex70g==
X-Google-Smtp-Source: AGHT+IFPbL54AXHQXB9MkS0qJtzg8o8q9yBGg3I5qPe5e95N0vMgv1+cPBqKR5EsKnzhBrhB5Hgmww==
X-Received: by 2002:a05:6a20:4284:b0:1a1:6b04:9f2e with SMTP id o4-20020a056a20428400b001a16b049f2emr7419660pzj.9.1709891060050;
        Fri, 08 Mar 2024 01:44:20 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id b1-20020aa78101000000b006e6350986a8sm6625169pfi.215.2024.03.08.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:44:19 -0800 (PST)
Date: Fri, 8 Mar 2024 15:14:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240308094404.GF3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <Zeos8kVxgchH9veF@ryzen>
 <20240308053829.GC3789@thinkpad>
 <ZerQxxfUvFm2MjqV@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZerQxxfUvFm2MjqV@ryzen>
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

On Fri, Mar 08, 2024 at 09:48:07AM +0100, Niklas Cassel wrote:
> On Fri, Mar 08, 2024 at 11:08:29AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 07, 2024 at 10:09:06PM +0100, Niklas Cassel wrote:
> > > On Mon, Mar 04, 2024 at 02:52:19PM +0530, Manivannan Sadhasivam wrote:
> > > > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > > > the host to complete the DWC core initialization. Also, those drivers will
> > > > send a notification to the EPF drivers once the initialization is fully
> > > > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > > > will start functioning.
> > > > 
> > > > For the rest of the drivers generating refclk locally, EPF drivers will
> > > > start functioning post binding with them. EPF drivers rely on the
> > > > 'core_init_notifier' flag to differentiate between the drivers.
> > > > Unfortunately, this creates two different flows for the EPF drivers.
> > > > 
> > > > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > > > a single initialization flow for the EPF drivers. This is done by calling
> > > > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > > > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > > > send the notification to the EPF drivers once the initialization is fully
> > > > completed.
> > > > 
> > > > Only difference here is that, the drivers requiring refclk from host will
> > > > send the notification once refclk is received, while others will send it
> > > > during probe time itself.
> > > > 
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > 
> > > You have removed the .core_init_notifier from EPC drivers,
> > > but the callback in EPF drivers is still called .core_init.
> > > 
> > > Yes, this was a confusing name even before this patch, but
> > > after this patch, it is probably even worse :)
> > > 
> > > The callback should be named from the perspective of EPF drivers IMO.
> > > .core_init sounds like a EPF driver should initialize the core.
> > > (But that is of course done by the EPC driver.)
> > > 
> > > The .link_up() callback name is better, the EPF driver is informed
> > > that the link is up.
> > > 
> > > Perhaps we could rename .core_init to .core_up ?
> > > 
> > > It tells the EPF drivers that the core is now up.
> > > (And the EPF driver can configure the BARs.)
> > > 
> > 
> > I don't disagree :) I thought about it but then decided to not extend the scope
> > of this series further. So saved that for next series.
> > 
> > But yeah, it is good to clean it up here itself.
> 
> If you intend to create a .core_deinit or .core_down (or whatever name
> you decide on), perhaps it is better to leave this cleanup to be part
> of that same series?
> 

I already added a patch. So let's do it here itself :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்
