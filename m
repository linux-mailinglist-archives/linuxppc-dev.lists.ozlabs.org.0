Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BE2FD292
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 15:26:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLSWT6GVfzDr1f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 01:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qkReOQio; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLSSw47TkzDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 01:24:16 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C1FD2336E
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611152653;
 bh=0Xtz3tkNSwsoY9gbgqE2qTK7eRaJcR+iJ9o+tD1IB+c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qkReOQiov9zXiYg96avLVaWfdyxpxanbJ1uYevLhphyxJQkpBe8s27GEbJCpbLClv
 Pmp53G/9+dTzLyTCKYMrBzb8Oeb0ty1Fn8tuBSP3TAltZjQLhY7enM0IaALUq7ljAb
 OvFYsUMQWyyYb3CafYK1WdyJvB69e9p2x6zbI07cLivlmcqDQ2fUutAbQjXxKJFdpM
 BdRDy0IV1M/fByAQVJdkREme6VBxXklgB99icNJAtj/fVEvRxXLZIeJdNZJoTBS1N9
 ylED35lcHlOWjzm8XRXYvWs39gy8h15E+45MTK0vsKgE0SRUa2IS+L1nwwvAYSM7vY
 kyuWhg6uFbW6A==
Received: by mail-ed1-f51.google.com with SMTP id c6so18848831ede.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 06:24:13 -0800 (PST)
X-Gm-Message-State: AOAM531Tl52hwlza38WKmnM33IFJcYWD3zo3ZVLxt27xio7xw4fLDrLk
 Fw0soigAAiAnXFZ3eRhXB8/oDEDPHvApYzrErQ==
X-Google-Smtp-Source: ABdhPJxsjPL+nYG7BlFb3gzD3BUJUMJLtrEcPRLAGMIcR3Rwa6WblBDjUksihZpxjJd/Vr6d3NHetWaFA5kQ/EYByFs=
X-Received: by 2002:a50:fc04:: with SMTP id i4mr7590319edr.137.1611152651919; 
 Wed, 20 Jan 2021 06:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
In-Reply-To: <20210120105246.23218-1-michael@walle.cc>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Jan 2021 08:23:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
Message-ID: <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Saravana Kannan <saravanak@google.com>, PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc> wrote:
>
> fw_devlink will defer the probe until all suppliers are ready. We can't
> use builtin_platform_driver_probe() because it doesn't retry after probe
> deferral. Convert it to builtin_platform_driver().

If builtin_platform_driver_probe() doesn't work with fw_devlink, then
shouldn't it be fixed or removed? Then we're not fixing drivers later
when folks start caring about deferred probe and devlink.

I'd really prefer if we convert this to a module instead. (And all the
other PCI host drivers.)

> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")

This happened!?

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 44ad34cdc3bc..5b9c625df7b8 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -232,7 +232,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
>         { },
>  };
>
> -static int __init ls_pcie_probe(struct platform_device *pdev)
> +static int ls_pcie_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct dw_pcie *pci;
> @@ -271,10 +271,11 @@ static int __init ls_pcie_probe(struct platform_device *pdev)
>  }
>
>  static struct platform_driver ls_pcie_driver = {
> +       .probe = ls_pcie_probe,
>         .driver = {
>                 .name = "layerscape-pcie",
>                 .of_match_table = ls_pcie_of_match,
>                 .suppress_bind_attrs = true,
>         },
>  };
> -builtin_platform_driver_probe(ls_pcie_driver, ls_pcie_probe);
> +builtin_platform_driver(ls_pcie_driver);
> --
> 2.20.1
>
