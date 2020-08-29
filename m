Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10D256677
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 11:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bdrkh3VgRzDqhK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 19:29:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bdrfl46wLzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 19:25:35 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 217DA68C4E; Sat, 29 Aug 2020 11:25:32 +0200 (CEST)
Date: Sat, 29 Aug 2020 11:25:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 08/10] x86: remove address space overrides using set_fs()
Message-ID: <20200829092531.GC8833@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-9-hch@lst.de>
 <CAHk-=wjxeN+KrCB2TyC5s2RWhz-dWWO8vbBwWcCiKb0+8ipayw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjxeN+KrCB2TyC5s2RWhz-dWWO8vbBwWcCiKb0+8ipayw@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 11:15:12AM -0700, Linus Torvalds wrote:
> >  SYM_FUNC_START(__put_user_2)
> > -       ENTER
> > -       mov TASK_addr_limit(%_ASM_BX),%_ASM_BX
> > +       LOAD_TASK_SIZE_MAX
> >         sub $1,%_ASM_BX
> 
> It's even more obvious here. We load a constant and then immediately
> do a "sub $1" on that value.
> 
> It's not a huge deal, you don't have to respin the series for this, I
> just wanted to point it out so that people are aware of it and if I
> forget somebody else will hopefully remember that "we should fix that
> too".

The changes seem easy enough and I need to respin at least for the
lkdtm changes, and probaby also for a pending fix in the low-level
x86 code that will hopefully be picked up for 5.9.

But the more important questions is: how do we want to pick the series
up?  Especially due to the splice changes I really want it to be in
linux-next as long as possible.
