Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF95504E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 14:53:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQG6t6BhGz3bmM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 22:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQG6T3JmGz300x
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 22:53:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B43C5113E;
	Sat, 18 Jun 2022 05:52:33 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.35.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F5253F792;
	Sat, 18 Jun 2022 05:52:28 -0700 (PDT)
Date: Sat, 18 Jun 2022 13:52:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 6/8] arm64: add support for machine check error
 safe
Message-ID: <Yq3KiDN87pd6mg+m@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-7-tongtiangen@huawei.com>
 <YqxBd9GfUHLWZWoh@FVFF77S0Q05N>
 <4aa8b109-c79b-8da0-db89-85ca128f1049@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4aa8b109-c79b-8da0-db89-85ca128f1049@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 18, 2022 at 05:18:55PM +0800, Tong Tiangen wrote:
> 在 2022/6/17 16:55, Mark Rutland 写道:
> > On Sat, May 28, 2022 at 06:50:54AM +0000, Tong Tiangen wrote:
> > > +static bool arm64_do_kernel_sea(unsigned long addr, unsigned int esr,
> > > +				     struct pt_regs *regs, int sig, int code)
> > > +{
> > > +	if (!IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
> > > +		return false;
> > > +
> > > +	if (user_mode(regs) || !current->mm)
> > > +		return false;
> > 
> > What's the `!current->mm` check for?
> 
> At first, I considered that only user processes have the opportunity to
> recover when they trigger memory error.
> 
> But it seems that this restriction is unreasonable. When the kernel thread
> triggers memory error, it can also be recovered. for instance:
> 
> https://lore.kernel.org/linux-mm/20220527190731.322722-1-jiaqiyan@google.com/
> 
> And i think if(!current->mm) shoud be added below:
> 
> if(!current->mm) {
> 	set_thread_esr(0, esr);
> 	arm64_force_sig_fault(...);
> }
> return true;

Why does 'current->mm' have anything to do with this, though?

There can be kernel threads with `current->mm` set in unusual circumstances
(and there's a lot of kernel code out there which handles that wrong), so if
you want to treat user tasks differently, we should be doing something like
checking PF_KTHREAD, or adding something like an is_user_task() helper.

[...]

> > > +
> > > +	if (apei_claim_sea(regs) < 0)
> > > +		return false;
> > > +
> > > +	if (!fixup_exception_mc(regs))
> > > +		return false;
> > 
> > I thought we still wanted to signal the task in this case? Or do you expect to
> > add that into `fixup_exception_mc()` ?
> 
> Yeah, here return false and will signal to task in do_sea() ->
> arm64_notify_die().

I mean when we do the fixup.

I thought the idea was to apply the fixup (to stop the kernel from crashing),
but still to deliver a fatal signal to the user task since we can't do what the
user task asked us to.

> > > +
> > > +	set_thread_esr(0, esr);
> > 
> > Why are we not setting the address? Is that deliberate, or an oversight?
> 
> Here set fault_address to 0, i refer to the logic of arm64_notify_die().
> 
> void arm64_notify_die(...)
> {
>          if (user_mode(regs)) {
>                  WARN_ON(regs != current_pt_regs());
>                  current->thread.fault_address = 0;
>                  current->thread.fault_code = err;
> 
>                  arm64_force_sig_fault(signo, sicode, far, str);
>          } else {
>                  die(str, regs, err);
>          }
> }
> 
> I don't know exactly why and do you know why arm64_notify_die() did this? :)

To be honest, I don't know, and that looks equally suspicious to me.

Looking at the git history, that was added in commit:

  9141300a5884b57c ("arm64: Provide read/write fault information in compat signal handlers")

... so maybe Catalin recalls why.

Perhaps the assumption is just that this will be fatal and so unimportant? ...
but in that case the same logic would apply to the ESR value, so it's not clear
to me.

Mark.
