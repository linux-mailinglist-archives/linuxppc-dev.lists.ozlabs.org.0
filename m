Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1811949E31C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 14:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1Bx0ClBz3cSt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 00:09:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1BR4Qfxz30N9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 00:09:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78C161063;
 Thu, 27 Jan 2022 05:09:00 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 169AE3F766;
 Thu, 27 Jan 2022 05:08:58 -0800 (PST)
Date: Thu, 27 Jan 2022 13:08:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfKZXvB9vCN1bA1c@FVFF77S0Q05N>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <yt9dy231gzae.fsf@linux.ibm.com> <YfKPmFJ2MGsem4VB@FVFF77S0Q05N>
 <20220127074601.41a3773d@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127074601.41a3773d@rorschach.local.home>
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 07:46:01AM -0500, Steven Rostedt wrote:
> On Thu, 27 Jan 2022 12:27:04 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > Ah, so those non-ELF relocations for the mcount_loc table just mean "apply the
> > KASLR offset here", which is equivalent for all entries.
> > 
> > That makes sense, thanks!
> 
> And this is why we were having such a hard time understanding each other ;-)

;)

With that in mind, I think that we understand that the build-time sort works
for:

* arch/x86, becuase the non-ELF relocations for mcount_loc happen to be
  equivalent.
 
* arch/arm, because there's no dynamic relocaiton and the mcount_loc entries
  have been finalized prior to sorting.

... but doesn't work for anyone else (including arm64) because the ELF
relocations are not equivalent, and need special care that is not yet
implemented.

So we should have arm and x86 opt-in, but for now everyone else (including
arm64, powerpc, s390) should be left with the prior behaviour with the runtime
sort only (in case the build-time sort breaks anything, as I mentioned in my
other mail).

Does that sound about right?

In future we might be able to do something much smarter (e.g. adding some
preprocessing to use relative entries).

I'll take a look at shelf. :)

Thanks,
Mark.

> I started a new project called "shelf", which is a shell interface to
> read ELF files (Shelf on a ELF!).
> 
> It uses my ccli library:
> 
>    https://github.com/rostedt/libccli
> 
> and can be found here:
> 
>    https://github.com/rostedt/shelf
> 
> Build and install the latest libccli and then build this with just
> "make".
> 
>   $ shelf vmlinux
> 
> and then you can see what is stored in the mcount location:
> 
>   shelf> dump symbol __start_mcount_loc - __stop_mcount_loc
> 
> I plan on adding more to include the REL and RELA sections and show how
> they affect symbols and such.
> 
> Feel free to contribute too ;-)
> 
> -- Steve
