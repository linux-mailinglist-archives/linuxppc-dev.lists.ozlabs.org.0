Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C955A19FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 22:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDDS71VQ7z3bpr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 06:03:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FjiIGHFP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FjiIGHFP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDDRV09Bnz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 06:03:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25E6461224;
	Thu, 25 Aug 2022 20:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A40EC433C1;
	Thu, 25 Aug 2022 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661457792;
	bh=/9TkzmLfQn5M4n7XTfIrTb8KtnGk+NpgN8KOueh3Pmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FjiIGHFPr0K0C9NVpecYZNRM8Lm+WQ6OkQ91WYvlL20FKNczqlHVhUm0XpP5gEVTM
	 c18p7b0zC3xP6U+F70tKNpYPKx5gc1LDUjof7pvPhl8tON6AMoKURoOMnfYSg0rmEJ
	 xeEJcd0ZLK4bnxLo7EcOx8lLGM+9nvAS/1i315YakjsoppxiM7O7qkwD6euyY1bftZ
	 hvVy2OubI+nQnm9Ieao3D3T+wgCz4T/LM+EofXuw7VmqoivkBJw2bWnJf/HiepfYIq
	 0E++cDJUibw/NKWUI6av+8OTwBrVoeZWr0XUnPzmPS8hOIXwik0jBfwMtUh8WTNNxq
	 vX1Oy+Bs7gQgg==
Date: Thu, 25 Aug 2022 15:03:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
Message-ID: <20220825200310.GA2869783@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735drn4yi.fsf@mpe.ellerman.id.au>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 20, 2022 at 10:17:41AM +1000, Michael Ellerman wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> > On Sat, Aug 06, 2022 at 06:53:01PM +1000, Russell Currey wrote:
> >> I haven't touched EEH in a long time I don't have much knowledge of the
> >> subsystem at this point either, so it's misleading to have me as a
> >> maintainer.
> >> 
> >> I remain grateful to Oliver for picking up my slack over the years.
> >> 
> >> Signed-off-by: Russell Currey <ruscur@russell.cc>
> >> ---
> >>  MAINTAINERS | 1 -
> >>  1 file changed, 1 deletion(-)
> >> 
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index a9f77648c107..dfe6081fa0b3 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -15639,7 +15639,6 @@ F:	drivers/pci/endpoint/
> >>  F:	tools/pci/
> >>  
> >>  PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
> >> -M:	Russell Currey <ruscur@russell.cc>
> >>  M:	Oliver O'Halloran <oohall@gmail.com>
> >>  L:	linuxppc-dev@lists.ozlabs.org
> >>  S:	Supported
> >
> > I was thinking along these lines, but if you want to take this,
> > Michael, I'll drop it:
> 
> Hi Bjorn,
> 
> I was hoping one of the protagonists would send a patch :), but that
> looks perfect.

Waiting for that patch would have been the *smart* thing to do, but I
added your ack and put it on for-linus for v6.0.  Thanks!

> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> cheers
> 
> > commit 92ea781689d1 ("MAINTAINERS: Add Mahesh J Salgaonkar as EEH maintainer")
> > Author: Russell Currey <ruscur@russell.cc>
> > Date:   Sat Aug 6 18:53:01 2022 +1000
> >
> >     MAINTAINERS: Add Mahesh J Salgaonkar as EEH maintainer
> >     
> >     Update EEH entry:
> >     
> >       - Russell: lacks time to maintain EEH.
> >     
> >       - Oliver: lacks time & hardware to do actual maintenance, but happy to
> >         field questions and review things.
> >     
> >       - Mahesh: glad to take over EEH maintenance.
> >     
> >     [bhelgaas: commit log, add Mahesh, make Oliver reviewer]
> >     Link: https://lore.kernel.org/r/20220806085301.25142-1-ruscur@russell.cc
> >     Signed-off-by: Russell Currey <ruscur@russell.cc>
> >     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f60dfac7661c..51def5ac9462 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15696,8 +15696,8 @@ F:	drivers/pci/endpoint/
> >  F:	tools/pci/
> >  
> >  PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
> > -M:	Russell Currey <ruscur@russell.cc>
> > -M:	Oliver O'Halloran <oohall@gmail.com>
> > +M:	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> > +R:	Oliver O'Halloran <oohall@gmail.com>
> >  L:	linuxppc-dev@lists.ozlabs.org
> >  S:	Supported
> >  F:	Documentation/PCI/pci-error-recovery.rst
