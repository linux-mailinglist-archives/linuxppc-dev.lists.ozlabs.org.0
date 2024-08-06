Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AEA94940E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 17:01:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdc2M22jWz3cns
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 01:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdc202rSxz3cHS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 01:00:54 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB59BFEC;
	Tue,  6 Aug 2024 08:00:49 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A3133F6A8;
	Tue,  6 Aug 2024 08:00:20 -0700 (PDT)
Date: Tue, 6 Aug 2024 16:00:17 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <ZrI6gRQWW8HU8p0/@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <ZqJ2knGETfS4nfEA@e133380.arm.com>
 <20240801155441.GB841837@e124191.cambridge.arm.com>
 <Zqu2VYELikM5LFY/@e133380.arm.com>
 <20240806103532.GA1986436@e124191.cambridge.arm.com>
 <20240806143103.GB2017741@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806143103.GB2017741@e124191.cambridge.arm.com>
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

On Tue, Aug 06, 2024 at 03:31:03PM +0100, Joey Gouly wrote:
> On Tue, Aug 06, 2024 at 11:35:32AM +0100, Joey Gouly wrote:
> > On Thu, Aug 01, 2024 at 05:22:45PM +0100, Dave Martin wrote:
> > > On Thu, Aug 01, 2024 at 04:54:41PM +0100, Joey Gouly wrote:
> > > > On Thu, Jul 25, 2024 at 05:00:18PM +0100, Dave Martin wrote:
> > > > > Hi,
> > > > > 
> > > > > On Fri, May 03, 2024 at 02:01:36PM +0100, Joey Gouly wrote:
> > > > > > Add PKEY support to signals, by saving and restoring POR_EL0 from the stackframe.
> > > > > > 
> > > > > > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > > Cc: Will Deacon <will@kernel.org>
> > > > > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > > > > > Acked-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
> > > > > > ---
> > > > > >  arch/arm64/include/uapi/asm/sigcontext.h |  7 ++++
> > > > > >  arch/arm64/kernel/signal.c               | 52 ++++++++++++++++++++++++
> > > > > >  2 files changed, 59 insertions(+)
> > > > > > 
> > > > > > diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/include/uapi/asm/sigcontext.h
> > > > > > index 8a45b7a411e0..e4cba8a6c9a2 100644
> > > > > > --- a/arch/arm64/include/uapi/asm/sigcontext.h
> > > > > > +++ b/arch/arm64/include/uapi/asm/sigcontext.h
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > @@ -980,6 +1013,13 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
> > > > > >  			return err;
> > > > > >  	}
> > > > > >  
> > > > > > +	if (system_supports_poe()) {
> > > > > > +		err = sigframe_alloc(user, &user->poe_offset,
> > > > > > +				     sizeof(struct poe_context));
> > > > > > +		if (err)
> > > > > > +			return err;
> > > > > > +	}
> > > > > > +
> > > > > >  	return sigframe_alloc_end(user);
> > > > > >  }
> > > > > >  
> > > > > > @@ -1020,6 +1060,15 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
> > > > > >  		__put_user_error(current->thread.fault_code, &esr_ctx->esr, err);
> > > > > >  	}
> > > > > >  
> > > > > > +	if (system_supports_poe() && err == 0 && user->poe_offset) {
> > > > > > +		struct poe_context __user *poe_ctx =
> > > > > > +			apply_user_offset(user, user->poe_offset);
> > > > > > +
> > > > > > +		__put_user_error(POE_MAGIC, &poe_ctx->head.magic, err);
> > > > > > +		__put_user_error(sizeof(*poe_ctx), &poe_ctx->head.size, err);
> > > > > > +		__put_user_error(read_sysreg_s(SYS_POR_EL0), &poe_ctx->por_el0, err);
> > > > > > +	}
> > > > > > +
> > > > > 
> > > > > Does the AArch64 procedure call standard say anything about whether
> > > > > POR_EL0 is caller-saved?
> > > > 
> > > > I asked about this, and it doesn't say anything and they don't plan on it,
> > > > since it's very application specific.
> > > 
> > > Right.  I think that confirms that we don't absolutely need to preserve
> > > POR_EL0, because if compiler-generated code was allowed to fiddle with
> > > this and not clean up after itself, the PCS would have to document this.
> > > 
> > > > > 
> > > > > <bikeshed>
> > > > > 
> > > > > In theory we could skip saving this register if it is already
> > > > > POR_EL0_INIT (which it often will be), and if the signal handler is not
> > > > > supposed to modify and leave the modified value in the register when
> > > > > returning.
> > > > > 
> > > > > The complexity of the additional check my be a bit pointless though,
> > > > > and the the handler might theoretically want to change the interrupted
> > > > > code's POR_EL0 explicitly, which would be complicated if POE_MAGIC is
> > > > > sometimes there and sometimes not.
> > > > > 
> > > > > </bikeshed>
> > > > > 
> > > > I think trying to skip/optimise something here would be more effort than any
> > > > possible benefits!
> > > 
> > > Actually, having thought about this some more I think that only dumping
> > > this register if != POR_EL0_INIT may be right right thing to do.
> > > 
> > > This would mean that old binary would stacks never see poe_context in
> > > the signal frame, and so will never experience unexpected stack
> > > overruns (at least, not due solely to the presence of this feature).
> > 
> > They can already see things they don't expect, like FPMR that was added
> > recently.
> > 
> > > 
> > > POE-aware signal handlers have to do something fiddly and nonportable
> > > to obtain the original value of POR_EL0 regardless, so requiring them
> > > do handle both cases (present in sigframe and absent) doesn't seem too
> > > onerous to me.
> > 
> > If the signal handler wanted to modify the value, from the default, wouldn't it
> > need to mess around with the sig context stuff, to allocate some space for
> > POR_EL0, such that the kernel would restore it properly? (If that's even
> > possible).
> > 
> > > 
> > > 
> > > Do you think this approach would break any known use cases?
> > 
> > Not sure.
> > 
> 
> We talked about this offline, helped me understand it more, and I think
> something like this makes sense:
> 
> diff --git arch/arm64/kernel/signal.c arch/arm64/kernel/signal.c
> index 561986947530..ca7d4e0be275 100644
> --- arch/arm64/kernel/signal.c
> +++ arch/arm64/kernel/signal.c
> @@ -1024,7 +1025,10 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
>                         return err;
>         }
>  
> -       if (system_supports_poe()) {
> +       if (system_supports_poe() &&
> +                       (add_all ||
> +                        mm_pkey_allocation_map(current->mm) != 0x1 ||

We probably ought to holding the mm lock for read around this (as in
mm/mprotect.c:pkey_alloc()), or have a wrapper to encapsulate that.

Signal delivery is not fast path, so I think we should stick to the
simple and obviously correct approach rather than trying to be
lockless (at least until somebody comes up with a compelling reason to
change it).

If doing that, we should probably put the condition on the allocation
map last so that we don't take the lock unnecessarily.

> +                        read_sysreg_s(SYS_POR_EL0) != POR_EL0_INIT)) {
>                 err = sigframe_alloc(user, &user->poe_offset,
>                                      sizeof(struct poe_context));
>                 if (err)
> 
> 
> That is, we only save the POR_EL0 value if any pkeys have been allocated (other
> than pkey 0) *or* if POR_EL0 is a non-default value.
> 
> The latter case is a corner case, where a userspace would have changed POR_EL0
> before allocating any extra pkeys.
> That could be:
> 	- pkey 0, if it restricts pkey 0 without allocating other pkeys, it's
> 	  unlikely the program can do anything useful anyway
> 	- Another pkey, which userspace probably shouldn't do anyway.
> 	  The man pages say:
> 		The kernel guarantees that the contents of the hardware rights
> 		register (PKRU) will be preserved only for allocated protection keys. Any time
> 		a key is unallocated (either before the first call returning that key from
> 		pkey_alloc() or after it is freed via pkey_free()), the kernel may make
> 		arbitrary changes to the parts of the rights register affecting access to that
> 		key.
> 	  So userspace shouldn't be changing POR_EL0 before allocating pkeys anyway..
> 
> Thanks,
> Joey

This seems better, thanks.

I'll leave it for others to comment on whether this is an issue for any
pkeys use case, but it does mean that non-POE-aware arm64 code
shouldn't see any impact on the signal handling side.

Your new approach means that poe_context is always present in the
sigframe for code that is using POE, so I think that reasonable
scenarios of wanting to change the POR_EL0 value for sigreturn ought
to work.

Processes that contain a mixture of POE and non-POE code are a bit more
of a grey area, but I think that libraries should not be arbitrarily
commandeering pkeys since they have no way to be sure that won't break
the calling program...  I'm assuming that we won't have to worry about
that scenario in practice.

Cheers
---Dave
