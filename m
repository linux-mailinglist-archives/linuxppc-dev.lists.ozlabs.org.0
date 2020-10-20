Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69464294574
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 01:30:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG8x93fzNzDqft
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 10:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=allandria.com
 (client-ip=50.242.82.17; helo=cynthia.allandria.com;
 envelope-from=flar@allandria.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=allandria.com
X-Greylist: delayed 2612 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Oct 2020 10:28:36 AEDT
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG8vS5fnMzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 10:28:36 +1100 (AEDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
 (envelope-from <flar@allandria.com>)
 id 1kV0N4-00040j-JM; Tue, 20 Oct 2020 15:44:46 -0700
Date: Tue, 20 Oct 2020 15:44:46 -0700
From: Brad Boyer <brad@allandria.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] serial: pmac_zilog: don't init if zilog is not available
Message-ID: <20201020224446.GA15066@allandria.com>
References: <20201020162303.1730562-1-laurent@vivier.eu>
 <20201020162844.GA865546@kroah.com>
 <468bbbef-4745-3b16-b6f4-30b46ebcdc33@vivier.eu>
 <20201020173745.GA882703@kroah.com>
 <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu>
 <20201020183246.GA912431@kroah.com>
 <b52e7fde-8874-3c53-ca13-7709656b69fb@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b52e7fde-8874-3c53-ca13-7709656b69fb@vivier.eu>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-serial@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 20, 2020 at 08:42:53PM +0200, Laurent Vivier wrote:
> Le 20/10/2020 ?? 20:32, Greg KH a ??crit??:
> > On Tue, Oct 20, 2020 at 08:19:26PM +0200, Laurent Vivier wrote:
> >> Le 20/10/2020 ?? 19:37, Greg KH a ??crit??:
> >>> Why not fix it to work properly like other arch checks are done
> >> I would be happy to do the same.
> >>
> >>> Put it in a .h file and do the #ifdef there.  Why is this "special"?
> >>
> >> I don't know.
> >>
> > 
> > Yup, that would be a good start, but why is the pmac_zilog.h file
> > responsible for this?  Shouldn't this be in some arch-specific file
> > somewhere?
> 
> For m68k, MACH_IS_MAC is defined in arch/m68k/include/asm/setup.h
> 
> If I want to define it for any other archs I don't know in which file we
> can put it.
> 
> But as m68k mac is only sharing drivers with pmac perhaps we can put
> this in arch/powerpc/include/asm/setup.h?

Wouldn't it be better to rearrange this code to only run if the devices
are present? This is a macio driver on pmac and a platform driver on mac,
so shouldn't it be possible to only run this code when the appropriate
entries are present in the right data structures?

I didn't look at a lot of the other serial drivers, but some other mac
drivers have recently been updated to no longer have MACH_IS_MAC checks
due to being converted to platform drivers.

	Brad Boyer
	brad@allandria.com

