Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B28AB22EDE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 15:51:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFh6b3lW0zDrPH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 23:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFh3N2gBVzDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 23:48:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=UO1iaSKR; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFh3N28qzz8t44
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 23:48:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFh3N1c50z9sRX; Mon, 27 Jul 2020 23:48:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=UO1iaSKR; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFh3M6SBJz9sRW
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 23:48:31 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id m16so8019675pls.5
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=szunKijEXv6Oi5Ur3X4bC9MRzV/pKzbZV4r4GAHkBNY=;
 b=UO1iaSKRkRYbWrwirjm9kkXJySnMLFJjvS2oQm6NqGsKeD7NxjL+SjCe6bZbkRJgtL
 4RKQwVeN4Xl2hQZo3ELW4F4Xs6QpFdkvmiuqPpfa6rQ7QH2eVnnP1M/nnk6IOrfqrI9u
 ypAHwwB5TIOTqkCNdLBeOUKZP7rfpjZNxR8Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=szunKijEXv6Oi5Ur3X4bC9MRzV/pKzbZV4r4GAHkBNY=;
 b=rR8jx24sWzQ82NBoW2/Pyhcb3boPGWSXLqm+kHeZYtaJC6c01rihIMFgReBiSUtwWl
 fJ/KLhI4rrahg4pLRn7F11XsIFjdjEp1Q1KkX6wzVf1HtT2FcyeASO2jorVtm1h1z5/9
 kDiEL3L8UWZLydF3V5P3w2yEaC3kG7jxPDhAgGz4mdPpFTbV0IrBCZsS/SALYva+fmV0
 /hAD3p18IDT/OE/nJeMW+MnUzBkYIFHomwiiqRrnA721vP6lNBBPTfeb1lsB3yI5qBhf
 NxYlJo9qZMXMcQ/XMICYA+66QVk2YzxLMeyBFud/Mt8TKsvpIHpdQOKBWlkBGOcbx0KB
 K0tQ==
X-Gm-Message-State: AOAM533NrlxLZFcXtJlwgWik4FwF2roaWP+U32N406Z8M1hX991r82Ch
 ZWPvLn5DVrqiidvre/BHuyKPog==
X-Google-Smtp-Source: ABdhPJyuxmOYDhPH3QVlCnzX7TGgH1yjOH7R1emHg9aNyw2t6pWlA3Ge4DTuqMAMunateeij5IEfhg==
X-Received: by 2002:a17:90b:f0a:: with SMTP id
 br10mr12838066pjb.77.1595857708308; 
 Mon, 27 Jul 2020 06:48:28 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-9402-c547-7ebf-a307.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:9402:c547:7ebf:a307])
 by smtp.gmail.com with ESMTPSA id g13sm15295894pje.29.2020.07.27.06.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:48:27 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 4/5] powerpc/mm: Remove custom stack expansion checking
In-Reply-To: <20200724092528.1578671-4-mpe@ellerman.id.au>
References: <20200724092528.1578671-1-mpe@ellerman.id.au>
 <20200724092528.1578671-4-mpe@ellerman.id.au>
Date: Mon, 27 Jul 2020 23:48:24 +1000
Message-ID: <87tuxtrrvb.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

I tested v1 of this. I ran the test from the bug with a range of stack
sizes, in a loop, for several hours and didn't see any crashes/signal
delivery failures.

I retested v2 for a few minutes just to be sure, and I ran stress-ng's
stack, stackmmap and bad-altstack stressors to make sure no obvious
kernel bugs were exposed. Nothing crashed.

All tests done on a P8 LE guest under KVM.

On that basis:

Tested-by: Daniel Axtens <dja@axtens.net>

The more I look at this the less qualified I feel to Review it, but
certainly it looks better than my ugly hack from late last year.

Kind regards,
Daniel

