Return-Path: <linuxppc-dev+bounces-5522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A9A1A6D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 16:15:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf4Hj5NNzz307C;
	Fri, 24 Jan 2025 02:14:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737645297;
	cv=none; b=f4EgpRpm5zmeL7LLgytnaDNxkttXue/wHTugeBF7Mm42NmTqiZTth7OtFF1IyUb0rJWFd4OW1kXKk1zo5dJwSjFfzpl8IV/12oh6MVG2sWhZgnafQlIan+QdXuPfPDvINUmhAY8p4qYKInfssgZr8BwWpRX5gfUhTgA1uhfbfoEXlgcWWNd2qnU9S/Uns8/UuqJ4+C5ecLiQtlMoK8TalAHOpzk0J8gE1U0xkntq2LRpGAcesfHFd0rJMDNRXM7FD0O0uX+56qjnrCA7CHo6YqfGyLYOO1KFn1cgKy0rDO+s5pUWi1GnRsddiJsybVGnlZFTUDGvvp8T/UiSSj5ruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737645297; c=relaxed/relaxed;
	bh=FvlEipCEN1rSVYi0JSDjcoaOXMVFSnu6zqOJD6uPi5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKFREVmjtz0qvOD6X9d4ANb4HQoY/T3DWbRYIaF0tf34O7H+OoyXVuC8psdjZ244a3PcPZdppTQYCZPz/wVdntymbDvAoZdsJ+7cqH8Vc8oQcTEHTe8CFKmFVMuIL04UyfgGFzRr5nba1s486WtXj0Njd3z2m3AsksUHOw9W1HIHpallZKyw9W2aKaM3qepggzW5AUQXyq5CqmuzBW1xVirH+HMzmluXD/v05JZTWPxEPYPelR2zMC9jha8wIl6BfrPNyI8uon1ZkMW2Z2ZIj2504U3o5PfpQXIYsbGSc5xffiSCpsHhNIL9Q2SJEMmjuEIZce82rDbVaw/F8RPDJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org) smtp.mailfrom=alpha.franken.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 2425 seconds by postgrey-1.37 at boromir; Fri, 24 Jan 2025 02:14:55 AEDT
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf4Hg3yYcz305n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 02:14:55 +1100 (AEDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tayHM-0003Jh-00; Thu, 23 Jan 2025 15:33:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AD776C0147; Thu, 23 Jan 2025 15:33:32 +0100 (CET)
Date: Thu, 23 Jan 2025 15:33:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <Z5JTPJXcL8J4B2mD@alpha.franken.de>
References: <20250120134409.GA21241@redhat.com>
 <20250120134445.GA21268@redhat.com>
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
In-Reply-To: <20250120134445.GA21268@redhat.com>
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 02:44:45PM +0100, Oleg Nesterov wrote:
> arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
> can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
> and "sd == NULL" checks in __secure_computing(sd) paths.
> 
> With the change above syscall_trace_enter() can just use secure_computing()
> and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
> not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/mips/kernel/ptrace.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 61503a36067e..f7107479c7fa 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1326,24 +1326,8 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  			return -1;
>  	}
>  
> -#ifdef CONFIG_SECCOMP
> -	if (unlikely(test_thread_flag(TIF_SECCOMP))) {
> -		int ret, i;
> -		struct seccomp_data sd;
> -		unsigned long args[6];
> -
> -		sd.nr = current_thread_info()->syscall;
> -		sd.arch = syscall_get_arch(current);
> -		syscall_get_arguments(current, regs, args);
> -		for (i = 0; i < 6; i++)
> -			sd.args[i] = args[i];
> -		sd.instruction_pointer = KSTK_EIP(current);
> -
> -		ret = __secure_computing(&sd);
> -		if (ret == -1)
> -			return ret;
> -	}
> -#endif
> +	if (secure_computing())
> +		return -1;
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->regs[2]);
> -- 
> 2.25.1.362.g51ebf55

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

