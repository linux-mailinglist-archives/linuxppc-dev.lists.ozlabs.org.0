Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1129422B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 20:33:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG2M04D3GzDqft
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 05:33:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JYdQL3Wq; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG2KN3sxCzDqgn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 05:32:08 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA27B21534;
 Tue, 20 Oct 2020 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603218725;
 bh=rYkBj1ZJWTczz5/r0ofs7bNB91o9zGiASSEmBN2me+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYdQL3WqM7p6HeQ0EeMAIo5Q2YOfnLuT4iVy5ZEoFobMfwLlGD4IAPVmgw+BUTYAb
 EqhiJi5sA+fXVSNRzB+d6NDWeOqxt4Y137jjticPgIoqKRJ55sa6oAYaWiKzjhDLiV
 tkHoaxu4fBh4Yu4mpzIN7rlSt59KQPCq8o4o/hCw=
Date: Tue, 20 Oct 2020 20:32:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] serial: pmac_zilog: don't init if zilog is not available
Message-ID: <20201020183246.GA912431@kroah.com>
References: <20201020162303.1730562-1-laurent@vivier.eu>
 <20201020162844.GA865546@kroah.com>
 <468bbbef-4745-3b16-b6f4-30b46ebcdc33@vivier.eu>
 <20201020173745.GA882703@kroah.com>
 <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu>
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
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 20, 2020 at 08:19:26PM +0200, Laurent Vivier wrote:
> Le 20/10/2020 à 19:37, Greg KH a écrit :
> > On Tue, Oct 20, 2020 at 06:37:41PM +0200, Laurent Vivier wrote:
> >> Le 20/10/2020 à 18:28, Greg KH a écrit :
> >>> On Tue, Oct 20, 2020 at 06:23:03PM +0200, Laurent Vivier wrote:
> >>>> We can avoid to probe for the Zilog device (and generate ugly kernel warning)
> >>>> if kernel is built for Mac but not on a Mac.
> >>>>
> >>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> >>>> ---
> >>>>  drivers/tty/serial/pmac_zilog.c | 11 +++++++++++
> >>>>  1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
> >>>> index 063484b22523..d1d2e55983c3 100644
> >>>> --- a/drivers/tty/serial/pmac_zilog.c
> >>>> +++ b/drivers/tty/serial/pmac_zilog.c
> >>>> @@ -1867,6 +1867,12 @@ static struct platform_driver pmz_driver = {
> >>>>  static int __init init_pmz(void)
> >>>>  {
> >>>>  	int rc, i;
> >>>> +
> >>>> +#ifdef CONFIG_MAC
> >>>> +	if (!MACH_IS_MAC)
> >>>> +		return -ENODEV;
> >>>> +#endif
> >>>
> >>> Why is the #ifdef needed?
> >>>
> >>> We don't like putting #ifdef in .c files for good reasons.  Can you make
> >>> the api check for this work with and without that #ifdef needed?
> >>
> >> The #ifdef is needed because this file can be compiled for PowerMac and
> >> m68k Mac. For PowerMac, the MACH_IS_MAC is not defined, so we need the
> >> #ifdef.
> >>
> >> We need the MAC_IS_MAC because the same kernel can be used with several
> >> m68k machines, so the init_pmz can be called on a m68k machine without
> >> the zilog device (it's a multi-targets kernel).
> >>
> >> You can check it's the good way to do by looking inside:
> >>
> >>     drivers/video/fbdev/valkyriefb.c +317
> >>     drivers/macintosh/adb.c +316
> >>
> >> That are two files used by both, mac and pmac.
> > 
> > Why not fix it to work properly like other arch checks are done
> I would be happy to do the same.
> 
> > Put it in a .h file and do the #ifdef there.  Why is this "special"?
> 
> I don't know.
> 
> Do you mean something like:
> 
> drivers/tty/serial/pmac_zilog.h
> ...
> #ifndef MACH_IS_MAC
> #define MACH_IS_MAC (0)
> #endif
> ...
> 
> drivers/tty/serial/pmac_zilog.c
> ...
> static int __init pmz_console_init(void)
> {
>         if (!MACH_IS_MAC)
>                 return -ENODEV;
> ...

Yup, that would be a good start, but why is the pmac_zilog.h file
responsible for this?  Shouldn't this be in some arch-specific file
somewhere?

thanks,

greg k-h
