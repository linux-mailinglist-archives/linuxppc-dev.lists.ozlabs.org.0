Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BD8C8A80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 19:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgtd70939z30gp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 03:05:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgtcg6gsDz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 03:05:06 +1000 (AEST)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f44bcbaae7so1253396b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 10:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715965501; x=1716570301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAF2nClB9tdRe2nZvO7iQeg/IDzJ4PErDPhyqSEtfbs=;
        b=niGcP7GYLqsMmmpUzRZrEcDHAxZ9EczMtpo+mU4vnDbwtW76V/1XopmXOcPlaxa5+a
         e6rFLvB0Ye2mX5e7U0Dbyfdi35qGW0Uyk825rdFzQhJgQ7a1efyWd0FFNPnaxaf9cs1h
         qJQB0HLr0WZq11eYHkZfUL2wvESsFz5xWyBdq/6jK+YZKpQpS2J51fDj6OwUqIo2Xchu
         Zsc+0enO8u1sh6Yp6tuGAnniMkYl16pK5YC8UNuAqsDEdG82mym3l3cmIA2TdYkU7z+u
         GxzZ+zdlbSMv+Tw8IQKJAEarED3T2WDihTZk3DJL61U084sO7c+W1NrBqwd2gm9wMUUm
         OQZw==
X-Forwarded-Encrypted: i=1; AJvYcCXYKgol/DgjvmNHEAWSNqnvoIycoIS1Mh/iNTOQ0hEPmsVv9iwvkAFtbipontaqA9S0bS3NZr8RvZkAtla1KfOKIJBcw9rq7BSGcwA1EA==
X-Gm-Message-State: AOJu0YyWevfcP5KxoWl3gin1ZzDWIr0JbgZU9bodJ23evTeGPEOxY53o
	3aH0G0f6gqbEY665zpAJrnlIsE7w7Uz7fQXjWzJSxJS5KrrRD+hj
X-Google-Smtp-Source: AGHT+IGDk5wz8T58ydDnsgGbyCZmHKCAeGjDn9utiYyGXMhzVl4Lcok/JS9rF8CQMUTTLF/lj2nWEQ==
X-Received: by 2002:a05:6a00:238b:b0:6ea:afdb:6d03 with SMTP id d2e1a72fcca58-6f4e02d3ef9mr24111615b3a.19.1715965501417;
        Fri, 17 May 2024 10:05:01 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f68c7d3651sm1904783b3a.183.2024.05.17.10.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 10:04:59 -0700 (PDT)
Date: Sat, 18 May 2024 02:04:58 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v12 0/8] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
Message-ID: <20240517170458.GA1947919@rocinante>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org,
  Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

> This series is the continuation of previous work by Vidya Sagar [1] to fix the
> issues related to accessing DBI register space before completing the core
> initialization in some EP platforms like Tegra194/234 and Qcom EP.
> 
> Since Vidya is busy, I took over the series based on his consent (off-list
> discussion).
> 
> NOTE
> ====
> 
> Based on the comments received in v7 [2], I've heavily modified the series
> to fix several other issues reported by Bjorn and Niklas. One noticeable
> change is getting rid of the 'core_init_notifer' flag added to differentiate
> between glue drivers requiring refclk from host and drivers getting refclk
> locally.
> 
> By getting rid of this flag, now both the DWC EP driver and the EPF drivers
> can use a single flow and need not distinguish between the glue drivers.
> 
> We can also get rid of the 'link_up_notifier' flag in the future by following
> the same convention.
> 
> Testing
> =======
> 
> I've tested the series on Qcom SM8450 based dev board that depends on refclk
> from host with EPF_MHI driver. It'd be good to test this series on platforms
> that generate refclk locally and also with EPF_TEST driver.

Applied to controller/dwc, thank you!

[01/08] PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host
        https://git.kernel.org/pci/pci/c/869bc5253406
[02/08] PCI: dwc: ep: Add Kernel-doc comments for APIs
        https://git.kernel.org/pci/pci/c/7cbebc86c72a
[03/08] PCI: dwc: ep: Remove deinit() callback from struct dw_pcie_ep_ops
        https://git.kernel.org/pci/pci/c/b7dec6b85089
[04/08] PCI: dwc: ep: Rename dw_pcie_ep_exit() to dw_pcie_ep_deinit()
        https://git.kernel.org/pci/pci/c/c8682a3314c1
[05/08] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API for drivers supporting PERST#
        https://git.kernel.org/pci/pci/c/570d7715eed8
[06/08] PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
        https://git.kernel.org/pci/pci/c/7d6e64c443ea
[07/08] PCI: dwc: ep: Call dw_pcie_ep_init_registers() API directly from all glue drivers
        https://git.kernel.org/pci/pci/c/df69e17ccc2f
[08/08] PCI: endpoint: Remove "core_init_notifier" flag
        https://git.kernel.org/pci/pci/c/a01e7214bef9

	Krzysztof
