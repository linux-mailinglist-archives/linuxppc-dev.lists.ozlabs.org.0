Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0F44DDD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 23:22:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqx6n65cKz3c6Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 09:22:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fpvZ8M2K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20210112.gappssmtp.com
 header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=fpvZ8M2K; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hqx633GHXz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 09:22:01 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id p17so6364359pgj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 14:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0BKlKVSWYn1I0Z87pY4nl686M+hJNylVprtBUShQPP8=;
 b=fpvZ8M2Kcj7XZIaeWf50Li9FO87nKUAQZnJoqpm3sU45tValVLIT4Rxw9xs9PruFV6
 o/5JOonKlKHWq6zqE30kt8IDDEf1Hx2iNyO0lVLWiBDLmlE8VrXe1Mch15Bj3PZmzlLA
 ONnVfGcBJ46rWBDrQ5SVSjWlRrwSx9/2o5xSqfEGypWDaTiayD4ctGXWYEB5QehIzekd
 PB1+PcF7FaFc+5qaEvO9YxFs/F3EUJqjqtH7j58xnoeG5phNNCvUDYsGbMkOyRF9BJUJ
 8EtR3O95+FZjv8hfdWHLmnJB+mwLzxmJQBpqHUXpiqfEjD9B57ACruicPMuIUkh7mRb/
 w5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0BKlKVSWYn1I0Z87pY4nl686M+hJNylVprtBUShQPP8=;
 b=nlF5pJDexSWiUzEa6bdC3BSuP9FaFaYJbxJ1P16KIlHcHFLaQXVjbdMBr8cvWifnou
 lF4FQD2ntWDSXi3DvM0IJ2m5BqxQAHvtJupCh3tVslYqFYtFuWnr2wqGIA9b37Tjp3la
 yf87UDtJssKN3UDTSE/UwwOYafMciV7UTnku3YMRB7+lnJgg8ntSBRefeHV5L5oiHEAE
 bYhS/EOp0zTZAK/TsmkC9dF5ttTeNccLViKr86lxYj7nYE6dmUpRSfdXLGD1VuAqpAZC
 f1YDGugxZgMJt7v6jyPpVOOMQpNX++Un22QX/C4DMKHiA8ToEizaC72NLMYPfYnHTkqD
 pYAg==
X-Gm-Message-State: AOAM532cL3npaOuLLcInGBFOOin8fysQB58mARcYuGT1UoB9tfM/CryR
 Ee95G3vXd7ieA9rXARuX8wsHbYVojloDJ/hDq3H+lg==
X-Google-Smtp-Source: ABdhPJx7XXxBnZsNRpwtzXuzTfOJXFSovmVOHEAknpHPnTjHlWJwEv+RbIQvGnjckVbmUTZIzwnmLX+3KSNqGekIISY=
X-Received: by 2002:a63:81c8:: with SMTP id t191mr6900205pgd.192.1636669318174; 
 Thu, 11 Nov 2021 14:21:58 -0800 (PST)
MIME-Version: 1.0
References: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <20211110184106.GA1251058@bhelgaas> <87sfw3969l.wl-maz@kernel.org>
 <8cc64c3b-b0c0-fb41-9836-2e5e6a4459d1@xenosoft.de>
 <87r1bn88rt.wl-maz@kernel.org>
 <f40294c6-a088-af53-eeea-4dfbd255c5c9@xenosoft.de>
 <87pmr7803l.wl-maz@kernel.org>
In-Reply-To: <87pmr7803l.wl-maz@kernel.org>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 11 Nov 2021 14:21:46 -0800
Message-ID: <CAOesGMgHfsFKWOXNOMghO3Xqj2y8M5XA8GjVV5ciOT0A4b+wdg@mail.gmail.com>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
To: Marc Zyngier <maz@kernel.org>
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
Cc: Jens Axboe <axboe@kernel.dk>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Arnd Bergmann <arnd@arndb.de>, kw@linux.com,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 damien.lemoal@opensource.wdc.com, Darren Stevens <darren@stevens-zone.net>,
 Bjorn Helgaas <helgaas@kernel.org>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 robert@swiecki.net, Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 11, 2021 at 2:20 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 11 Nov 2021 07:47:08 +0000,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> >
> > On 11 November 2021 at 08:13 am, Marc Zyngier wrote:
> > > On Thu, 11 Nov 2021 05:24:52 +0000,
> > > Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> > >> Hello Marc,
> > >>
> > >> Here you are:
> > >> https://forum.hyperion-entertainment.com/viewtopic.php?p=54406#p54406
> > > This is not what I asked. I need the actual source file, or at the
> > > very least the compiled object (the /sys/firmware/fdt file, for
> > > example). Not an interpretation that I can't feed to the kernel.
> > >
> > > Without this, I can't debug your problem.
> > >
> > >> We are very happy to have the patch for reverting the bad commit
> > >> because we want to test the new PASEMI i2c driver with support for the
> > >> Apple M1 [1] on our Nemo boards.
> > > You can revert the patch on your own. At this stage, we're not blindly
> > > reverting things in the tree, but instead trying to understand what
> > > is happening on your particular system.
> > >
> > > Thanks,
> > >
> > >     M.
> > >
> > I added a download link for the fdt file to the post [1]. Please read
> > also Darren's comments in this post.
>
> Thanks for that. The DT looks absolutely bonkers, no wonder that
> things break with something like that.
>
> But Darren's comments made me jump a bit, and I quote them here for
> everyone to see:
>
> <quote>
> [...]
>
> The dtb passed by the CFE firmware has a number of issues, which up till
> now have been fixed by use of patches applied to the mainline kernel.
> This occasionally causes problems with changes made to mainline.
>
> [...]
> </quote>
>
> Am I right in understanding that the upstream kernel does not support
> the machine out of the box, and that you actually have to apply out of
> tree patches to make it work? That these patches have to do with the
> IRQ routing?

To my knowledge that has never been needed -- that the base platform
support is all there.

This is an old platform, and just like with the power macs, the
devicetree is indeed supplied from firmware, and as such not easily
patchable like with ARM platforms.

Last time this was an issue (to my memory) was when they enabled
automatic little endian switching in the boot path, that caused some
issues with a (bad) phandle pointer that had gone undiscovered for 10+
years.

> If so, I wonder why upstream should revert a patch to work on a system
> that isn't supported upstream the first place. I will still try and
> come up with a solution for you. But asking for the revert of a patch
> on these grounds is not, IMHO, acceptable. Also, please provide these
> patches on the list so that I can help you to some extend (and I mean
> *on the list*, not on a random forum that collects my information).

Early fixups of DT is the way to go here, if needed -- we do it on
some other platforms. That can happen in-kernel, and keep the new
functionality. For that we'd need to figure out what's actually wrong
with the DT as such right now.



-Olof
