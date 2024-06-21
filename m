Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63726912DFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 21:38:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5SMw0s4Sz3d39
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 05:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.170; helo=mail-il1-f170.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5SLj3PBMz3cWD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 05:37:48 +1000 (AEST)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-375e0e258b7so9409865ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 12:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718998666; x=1719603466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXQhvL9a6CYV2VK3wKh6O5gxH2nHkFbrE11g//vArPo=;
        b=HZHgW7n/UnDMojBItjWqSHZpzGv7mADiiJ6oUoa7JA5NGJy0nfVpV0/M69NYb3Byql
         zXKPlUGaY5SlSms16Z2kbJgk9k3rCEh2+aTP51UpzrRwQWBXdjbeSiT/blp6h6E83/vx
         sNTEpsVoXBXiH5PiPC3U/FQIit+Ppk0rn98SZj/iIEk+J9Sl/IoWp3rUbPN1c6mwelLM
         sMa9VH9kvVOaiutBF4Oaw7hr2xRIeHHKLdPj71fD2PTHwVSJuRKKEP03G7q1nP5hmq9D
         Oi5Op+UJQVd0TSezboB9H7bB5DKTbKffOd3rkn+iUYRLxOXyqh2gP76ew54340zzli1U
         PiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSMkc3HLHrtKeEBNrvFyx3DKNibEgHUEoyC0XiTPDoN+HJLLjON4VqPNfn0ucKOjrt5RtUbVEq3Rgf5Z+Abt4/Px5axY7GjLSspFB0fA==
X-Gm-Message-State: AOJu0YwW0LG3jaJTShKIN8oOdL/b2dxcBiq1zZwutJJ9OzYevSNMwu9N
	rDWbBOYoznhDY2wQ3zZEnOb/0v9Tib//6tRCO3LHlQHD3Bj6M/RG
X-Google-Smtp-Source: AGHT+IGlUL9QwPxUHX7nV3tXeYRMDnq/je2PsJ3NCGAtSFvVXOze8EobQXpZtTE4zHujIy0ctpA41A==
X-Received: by 2002:a05:6e02:1c85:b0:375:a185:f00f with SMTP id e9e14a558f8ab-3761d709758mr109157335ab.22.1718998666403;
        Fri, 21 Jun 2024 12:37:46 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b3ee8c95sm1492640a12.31.2024.06.21.12.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 12:37:45 -0700 (PDT)
Date: Sat, 22 Jun 2024 04:37:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Message-ID: <20240621193744.GA3008482@rocinante>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240610065324.GA7660@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610065324.GA7660@thinkpad>
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
Cc: imx@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

> Applied patch 2/5 to pci/endpoint! Krzysztof, please apply patches 1/5 and 5/5
> to controller/dwc (patches 3/5 and 4/5 are already applied by you).

Applied to controller/dwc, thank you!

[01/02] PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
        https://git.kernel.org/pci/pci/c/9eba2f70362f

[02/02] PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
        https://git.kernel.org/pci/pci/c/14638af66309

	Krzysztof
