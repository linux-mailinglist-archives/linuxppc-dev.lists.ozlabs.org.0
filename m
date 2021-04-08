Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BB3584B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 15:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGMZ03brKz3bwg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 23:29:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGMYf6kgwz30Cb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 23:29:26 +1000 (AEST)
IronPort-SDR: 8mMNjT6zL5zIdwR5Q72WiFx8B1x0eE/0R6mgsmGNZJvPhgsTDYoP57aTBcqpUCXC7+g6owmlyd
 TonBhTFXT/Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="254876832"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="254876832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 06:29:22 -0700
IronPort-SDR: D3QHX5UVSB8YX34MZLNYlLK0kPKdVmkIBWjKvFADTZAC3rD9R9M8THaBbj3tnr/+TF6aChcI+z
 hErj278onk1A==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="419147368"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 06:29:13 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lUUia-002IVr-4H; Thu, 08 Apr 2021 16:29:08 +0300
Date: Thu, 8 Apr 2021 16:29:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <YG8FJOYVovYIOLXA@smile.fi.intel.com>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <03be4ed9-8e8d-e2c2-611d-ac09c61d84f9@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03be4ed9-8e8d-e2c2-611d-ac09c61d84f9@rasmusvillemoes.dk>
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
Cc: Corey Minyard <cminyard@mvista.com>, linux-hyperv@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Iurii Zaikin <yzaikin@google.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biederman <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 02:45:12PM +0200, Rasmus Villemoes wrote:
> On 06/04/2021 15.31, Andy Shevchenko wrote:
> > kernel.h is being used as a dump for all kinds of stuff for a long time.
> > Here is the attempt to start cleaning it up by splitting out panic and
> > oops helpers.
> 
> Yay.
> 
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Thanks!

> > At the same time convert users in header and lib folder to use new header.
> > Though for time being include new header back to kernel.h to avoid twisted
> > indirected includes for existing users.
> 
> I think it would be good to have some place to note that "This #include
> is just for backwards compatibility, it will go away RealSoonNow, so if
> you rely on something from linux/panic.h, include that explicitly
> yourself TYVM. And if you're looking for a janitorial task, write a
> script to check that every file that uses some identifier defined in
> panic.h actually includes that file. When all offenders are found and
> dealt with, remove the #include and this note.".

Good and...

> > +struct taint_flag {
> > +	char c_true;	/* character printed when tainted */
> > +	char c_false;	/* character printed when not tainted */
> > +	bool module;	/* also show as a per-module taint flag */
> > +};
> > +
> > +extern const struct taint_flag taint_flags[TAINT_FLAGS_COUNT];
> 
> While you're doing this, nothing outside of kernel/panic.c cares about
> the definition of struct taint_flag or use the taint_flags array, so
> could you make the definition private to that file and make the array
> static? (Another patch, of course.)

...according to the above if *you are looking for a janitorial task*... :-))

> > +enum lockdep_ok {
> > +	LOCKDEP_STILL_OK,
> > +	LOCKDEP_NOW_UNRELIABLE,
> > +};
> > +
> > +extern const char *print_tainted(void);
> > +extern void add_taint(unsigned flag, enum lockdep_ok);
> > +extern int test_taint(unsigned flag);
> > +extern unsigned long get_taint(void);
> 
> I know you're just moving code, but it would be a nice opportunity to
> drop the redundant externs.

As above. But for all these I have heard you. So, I'll keep this response
as part of my always only growing TODO list.

-- 
With Best Regards,
Andy Shevchenko


