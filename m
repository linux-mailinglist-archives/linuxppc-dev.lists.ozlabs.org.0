Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978C294581
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 01:45:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG9HQ0PTmzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 10:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CG9Dv16pjzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 10:43:39 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 3A69323B22;
 Tue, 20 Oct 2020 19:43:34 -0400 (EDT)
Date: Wed, 21 Oct 2020 10:43:37 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Brad Boyer <brad@allandria.com>
Subject: Re: [PATCH] serial: pmac_zilog: don't init if zilog is not available
In-Reply-To: <20201020224446.GA15066@allandria.com>
Message-ID: <alpine.LNX.2.23.453.2010211038390.6@nippy.intranet>
References: <20201020162303.1730562-1-laurent@vivier.eu>
 <20201020162844.GA865546@kroah.com>
 <468bbbef-4745-3b16-b6f4-30b46ebcdc33@vivier.eu>
 <20201020173745.GA882703@kroah.com>
 <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu>
 <20201020183246.GA912431@kroah.com>
 <b52e7fde-8874-3c53-ca13-7709656b69fb@vivier.eu>
 <20201020224446.GA15066@allandria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Greg KH <gregkh@linuxfoundation.org>, Laurent Vivier <laurent@vivier.eu>,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Oct 2020, Brad Boyer wrote:

> 
> Wouldn't it be better to rearrange this code to only run if the devices 
> are present? This is a macio driver on pmac and a platform driver on 
> mac, so shouldn't it be possible to only run this code when the 
> appropriate entries are present in the right data structures?
> 
> I didn't look at a lot of the other serial drivers, but some other mac 
> drivers have recently been updated to no longer have MACH_IS_MAC checks 
> due to being converted to platform drivers.
> 

Actually, it's not simply a platform driver or macio driver. I think the 
console is supposed to be registered before the normal bus matching takes 
place. Hence this comment in pmac_zilog.c,

        /* 
         * First, we need to do a direct OF-based probe pass. We
         * do that because we want serial console up before the
         * macio stuffs calls us back, and since that makes it
         * easier to pass the proper number of channels to
         * uart_register_driver()
         */

Laurent, can we avoid the irq == 0 warning splat like this?

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 96e7aa479961..7db600cd8cc7 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1701,8 +1701,10 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	int irq;
 
 	r_ports = platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
+	if (!r_ports)
+		return -ENODEV;
 	irq = platform_get_irq(uap->pdev, 0);
-	if (!r_ports || irq <= 0)
+	if (irq <= 0)
 		return -ENODEV;
 
 	uap->port.mapbase  = r_ports->start;
