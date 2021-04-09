Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939E3597C0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 10:24:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGrkw0Smsz3c0C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 18:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=gmail.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 09 Apr 2021 18:23:49 AEST
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGrkY28Gpz3026
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 18:23:49 +1000 (AEST)
IronPort-SDR: hgb2KwDrFtJuaPKdJestd8j6CVhj9VMVGco8we7xsW+tGZvBqCHY0V9A9S3rLFwYAGEuU/VJQe
 di8uXUzFI/vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="190517126"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="190517126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 01:22:41 -0700
IronPort-SDR: LpPwGYvzeGLB4564wHP5jJbcRyN85WbfWAYL9lYRz8cQSDjnd3E+cW0pfFcrKjH/dI51i7LuRn
 04ILPMrQhS5g==
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="613646033"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 01:22:32 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1lUmPK-002UMq-O4; Fri, 09 Apr 2021 11:22:26 +0300
Date: Fri, 9 Apr 2021 11:22:26 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <YHAOwm5JtmH/8Njr@smile.fi.intel.com>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <202104061143.E11D2D0@keescook>
 <CAHp75Ve+11u=dtNTO8BCohOJHGWSMJtb1nGCOrNde7bXaD4ehA@mail.gmail.com>
 <20210408232303.453749e0e6fb0adfa8545440@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408232303.453749e0e6fb0adfa8545440@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux-Arch <linux-arch@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Iurii Zaikin <yzaikin@google.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kexec@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Eric Biederman <ebiederm@xmission.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 11:23:03PM -0700, Andrew Morton wrote:
> On Wed, 7 Apr 2021 11:46:37 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
> > On Wed, Apr 7, 2021 at 11:17 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> > > > kernel.h is being used as a dump for all kinds of stuff for a long time.
> > > > Here is the attempt to start cleaning it up by splitting out panic and
> > > > oops helpers.
> > > >
> > > > At the same time convert users in header and lib folder to use new header.
> > > > Though for time being include new header back to kernel.h to avoid twisted
> > > > indirected includes for existing users.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > I like it! Do you have a multi-arch CI to do allmodconfig builds to
> > > double-check this?
> > 
> > Unfortunately no, I rely on plenty of bots that are harvesting mailing lists.
> > 
> > But I will appreciate it if somebody can run this through various build tests.
> > 
> 
> um, did you try x86_64 allmodconfig?
> 
> I'm up to
> kernelh-split-out-panic-and-oops-helpers-fix-fix-fix-fix-fix-fix-fix.patch
> and counting.


I will try on my side and will fix those, thanks!

> and.... drivers/leds/trigger/ledtrig-heartbeat.c as well.
> 
> I'll drop it.

No problem, thanks for the report.

-- 
With Best Regards,
Andy Shevchenko


