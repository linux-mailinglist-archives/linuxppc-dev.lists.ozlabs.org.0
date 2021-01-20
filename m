Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F22FDB39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:56:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLd8v0rfYzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 07:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GXWFrxlW; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLZfT3M4yzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 06:02:49 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id z1so20470553ybr.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4jPdyf7csnEaOrlNIT9kHyquVjGEOb/saDEg+4JUVFI=;
 b=GXWFrxlW7h7Ccmu201AlJ0i3zH1OBGX+7ae3c3xwAWHnytEgwmULkgdT9ivGOV4N3F
 L5Njok/YfcvBy02xWpQNLVptMjt3KQvO8okfsEtEXTMkSMs15F0nYXZmNn9wcec51ji4
 66V/7pr1yu8QvpomFS2ibuYwdDG8sa7Dml2etoWNFBwL8OebfYisV/7V9tFeLjxSfviC
 6I2CXzmWij7eF1JAfdSM6wfZm4/igyKLHyQTmiNBc6X3x7T6A1TolCWg9TKgTZFkIS3/
 2Z6V4pdzyuA4lZ83mPPwb+hNfSssNo0ub+6pk41DMJOuPUc4wUZ8q/9Pv3WnNyEvG6Ef
 2esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4jPdyf7csnEaOrlNIT9kHyquVjGEOb/saDEg+4JUVFI=;
 b=pcf0tDtZQr14a+R4qObaWbdDRn2kqoyt1ALlUhdYN58mflSXobedYjzigxrTGZYJLt
 uj2lAD06Yuby/BuJvYuV3otKCNo1Ern7DNb3PVk7b3BmOTWpFf5QrUJtIXzW0m67AIjI
 Gvt4kSm+WqozKEcru8QeXr0ZeWNWDSQHffQZNIaXW6MeIDUhb5faafw3a9/T4VEYB+ZD
 /uRmVOkUcmKk0vhUWjyXdZD1XGr1pD7VMT259NnLcQxW5RRA9nzYFADr0o+YSeGJP25f
 xrzor+3p1PGhXA7NNY9TvXumlJPAbX7PJ3D6mc+PbP4YIlNt0Bhydtg/ROMuh2UGgslN
 Ti/g==
X-Gm-Message-State: AOAM530n3XabuFIGiWzhKLE7yXG7md4M7R+higuWIUCIZNOUrn5Lzmdt
 5bnF6uMyxmGYDl44PmsVHlhG8Qh3siLeaLVJLxP6Cw==
X-Google-Smtp-Source: ABdhPJzcly2us+ps4x0SHFbK9AkNe9Kxkb2EVg9MufyFhzozTWNWq2AL/VmZLGwjG1JqDdlEE2kPiCmt4PWNKJ7P4/Y=
X-Received: by 2002:a25:c343:: with SMTP id t64mr15290558ybf.228.1611169365754; 
 Wed, 20 Jan 2021 11:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
In-Reply-To: <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 20 Jan 2021 11:02:09 -0800
Message-ID: <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Jan 2021 07:49:58 +1100
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
 PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Michael Walle <michael@walle.cc>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc> wrote:
> >
> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > deferral. Convert it to builtin_platform_driver().
>
> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> shouldn't it be fixed or removed?

I was actually thinking about this too. The problem with fixing
builtin_platform_driver_probe() to behave like
builtin_platform_driver() is that these probe functions could be
marked with __init. But there are also only 20 instances of
builtin_platform_driver_probe() in the kernel:
$ git grep ^builtin_platform_driver_probe | wc -l
20

So it might be easier to just fix them to not use
builtin_platform_driver_probe().

Michael,

Any chance you'd be willing to help me by converting all these to
builtin_platform_driver() and delete builtin_platform_driver_probe()?

-Saravana

> Then we're not fixing drivers later
> when folks start caring about deferred probe and devlink.
>
> I'd really prefer if we convert this to a module instead. (And all the
> other PCI host drivers.)
>
> > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
>
> This happened!?
>
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> >  drivers/pci/controller/dwc/pci-layerscape.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 44ad34cdc3bc..5b9c625df7b8 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -232,7 +232,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
> >         { },
> >  };
> >
> > -static int __init ls_pcie_probe(struct platform_device *pdev)
> > +static int ls_pcie_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> >         struct dw_pcie *pci;
> > @@ -271,10 +271,11 @@ static int __init ls_pcie_probe(struct platform_device *pdev)
> >  }
> >
> >  static struct platform_driver ls_pcie_driver = {
> > +       .probe = ls_pcie_probe,
> >         .driver = {
> >                 .name = "layerscape-pcie",
> >                 .of_match_table = ls_pcie_of_match,
> >                 .suppress_bind_attrs = true,
> >         },
> >  };
> > -builtin_platform_driver_probe(ls_pcie_driver, ls_pcie_probe);
> > +builtin_platform_driver(ls_pcie_driver);
> > --
> > 2.20.1
> >
