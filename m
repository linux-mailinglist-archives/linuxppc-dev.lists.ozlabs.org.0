Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4F1A1BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 18:42:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450wx750jmzDqWC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 02:42:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=xlfc=tk=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450wvM15RwzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 02:41:03 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EC6221479;
 Fri, 10 May 2019 16:40:59 +0000 (UTC)
Date: Fri, 10 May 2019 12:40:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190510124058.0d44b441@gandalf.local.home>
In-Reply-To: <20190510183258.1f6c4153@mschwideX1>
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
 <20190510183258.1f6c4153@mschwideX1>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Petr Mladek <pmladek@suse.com>, linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 May 2019 18:32:58 +0200
Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:

> On Fri, 10 May 2019 12:24:01 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Fri, 10 May 2019 10:42:13 +0200
> > Petr Mladek <pmladek@suse.com> wrote:
> >   
> > >  static const char *check_pointer_msg(const void *ptr)
> > >  {
> > > -	char byte;
> > > -
> > >  	if (!ptr)
> > >  		return "(null)";
> > >  
> > > -	if (probe_kernel_address(ptr, byte))
> > > +	if ((unsigned long)ptr < PAGE_SIZE || IS_ERR_VALUE(ptr))
> > >  		return "(efault)";
> > >      
> > 
> > 
> > 	< PAGE_SIZE ?
> > 
> > do you mean: < TASK_SIZE ?  
> 
> The check with < TASK_SIZE would break on s390. The 'ptr' is
> in the kernel address space, *not* in the user address space.
> Remember s390 has two separate address spaces for kernel/user
> the check < TASK_SIZE only makes sense with a __user pointer.
> 

So we allow this to read user addresses? Can't that cause a fault?

If the condition is true, we return "(efault)".

-- Steve
