Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB731EC9BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 08:52:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cKNT4BdhzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:52:41 +1000 (AEST)
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
 header.s=default header.b=Zt5wWn8k; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cKKw6pjRzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 16:50:28 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18B5D2068D;
 Wed,  3 Jun 2020 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591167026;
 bh=3l7TMZy0dkIcAxTaqluxLc6yZSpowQHh7l0jSHXXhjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zt5wWn8k8xqW8a7aqFKlDhp0W7XsKc9rm9ancnmCAsW3pxTs0oBfoxOCAuU2ZybWw
 pPBePWbiFZCbUWuiJdegf+TO3xZM8xrkDo9tUbPOqAKIqdP6etuiAGAWlICj01cX1s
 FH64hh6B64ddM7UHr2aCuNB2psSg8bGA9oFzsa5s=
Date: Wed, 3 Jun 2020 08:50:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "wanghai (M)" <wanghai38@huawei.com>
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
Message-ID: <20200603065024.GA587198@kroah.com>
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
 <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
 <20200603061443.GB531505@kroah.com>
 <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Elfring <Markus.Elfring@web.de>, Ian Munsie <imunsie@au1.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 02:34:07PM +0800, wanghai (M) wrote:
> 
> 在 2020/6/3 14:14, Greg Kroah-Hartman 写道:
> > On Wed, Jun 03, 2020 at 09:42:41AM +0800, wanghai (M) wrote:
> > > 在 2020/6/3 1:20, Markus Elfring 写道:
> > > > > Fix it by adding a call to kobject_put() in the error path of
> > > > > kobject_init_and_add().
> > > > Thanks for another completion of the exception handling.
> > > > 
> > > > Would an other patch subject be a bit nicer?
> > > Thanks for the guidance, I will perfect this description and send a v2
> > Please note that you are responding to someone that a lot of kernel
> > developers and maintainers have blacklisted as being very annoying and
> > not helpful at all.
> > 
> > Please do not feel that you need to respond to, or change any patch in
> > response to their emails at all.
> > 
> > I strongly recommend you just add them to your filters to not have to
> > see their messages.  That's what I have done.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> > .
> 
> Okay, so I don’t have to send the v2 patch.

No, all should be fine, I'll review the patch when after 5.8-rc1 is out,
and if I find any problems with it, will let you know then.

thanks,

greg k-h
