Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019818598
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 08:54:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4503x604xrzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="i6fGs8He"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4503vs3j1hzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 16:53:29 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F549208C3;
 Thu,  9 May 2019 06:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557384806;
 bh=dAe8QjULl4HoxlEX4m0F4d63srd+dKX/P1oy0OpJfXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i6fGs8HeR2NRB6YkpW+mCdAC1oIMsAcYr7LowmXSP08SIUy5z0ECTSng+shdLBCbq
 QizX0K2LIcu4MWdtYli8NRSlsozwm0TOPla55s6VmZb6t2ZTiMbzau/DiyD7U931nQ
 Yc0jN1Hdi/V+gkK3PrJgzkAKZ4v5VskziFbP3fzs=
Date: Thu, 9 May 2019 08:53:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Build failure in v4.4.y.queue (ppc:allmodconfig)
Message-ID: <20190509065324.GA3864@kroah.com>
References: <20190508202642.GA28212@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508202642.GA28212@roeck-us.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 08, 2019 at 01:26:42PM -0700, Guenter Roeck wrote:
> I see multiple instances of:
> 
> arch/powerpc/kernel/exceptions-64s.S:839: Error:
> 	attempt to move .org backwards
> 
> in v4.4.y.queue (v4.4.179-143-gc4db218e9451).
> 
> This is due to commit 9b2d4e06d7f1 ("powerpc/64s: Add support for a store
> forwarding barrier at kernel entry/exit"), which is part of a large patch
> series and can not easily be reverted.
> 
> Guess I'll stop doing ppc:allmodconfig builds in v4.4.y ?

Michael, I thought this patch series was supposed to fix ppc issues, not
add to them :)

Any ideas on what to do here?

thanks,

greg k-h
