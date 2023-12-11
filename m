Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4480C0C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 06:40:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZ4neWCT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpVvx3WFqz30hQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 16:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZ4neWCT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpVv52mYWz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 16:40:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 066C1B80B13;
	Mon, 11 Dec 2023 05:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDEDC433C7;
	Mon, 11 Dec 2023 05:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702273195;
	bh=pXkGuPEWqJcgOs6ijfV32w7ZZV3pIr0foEoCn6cP/+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rZ4neWCTUFGh1Y+953GYlVN2hnNOeL71TAYRdsHCd7Jk+zhyeZRMkMX4QL4UlFjPa
	 DU8eBc8rFP8uMdvg0IoEazbkZS8MIFjx2HeskY6O2qS21h5tlb/PWQdo0rvmP1+7t7
	 ObHCEOH/35CFjFP0DL+z8Lnh6be/Jmsf2g5Q7Hng329CKXKqZsGR9PwBgkCaqRh8KC
	 KrpZKo4SLGo25yHGtRKqk//4MuoszNSOYv77wubakdw41SGYJ3m3brJf7jMPrvO50M
	 UIefKNDhmr4bhUu8zjWSGJ1Rql78fOVBKwdnFvBAFwCIIzONdg8LahcFp6d814eX2F
	 Lgh4qWviAbKPA==
Date: Mon, 11 Dec 2023 14:39:50 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH 5/9] powerpc/kprobes: Use ftrace to determine if a
 probe is at function entry
Message-Id: <20231211143950.980b4ab4e11b71de04332540@kernel.org>
In-Reply-To: <15f0b3a2e72326423cfb4ce4e89afff540042245.1702045299.git.naveen@kernel.org>
References: <cover.1702045299.git.naveen@kernel.org>
	<15f0b3a2e72326423cfb4ce4e89afff540042245.1702045299.git.naveen@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  8 Dec 2023 22:00:44 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> Rather than hard-coding the offset into a function to be used to
> determine if a kprobe is at function entry, use ftrace_location() to
> determine the ftrace location within the function and categorize all
> instructions till that offset to be function entry.
> 
> For functions that cannot be traced, we fall back to using a fixed
> offset of 8 (two instructions) to categorize a probe as being at
> function entry for 64-bit elfv2.
> 

OK, so this can cover both KPROBES_ON_FTRACE=y/n cases and the function
is traced by ftrace or not.

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/kernel/kprobes.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index b20ee72e873a..42665dfab59e 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -105,24 +105,22 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>  	return addr;
>  }
>  
> -static bool arch_kprobe_on_func_entry(unsigned long offset)
> +static bool arch_kprobe_on_func_entry(unsigned long addr, unsigned long offset)
>  {
> -#ifdef CONFIG_PPC64_ELF_ABI_V2
> -#ifdef CONFIG_KPROBES_ON_FTRACE
> -	return offset <= 16;
> -#else
> -	return offset <= 8;
> -#endif
> -#else
> +	unsigned long ip = ftrace_location(addr);
> +
> +	if (ip)
> +		return offset <= (ip - addr);
> +	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
> +		return offset <= 8;
>  	return !offset;
> -#endif
>  }
>  
>  /* XXX try and fold the magic of kprobe_lookup_name() in this */
>  kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offset,
>  					 bool *on_func_entry)
>  {
> -	*on_func_entry = arch_kprobe_on_func_entry(offset);
> +	*on_func_entry = arch_kprobe_on_func_entry(addr, offset);
>  	return (kprobe_opcode_t *)(addr + offset);
>  }
>  
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
