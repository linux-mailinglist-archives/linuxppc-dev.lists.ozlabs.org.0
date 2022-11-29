Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1D63BB8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 09:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLwTf14yFz3bVs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 19:28:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dddu6IBa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dddu6IBa;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLwSg60Zcz305Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 19:27:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 59DDBB811C2;
	Tue, 29 Nov 2022 08:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EF8C433C1;
	Tue, 29 Nov 2022 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669710461;
	bh=Kjks0TSI6O1yYxWH+iF7PLjdCelG6aVkRssHbUmCh5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dddu6IBaI0n7pVLOTm/6w9IpgWtwVpvnAmpJKjBb6PBn/8pDjsYrllu/GL9KuwRO7
	 nymXJlsuKHWfivVwmstZeSHe0S0JG6ex/baORYnYnpdDZcUh5VMrmLQZRHLTSqfGVH
	 PKpdIiyGIgEsoVZRllUIehzVtd0ChvbWzGLtBtzk=
Date: Tue, 29 Nov 2022 09:27:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] driver core: fix up some missing class.devnode()
 conversions.
Message-ID: <Y4XCelSURHMMK61T@kroah.com>
References: <20221128173539.3112234-1-gregkh@linuxfoundation.org>
 <9da4f875-7fb3-803f-379e-0352eb824d8f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9da4f875-7fb3-803f-379e-0352eb824d8f@csgroup.eu>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 29, 2022 at 06:33:04AM +0000, Christophe Leroy wrote:
> 
> 
> Le 28/11/2022 à 18:35, Greg Kroah-Hartman a écrit :
> > In commit ff62b8e6588f ("driver core: make struct class.devnode() take a
> > const *") the ->devnode callback changed the pointer to be const, but a
> > few instances of PowerPC drivers were not caught for some reason.
> > 
> > Fix this up by changing the pointers to be const.
> 
> Build fails:
> 
> /linux/arch/powerpc/platforms/book3s/vas-api.c: In function 
> 'vas_register_coproc_api':
> /linux/arch/powerpc/platforms/book3s/vas-api.c:590:31: error: assignment 
> from incompatible pointer type [-Werror=incompatible-pointer-types]
>    coproc_device.class->devnode = coproc_devnode;
>                                 ^
> cc1: all warnings being treated as errors

What did you build this against?  It has to be be against my
driver-core-next tree as that is where the Fixes: commit is.

thanks,

greg k-h
