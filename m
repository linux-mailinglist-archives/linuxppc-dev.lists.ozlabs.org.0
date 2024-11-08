Return-Path: <linuxppc-dev+bounces-3056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C4D9C2086
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 16:35:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlNKy0Kkkz3bwp;
	Sat,  9 Nov 2024 02:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731080101;
	cv=none; b=YWqQYJIOe5nKaI65B+fODtVCwdDKvvw7aQZJnFzG95shudNKQG8JBFMMEO/UxNOrsbGksBSoNeLGq4yBzVHoDsUrYZ8xk+0fPTTZXoZWx2waQt2xRpxDo7IcfEc7FpocebVdc+sWu8iM9zUBUQ5aavZrY5wg0AI5DXUUGE5vO6OWpvw+a1xMUPhpoccWO7lakviTxU/BxQfvDfmBM3VzjruV0MMc4D9mfliSvHQTPCjjCd8bYgSN/p8oZY0xoex0nNnBaqFk2PjDIFBJkFfS86nfb/Wf+O6/rsilv1LWeN357v3BpQPuRhVbICLo11pkETMqmygLYiDLusFeYpLKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731080101; c=relaxed/relaxed;
	bh=vjqYkG8ff4c+T4YdMOMbIeQIrZmZCxBiG8+gykwYd68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM/WR1mADbV7mkLEZtDAVQExCdcSYtpVDxkjguIsdITDlRaAE0Du28CVOXIKv5wq+ybjtI+VD3H/2zEZQ+2L/xLGNZdzyaCVWneITR4z4oDHpSit0qHdzR/jxYVsCaAoUNJVodoSiex8o6jCJ/HxXDYTGtcrmo9VdFFnL3sefgyaribZujalxRu7G379jsgngZAbUNRPLr5Cq0XeirkR04JvcecEkRoX5A9ESQR1fty1Gqcw+HCRFU1jS6JYrm/Qxor56yjXV7nRGLF44E0L6j4FO74TtpKsMKKOhBZeaRGbsvnfHi8y+ktseJ+IGHh1EKrEt89yFRalyCIfvfiauQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=90.155.50.34; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=90.155.50.34; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlNKn0ngbz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 02:34:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vjqYkG8ff4c+T4YdMOMbIeQIrZmZCxBiG8+gykwYd68=; b=Yrlsi7At3LEJP0uIS6NkE1jR0Z
	oEDQN829mzVxadI/xT+kHJyj5id3FRDTMankwY09OZVfoGLKoqsmLmgVU1Lu1pazKwCxc0rCgk1MQ
	xtxACAOrflTnYJ1gsq35M/GrEku0PXrYo1NmUlRg3/xm/yNXfSqjxdFSGnOXTyYmYxf2oekxv9FLP
	wEOzongRu606SdS0S8qnLTBPFqmALtmejbk/mXmEr2UTL7qA+UAscv+0HOvdCrD1PTIU4PbUBjS+W
	/Lg0PXKc83CciAUL2IEcvj4nySJ8JJocIaAq2CpM/eee1apM5FIwT9nN1SxiZwdtiiRR7++R4EU95
	TbKChe7A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qzz-000000090KC-0Eqo;
	Fri, 08 Nov 2024 15:34:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2EC8930049D; Fri,  8 Nov 2024 16:34:11 +0100 (CET)
Date: Fri, 8 Nov 2024 16:34:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
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
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <20241108153411.GF38786@noisy.programming.kicks-ass.net>
References: <20241107190336.2963882-1-coltonlewis@google.com>
 <20241107190336.2963882-5-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107190336.2963882-5-coltonlewis@google.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 07:03:35PM +0000, Colton Lewis wrote:
> Break the assignment logic for misc flags into their own respective
> functions to reduce the complexity of the nested logic.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
>  arch/x86/include/asm/perf_event.h |  2 ++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index d19e939f3998..9fdc5fa22c66 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3011,16 +3011,35 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> +static unsigned long common_misc_flags(struct pt_regs *regs)
> +{
> +	if (regs->flags & PERF_EFLAGS_EXACT)
> +		return PERF_RECORD_MISC_EXACT_IP;
> +
> +	return 0;
> +}
> +
> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned long guest_state = perf_guest_state();
> +	unsigned long flags = common_misc_flags(regs);

This is double common_misc and makes no sense

> +
> +	if (!(guest_state & PERF_GUEST_ACTIVE))
> +		return flags;
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		return flags & PERF_RECORD_MISC_GUEST_USER;
> +	else
> +		return flags & PERF_RECORD_MISC_GUEST_KERNEL;

And this is just broken garbage, right?

> +}

Did you mean to write:

unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
{
	unsigned long guest_state = perf_guest_state();
	unsigned long flags = 0;

	if (guest_state & PERF_GUEST_ACTIVE) {
		if (guest_state & PERF_GUEST_USER)
			flags |= PERF_RECORD_MISC_GUEST_USER;
		else
			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
	}

	return flags;
}

>  unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
> -	int misc = 0;
> +	unsigned long misc = common_misc_flags(regs);

Because here you do the common thing..

>  
>  	if (guest_state) {
> -		if (guest_state & PERF_GUEST_USER)
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> +		misc |= perf_arch_guest_misc_flags(regs);

And here you mix in the guest things.

>  	} else {
>  		if (user_mode(regs))
>  			misc |= PERF_RECORD_MISC_USER;

