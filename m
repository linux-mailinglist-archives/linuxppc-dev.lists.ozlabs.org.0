Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D7A254299
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 11:39:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcd3z0mXVzDqn1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 19:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcd1v5t7nzDqg1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 19:37:54 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8281168B02; Thu, 27 Aug 2020 11:37:48 +0200 (CEST)
Date: Thu, 27 Aug 2020 11:37:48 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 09/11] x86: remove address space overrides using set_fs()
Message-ID: <20200827093748.GA13887@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-10-hch@lst.de>
 <935d551809894d14965e430e05d21057@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935d551809894d14965e430e05d21057@AcuMS.aculab.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 'Christoph Hellwig' <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 08:23:11AM +0000, David Laight wrote:
> From: Christoph Hellwig
> > Sent: 17 August 2020 08:32
> >
> > Stop providing the possibility to override the address space using
> > set_fs() now that there is no need for that any more.  To properly
> > handle the TASK_SIZE_MAX checking for 4 vs 5-level page tables on
> > x86 a new alternative is introduced, which just like the one in
> > entry_64.S has to use the hardcoded virtual address bits to escape
> > the fact that TASK_SIZE_MAX isn't actually a constant when 5-level
> > page tables are enabled.
> ....
> > @@ -93,7 +69,7 @@ static inline bool pagefault_disabled(void);
> >  #define access_ok(addr, size)					\
> >  ({									\
> >  	WARN_ON_IN_IRQ();						\
> > -	likely(!__range_not_ok(addr, size, user_addr_max()));		\
> > +	likely(!__range_not_ok(addr, size, TASK_SIZE_MAX));		\
> >  })
> 
> Can't that always compare against a constant even when 5-levl
> page tables are enabled on x86-64?
> 
> On x86-64 it can (probably) reduce to (addr | (addr + size)) < 0.

I'll leave that to the x86 maintainers as a future cleanup if wanted.
