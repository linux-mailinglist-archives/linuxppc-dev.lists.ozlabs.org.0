Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2118E34F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 18:25:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l6wQ0gP5zDrnP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 04:25:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ayf6=5g=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=0uZasLyY; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l6t45DPLzDrnP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 04:23:08 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AE9120767;
 Sat, 21 Mar 2020 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584811386;
 bh=xECwvu3Zm1NEgzqD5GrnBGLFCYYFmNZsamemFqiM8NY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=0uZasLyYOOcy2Jn3NQfpB2UAWhjp74rz1TUNHg9BhAjwPgKnZR60zmujqnihmxQ4W
 7foxJjnQ0xMcW011TdKCXLYocZvyg8MDtNv8kWqj8WW3VxI5OcNV2Y2TQfkKR5STHK
 tsXIa2UPcdd8dIM4hV5/+BQQoln4Cxe0PVsX+CFA=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 8D6D435226C1; Sat, 21 Mar 2020 10:23:05 -0700 (PDT)
Date: Sat, 21 Mar 2020 10:23:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 08/15] Documentation: Add lock ordering and nesting
 documentation
Message-ID: <20200321172305.GW3199@paulmck-ThinkPad-P72>
References: <20200320160145.GN3199@paulmck-ThinkPad-P72>
 <87mu8apzxr.fsf@nanos.tec.linutronix.de>
 <20200320210243.GT3199@paulmck-ThinkPad-P72>
 <874kuipsbw.fsf@nanos.tec.linutronix.de>
 <20200321022930.GU3199@paulmck-ThinkPad-P72>
 <875zeyrold.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zeyrold.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Logan Gunthorpe <logang@deltatee.com>,
 Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 21, 2020 at 11:26:06AM +0100, Thomas Gleixner wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> > On Fri, Mar 20, 2020 at 11:36:03PM +0100, Thomas Gleixner wrote:
> >> I agree that what I tried to express is hard to parse, but it's at least
> >> halfways correct :)
> >
> > Apologies!  That is what I get for not looking it up in the source.  :-/
> >
> > OK, so I am stupid enough not only to get it wrong, but also to try again:
> >
> >    ... Other types of wakeups would normally unconditionally set the
> >    task state to RUNNING, but that does not work here because the task
> >    must remain blocked until the lock becomes available.  Therefore,
> >    when a non-lock wakeup attempts to awaken a task blocked waiting
> >    for a spinlock, it instead sets the saved state to RUNNING.  Then,
> >    when the lock acquisition completes, the lock wakeup sets the task
> >    state to the saved state, in this case setting it to RUNNING.
> >
> > Is that better?
> 
> Definitely!
> 
> Thanks for all the editorial work!

NP, and glad you like it!

But I felt even more stupid sometime in the middle of the night.  Why on
earth didn't I work in your nice examples?  :-/

I will pull them in later.  Time to go hike!!!

							Thanx, Paul
