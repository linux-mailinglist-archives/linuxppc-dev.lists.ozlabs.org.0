Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FDB421EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 12:04:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P2Wx6ZyPzDr5L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 20:03:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="woHo6S2W"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P2VK1m3pzDqyv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 20:02:31 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE84E2080A;
 Wed, 12 Jun 2019 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560333748;
 bh=qMzrZuMLFzb5RylQt20JsN+YRh2AKQBbX2zBlJYqfOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=woHo6S2WGn34Ag9i4h0X5sZ9ze8QOzOaysI6xNQE56wk4p5i7nOs1a/xQ2+EkBU6R
 CxbhtUphZ/B/mSrm7iyOlHwAnwHFJYEdN/8RLKvskztK27BBKQgv+BooHN1JI1vUHh
 zDHualeBvgMzJYUIrl7T+jSEBOghofsPdSS+CBeU=
Date: Wed, 12 Jun 2019 12:02:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] cxl: no need to check return value of debugfs_create
 functions
Message-ID: <20190612100226.GA18368@kroah.com>
References: <20190611181309.GA17098@kroah.com>
 <CAK8P3a1otKxoJUNH=-tZfzFy9qzQQc61i8AZPh-L7e-Ybd8kpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1otKxoJUNH=-tZfzFy9qzQQc61i8AZPh-L7e-Ybd8kpg@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 11:51:21AM +0200, Arnd Bergmann wrote:
> On Tue, Jun 11, 2019 at 8:13 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> 
> > @@ -64,8 +64,6 @@ int cxl_debugfs_adapter_add(struct cxl *adapter)
> >
> >         snprintf(buf, 32, "card%i", adapter->adapter_num);
> >         dir = debugfs_create_dir(buf, cxl_debugfs);
> > -       if (IS_ERR(dir))
> > -               return PTR_ERR(dir);
> >         adapter->debugfs = dir;
> >
> 
> Should the check for 'cxl_debugfs' get removed here as well?

Maybe, I could not determine the logic if those functions could be
called before cxl_debugfs was ever set.

And debugfs_create_dir() will not return a NULL value if an error
happens, so no need to worry about files being created in the wrong
place.

> If that is null, we might put the subdir in the wrong place in the
> tree, but that would otherwise be harmless as well, and the
> same thing happens if 'dir' is NULL above and we add the
> files in the debugfs root later (losing the ability to clean up
> afterwards).
> 
> int cxl_debugfs_adapter_add(struct cxl *adapter)
> {
>         struct dentry *dir;
>         char buf[32];
> 
>         if (!cxl_debugfs)
>                 return -ENODEV;
> 
> It's still a bit odd to return an error, since the caller then just
> ignores the return code anway:

Then let's just return nothing.

>         /* Don't care if this one fails: */
>         cxl_debugfs_adapter_add(adapter);
> 
> It would seem best to change the return type to 'void' here for
> consistency.

I agree, let me go do that.

thanks,

greg k-h
