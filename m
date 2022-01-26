Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4156749CC8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 15:43:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkRKh1SfBz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 01:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 337 seconds by postgrey-1.36 at boromir;
 Thu, 27 Jan 2022 01:42:58 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JkRKG21brz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 01:42:56 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4743A1FB;
 Wed, 26 Jan 2022 06:37:16 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.1.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CB7E3F793;
 Wed, 26 Jan 2022 06:37:15 -0800 (PST)
Date: Wed, 26 Jan 2022 14:37:09 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Yinan Liu <yinan@linux.alibaba.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfFclROd+0/61q2d@FVFF77S0Q05N>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Steve pointed me at this thread over IRC -- I'm not subscribed to this list so
grabbed a copy of the thread thus far via b4.

On Tue, Jan 25, 2022 at 11:20:27AM +0800, Yinan Liu wrote:
> > Yeah, I think it's time to opt in, instead of opting out.

I agree this must be opt-in rather than opt-out.

However, I think most architectures were broken (in at least some
configurations) by commit:

  72b3942a173c387b ("scripts: ftrace - move the sort-processing in ftrace_init")

... and so I don't think this fix is correct as-is, and we might want to revert
that or at least mark is as BROKEN for now.

More on that below.

> > 
> > Something like this:
> > 
> > -- Steve
> > 
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index c2724d986fa0..5256ebe57451 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -82,6 +82,7 @@ config ARM
> >   	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
> >   	select HAVE_CONTEXT_TRACKING
> >   	select HAVE_C_RECORDMCOUNT
> > +	select HAVE_BUILDTIME_MCOUNT_SORT
> >   	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
> >   	select HAVE_DMA_CONTIGUOUS if MMU
> >   	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU

IIUC the 32-bit arm kernel can be relocated at boot time, so I don't believe
this is correct, and I believe any relocatable arm kernel has been broken since
htat was introduced.

> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index c4207cf9bb17..7996548b2b27 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -166,6 +166,7 @@ config ARM64
> >   	select HAVE_ASM_MODVERSIONS
> >   	select HAVE_EBPF_JIT
> >   	select HAVE_C_RECORDMCOUNT
> > +	select HAVE_BUILDTIME_MCOUNT_SORT
> >   	select HAVE_CMPXCHG_DOUBLE
> >   	select HAVE_CMPXCHG_LOCAL
> >   	select HAVE_CONTEXT_TRACKING

The arm64 kernel is relocatable by default, and has been broken since the
build-time sort was introduced -- I see ftrace test failures, and the
CONFIG_FTRACE_SORT_STARTUP_TEST screams at boot time.

> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 7399327d1eff..46080dea5dba 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -186,6 +186,7 @@ config X86
> >   	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
> >   	select HAVE_C_RECORDMCOUNT
> >   	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
> > +	select HAVE_BUILDTIME_MCOUNT_SORT

Isn't x86 relocatable in some configurations (e.g. for KASLR)?

I can't see how the sort works for those cases, because the mcount_loc entries
are absolute, and either:

* The sorted entries will get overwritten by the unsorted relocation entries,
  and won't be sorted.

* The sorted entries won't get overwritten, but then the absolute address will
  be wrong since they hadn't been relocated.

How does that work?

Thanks,
Mark.

> >   	select HAVE_DEBUG_KMEMLEAK
> >   	select HAVE_DMA_CONTIGUOUS
> >   	select HAVE_DYNAMIC_FTRACE
> > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > index 752ed89a293b..7e5b92090faa 100644
> > --- a/kernel/trace/Kconfig
> > +++ b/kernel/trace/Kconfig
> > @@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
> >   	help
> >   	  C version of recordmcount available?
> > +config HAVE_BUILDTIME_MCOUNT_SORT
> > +       bool
> > +       help
> > +         An architecture selects this if it sorts the mcount_loc section
> > +	 at build time.
> > +
> >   config BUILDTIME_MCOUNT_SORT
> >          bool
> >          default y
> > -       depends on BUILDTIME_TABLE_SORT && !S390
> > +       depends on HAVE_BUILDTIME_MCOUNT_SORT
> >          help
> >            Sort the mcount_loc section at build time.
> 
> LGTM. This will no longer destroy ftrace on other architectures.
> Those arches that we are not sure about can test and enable this function by
> themselves.
> 
> 
> Best regards
> --yinan
> 
