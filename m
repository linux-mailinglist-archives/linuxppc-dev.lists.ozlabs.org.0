Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55D187AE49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 18:54:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wQQy+2vx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvynk38l9z3dVK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 04:54:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wQQy+2vx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvymz2TFbz3cG3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 04:53:53 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e6c10bdd2fso163781b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710352429; x=1710957229; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P42L0V1byhnm9xVh8nwf+gtaXnbnBXKB7y3o50DEnDg=;
        b=wQQy+2vxvLAvNpqd3ubD/nJltqfAjlk8CQ9eCIl3gss64grF0YGr/tSa8cmrjRl0hA
         J6We1/VMIDulapyU1T5kpZwZQqE0QmxLaHmtRGrd9MLnv9KKmNBA5BRfYMH3BNcEXpTi
         rUwtjdTXU7v53cWELpp8DI0rrgwCWGks5j7LHpAdFXL4PHm2dQZqrYLU3kSgqXRObBMt
         EcIL0iwUrANtHIxGfEHjFc/mVZtSwQlLJjcbt1JTYkT/2fOQIm1WDkfnCAS7Dy0eVvwW
         6LY4h2sx8KADpaSd8MsHkF83YZLZeciLZyjkGsBBrv8d9967jsvYk3uViQkz3PI7rvoV
         2t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352429; x=1710957229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P42L0V1byhnm9xVh8nwf+gtaXnbnBXKB7y3o50DEnDg=;
        b=CkAIFDVr4VkZDz2QZqIEC5e6/3DQnJRrByX217+jzxUW94rZp+YDdLYQ/PO6LykBwZ
         qXNqSt4mNT6muYYbgC6Dxm2rWSUoQVx+6fSLRaofry76C36iLAyyLlT7jtvDamr7aopl
         UtO/DJ4J7eVDH8MG5SAEFbGnOHb+p+liakWlNwLtkcETqjqRIDyRi2ZvSpFVCyQqqBtX
         VSoGu7JqW55o1lvcSjXf7G+ZjCgF4kxm8lVYe7uGBzOy7RIwVoNjNCXzv+D6FfuLJ9T0
         BPMTjb6e7HdyjAOYQ63VXcQ66gsZsf689sIFPRgDqmAvRKBgK2pDw2au9Lz20tKh0tEk
         Ra6g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2wdgNcQnHWMdYrbIs3qi1bO4FtpAWte65Wmg6PcmDI/k0L0CWghUMRXTzQZHr4ZZfLQTe2/zBaZO4tvuoogJbCoKzU/RaKfR+Fw/8g==
X-Gm-Message-State: AOJu0Yx6igamKeaJhpE7SEImBv3Q6gC3sTQVkWhBFQJruokioVEFk2tp
	vNKYMM1qhmbnrh2jftuR5J8WQKGLpH/K8FVB0xqG34/61j3Kx6K/vWRCDBspnA==
X-Google-Smtp-Source: AGHT+IFcf5q7ruVnxD8hAPCs04EkAgFwMtLJq7WsD337HPZnA1JczKQ1xXu4AYtawACMGMb2l439Qw==
X-Received: by 2002:a05:6a20:12c9:b0:1a3:113a:bbd5 with SMTP id v9-20020a056a2012c900b001a3113abbd5mr5892663pzg.40.1710352428857;
        Wed, 13 Mar 2024 10:53:48 -0700 (PDT)
Received: from thinkpad ([117.213.99.94])
        by smtp.gmail.com with ESMTPSA id r6-20020a63e506000000b005dbd0facb4dsm7803062pgh.61.2024.03.13.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:53:48 -0700 (PDT)
Date: Wed, 13 Mar 2024 23:23:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240313175333.GA126027@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <ZesRk5Dg4KEASD3U@ryzen>
 <20240311144559.GA2504@thinkpad>
 <Ze99lLhe2GqIqMgl@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ze99lLhe2GqIqMgl@ryzen>
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

On Mon, Mar 11, 2024 at 10:54:28PM +0100, Niklas Cassel wrote:
> On Mon, Mar 11, 2024 at 08:15:59PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > I would say that it is the following change that breaks things:
> > > 
> > > > -	if (!core_init_notifier) {
> > > > -		ret = pci_epf_test_core_init(epf);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -	}
> > > > -
> > > 
> > > Since without this code, pci_epf_test_core_init() will no longer be called,
> > > as there is currently no one that calls epf->core_init() for a EPF driver
> > > after it has been bound. (For drivers that call dw_pcie_ep_init_notify() in
> > > .probe())
> > > 
> > 
> > Thanks a lot for testing, Niklas!
> > 
> > > I guess one way to solve this would be for the EPC core to keep track of
> > > the current EPC "core state" (up/down). If the core is "up" at EPF .bind()
> > > time, notify the EPF driver directly after .bind()?
> > > 
> > 
> > Yeah, that's a good solution. But I think it would be better if the EPC caches
> > all events if the EPF drivers are not available and dispatch them once the bind
> > happens for each EPF driver. Even though INIT_COMPLETE is the only event that is
> > getting generated before bind() now, IMO it is better to add provision to catch
> > other events also.
> > 
> > Wdyt?
> 
> I'm not sure.
> What if the EPF goes up/down/up, it seems a bit silly to send all those
> events to the EPF driver that will alloc+free+alloc.
> 
> Do we know for sure that we will want to store + replay events other than
> INIT_COMPLETE?
> 
> And how many events should we store?
> 
> 
> Until we can think of a good reason which events other than UP/DOWN we
> can to store, I think that just storing the state as an integer in
> struct pci_epc seems simpler.
> 

Hmm, makes sense.

> 
> Or I guess we could continue with a flag in struct pci_epc_features,
> like has_perst_notifier, which would then require the EPC driver to
> call both epc_notify_core_up() and epc_notify_core_down() when receiving
> the PERST deassert/assert.
> For a driver without the flag set, the EPC core would call
> .epc_notify_core_up() after bind. (And .epc_notify_core_down() would never
> be called, or it could call it before unbind().)
> That way an EPF driver itself would not need any different handling
> (all callbacks would always come, either triggered by an EPC driver that
> has PERST GPIO irq, or triggered by the EPC core for a driver that lacks
> a PERST GPIO).
> 

For simplicity, I've just used a flag in 'struct pci_epc' to track the core_init
and call the callback during bind().

But the series has grown big, so I decided to split it into two. One to address
the DBI access issue and also remove the 'core_init_notifier' flag and another
one to make EPF drivers more robust to handle the host reboot scenario.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
