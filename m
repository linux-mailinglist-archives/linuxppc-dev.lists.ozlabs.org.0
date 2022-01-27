Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C549E38D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 14:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1kr6tF1z3cBr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 00:33:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1kR3qbWz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 00:33:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC5B1063;
 Thu, 27 Jan 2022 05:33:16 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C39D3F766;
 Thu, 27 Jan 2022 05:33:14 -0800 (PST)
Date: Thu, 27 Jan 2022 13:33:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfKfDnbNGina2lKz@FVFF77S0Q05N>
References: <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <yt9dy231gzae.fsf@linux.ibm.com> <YfKPmFJ2MGsem4VB@FVFF77S0Q05N>
 <20220127074601.41a3773d@rorschach.local.home>
 <YfKZXvB9vCN1bA1c@FVFF77S0Q05N> <yt9dsft9gvyo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yt9dsft9gvyo.fsf@linux.ibm.com>
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
Cc: keescook@chromium.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 02:16:31PM +0100, Sven Schnelle wrote:
> Mark Rutland <mark.rutland@arm.com> writes:
> 
> > On Thu, Jan 27, 2022 at 07:46:01AM -0500, Steven Rostedt wrote:
> >> On Thu, 27 Jan 2022 12:27:04 +0000
> >> Mark Rutland <mark.rutland@arm.com> wrote:
> >> 
> >> > Ah, so those non-ELF relocations for the mcount_loc table just mean "apply the
> >> > KASLR offset here", which is equivalent for all entries.
> >> > 
> >> > That makes sense, thanks!
> >> 
> >> And this is why we were having such a hard time understanding each other ;-)
> >
> > ;)
> >
> > With that in mind, I think that we understand that the build-time sort works
> > for:
> >
> > * arch/x86, becuase the non-ELF relocations for mcount_loc happen to be
> >   equivalent.
> >  
> > * arch/arm, because there's no dynamic relocaiton and the mcount_loc entries
> >   have been finalized prior to sorting.
> >
> > ... but doesn't work for anyone else (including arm64) because the ELF
> > relocations are not equivalent, and need special care that is not yet
> > implemented.
> 
> For s390 my idea is to just skip the addresses between __start_mcount_loc
> and __stop_mcount_loc, because for these addresses we know that they are
> 64 bits wide, so we just need to add the KASLR offset.
> 
> I'm thinking about something like this:
> 
> diff --git a/arch/s390/boot/compressed/decompressor.h b/arch/s390/boot/compressed/decompressor.h
> index f75cc31a77dd..015d7e2e94ef 100644
> --- a/arch/s390/boot/compressed/decompressor.h
> +++ b/arch/s390/boot/compressed/decompressor.h
> @@ -25,6 +25,8 @@ struct vmlinux_info {
>  	unsigned long rela_dyn_start;
>  	unsigned long rela_dyn_end;
>  	unsigned long amode31_size;
> +	unsigned long start_mcount_loc;
> +	unsigned long stop_mcount_loc;
>  };
>  
>  /* Symbols defined by linker scripts */
> diff --git a/arch/s390/boot/startup.c b/arch/s390/boot/startup.c
> index 1aa11a8f57dd..7bb0d88db5c6 100644
> --- a/arch/s390/boot/startup.c
> +++ b/arch/s390/boot/startup.c
> @@ -88,6 +88,11 @@ static void handle_relocs(unsigned long offset)
>  	dynsym = (Elf64_Sym *) vmlinux.dynsym_start;
>  	for (rela = rela_start; rela < rela_end; rela++) {
>  		loc = rela->r_offset + offset;
> +		if ((loc >= vmlinux.start_mcount_loc) &&
> +		    (loc < vmlinux.stop_mcount_loc)) {
> +			(*(unsigned long *)loc) += offset;
> +			continue;
> +		}
>  		val = rela->r_addend;
>  		r_sym = ELF64_R_SYM(rela->r_info);
>  		if (r_sym) {
> @@ -232,6 +237,8 @@ static void offset_vmlinux_info(unsigned long offset)
>  	vmlinux.rela_dyn_start += offset;
>  	vmlinux.rela_dyn_end += offset;
>  	vmlinux.dynsym_start += offset;
> +	vmlinux.start_mcount_loc += offset;
> +	vmlinux.stop_mcount_loc += offset;
>  }
>  
>  static unsigned long reserve_amode31(unsigned long safe_addr)
> diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
> index 42c43521878f..51c773405608 100644
> --- a/arch/s390/kernel/vmlinux.lds.S
> +++ b/arch/s390/kernel/vmlinux.lds.S
> @@ -213,6 +213,8 @@ SECTIONS
>  		QUAD(__rela_dyn_start)				/* rela_dyn_start */
>  		QUAD(__rela_dyn_end)				/* rela_dyn_end */
>  		QUAD(_eamode31 - _samode31)			/* amode31_size */
> +		QUAD(__start_mcount_loc)
> +		QUAD(__stop_mcount_loc)
>  	} :NONE
>  
>  	/* Debugging sections.	*/
> 
> Not sure whether that would also work on power, and also not sure
> whether i missed something thinking about that. Maybe it doesn't even
> work. ;-)

I don't know enough about s390 or powerpc relocs to say whether that works, but
I can say that approach isn't going to work for arm64 without other signficant
changes.

I want to get the regression fixed ASAP, so can we take a simple patch for -rc2
which disables the build-time sort where it's currently broken (by limiting the
opt-in to arm and x86), then follow-up per-architecture to re-enable it if
desired/safe?

Thanks,
Mark.
