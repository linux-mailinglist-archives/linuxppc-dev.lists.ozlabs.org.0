Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E584F0955
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 14:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KWY8K2RQnz2yY7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 22:27:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=n+N8X/el;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=n+N8X/el; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KWY7f5MP2z2xBf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Apr 2022 22:27:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C69F61138;
 Sun,  3 Apr 2022 12:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5D3C340ED;
 Sun,  3 Apr 2022 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648988825;
 bh=zgNS5JeSbvVeyXlQEZUIkye/6ihd4vVdw1KPp14kaTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+N8X/elFnsdYCqzpfMNBDMYvA5W1lReaL39kP7Wp5RJXJ3FyskXLre8avFb4JFj/
 U6HN5f1ABQTY6yTniQ+8+pdyVjJOWMZK5VBQmmWq88jQVx/4oZIh8dKfCYi5Vo3QIe
 SupHOqxiqpE3OMChHVS4FlSF4exL826aoe7p13JQ=
Date: Sun, 3 Apr 2022 14:26:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [Rebased for 5.4] powerpc/kasan: Fix early region not
 updated correctly
Message-ID: <YkmSeqRUjqbH9dcX@kroah.com>
References: <fc39c36ea92e03ed5eb218ddbe83b34361034d9d.1648915982.git.christophe.leroy@csgroup.eu>
 <Ykl2C6DmSKWxlOWE@kroah.com>
 <fd2c0d7a-e194-1ce4-4a5f-2d66ae0d350a@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd2c0d7a-e194-1ce4-4a5f-2d66ae0d350a@csgroup.eu>
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
Cc: Chen Jingwen <chenjingwen6@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 03, 2022 at 11:54:55AM +0000, Christophe Leroy wrote:
> 
> 
> Le 03/04/2022 à 12:25, Greg KH a écrit :
> > On Sat, Apr 02, 2022 at 06:13:31PM +0200, Christophe Leroy wrote:
> >> From: Chen Jingwen <chenjingwen6@huawei.com>
> >>
> >> This is backport for 5.4
> >>
> >> Upstream commit 5647a94a26e352beed61788b46e035d9d12664cd
> > 
> > This is not a commit in Linus's tree :(
> > 
> 
> Oops. Don't know what I did, that's indeed the commit after I 
> cherry-picked it on top of 5.4.188 and before I modified it.
> 
> According to the mail you sent me yesterday to tell it FAILED to apply 
> on 5.4, the upstream commit is dd75080aa8409ce10d50fb58981c6b59bf8707d3

Can you resend with this fixed up please?

thanks,

greg k-h
