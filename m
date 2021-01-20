Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A72FD487
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 16:52:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLVQF4cZNzDr0m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 02:52:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=RVDEo4Ks; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLVNH1scBzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 02:50:22 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3458A23340;
 Wed, 20 Jan 2021 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611157819;
 bh=fBMJEpbeW4fb/1FlOYEHbgt7kuNpM9yvsa0KQlOyNHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVDEo4KsJGh9Tb7AghreIaMDU7L2aWJ3JG12Owy6S7VImj/ocpgKYdJi60PF5PL62
 7sqM05TbpFlQmxpSRTG6zyXqcgypIF0Vyru2eqoZWpaobq5HkF71Tglq8cfKC2+eiz
 y5jqwpHIo4RnlZox0OB2ct7qBFD4P+r9pxfNoVNA=
Date: Wed, 20 Jan 2021 16:50:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
Message-ID: <YAhROU8A8ZHduptZ@kroah.com>
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
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
 Minghuan Lian <minghuan.Lian@nxp.com>, Michael Walle <michael@walle.cc>,
 Mingkai Hu <mingkai.hu@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 08:23:59AM -0600, Rob Herring wrote:
> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc> wrote:
> >
> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > deferral. Convert it to builtin_platform_driver().
> 
> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> shouldn't it be fixed or removed? Then we're not fixing drivers later
> when folks start caring about deferred probe and devlink.
> 
> I'd really prefer if we convert this to a module instead. (And all the
> other PCI host drivers.)
> 
> > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> 
> This happened!?

It's in linux-next in my tree, but is looking like it might be reverted
soon.  But finding these issues is good.

thanks,

greg k-h
