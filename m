Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94482192E6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 17:41:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nYmS0gBfzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 03:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=hi2+=5k=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=APOdz2w7; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nYjk2LqdzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:39:21 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6311D2073E;
 Wed, 25 Mar 2020 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585154359;
 bh=A1GPX4wlECfGGG7gTSHHrGt3spoxTdKZ1xy9utwV/BA=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=APOdz2w7EH+7D58vqGoNgP8mOHfbNma8Ty1WIG8jpBICPSinl9OycWqb0OdtxkciV
 gxpkAVRwhIe+WxIGCYwXBH73yF99ZY9v+QEk7Sp75Ev8c6B1ujrOAxGnV4ZUKw4afx
 Pt8nI6CO51v4M2JmrHTqBAusgH99DwWPqLUsLFTU=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 325E9352094D; Wed, 25 Mar 2020 09:39:19 -0700 (PDT)
Date: Wed, 25 Mar 2020 09:39:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sebastian Siewior <bigeasy@linutronix.de>
Subject: Re: Documentation/locking/locktypes: Further clarifications and
 wordsmithing
Message-ID: <20200325163919.GU19865@paulmck-ThinkPad-P72>
References: <20200323025501.GE3199@paulmck-ThinkPad-P72>
 <87r1xhz6qp.fsf@nanos.tec.linutronix.de>
 <20200325002811.GO19865@paulmck-ThinkPad-P72>
 <87wo78y5yy.fsf@nanos.tec.linutronix.de>
 <20200325160212.oavrni7gmzudnczv@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200325160212.oavrni7gmzudnczv@linutronix.de>
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
Cc: linux-usb@vger.kernel.org, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Vincent Chen <deanbo422@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Davidlohr Bueso <dave@stgolabs.net>,
 linux-acpi@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 platform-driver-x86@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 kbuild test robot <lkp@intel.com>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dbueso@suse.de>,
 netdev@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 25, 2020 at 05:02:12PM +0100, Sebastian Siewior wrote:
> On 2020-03-25 13:27:49 [+0100], Thomas Gleixner wrote:
> > The documentation of rw_semaphores is wrong as it claims that the non-owner
> > reader release is not supported by RT. That's just history biased memory
> > distortion.
> > 
> > Split the 'Owner semantics' section up and add separate sections for
> > semaphore and rw_semaphore to reflect reality.
> > 
> > Aside of that the following updates are done:
> > 
> >  - Add pseudo code to document the spinlock state preserving mechanism on
> >    PREEMPT_RT
> > 
> >  - Wordsmith the bitspinlock and lock nesting sections
> > 
> > Co-developed-by: Paul McKenney <paulmck@kernel.org>
> > Signed-off-by: Paul McKenney <paulmck@kernel.org>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> > --- a/Documentation/locking/locktypes.rst
> > +++ b/Documentation/locking/locktypes.rst
> …
> > +rw_semaphore
> > +============
> > +
> > +rw_semaphore is a multiple readers and single writer lock mechanism.
> > +
> > +On non-PREEMPT_RT kernels the implementation is fair, thus preventing
> > +writer starvation.
> > +
> > +rw_semaphore complies by default with the strict owner semantics, but there
> > +exist special-purpose interfaces that allow non-owner release for readers.
> > +These work independent of the kernel configuration.
> 
> This reads funny, could be my English. "This works independent …" maybe?

The "These" refers to "interfaces", which is plural, so "These" rather
than "This".  But yes, it is a bit awkward, because you have to skip
back past "readers", "release", and "non-owner" to find the implied
subject of that last sentence.

So how about this instead, making the implied subject explicit?

rw_semaphore complies by default with the strict owner semantics, but there
exist special-purpose interfaces that allow non-owner release for readers.
These interfaces work independent of the kernel configuration.

							Thanx, Paul
