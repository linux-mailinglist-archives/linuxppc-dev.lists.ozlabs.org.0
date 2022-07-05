Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9BA567711
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 21:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcsVL6gYXz3c8X
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 05:02:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5; helo=netrider.rowland.org; envelope-from=stern+62cbd50a@netrider.rowland.org; receiver=<UNKNOWN>)
X-Greylist: delayed 398 seconds by postgrey-1.36 at boromir; Wed, 06 Jul 2022 05:01:38 AEST
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lists.ozlabs.org (Postfix) with SMTP id 4LcsTv02Bnz3brl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 05:01:38 +1000 (AEST)
Received: (qmail 371446 invoked by uid 1000); 5 Jul 2022 14:54:55 -0400
Date: Tue, 5 Jul 2022 14:54:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in
 host mode.
Message-ID: <YsSI/7uGfRWHps9A@rowland.harvard.edu>
References: <20220702220355.63b36fb8@Cyrus.lan>
 <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux USB List <linux-usb@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Christian Zigotzky <chzigotzky@xenosoft.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 05, 2022 at 10:29:53AM -0600, Rob Herring wrote:
> On Sat, Jul 2, 2022 at 3:04 PM Darren Stevens <darren@stevens-zone.net> wrote:
> >
> > In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> > core) we stopped platform_get_resource() from returning the IRQ, as all
> > drivers were supposed to have switched to platform_get_irq()
> > Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> > it.
> >
> > Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Darren Stevens <darren@stevens-zone.net>
> > ---
> >  v3 - Corrected resource allocation in fsl-mph-dr-of.c
> >
> >  v2 - Fixed coding style, removed a couple of unneeded initializations,
> >       cc'd Layerscape maintainers.
> >
> > Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring
> > (in fsl-mph-dr-of.c)
> 
> Thanks for fixing.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Okay for me too.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

