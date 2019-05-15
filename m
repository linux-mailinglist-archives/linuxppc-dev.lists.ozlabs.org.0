Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E21E92E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 09:37:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453mbs2WpvzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 17:37:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.com
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=pmladek@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453mYz12YVzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 17:35:48 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E79AABE9;
 Wed, 15 May 2019 07:35:44 +0000 (UTC)
Date: Wed, 15 May 2019 09:35:42 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190515073542.y6ru2nfagtcrpdl7@pathway.suse.cz>
References: <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
 <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
 <096d6c9c17b3484484d9d9d3f3aa3a7c@AcuMS.aculab.com>
 <20190513091320.GK9224@smile.fi.intel.com>
 <20190513124220.wty2qbnz4wo52h3x@pathway.suse.cz>
 <20190514020730.GA651@jagdpanzerIV>
 <45348cf615fe40d383c1a25688d4a88f@AcuMS.aculab.com>
 <CAMuHMdXaMObq9h2Sb49PW1-HUysPeaWXB7wJmKFz=xLmSoUDZg@mail.gmail.com>
 <20190514143751.48e81e05@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514143751.48e81e05@oasis.local.home>
User-Agent: NeoMutt/20170912 (1.9.0)
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
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2019-05-14 14:37:51, Steven Rostedt wrote:
> 
> [ Purple is a nice shade on the bike shed. ;-) ]
> 
> On Tue, 14 May 2019 11:02:17 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > On Tue, May 14, 2019 at 10:29 AM David Laight <David.Laight@aculab.com> wrote:
> > > > And I like Steven's "(fault)" idea.
> > > > How about this:
> > > >
> > > >       if ptr < PAGE_SIZE              -> "(null)"
> > > >       if IS_ERR_VALUE(ptr)            -> "(fault)"
> > > >
> > > >       -ss  
> > >
> > > Or:
> > >         if (ptr < PAGE_SIZE)
> > >                 return ptr ? "(null+)" : "(null)";
> 
> Hmm, that is useful.
> 
> > >         if IS_ERR_VALUE(ptr)
> > >                 return "(errno)"  
> 
> I still prefer "(fault)" as is pretty much all I would expect from a
> pointer dereference, even if it is just bad parsing of, say, a parsing
> an MAC address. "fault" is generic enough. "errno" will be confusing,
> because that's normally a variable not a output.
> 
> > 
> > Do we care about the value? "(-E%u)"?
> 
> That too could be confusing. What would (-E22) be considered by a user
> doing an sprintf() on some string. I know that would confuse me, or I
> would think that it was what the %pX displayed, and wonder why it
> displayed it that way. Whereas "(fault)" is quite obvious for any %p
> use case.

This discussion clearly shows that it is hard to make anyone happy.

I considered switching to "(fault)" because there seems to be more
people in favor of this.

But there is used also "(einval)" when an unsupported pointer
modifier is passed. The idea is to show error codes that people
are familiar with.

It might have been better to use the uppercase "(EFAULT)" and
"(EINVAL)" to make it more obvious. But I wanted to follow
the existing style with the lowercase "(null)".

As of now, I think that we should keep it as is unless there is
some wider agreement on a change.

Best Regards,
Petr
