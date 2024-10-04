Return-Path: <linuxppc-dev+bounces-1761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0F99073A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 17:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKsYd6mGVz2yfj;
	Sat,  5 Oct 2024 01:15:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728054933;
	cv=none; b=Lzce8sUfzV+DwpoGf+YuMaH1CPB+aXCfh+Sr6fVYRBI/D0kgLQZGoZFjMvs1WqYaQ4nRjytcxJBmdGvfV070AF/HmgZOZCHFZDDbTf3XmYe8g+19KW+ohq0kf6JodYw2jQyf4ksg3oWso6X06LEnII1GJyXgPJ1pNbHxZ+axpAWZ+3+RztvvAahZPKASSGa2M0Mm03ITACPtP7GofDGwfvr5NJEo4iEsQicUtZfLLOzQopzC78WCqPugrJtoJl0uS97/trMqKlvkXWCDmarM0gbDohLNc1BvlBqKsAbcvNyB1YW27GJTw3pzzpBsI9QpyY+SRnovD9aR7H5XFhf2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728054933; c=relaxed/relaxed;
	bh=KJGQ8Bt4UUP43NZ7vxOhcnwe1IybmzNSUko46gBWUwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMgBGNJcN7bONoNdAGwUuQHYVGTaIVerOGt1b0bZ89APzjTrMPOSR3dLW2yXHs7hJpUpthmemRc0ghIw6DkvUH2lycO5dNn6Kjb6dqVUA2bO8k1LhM3SXCz1xUAVpHIRNgl7VMFfWtx/dc6IfpZyprkDJuZVjT+TbNOWA0TIahHQUwRhnMZn8EnTstgDquUY3z23wB9RlYNu44hRapVzVNUGuW9UiFUqNy802yEyXS1LRHccPP9NbR+a2bvph2RDTZGeQiJMj1G62uHimufMbFaCQ5Isfolba1LtRiw+yjCLOAZP2O1sxLhZCmi4A4oxb93VJcQjidlb6Jl04m12Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKsYc1Lhdz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 01:15:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3131339;
	Fri,  4 Oct 2024 08:15:26 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 493D13F640;
	Fri,  4 Oct 2024 08:14:52 -0700 (PDT)
Date: Fri, 4 Oct 2024 16:14:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 1/5] arm: perf: Drop unused functions
Message-ID: <ZwAGZ5YB-eYemlYR@J2N7QTR9R3.cambridge.arm.com>
References: <20240920174740.781614-1-coltonlewis@google.com>
 <20240920174740.781614-2-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920174740.781614-2-coltonlewis@google.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Sep 20, 2024 at 05:47:36PM +0000, Colton Lewis wrote:
> For arm's implementation, perf_instruction_pointer() and
> perf_misc_flags() are equivalent to the generic versions in
> include/linux/perf_event.h so arch/arm doesn't need to provide its
> own versions. Drop them here.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm/include/asm/perf_event.h |  7 -------
>  arch/arm/kernel/perf_callchain.c  | 17 -----------------
>  2 files changed, 24 deletions(-)
> 
> diff --git a/arch/arm/include/asm/perf_event.h b/arch/arm/include/asm/perf_event.h
> index bdbc1e590891..c08f16f2e243 100644
> --- a/arch/arm/include/asm/perf_event.h
> +++ b/arch/arm/include/asm/perf_event.h
> @@ -8,13 +8,6 @@
>  #ifndef __ARM_PERF_EVENT_H__
>  #define __ARM_PERF_EVENT_H__
>  
> -#ifdef CONFIG_PERF_EVENTS
> -struct pt_regs;
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> -#endif
> -
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
>  	(regs)->ARM_pc = (__ip); \
>  	frame_pointer((regs)) = (unsigned long) __builtin_frame_address(0); \
> diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
> index 1d230ac9d0eb..a2601b1ef318 100644
> --- a/arch/arm/kernel/perf_callchain.c
> +++ b/arch/arm/kernel/perf_callchain.c
> @@ -96,20 +96,3 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>  	arm_get_current_stackframe(regs, &fr);
>  	walk_stackframe(&fr, callchain_trace, entry);
>  }
> -
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> -{
> -	return instruction_pointer(regs);
> -}
> -
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> -{
> -	int misc = 0;
> -
> -	if (user_mode(regs))
> -		misc |= PERF_RECORD_MISC_USER;
> -	else
> -		misc |= PERF_RECORD_MISC_KERNEL;
> -
> -	return misc;
> -}
> -- 
> 2.46.0.792.g87dc391469-goog
> 

