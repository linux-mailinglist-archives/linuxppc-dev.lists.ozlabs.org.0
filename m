Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46941F200F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 21:46:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477dqJ4j4qzF5sg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 07:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="dLqPPOZn"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477dZ82Bh0zF5S6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 07:34:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJrcQXptkMvPiExxcW5iB0NzeMYZeKfH93+EIxkwDzY=; b=dLqPPOZnjveWBeyFqFHqrbtNZ
 Duw5YArJPTaMMMK8SsjUxFjkIDQhNUSGD5PvNQVqSS+e/GWXU1Um5AVf/5sUPjLz45CKuM0IRDAMs
 VJOI3PF4FsdFW2Mj099DRLCzazEzb+zrotnV0I1WVxXeWHoGdNsYMsg3hXOH54aFacQzs/oy4AisX
 0iQV33+aUEMHy+n5TIl+aUKiWMNj3wlvtrjuO4fCRVPkUgi8SKL+BQOZYBkn7NslBLpVF53Y5s7wl
 nyOBB1ExO8CnC6/BiF+fSyjnLlUc7UEIcgZ13IIdTf4f2/4oA2gULPIuZ+oV94CGzcp/+zHem6q8U
 4ISIm47TA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSS0p-0001aI-GA; Wed, 06 Nov 2019 20:34:43 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id C2126980DF5; Wed,  6 Nov 2019 21:34:40 +0100 (CET)
Date: Wed, 6 Nov 2019 21:34:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191106203440.GH3079@worktop.programming.kicks-ass.net>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:44:51 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Douglas Anderson <dianders@chromium.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 06, 2019 at 04:27:33PM +0000, Dmitry Safonov wrote:
> Hi Peter,
> 
> On 11/6/19 9:20 AM, Peter Zijlstra wrote:
> > On Wed, Nov 06, 2019 at 03:04:51AM +0000, Dmitry Safonov wrote:
> >> Add log level argument to show_stack().
> >> Done in three stages:
> >> 1. Introducing show_stack_loglvl() for every architecture
> >> 2. Migrating old users with an explicit log level
> >> 3. Renaming show_stack_loglvl() into show_stack()
> >>
> >> Justification:
> >> o It's a design mistake to move a business-logic decision
> >>   into platform realization detail.
> >> o I have currently two patches sets that would benefit from this work:
> >>   Removing console_loglevel jumps in sysrq driver [1]
> >>   Hung task warning before panic [2] - suggested by Tetsuo (but he
> >>   probably didn't realise what it would involve).
> >> o While doing (1), (2) the backtraces were adjusted to headers
> >>   and other messages for each situation - so there won't be a situation
> >>   when the backtrace is printed, but the headers are missing because
> >>   they have lesser log level (or the reverse).
> >> o As the result in (2) plays with console_loglevel for kdb are removed.
> > 
> > I really don't understand that word salad. Why are you doing this?
> > 
> 
> Sorry, I should have tried to describe better.
> 
> I'm trying to remove external users of console_loglevel by following
> reasons:

I suppose since all my machines have 'debug ignore_loglevel
earlyprintk=serial,ttyS0,115200 console=ttyS0,115200' I don't have this
experience.

> - changing console_loglevel on SMP means that unwanted messages from
> other CPUs will appear (that have lower log level)
> - on UMP unwanted messages may appear if the code is preempted while it
> hasn't set the console_loglevel back to old
> - rising console_loglevel to print wanted message(s) may not work at all
> if printk() has being delayed and the console_loglevel is already set
> back to old value

Sure, frobbing the global console_loglevel is bad.

> I also have patches in wip those needs to print backtrace with specific
> loglevel (higher when it's critical, lower when it's notice and
> shouldn't go to serial console).

(everything always should go to serial, serial is awesome :-)

> Besides on local tests I see hits those have headers (messages like
> "Backtrace: ") without an actual backtrace and the reverse - a backtrace
> without a reason for it. It's quite annoying and worth addressing by
> syncing headers log levels to backtraces.

I suppose I'm surprised there are backtraces that are not important.
Either badness happened and it needs printing, or the user asked for it
and it needs printing.

Perhaps we should be removing backtraces if they're not important
instead of allowing to print them as lower loglevels?
