Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3B2D4125
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 12:31:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrZdC6GZwzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 22:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ideasonboard.com (client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=rcqx1vmQ; 
 dkim-atps=neutral
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrZY80Kf0zDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 22:28:07 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D186CDD;
 Wed,  9 Dec 2020 12:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607513281;
 bh=iMZ/MdwMrQyEtzHeeza99WrLdvvODJuHJmMrkn9wFBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcqx1vmQkSxAxr1meC2h6m69JtY+gzxFVKAwzEcriT5hcq5ap+jOr0+6K48Qq3QKK
 CoTDTWaUQAlgrEAgVKkdTPakKidrBD6WUzE6DJjzU+Aj9PY4AsLgC/lV3tegsHQowb
 E4vFthJgZdBIHcivhQg/w3raZpO4NwN+tVbbooHI=
Date: Wed, 9 Dec 2020 13:27:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: usb: gadget: prefer pr_*() functions over raw
 printk()
Message-ID: <X9C0vOLZOnLZoPR8@pendragon.ideasonboard.com>
References: <20201208144403.22097-1-info@metux.net>
 <X8+howyVRiTR9gv/@pendragon.ideasonboard.com>
 <9aaa06ad-0bd8-486d-b16b-66927d57cf96@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9aaa06ad-0bd8-486d-b16b-66927d57cf96@metux.net>
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Enrico,

On Wed, Dec 09, 2020 at 12:11:36PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 08.12.20 16:54, Laurent Pinchart wrote:
> >> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> index 2b893bceea45..4834fafb3f70 100644
> >> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> @@ -1573,7 +1573,7 @@ static void usba_control_irq(struct usba_udc *udc, struct usba_ep *ep)
> >>  		 * generate or receive a reply right away. */
> >>  		usba_ep_writel(ep, CLR_STA, USBA_RX_SETUP);
> >>  
> >> -		/* printk(KERN_DEBUG "setup: %d: %02x.%02x\n",
> >> +		/* pr_debug("setup: %d: %02x.%02x\n",
> >>  			ep->state, crq.crq.bRequestType,
> >>  			crq.crq.bRequest); */
> > 
> > I wonder if this shouldn't be dropped instead, commented-out code isn't
> > very useful.
> 
> Indeed. Shall I send a separate patch for that ?

Yes, that would make sense.

> > When a pointer to a struct device is available, dev_err() would be much
> > better. That's however out of scope for this patch, but it would be nice
> > to address it. This would become
> > 
> > 		dev_err(&pdev->dev, "Check IRQ setup!\n");
> > 
> 
> You're right. I didn't check for that yet. I'll do it in a separate
> patch.

As most of the files touched by this patch are device drivers, dev_*()
functions should be used instead of pr_*() where possible. I'd recommend
a first patch that converts to dev_*(), and then a second patch that
converts the remaining printk()s, if any, to pr_*() in the contexts
where no struct device is available or can easily be made available.

-- 
Regards,

Laurent Pinchart
