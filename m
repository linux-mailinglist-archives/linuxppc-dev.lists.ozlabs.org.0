Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8F10B9E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 18:53:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vPbR2sHvzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 02:53:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44vPZ73gKZzDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 02:51:58 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48B2880D;
 Wed,  1 May 2019 09:51:57 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35DD13F719;
 Wed,  1 May 2019 09:51:54 -0700 (PDT)
Date: Wed, 1 May 2019 17:51:51 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH v2 3/6] x86: clean up _TIF_SYSCALL_EMU handling using
 ptrace_syscall_enter hook
Message-ID: <20190501165151.GB12498@e107155-lin>
References: <20190318104925.16600-1-sudeep.holla@arm.com>
 <20190318104925.16600-4-sudeep.holla@arm.com>
 <20190318153321.GA23521@redhat.com>
 <20190430164413.GA18913@e107155-lin>
 <20190501155711.GB30235@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501155711.GB30235@redhat.com>
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
Cc: Haibo Xu <haibo.xu@arm.com>, Steve Capper <Steve.Capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, jdike@addtoit.com, x86@kernel.org,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Bin Lu <bin.lu@arm.com>, Richard Weinberger <richard@nod.at>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 01, 2019 at 05:57:11PM +0200, Oleg Nesterov wrote:
> On 04/30, Sudeep Holla wrote:
> >
> > On Mon, Mar 18, 2019 at 04:33:22PM +0100, Oleg Nesterov wrote:
> > >
> > > And it seems that _TIF_WORK_SYSCALL_ENTRY needs some cleanups too... We don't need
> > > "& _TIF_WORK_SYSCALL_ENTRY" in syscall_trace_enter, and _TIF_WORK_SYSCALL_ENTRY
> > > should not include _TIF_NOHZ?
> > >
> >
> > I was about to post the updated version and checked this to make sure I have
> > covered everything or not. I had missed the above comment. All architectures
> > have _TIF_NOHZ in their mask that they check to do work. And from x86, I read
> > "...syscall_trace_enter(). Also includes TIF_NOHZ for enter_from_user_mode()"
> > So I don't understand why _TIF_NOHZ needs to be dropped.
>
> I have already forgot this discussion... But after I glanced at this code again
> I still think the same, and I don't understand why do you disagree.
>

Sorry, but I didn't have any disagreement, I just said I don't understand
the usage on all architectures at that moment.

> > Also if we need to drop, we can address that separately examining all archs.
>
> Sure, and I was only talking about x86. We can keep TIF_NOHZ and even
> set_tsk_thread_flag(TIF_NOHZ) in context_tracking_cpu_set() if some arch needs
> this but remove TIF_NOHZ from TIF_WORK_SYSCALL_ENTRY in arch/x86/include/asm/thread_info.h,
> afaics this shouldn't make any difference.
>

OK, it's just x86, then I understand your point. I was looking at all
the architectures, sorry for the confusion.

> And I see no reason why x86 needs to use TIF_WORK_SYSCALL_ENTRY in
> syscall_trace_enter().
>

Agreed

--
Regards,
Sudeep
