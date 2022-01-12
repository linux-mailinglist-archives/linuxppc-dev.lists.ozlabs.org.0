Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3648C7E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 17:10:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYswB3TKLz3bZg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 03:10:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYsvn5pmKz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 03:09:41 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3EE0868AFE; Wed, 12 Jan 2022 17:09:36 +0100 (CET)
Date: Wed, 12 Jan 2022 17:09:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64
 in fcntl.h
Message-ID: <20220112160935.GA3684@lst.de>
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-5-hch@lst.de>
 <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
 <20220112075609.GA4854@lst.de>
 <CAK8P3a1ONn=FiPU3669MjBMntS-1K5bgX4pHforUsYJ7yhwZ-g@mail.gmail.com>
 <f86483fca8b0dc68ce243ba47998ff3296a3b6f8.camel@kernel.org>
 <CAK8P3a3FgHQ+w+Sj00yOERRLWfVhx7NYsGJ1NBAXQ0=is3G=Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3FgHQ+w+Sj00yOERRLWfVhx7NYsGJ1NBAXQ0=is3G=Kg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 12, 2022 at 01:08:24PM +0100, Arnd Bergmann wrote:
> > I don't have a strong opinion here. If we were taking symbols away that
> > were previously visible to userland it would be one thing, but since
> > we're just adding symbols that may not have been there before, this
> > seems less likely to break anything.
> 
> Changing
> 
> #ifndef CONFIG_64BIT
> 
> to
> 
> #if __BITS_PER_LONG==32 || defined(__KERNEL__),
> 
> would take symbols away, since the CONFIG_64BIT macro is never
> set in user space.

Yes.

> > I probably lean toward Christoph's original solution instead of keeping
> > the conditional definitions. It's hard to imagine there are many
> > programs that care whether these other symbols are defined or not.
> >
> > You can add this to the original patch:
> >
> > Acked-by: Jeff Layton <jlayton@kernel.org>
> 
> Sounds good, thanks

So should we go ahead with the series as-is?  Or respin it?  Or add
the above change ontop?
