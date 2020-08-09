Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252F24006A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 01:17:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPw3J5463zDqPK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BPw1k5RWhzDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 09:15:38 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 9F8A729B87;
 Sun,  9 Aug 2020 19:15:28 -0400 (EDT)
Date: Mon, 10 Aug 2020 09:15:18 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/9] macintosh/via-macii: Access autopoll_devs when inside
 lock
In-Reply-To: <20200809190138.GA133890@roeck-us.net>
Message-ID: <alpine.LNX.2.23.453.2008100859330.8@nippy.intranet>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
 <5952dd8a9bc9de90f1acc4790c51dd42b4c98065.1593318192.git.fthain@telegraphics.com.au>
 <20200809190138.GA133890@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 9 Aug 2020, Guenter Roeck wrote:

> Hi,
> 
> On Sun, Jun 28, 2020 at 02:23:12PM +1000, Finn Thain wrote:
> > The interrupt handler should be excluded when accessing the 
> > autopoll_devs variable.
> > 
> 
> I am quite baffled by this patch. Other than adding an unnecessary lock 
> / unlock sequence,

The new lock/unlock sequence means that the expression (autopoll_devs && 
!current_req) can be understood to be atomic. That makes it easier for me 
to follow (being that both variables are shared state).

> accessing a variable (which is derived from another variable) from 
> inside or outside a lock does not make a difference. If autopoll_devs = 
> devs & 0xfffe is 0 inside the lock, it will just as much be 0 outside 
> the lock, and vice versa.
> 
> Can you explain this in some more detail ? Not that is matters much 
> since the change already made it into mainline, but I would like to 
> understand what if anything I am missing here.
> 

I think the new code is more readable and is obviously free of race 
conditions. It's not obvious to me why the old code was free of race 
conditions but if you can easily establish that by inspection then you are 
a better auditor than I am. Regardless, I'll stick with "Keep It Simple, 
Stupid".
