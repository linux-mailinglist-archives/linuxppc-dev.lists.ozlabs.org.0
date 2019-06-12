Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDEF42B57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 17:56:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PBLW2CBTzDr6Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 01:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="E0A2cXDQ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PBJ73PlmzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 01:54:15 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A24BD21019;
 Wed, 12 Jun 2019 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560354852;
 bh=menpCBZD9aZUCarfRE2kMrzLz6afnT/Z2OnvYhmJ+z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0A2cXDQeSax9afjc6Lw0sqX2o7/Mf6QccsptbwGMawXgvewp3+hxCCehlFOZcg/E
 /0N/4r6jgzENlAVOSJJCaaWxupvr53eVNpeUGu5syCvAdERUgIJe4l39ipF45RfkfU
 1Xl7I+Q6IvXbwtOe0q1/yTaarandYmBHltVgocjA=
Date: Wed, 12 Jun 2019 17:54:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] cxl: no need to check return value of debugfs_create
 functions
Message-ID: <20190612155409.GA26564@kroah.com>
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
> If that is null, we might put the subdir in the wrong place in the
> tree, but that would otherwise be harmless as well, and the
> same thing happens if 'dir' is NULL above and we add the
> files in the debugfs root later (losing the ability to clean up
> afterwards).

dir can only be NULL if no one has initialized it, debugfs_create_dir()
will never return a null value.  I don't really know the ordering of the
calls here, so I'll keep this as-is for now incase someone is trying to
add a "device" before a directory is initialized.

thanks,

greg k-h
