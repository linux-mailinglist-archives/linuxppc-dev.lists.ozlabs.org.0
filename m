Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C91AB82C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:38:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492qKx4MJmzDrQT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cbdwHKeK; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492q9D1jRczDrNL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 16:30:39 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8161720732;
 Thu, 16 Apr 2020 06:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587018637;
 bh=kqRpyAaduUyON5qHMIXra4FBqaXyvxk32qkeqxVv1Uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbdwHKeK/IH1ewqwP4nqBiVouDPSTrUtcYzQe8iu4qOM6FtNEF1uU7BJBh28xKst8
 JA9NzFpRmUkMLHYDWKL6nPvpU4pyoFLYCEMNp7kKCqfF46Yk83CjubE8Tr8+rEvkat
 +xXVKkM3kxC5j5dhsVXoKUuQz7HxISVwn4yuRtr8=
Date: Thu, 16 Apr 2020 08:30:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v2,5/5] drivers: uio: new driver for fsl_85xx_cache_sram
Message-ID: <20200416063034.GB299193@kroah.com>
References: <20200415124929.GA3265842@kroah.com>
 <20200415152442.122873-1-wenhu.wang@vivo.com>
 <20200415152442.122873-6-wenhu.wang@vivo.com>
 <37b6b890-e537-7424-6b26-04565681f40a@c-s.fr>
 <f2a1f91f92c0fe4bce46c28222dea355d96e2090.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2a1f91f92c0fe4bce46c28222dea355d96e2090.camel@buserror.net>
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
Cc: linux-kernel@vger.kernel.org, kernel@vivo.com,
 Wang Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 02:27:51PM -0500, Scott Wood wrote:
> > > +		dev_err(&pdev->dev, "error no valid uio-map configured\n");
> > > +		ret = -EINVAL;
> > > +		goto err_info_free_internel;
> > > +	}
> > > +
> > > +	info->version = "0.1.0";
> > 
> > Could you define some DRIVER_VERSION in the top of the file next to 
> > DRIVER_NAME instead of hard coding in the middle on a function ?
> 
> That's what v1 had, and Greg KH said to remove it.  I'm guessing that he
> thought it was the common-but-pointless practice of having the driver print a
> version number that never gets updated, rather than something the UIO API
> (unfortunately, compared to a feature query interface) expects.  That said,
> I'm not sure what the value is of making it a macro since it should only be
> used once, that use is self documenting, it isn't tunable, etc.  Though if
> this isn't a macro, UIO_NAME also shouldn't be (and if it is made a macro
> again, it should be UIO_VERSION, not DRIVER_VERSION).
> 
> Does this really need a three-part version scheme?  What's wrong with a
> version of "1", to be changed to "2" in the hopefully-unlikely event that the
> userspace API changes?  Assuming UIO is used for this at all, which doesn't
> seem like a great fit to me.

No driver version numbers at all please, they do not make any sense when
the driver is included in the kernel tree.

greg k-h