> We have powerpc specific logic in our page fault handling to decide if
> an access to an unmapped address below the stack pointer should expand
> the stack VMA.
>
> The logic aims to prevent userspace from doing bad accesses below the
> stack pointer. However as long as the stack is < 1MB in size, we allow
> all accesses without further checks. Adding some debug I see that I
> can do a full kernel build and LTP run, and not a single process has
> used more than 1MB of stack. So for the majority of processes the
> logic never even fires.
>
> We also recently found a nasty bug in this code which could cause
> userspace programs to be killed during signal delivery. It went
> unnoticed presumably because most processes use < 1MB of stack.
>
> The generic mm code has also grown support for stack guard pages since
> this code was originally written, so the most heinous case of the
> stack expanding into other mappings is now handled for us.
>
> Finally although some other arches have special logic in this path,
> from what I can tell none of x86, arm64, arm and s390 impose any extra
> checks other than those in expand_stack().
>
> So drop our complicated logic and like other architectures just let
> the stack expand as long as its within the rlimit.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/fault.c | 109 ++--------------------------------------
>  1 file changed, 5 insertions(+), 104 deletions(-)
>
> v2: no change just rebased.
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 3ebb1792e636..925a7231abb3 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -42,39 +42,7 @@
>  #include <asm/kup.h>
>  #include <asm/inst.h>
>  
> -/*
> - * Check whether the instruction inst is a store using
> - * an update addressing form which will update r1.
> - */
> -static bool store_updates_sp(struct ppc_inst inst)
> -{
> -	/* check for 1 in the rA field */
> -	if (((ppc_inst_val(inst) >> 16) & 0x1f) != 1)
> -		return false;
> -	/* check major opcode */
> -	switch (ppc_inst_primary_opcode(inst)) {
> -	case OP_STWU:
> -	case OP_STBU:
> -	case OP_STHU:
> -	case OP_STFSU:
> -	case OP_STFDU:
> -		return true;
> -	case OP_STD:	/* std or stdu */
> -		return (ppc_inst_val(inst) & 3) == 1;
> -	case OP_31:
> -		/* check minor opcode */
> -		switch ((ppc_inst_val(inst) >> 1) & 0x3ff) {
> -		case OP_31_XOP_STDUX:
> -		case OP_31_XOP_STWUX:
> -		case OP_31_XOP_STBUX:
> -		case OP_31_XOP_STHUX:
> -		case OP_31_XOP_STFSUX:
> -		case OP_31_XOP_STFDUX:
> -			return true;
> -		}
> -	}
> -	return false;
> -}
> +
>  /*
>   * do_page_fault error handling helpers
>   */
> @@ -267,57 +235,6 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>  	return false;
>  }
>  
> -// This comes from 64-bit struct rt_sigframe + __SIGNAL_FRAMESIZE
> -#define SIGFRAME_MAX_SIZE	(4096 + 128)
> -
> -static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
> -				struct vm_area_struct *vma, unsigned int flags,
> -				bool *must_retry)
> -{
> -	/*
> -	 * N.B. The POWER/Open ABI allows programs to access up to
> -	 * 288 bytes below the stack pointer.
> -	 * The kernel signal delivery code writes a bit over 4KB
> -	 * below the stack pointer (r1) before decrementing it.
> -	 * The exec code can write slightly over 640kB to the stack
> -	 * before setting the user r1.  Thus we allow the stack to
> -	 * expand to 1MB without further checks.
> -	 */
> -	if (address + 0x100000 < vma->vm_end) {
> -		struct ppc_inst __user *nip = (struct ppc_inst __user *)regs->nip;
> -		/* get user regs even if this fault is in kernel mode */
> -		struct pt_regs *uregs = current->thread.regs;
> -		if (uregs == NULL)
> -			return true;
> -
> -		/*
> -		 * A user-mode access to an address a long way below
> -		 * the stack pointer is only valid if the instruction
> -		 * is one which would update the stack pointer to the
> -		 * address accessed if the instruction completed,
> -		 * i.e. either stwu rs,n(r1) or stwux rs,r1,rb
> -		 * (or the byte, halfword, float or double forms).
> -		 *
> -		 * If we don't check this then any write to the area
> -		 * between the last mapped region and the stack will
> -		 * expand the stack rather than segfaulting.
> -		 */
> -		if (address + SIGFRAME_MAX_SIZE >= uregs->gpr[1])
> -			return false;
> -
> -		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
> -		    access_ok(nip, sizeof(*nip))) {
> -			struct ppc_inst inst;
> -
> -			if (!probe_user_read_inst(&inst, nip))
> -				return !store_updates_sp(inst);
> -			*must_retry = true;
> -		}
> -		return true;
> -	}
> -	return false;
> -}
> -
>  #ifdef CONFIG_PPC_MEM_KEYS
>  static bool access_pkey_error(bool is_write, bool is_exec, bool is_pkey,
>  			      struct vm_area_struct *vma)
> @@ -483,7 +400,6 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>  	int is_user = user_mode(regs);
>  	int is_write = page_fault_is_write(error_code);
>  	vm_fault_t fault, major = 0;
> -	bool must_retry = false;
>  	bool kprobe_fault = kprobe_page_fault(regs, 11);
>  
>  	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
> @@ -572,30 +488,15 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>  	vma = find_vma(mm, address);
>  	if (unlikely(!vma))
>  		return bad_area(regs, address);
> -	if (likely(vma->vm_start <= address))
> -		goto good_area;
> -	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
> -		return bad_area(regs, address);
>  
> -	/* The stack is being expanded, check if it's valid */
> -	if (unlikely(bad_stack_expansion(regs, address, vma, flags,
> -					 &must_retry))) {
> -		if (!must_retry)
> +	if (unlikely(vma->vm_start > address)) {
> +		if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
>  			return bad_area(regs, address);
>  
> -		mmap_read_unlock(mm);
> -		if (fault_in_pages_readable((const char __user *)regs->nip,
> -					    sizeof(unsigned int)))
> -			return bad_area_nosemaphore(regs, address);
> -		goto retry;
> +		if (unlikely(expand_stack(vma, address)))
> +			return bad_area(regs, address);
>  	}
>  
> -	/* Try to expand it */
> -	if (unlikely(expand_stack(vma, address)))
> -		return bad_area(regs, address);
> -
> -good_area:
> -
>  #ifdef CONFIG_PPC_MEM_KEYS
>  	if (unlikely(access_pkey_error(is_write, is_exec,
>  				       (error_code & DSISR_KEYFAULT), vma)))
> -- 
> 2.25.1
