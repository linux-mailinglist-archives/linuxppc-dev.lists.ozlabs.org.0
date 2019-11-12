Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD10F886D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 07:19:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByJZ6mp0zF4y6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 17:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=sergey.senozhatsky.work@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vjlm6KDB"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Brxb2yF0zDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 13:17:55 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z4so12151117pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 18:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IS2Rt6ZY2kbQpUl893KQNxQCDA75x7+my/1Tf7NswKk=;
 b=Vjlm6KDBvoD6YwvO++lGZ6lHjSc6cCAm9fWSs4JjxabSDi/CqNgEayfiCYPC9t2GLz
 /Uty/IrZcv04aOS3qRrPGUG7rvgiF7YDnI2Kh9DQ5F3zuIcYwKRvol7P+LJHVR2Ntpue
 BmenkoLlXCW6FGqP0oYogfaCGkjco6cjgwMGb8PovVw8l1XJbVJPK3lxsi28NPqBWING
 uoTRw1Bt7GD9J0aMH2Xm/nWO4Q+ipdt8rIvGvN7pJpIBErQgGrRImSVcDd2J/2wookMd
 9Mf3+OZR0ijbdxrDUHHqzfcSZeytQjNDcnXBd9Ph8Qnd5c5vZ2BNhRMMpdwPBrRfh+x9
 Q4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IS2Rt6ZY2kbQpUl893KQNxQCDA75x7+my/1Tf7NswKk=;
 b=Hhl6xgYQnAgRaFUKQLl9OR88Lgiu3WFRKSOQJ4nJ3FbAeVv4Mng4WP0kvRoHK1g2WB
 JrZcu+WJS4BwayQlfX1mtAvOFDY5fJwG48pwb/CkmEXngL6SLcqtFa06dA5j6gWo5qiJ
 qpm/XSTXk9jdvQPMgL3o9onIZ6b3MSNX4j9NU/DV8JKEJL5156alWAv1MZvyQWGTOcyB
 a80SvmMOKOoDl8QOhPYOnfC9MbvHZvYTbrtbroaePrAu/PpL9Hioq4c1cgpRRjbj46p7
 hUXJUY8MarnovidbZUfb5wrK10aUyYr9ETlgXME7z7pnvtK++VSuOKInl+ofclZm3Iy5
 yrLw==
X-Gm-Message-State: APjAAAVOpgBTsg3QulHVudns1yC/kboKMpybdGLoi79VMoEt/4pdK7LM
 9drIzOkAsgGBksW4xZnUTC8=
X-Google-Smtp-Source: APXvYqzpzPbBNdkztHOhg5atVqEV6ayQFi/1XFUzsE81gTsFNG+Jay6WO4tdKRJ91MFuBRoP65cRJw==
X-Received: by 2002:a65:6119:: with SMTP id z25mr32726962pgu.332.1573525071244; 
 Mon, 11 Nov 2019 18:17:51 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id k103sm739924pje.16.2019.11.11.18.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 18:17:50 -0800 (PST)
Date: Tue, 12 Nov 2019 11:17:47 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191112021747.GA68506@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 12 Nov 2019 17:17:43 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-pm@vger.kernel.org,
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
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
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

On (19/11/11 19:47), Dmitry Safonov wrote:
[..]
> I don't see how bits on task_struct or in per-cpu are easier than
> supplying a log level parameter down the stack.
> How would it work if sysrq_handle_crash() called by key-press?
> How would that interact with deferred printing?
> How would it make visible prints from current context, but not from
> something that preempted it?

[..]

per-context log_level works pretty much the same way as per-message
log_level.

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
static DEFINE_PER_CPU(int, cpu_loglevels[4]); // @INITME.. LOGLEVEL_DEBUG + 1?

static int __printing_context(void)
{
	unsigned int preempt = preempt_count();

	if (!(preempt & (NMI_MASK | HARDIRQ_MASK | SOFITRQ_OFFSET)))
		return 0;
	if (preempt & SOFITRQ_OFFSET)
		return 1;
	if (preempt & HARDIRQ_MASK)
		return 2;
	return 3;
}

static int adj_context_loglevel(int level)
{
	int ctx = __printing_context();
	int cpu_level = this_cpu_read(cpu_loglevels[ctx]);

	// this one is important
	if (level == LOGLEVEL_SCHED)
		return level;
	// we are not in emergency context
	if (cpu_level == LOGLEVEL_DEBUG + 1)
		return level;
	// we better not override these
	if (LOGLEVEL_EMERG <= level && level <= LOGLEVEL_ERR)
		return level;
	return cpu_level;
}

void printk_emergency_enter(int log_level)
{
	int ctx;

	preempt_disable();
	ctx = __printing_context();
	this_cpu_write(cpu_loglevels[ctx], log_level);
}

void printk_emergency_exit(void)
{
	int ctx = __printing_context();

	this_cpu_write(cpu_loglevels[ctx], LOGLEVEL_DEBUG + 1);
	preempt_enable();
}

void vprintk_emit(...)
{
	level = adj_context_loglevel(level);
}
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
//
static void __show_stack(struct task_struct *task, unsigned long *sp)
{
	printk();
	...
	printk();
}

void show_stack(struct task_struct *task, unsigned long *sp, int log_level)
{
	printk_emergency_enter(log_level);
	__show_stack(task, sp);
	printk_emergency_exit();
}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //

show_stack() never schedules, disabling preemption around it should
not change anything. Should it be interrupted, we will handle it via
preempt count.

printk_emergency_enter(log_level) handles every printk() that
__show_stack() and friends do. Not worse than printk("%s Stack", lvl);
all over the place.

> What I'm going to do - is to fix all build and reported issues, I'll
> send v2 this week and feel free to NAK it, I will forget about those
> patches and won't be offended.

Lovely.
And - no, I'm not going to NAK platform specific changes. Just so you know.

*All* I'm talking about is an alternative, less "go and touch a ton of
platform code" approach. The argument "I patched so many files that I'm
not even going to discuss anything now" is not productive, to say the
least. Hope this clarifies.

	-ss
