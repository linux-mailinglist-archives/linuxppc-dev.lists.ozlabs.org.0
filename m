Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9994919F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 15:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdZ6d0m1Kz30VX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 23:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdZ6C5qTWz2y8f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 23:34:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C287DFEC;
	Tue,  6 Aug 2024 06:34:18 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1780C3F766;
	Tue,  6 Aug 2024 06:33:49 -0700 (PDT)
Date: Tue, 6 Aug 2024 14:33:37 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 15/29] arm64: handle PKEY/POE faults
Message-ID: <ZrImMQ44dlrqCf6v@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-16-joey.gouly@arm.com>
 <ZqJ11TqIJq9oB+pt@e133380.arm.com>
 <20240801160110.GC841837@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160110.GC841837@e124191.cambridge.arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Aug 01, 2024 at 05:01:10PM +0100, Joey Gouly wrote:
> On Thu, Jul 25, 2024 at 04:57:09PM +0100, Dave Martin wrote:
> > On Fri, May 03, 2024 at 02:01:33PM +0100, Joey Gouly wrote:
> > > If a memory fault occurs that is due to an overlay/pkey fault, report that to
> > > userspace with a SEGV_PKUERR.
> > > 
> > > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/traps.h |  1 +
> > >  arch/arm64/kernel/traps.c      | 12 ++++++--
> > >  arch/arm64/mm/fault.c          | 56 ++++++++++++++++++++++++++++++++--
> > >  3 files changed, 64 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> > > index eefe766d6161..f6f6f2cb7f10 100644
> > > --- a/arch/arm64/include/asm/traps.h
> > > +++ b/arch/arm64/include/asm/traps.h
> > > @@ -25,6 +25,7 @@ try_emulate_armv8_deprecated(struct pt_regs *regs, u32 insn)
> > >  void force_signal_inject(int signal, int code, unsigned long address, unsigned long err);
> > >  void arm64_notify_segfault(unsigned long addr);
> > >  void arm64_force_sig_fault(int signo, int code, unsigned long far, const char *str);
> > > +void arm64_force_sig_fault_pkey(int signo, int code, unsigned long far, const char *str, int pkey);
> > >  void arm64_force_sig_mceerr(int code, unsigned long far, short lsb, const char *str);
> > >  void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const char *str);
> > >  
> > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > index 215e6d7f2df8..1bac6c84d3f5 100644
> > > --- a/arch/arm64/kernel/traps.c
> > > +++ b/arch/arm64/kernel/traps.c
> > > @@ -263,16 +263,24 @@ static void arm64_show_signal(int signo, const char *str)
> > >  	__show_regs(regs);
> > >  }
> > >  
> > > -void arm64_force_sig_fault(int signo, int code, unsigned long far,
> > > -			   const char *str)
> > > +void arm64_force_sig_fault_pkey(int signo, int code, unsigned long far,
> > > +			   const char *str, int pkey)
> > >  {
> > >  	arm64_show_signal(signo, str);
> > >  	if (signo == SIGKILL)
> > >  		force_sig(SIGKILL);
> > > +	else if (code == SEGV_PKUERR)
> > > +		force_sig_pkuerr((void __user *)far, pkey);
> > 
> > Is signo definitely SIGSEGV here?  It looks to me like we can get in
> > here for SIGBUS, SIGTRAP etc.
> > 
> > si_codes are not unique between different signo here, so I'm wondering
> > whether this should this be:
> > 
> > 	else if (signo == SIGSEGV && code == SEGV_PKUERR)
> > 
> > ...?
> > 
> > 
> > >  	else
> > >  		force_sig_fault(signo, code, (void __user *)far);
> > >  }
> > >  
> > > +void arm64_force_sig_fault(int signo, int code, unsigned long far,
> > > +			   const char *str)
> > > +{
> > > +	arm64_force_sig_fault_pkey(signo, code, far, str, 0);
> > 
> > Is there a reason not to follow the same convention as elsewhere, where
> > -1 is passed for "no pkey"?
> > 
> > If we think this should never be called with signo == SIGSEGV &&
> > code == SEGV_PKUERR and no valid pkey but if it's messy to prove, then
> > maybe a WARN_ON_ONCE() would be worth it here?
> > 
> 
> Anshuman suggested to separate them out, which I did like below, I think that
> addresses your comments too?
> 
> diff --git arch/arm64/kernel/traps.c arch/arm64/kernel/traps.c
> index 215e6d7f2df8..49bac9ae04c0 100644
> --- arch/arm64/kernel/traps.c
> +++ arch/arm64/kernel/traps.c
> @@ -273,6 +273,13 @@ void arm64_force_sig_fault(int signo, int code, unsigned long far,
>                 force_sig_fault(signo, code, (void __user *)far);
>  }
>  
> +void arm64_force_sig_fault_pkey(int signo, int code, unsigned long far,
> +                          const char *str, int pkey)
> +{
> +       arm64_show_signal(signo, str);
> +       force_sig_pkuerr((void __user *)far, pkey);
> +}
> +
>  void arm64_force_sig_mceerr(int code, unsigned long far, short lsb,
>                             const char *str)
>  {
> 
> diff --git arch/arm64/mm/fault.c arch/arm64/mm/fault.c
> index 451ba7cbd5ad..1ddd46b97f88 100644
> --- arch/arm64/mm/fault.c
> +++ arch/arm64/mm/fault.c

(Guessing where this is means to apply, since there is no hunk header
or context...)

> 
> -               arm64_force_sig_fault(SIGSEGV, si_code, far, inf->name);
> +               if (si_code == SEGV_PKUERR)
> +                       arm64_force_sig_fault_pkey(SIGSEGV, si_code, far, inf->name, pkey);

Maybe drop the the signo and si_code argument?  This would mean that
arm64_force_sig_fault_pkey() can't be called with a signo/si_code
combination that makes no sense.

I think pkey faults are always going to be SIGSEGV/SEGV_PKUERR, right?
Or are there other combinations that can apply for these faults?


> +               else
> +                       arm64_force_sig_fault(SIGSEGV, si_code, far, inf->name);

Otherwise yes, I think splitting things this way makes sense.

Cheers
---Dave
