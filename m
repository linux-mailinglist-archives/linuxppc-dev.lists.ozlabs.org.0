Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C8270AF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 07:42:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btfjh0XnNzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 15:42:32 +1000 (AEST)
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
 header.s=default header.b=IqvlWxn9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Btfgh4M5bzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 15:40:45 +1000 (AEST)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 132242074B;
 Sat, 19 Sep 2020 05:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600494042;
 bh=4UDoglSsx5ePkj52lwygs8/ySTjMr9uDLxGKxasviws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IqvlWxn9E9n7ybWkey4E5EluYvuIOpNMeG8V3KlpTLmp4rymfIlGa4IUPhndVafl8
 xezXIGWw8sx8z16tVYSXNctmRExipyQUsIJKffX4cqutoGKteYU2CdBPs9DMfSO7Y+
 5zBs+JlxQ4r9OkJRflI7o5A+KK2YWUWzMoNPQmGg=
Date: Sat, 19 Sep 2020 07:40:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] tty: hvc: fix link error with
 CONFIG_SERIAL_CORE_CONSOLE=n
Message-ID: <20200919054038.GA432686@kroah.com>
References: <20200918092030.3855438-1-yangyingliang@huawei.com>
 <20200918111708.GC2242974@kroah.com>
 <6100a6e7-641f-7e9b-b4a3-3834320d1bb1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6100a6e7-641f-7e9b-b4a3-3834320d1bb1@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 10:48:41AM +0800, Yang Yingliang wrote:
> 
> On 2020/9/18 19:17, Greg KH wrote:
> > On Fri, Sep 18, 2020 at 05:20:30PM +0800, Yang Yingliang wrote:
> > > Fix the link error by selecting SERIAL_CORE_CONSOLE.
> > > 
> > > aarch64-linux-gnu-ld: drivers/tty/hvc/hvc_dcc.o: in function `dcc_early_write':
> > > hvc_dcc.c:(.text+0x164): undefined reference to `uart_console_write'
> > > 
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > >   drivers/tty/hvc/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> > > index d1b27b0522a3..8d60e0ff67b4 100644
> > > --- a/drivers/tty/hvc/Kconfig
> > > +++ b/drivers/tty/hvc/Kconfig
> > > @@ -81,6 +81,7 @@ config HVC_DCC
> > >   	bool "ARM JTAG DCC console"
> > >   	depends on ARM || ARM64
> > >   	select HVC_DRIVER
> > > +	select SERIAL_CORE_CONSOLE
> > >   	help
> > >   	  This console uses the JTAG DCC on ARM to create a console under the HVC
> > >   	  driver. This console is used through a JTAG only on ARM. If you don't have
> > > -- 
> > > 2.25.1
> > > 
> > Same question here, what caused this problem to happen?
> Fixes: d1a1af2cdf19 ("hvc: dcc: Add earlycon support")

Great, can you resend with that added please?

thanks,

greg k-h
