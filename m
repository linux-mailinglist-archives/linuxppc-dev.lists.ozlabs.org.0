Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260D8425C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 14:08:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPQTN2W5nz3cXl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 00:08:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPQSx3DHDz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 00:07:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80839DA7;
	Tue, 30 Jan 2024 05:08:08 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.48.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D8453F762;
	Tue, 30 Jan 2024 05:07:20 -0800 (PST)
Date: Tue, 30 Jan 2024 13:07:17 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v10 2/6] arm64: add support for machine check error safe
Message-ID: <Zbj0heg7eFukm_5Z@FVFF77S0Q05N>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-3-tongtiangen@huawei.com>
 <ZbflpQV7aVry0qPz@FVFF77S0Q05N>
 <eb78caf9-ac03-1030-4e32-b614e73c0f62@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb78caf9-ac03-1030-4e32-b614e73c0f62@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 06:57:24PM +0800, Tong Tiangen wrote:
> 在 2024/1/30 1:51, Mark Rutland 写道:
> > On Mon, Jan 29, 2024 at 09:46:48PM +0800, Tong Tiangen wrote:

> > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > index 55f6455a8284..312932dc100b 100644
> > > --- a/arch/arm64/mm/fault.c
> > > +++ b/arch/arm64/mm/fault.c
> > > @@ -730,6 +730,31 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > >   	return 1; /* "fault" */
> > >   }
> > > +static bool arm64_do_kernel_sea(unsigned long addr, unsigned int esr,
> > > +				     struct pt_regs *regs, int sig, int code)
> > > +{
> > > +	if (!IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
> > > +		return false;
> > > +
> > > +	if (user_mode(regs))
> > > +		return false;
> > 
> > This function is called "arm64_do_kernel_sea"; surely the caller should *never*
> > call this for a SEA taken from user mode?
> 
> In do_sea(), the processing logic is as follows:
>   do_sea()
>   {
>     [...]
>     if (user_mode(regs) && apei_claim_sea(regs) == 0) {
>        return 0;
>     }
>     [...]
>     //[1]
>     if (!arm64_do_kernel_sea()) {
>        arm64_notify_die();
>     }
>   }
> 
> [1] user_mode() is still possible to go here,If user_mode() goes here,
>  it indicates that the impact caused by the memory error cannot be
>  processed correctly by apei_claim_sea().
> 
> 
> In this case, only arm64_notify_die() can be used, This also maintains
> the original logic of user_mode()'s processing.

My point is that either:

(a) The name means that this should *only* be called for SEAs from a kernel
    context, and the caller should be responsible for ensuring that.

(b) The name is misleading, and the 'kernel' part should be removed from the
    name.

I prefer (a), and if you head down that route it's clear that you can get rid
of a bunch of redundant logic and remove the need for do_kernel_sea(), anyway,
e.g.

| static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
| {
|         const struct fault_info *inf = esr_to_fault_info(esr);
|         bool claimed = apei_claim_sea(regs) == 0;
|         unsigned long siaddr;
| 
|         if (claimed) {
|                 if (user_mode(regs)) {
|                         /*  
|                          * APEI claimed this as a firmware-first notification.
|                          * Some processing deferred to task_work before ret_to_user().
|                          */
|                         return 0;
|                 } else {
|                         /*
|                          * TODO: explain why this is correct.
|                          */
|                         if ((current->flags & PF_KTHREAD) &&
|                             fixup_exception_mc(regs))
|                                 return 0;
|                 }
|         }
| 
|         if (esr & ESR_ELx_FnV) {
|                 siaddr = 0;
|         } else {
|                 /*  
|                  * The architecture specifies that the tag bits of FAR_EL1 are
|                  * UNKNOWN for synchronous external aborts. Mask them out now
|                  * so that userspace doesn't see them.
|                  */
|                 siaddr  = untagged_addr(far);
|         }   
|         arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
| 
|         return 0;
| }

> > > +
> > > +	if (apei_claim_sea(regs) < 0)
> > > +		return false;
> > > +
> > > +	if (!fixup_exception_mc(regs))
> > > +		return false;
> > > +
> > > +	if (current->flags & PF_KTHREAD)
> > > +		return true;
> > 
> > I think this needs a comment; why do we allow kthreads to go on, yet kill user
> > threads? What about helper threads (e.g. for io_uring)?
> 
> If a memroy error occurs in the kernel thread, the problem is more
> serious than that of the user thread. As a result, related kernel
> functions, such as khugepaged, cannot run properly. kernel panic should
> be a better choice at this time.
> 
> Therefore, the processing scope of this framework is limited to the user
> thread.

That's reasonable, but needs to be explained in a comment.

Also, as above, I think you haven't conisderd helper threads (e.g. io_uring),
which don't have PF_KTHREAD set but do have PF_USER_WORKER set. I suspect those
need the same treatment as kthreads.

> > > +	set_thread_esr(0, esr);
> > 
> > Why do we set the ESR to 0?
> 
> The purpose is to reuse the logic of arm64_notify_die() and set the
> following parameters before sending signals to users:
>   current->thread.fault_address = 0;
>   current->thread.fault_code = err;

Ok, but there's no need to open-code that.

As per my above example, please continue to use the existing call to
arm64_notify_die() rather than open-coding bits of it.

Mark.
