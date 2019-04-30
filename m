Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13504FE27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:50:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnb23cYWzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44tnS064t4zDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 02:44:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FF03374;
 Tue, 30 Apr 2019 09:44:23 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 170F93F5C1;
 Tue, 30 Apr 2019 09:44:19 -0700 (PDT)
Date: Tue, 30 Apr 2019 17:44:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH v2 3/6] x86: clean up _TIF_SYSCALL_EMU handling using
 ptrace_syscall_enter hook
Message-ID: <20190430164413.GA18913@e107155-lin>
References: <20190318104925.16600-1-sudeep.holla@arm.com>
 <20190318104925.16600-4-sudeep.holla@arm.com>
 <20190318153321.GA23521@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190318153321.GA23521@redhat.com>
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
Cc: Sudeep Holla <sudeep.holla@arm.com>, Haibo Xu <haibo.xu@arm.com>,
 Steve Capper <Steve.Capper@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 jdike@addtoit.com, x86@kernel.org, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Bin Lu <bin.lu@arm.com>,
 Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 18, 2019 at 04:33:22PM +0100, Oleg Nesterov wrote:
> On 03/18, Sudeep Holla wrote:
> >
> > --- a/arch/x86/entry/common.c
> > +++ b/arch/x86/entry/common.c
> > @@ -70,22 +70,16 @@ static long syscall_trace_enter(struct pt_regs *regs)
> >
> >  	struct thread_info *ti = current_thread_info();
> >  	unsigned long ret = 0;
> > -	bool emulated = false;
> >  	u32 work;
> >
> >  	if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
> >  		BUG_ON(regs != task_pt_regs(current));
> >
> > -	work = READ_ONCE(ti->flags) & _TIF_WORK_SYSCALL_ENTRY;
> > -
> > -	if (unlikely(work & _TIF_SYSCALL_EMU))
> > -		emulated = true;
> > -
> > -	if ((emulated || (work & _TIF_SYSCALL_TRACE)) &&
> > -	    tracehook_report_syscall_entry(regs))
> > +	if (unlikely(ptrace_syscall_enter(regs)))
> >  		return -1L;
> >
> > -	if (emulated)
> > +	work = READ_ONCE(ti->flags) & _TIF_WORK_SYSCALL_ENTRY;
> > +	if ((work & _TIF_SYSCALL_TRACE) && tracehook_report_syscall_entry(regs))
> >  		return -1L;
>
[...]

>
> And it seems that _TIF_WORK_SYSCALL_ENTRY needs some cleanups too... We don't need
> "& _TIF_WORK_SYSCALL_ENTRY" in syscall_trace_enter, and _TIF_WORK_SYSCALL_ENTRY
> should not include _TIF_NOHZ?
>

I was about to post the updated version and checked this to make sure I have
covered everything or not. I had missed the above comment. All architectures
have _TIF_NOHZ in their mask that they check to do work. And from x86, I read
"...syscall_trace_enter(). Also includes TIF_NOHZ for enter_from_user_mode()"
So I don't understand why _TIF_NOHZ needs to be dropped.

Also if we need to drop, we can address that separately examining all archs.
I will post the cleanup as you suggested for now.

--
Regards,
Sudeep
