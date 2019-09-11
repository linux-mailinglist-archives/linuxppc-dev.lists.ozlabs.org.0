Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB5B01B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:35:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6wB4LbRzF3lm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:35:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.116.78; helo=8.mo5.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4658 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Sep 2019 01:58:39 AEST
Received: from 8.mo5.mail-out.ovh.net (8.mo5.mail-out.ovh.net [178.32.116.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T65C5K8XzF3ZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 01:58:38 +1000 (AEST)
Received: from player688.ha.ovh.net (unknown [10.108.57.183])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 13F2F24DD18
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 16:40:52 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 4ED3C99ECC49;
 Wed, 11 Sep 2019 14:40:44 +0000 (UTC)
Date: Wed, 11 Sep 2019 16:40:43 +0200
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xive: Fix bogus error code returned by OPAL
Message-ID: <20190911164043.5548afa1@bahia.lan>
In-Reply-To: <87k1aezz78.fsf@mpe.ellerman.id.au>
References: <156812362556.1866243.7399893138425681517.stgit@bahia.tls.ibm.com>
 <87k1aezz78.fsf@mpe.ellerman.id.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 537054258809641393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Sep 2019 00:26:19 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Hi Greg,
> 

Bom dia ! :)

> Couple of comments ...
> 
> Greg Kurz <groug@kaod.org> writes:
> > There's a bug in skiboot that causes the OPAL_XIVE_ALLOCATE_IRQ call
> > to return the 32-bit value 0xffffffff when OPAL has run out of IRQs.
> > Unfortunatelty, OPAL return values are signed 64-bit entities and
> > errors are supposed to be negative. If that happens, the linux code
> > confusingly treats 0xffffffff as a valid IRQ number and panics at some
> > point.
> >
> > A fix was recently merged in skiboot:
> >
> > e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")
> >
> > but we need a workaround anyway to support older skiboots already
> > on the field.
>   ^
>   in
>  
> >
> > Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
> > returned upon resource exhaustion.
> 
> This should go to stable, any idea what versions it should go back to?
> Probably whenever the xive code was introduced?
> 

Yes I guess so. This would mean v4.12. I'll add the appropriate stable
tag before re-posting, and address all the other remarks of course.

> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  arch/powerpc/sysdev/xive/native.c |   13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
> > index 37987c815913..c35583f84f9f 100644
> > --- a/arch/powerpc/sysdev/xive/native.c
> > +++ b/arch/powerpc/sysdev/xive/native.c
> > @@ -231,6 +231,15 @@ static bool xive_native_match(struct device_node *node)
> >  	return of_device_is_compatible(node, "ibm,opal-xive-vc");
> >  }
> >  
> > +static int64_t opal_xive_allocate_irq_fixup(uint32_t chip_id)
>           ^                                    ^
>           Can you use s64 here and u32 here ....
> 
> Instead of calling this opal_xive_allocate_irq_fixup() and relying on
> all callers to call the fixup, can we rename the opal wrapper and leave
> this function's name unchanged, eg:
> 
> -OPAL_CALL(opal_xive_allocate_irq,              OPAL_XIVE_ALLOCATE_IRQ);
> +OPAL_CALL(opal_xive_allocate_irq_raw,          OPAL_XIVE_ALLOCATE_IRQ);
> 
> 
> > +{
> > +	s64 irq = opal_xive_allocate_irq(chip_id);
> > +
> > +#define XIVE_ALLOC_NO_SPACE	0xffffffff /* No possible space */
> > +	return
> > +		irq == XIVE_ALLOC_NO_SPACE ? OPAL_RESOURCE : irq;
> > +}
> 
> I don't really like the #define and the weird indenting and so on, can
> we instead do it like:
> 
> 	/*
>          * Old versions of skiboot can incorrectly return 0xffffffff to
>          * indicate no space, fix it up here.
>          */
> 	return irq == 0xffffffff ? OPAL_RESOURCE : irq;
> 
> cheers
