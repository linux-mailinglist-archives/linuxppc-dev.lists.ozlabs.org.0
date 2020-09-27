Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D127A47E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 01:33:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0265179KzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 09:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LBfnpwp3; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C024X5lwCzDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 09:32:26 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id j2so9190484ioj.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 16:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aZ6YU8QkqvXetA4BeWJq48mo0OJ9Oxz0crizVyRgPnQ=;
 b=LBfnpwp3MtO84n7rLN09lDdxgaQPgijIySJX9jjqBw9KF+omtpeDch6oBcawxzUGzs
 yX85kVxYB9ppBIhv3Pe7vxEvtWnD6wV5PvMNS8ofM0Y5ExRkegvqyKBqHk+KJLmRTaNZ
 gvyvTQILWZPfvMBiSZW6FCRgne+/XX1lJ3EL3Fi9U8G8TkLw2Sz/55XyABK9Z+rmz+ig
 LHnRDwU3nq0vU1/XHDiYuL/CvA98PKq6A7/h/Pp5qXeO3MRG1WLYmIHXIljDEacAA67a
 vLz6rw4USRScKtxncxlaNdz3GL5xZOMOHLCVceypITeAf2XTcXYvDWVkx/oIfj51Lwe8
 v8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aZ6YU8QkqvXetA4BeWJq48mo0OJ9Oxz0crizVyRgPnQ=;
 b=b2Y5ZC5UZK4QHusENhVcK7Xpx8vguwfTBuYTxa13m52KOU9AN88irHMPFmz6zqKfVh
 Czi/KK7/I+oEDGXQ45CpoZOwWgzdT/rJzVxS07wf3LGhGsHw8otBC2uE3hqyVFGaJatO
 spIC4MJyXkyyr2+GK3D/9LsiNg0rBXbJ9zZODsI+2GbYh9yEIsbdJmnUwdm6611nHrAM
 8F+uDa7PRsZd6+hA0wQKSSfA6Y4dQ60Xi/OD5Utat90vf2+p1a+htqJONU5uxs6gqzVW
 KgbV5z9mk9pNixM+2rD89mMqp58n/HSO8xI9nOdrWPKqiEQvf/An3OQXWFOwxXjBlaD5
 cixw==
X-Gm-Message-State: AOAM5306rY5mcZVeR//T+klkiR6mOk3ZjslAE+Ywl0dU5wgiyNg0HnVZ
 sPdaUv4GuFJaTTWFbK9KfP7v1JuyhX+exkK1Hv8=
X-Google-Smtp-Source: ABdhPJzc5IwJZV09KI9PTIqU3GAYgTusaIZZSB0Qp6/tVIkfZR6sanJs/6HxmjpQN3io4gLQcfBmDzgSFMghUZUlYxE=
X-Received: by 2002:a02:6623:: with SMTP id k35mr6811796jac.105.1601249541984; 
 Sun, 27 Sep 2020 16:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSf1CEv3v940FR_we70qCBME0qFXPizPT8EFbf3XyK2-fPDrw@mail.gmail.com>
 <20200925194335.GA2453596@bjorn-Precision-5520>
In-Reply-To: <20200925194335.GA2453596@bjorn-Precision-5520>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 28 Sep 2020 09:32:10 +1000
Message-ID: <CAOSf1CGwj=m+P_XFAOG-KUz8mYCe1axLtk9JPmG5harHE7oArQ@mail.gmail.com>
Subject: Re: [PATCH] rpadlpar_io:Add MODULE_DESCRIPTION entries to kernel
 modules
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 26, 2020 at 5:43 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Sep 24, 2020 at 04:41:39PM +1000, Oliver O'Halloran wrote:
> > On Thu, Sep 24, 2020 at 3:15 PM Mamatha Inamdar
> > <mamatha4@linux.vnet.ibm.com> wrote:
> > >
> > > This patch adds a brief MODULE_DESCRIPTION to rpadlpar_io kernel modules
> > > (descriptions taken from Kconfig file)
> > >
> > > Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> > > ---
> > >  drivers/pci/hotplug/rpadlpar_core.c |    1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
> > > index f979b70..bac65ed 100644
> > > --- a/drivers/pci/hotplug/rpadlpar_core.c
> > > +++ b/drivers/pci/hotplug/rpadlpar_core.c
> > > @@ -478,3 +478,4 @@ static void __exit rpadlpar_io_exit(void)
> > >  module_init(rpadlpar_io_init);
> > >  module_exit(rpadlpar_io_exit);
> > >  MODULE_LICENSE("GPL");
> > > +MODULE_DESCRIPTION("RPA Dynamic Logical Partitioning driver for I/O slots");
> >
> > RPA as a spec was superseded by PAPR in the early 2000s. Can we rename
> > this already?
> >
> > The only potential problem I can see is scripts doing: modprobe
> > rpadlpar_io or similar
> >
> > However, we should be able to fix that with a module alias.
>
> Is MODULE_DESCRIPTION() connected with how modprobe works?

I don't think so. The description is just there as an FYI.

> If this patch just improves documentation, without breaking users of
> modprobe, I'm fine with it, even if it would be nice to rename to PAPR
> or something in the future.

Right, the change in this patch is just a documentation fix and
shouldn't cause any problems.

I was suggesting renaming the module itself since the term "RPA" is
only used in this hotplug driver and some of the corresponding PHB add
/ remove handling in arch/powerpc/platforms/pseries/. We can make that
change in a follow up though.

> But, please use "git log --oneline drivers/pci/hotplug/rpadlpar*" and
> match the style, and also look through the rest of drivers/pci/ to see
> if we should do the same thing to any other modules.
>
> Bjorn
