Return-Path: <linuxppc-dev+bounces-1044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440E96D5E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzwVs5t5cz2ysZ;
	Thu,  5 Sep 2024 20:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725531957;
	cv=none; b=nulsyi9GBq34z++PgyURvRv4+iObQq5tBJ2bvpIhFhVTV6sCVR3nxphN/6NfF+ZiGjGBiJ5YK8tvkOxAjDs2H5cyNa1oEpP7IgKdBtWnbczDd7+xe+WvZdyhGDNbVeTw5gU0B3e+RpksHabqEsFvEuaDDn+35WWmMf8XD1u9zB5Lzf+JvpYLQqDpGO0xsQFnpULO9ehW+YivFZyDdsY3x+jJS/OnSDQPTPjgBCvQRFuSvGHwe64AlsectytV1Oj0dPyTBNb0UeUwYZzMXps8Glc45NqxTjOrDwo7hfptyKReLDA0EZKmB/AdYKCH+InY+VTDAMOGRsLfArWl7gMS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725531957; c=relaxed/relaxed;
	bh=hGydPClaVhqw2S5vCswOCjjVlmQnbG3pYGIShOaVj2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cA+soerYeAKmdja6YHRSl/21Nu891Hyl5pwqBsTLPMncI/iwPxJGILA+EcIa6HLmHdmeZyDmDkoA+kRw09ta6e88WyFAyUdiCtln/314JwT0o8zgX8TDEb6RBXLeOGqi0GhtaRVw7SYLw7ebmYnVB5Doqgf507Pe3H9fm0Chw7Iyq2DAvtZI9df7wfQmsAPLHw6VgahwjjPgqN2tHL/viO0qJggBtdrudaXwQaLKeAdHZvPwCt3X1ou7ZXlfCGOCNF4d7Nhf8IWBfCJWdXI56bB0tB2YxMO9pJahZn2iVDT8McYSqmDPSCFy4G3f2xefZTn9Rl2x5VpBHzPDj80oKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzwVr6yD7z2yn2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:25:54 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06AA5FEC;
	Thu,  5 Sep 2024 03:25:49 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA503F73F;
	Thu,  5 Sep 2024 03:25:16 -0700 (PDT)
Date: Thu, 5 Sep 2024 11:25:10 +0100
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
Subject: Re: [PATCH 1/5] arm: perf: Drop unused functions
Message-ID: <ZtmHBuggqUr3ncw6@J2N7QTR9R3>
References: <20240904204133.1442132-1-coltonlewis@google.com>
 <20240904204133.1442132-2-coltonlewis@google.com>
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
In-Reply-To: <20240904204133.1442132-2-coltonlewis@google.com>

On Wed, Sep 04, 2024 at 08:41:29PM +0000, Colton Lewis wrote:
> perf_instruction_pointer() and perf_misc_flags() aren't used anywhere
> in this particular perf implementation. Drop them.

I think it'd be better to say that arch/arm's implementation of these is
equivalent to the generic versions in include/linux/perf_event.h, and so
arch/arm doesn't need to provide its own versions. It doesn't matter if
arch/arm uses them itself since they're being provided for the core perf
code.

With words to that effect:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
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
> 2.46.0.469.g59c65b2a67-goog
> 

