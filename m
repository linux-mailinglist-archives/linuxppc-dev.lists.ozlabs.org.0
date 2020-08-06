Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9923D518
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 03:29:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMW9d0D7KzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 11:29:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=JVrhm/RJ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMW7v3CctzDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 11:27:37 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bh1so13575059plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 18:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DuDsgb65jk4kM2QKtIcboGNZ4XnXjsLei0jhdfgm7I8=;
 b=JVrhm/RJlNTG1NWPza2dQZr9Xi30R017lzKrVsOpyLhddn5aaWR4VI5KEYKCX6Fy6Z
 QFjTcd5DEo1+jJNFpTv5BFvCVyvjFw/LDC3fUCTe2c1of3XCTUaRj9Q/KJJ6mTIxrcMu
 iLFztksVOvNcFMsdX0PK2ZsvGjzWJQjvmnwEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DuDsgb65jk4kM2QKtIcboGNZ4XnXjsLei0jhdfgm7I8=;
 b=b0JHvpQHF5AMmPkezbEKZNwSF3iDOsNlbfsChfWZHdV7Ge7ovr/v4BbONNCC69BIW8
 UdT+5vviF5jy+HLrrz4AKZfV37DpWxtBLWh0jwv91l0RTHOWs0AjTeSLCf+sbpYPLrJS
 IWDRg001O5L7PrZxKhpoZhKv7ZbbxXYNoxPhv1C0Y4XiQDkRt5KxbEfzNkldJDKhiXPy
 2yp7a7tVvTNL7+4eSa3p6M9fXXaXSXSjdadfEogKqgxVcvk2vAY+/oYzl4qDsg25g8JB
 vtX0nnc7ky5CTfF4lYc3kjedJ8p2mv9ULQzYTIW4m6X04d+rtt/dGPbsUlQSsbu1KDU7
 RNKA==
X-Gm-Message-State: AOAM530YIufyc8BsNwjXL+GVXiLRignryhVy6PfbzuqTe8miz4NAOG8D
 H1E8HmjE4D1WmZKS58jyE/7WOQohrJw=
X-Google-Smtp-Source: ABdhPJzpaODOKaK9mM77lcsaN9J7+FL/2GndCh5/hjyd1GVGbqvkDAvBzL1BVhx5eCGGJl+3MhV6/A==
X-Received: by 2002:a17:902:8c8a:: with SMTP id
 t10mr5587875plo.112.1596677254340; 
 Wed, 05 Aug 2020 18:27:34 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-b446-662a-483a-dcf2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b446:662a:483a:dcf2])
 by smtp.gmail.com with ESMTPSA id fv21sm4440079pjb.16.2020.08.05.18.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 18:27:33 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/5] powerpc/mm: Introduce temporary mm
In-Reply-To: <20200709040316.12789-2-cmr@informatik.wtf>
References: <20200709040316.12789-1-cmr@informatik.wtf>
 <20200709040316.12789-2-cmr@informatik.wtf>
Date: Thu, 06 Aug 2020 11:27:30 +1000
Message-ID: <87o8noo96l.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chris,
  
>  void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
>  bool ppc_breakpoint_available(void);
>  #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>  extern void do_send_trap(struct pt_regs *regs, unsigned long address,
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 1a474f6b1992..9269c7c7b04e 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -10,6 +10,7 @@
>  #include <asm/mmu.h>	
>  #include <asm/cputable.h>
>  #include <asm/cputhreads.h>
> +#include <asm/debug.h>
>  
>  /*
>   * Most if the context management is out of line
> @@ -300,5 +301,68 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
>  	return 0;
>  }
>  
> +struct temp_mm {
> +	struct mm_struct *temp;
> +	struct mm_struct *prev;
> +	bool is_kernel_thread;
> +	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
> +};

This is on the nitpicky end, but I wonder if this should be named
temp_mm, or should be labelled something else to capture its broader
purpose as a context for code patching? I'm thinking that a store of
breakpoints is perhaps unusual in a memory-managment structure?

I don't have a better suggestion off the top of my head and I'm happy
for you to leave it, I just wanted to flag it as a possible way we could
be clearer.

> +
> +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
> +{
> +	temp_mm->temp = mm;
> +	temp_mm->prev = NULL;
> +	temp_mm->is_kernel_thread = false;
> +	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> +}
> +
> +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> +{
> +	lockdep_assert_irqs_disabled();
> +
> +	temp_mm->is_kernel_thread = current->mm == NULL;
> +	if (temp_mm->is_kernel_thread)
> +		temp_mm->prev = current->active_mm;

You don't seem to restore active_mm below. I don't know what active_mm
does, so I don't know if this is a problem.

> +	else
> +		temp_mm->prev = current->mm;
> +
> +	/*
> +	 * Hash requires a non-NULL current->mm to allocate a userspace address
> +	 * when handling a page fault. Does not appear to hurt in Radix either.
> +	 */
> +	current->mm = temp_mm->temp;
> +	switch_mm_irqs_off(NULL, temp_mm->temp, current);
> +
> +	if (ppc_breakpoint_available()) {

I wondered if this could be changed during a text-patching operation.
AIUI, it potentially can on a P9 via "dawr_enable_dangerous" in debugfs.

I don't know if that's a problem. My concern is that you could turn off
breakpoints, call 'use_temporary_mm', then turn them back on again
before 'unuse_temporary_mm' and get a breakpoint while that can access
the temporary mm. Is there something else that makes that safe?
disabling IRQs maybe?

> +		struct arch_hw_breakpoint null_brk = {0};
> +		int i = 0;
> +
> +		for (; i < nr_wp_slots(); ++i) {

super nitpicky, and I'm not sure if this is actually documented, but I'd
usually see this written as:

for (i = 0; i < nr_wp_slots(); i++) {

Not sure if there's any reason that it _shouldn't_ be written the way
you've written it (and I do like initialising the variable when it's
defined!), I'm just not used to it. (Likewise with the unuse function.)

> +			__get_breakpoint(i, &temp_mm->brk[i]);
> +			if (temp_mm->brk[i].type != 0)
> +				__set_breakpoint(i, &null_brk);
> +		}
> +	}
> +}
> +

Kind regards,
Daniel

> +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
> +{
> +	lockdep_assert_irqs_disabled();
> +
> +	if (temp_mm->is_kernel_thread)
> +		current->mm = NULL;
> +	else
> +		current->mm = temp_mm->prev;
> +	switch_mm_irqs_off(NULL, temp_mm->prev, current);
> +
> +	if (ppc_breakpoint_available()) {
> +		int i = 0;
> +
> +		for (; i < nr_wp_slots(); ++i)
> +			if (temp_mm->brk[i].type != 0)
> +				__set_breakpoint(i, &temp_mm->brk[i]);
> +	}
> +}
> +
>  #endif /* __KERNEL__ */
>  #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 4650b9bb217f..b6c123bf5edd 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -824,6 +824,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
>  	return 0;
>  }
>  
> +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> +{
> +	memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
> +}
> +
>  void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
>  {
>  	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
> -- 
> 2.27.0
