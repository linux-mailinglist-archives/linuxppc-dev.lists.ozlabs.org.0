Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0494122B12A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:21:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCDz62lw0zDqX1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 00:21:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCDlW55BFzDrQY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 00:11:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=g5vyr8Pl; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BCDlV5trkz8t1H
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 00:11:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BCDlV5GDjz9sW2; Fri, 24 Jul 2020 00:11:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=g5vyr8Pl; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BCDlV2qNbz9sVx
 for <linuxppc-dev@ozlabs.org>; Fri, 24 Jul 2020 00:11:18 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u185so3087264pfu.1
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Jul 2020 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ysWuWF6gqJ2pHJaZJm1QwqnHU9OdxaAIZL3B1hN90eM=;
 b=g5vyr8Pl/p/lEI7Y8guC1W1L4781mToGXliNVuzvXS0kFNtodOXVVvsX1yFSlPNR5I
 hwrVEzMo9wIA3sm4LFYqkFqkqTcNlWLqGv4I0S64Jr0XpAY0Nj+GUWZugKttc86psCYR
 cXy1suut9ECSC8XV0aPk7bp2Fo+3oL7Kp5kEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ysWuWF6gqJ2pHJaZJm1QwqnHU9OdxaAIZL3B1hN90eM=;
 b=cdj+bZRg00NY8InQblDhjFodprCuk9qVFe/mYDT68cC08pnwG0Dt9YWGgw64Wq9gxC
 wI99YMCz0saC+51MVimFCBIgko3xif1yVpKw7gu99BDDYa6q6xGkMRRd4TmSUVMlI1VE
 Pr+21n5esI8J9iAogmxF5DYc6oMTDxjf1rRtStNUsZYCPCDc4KHUxn7HI3UQdlD06+3J
 uwaLDxpPxhSLGOww309TphIAsoZWFxB3O5TLEg1Z1wXILKzDdk0BpS412FNNusINeXd9
 GBGCDrWezpBeL1MnOkfB3g2YB+ePBTCvm7fStL2UsBvqlsuFqYrDHtrrtti2367ngt6s
 ReDA==
X-Gm-Message-State: AOAM531LKd4JeW7NwtLfiPaqJRHyurezlLp/m8e5KdohC8rGQtEUWJVQ
 a2KCZxjzB5J4ddI8bPIRuW/PlQ==
X-Google-Smtp-Source: ABdhPJz4p+KRDLB+MZxus77/edll9JJWc9jVmufPxWveQCofgvnnK+IJ9fSnEeHcIcq6nicvT2wK7Q==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr4209245pgk.434.1595513476033; 
 Thu, 23 Jul 2020 07:11:16 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-8915-8b02-da60-7583.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:8915:8b02:da60:7583])
 by smtp.gmail.com with ESMTPSA id l4sm2893791pjr.46.2020.07.23.07.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 07:11:15 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [RFC PATCH 4/5] powerpc/mm: Remove custom stack expansion checking
In-Reply-To: <20200703141327.1732550-4-mpe@ellerman.id.au>
References: <20200703141327.1732550-1-mpe@ellerman.id.au>
 <20200703141327.1732550-4-mpe@ellerman.id.au>
Date: Fri, 24 Jul 2020 00:11:12 +1000
Message-ID: <878sfatj7j.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-arch@vger.kernel.org, hughd@google.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

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

I applied and tested this. While I wouldn't call my testing
comprehensive, I have not been able to reproduce the crash with this
patch applied.

Kind regards,
Daniel


> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/fault.c | 106 ++--------------------------------------
>  1 file changed, 5 insertions(+), 101 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index ed01329dd12b..925a7231abb3 100644
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
> @@ -267,54 +235,6 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>  	return false;
>  }
>  
> -static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
> -				struct vm_area_struct *vma, unsigned int flags,
> -				bool *must_retry)
> -{
> -	/*
> -	 * N.B. The POWER/Open ABI allows programs to access up to
> -	 * 288 bytes below the stack pointer.
> -	 * The kernel signal delivery code writes up to 4KB
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
> -		if (address + 4096 >= uregs->gpr[1])
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
> @@ -480,7 +400,6 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>  	int is_user = user_mode(regs);
>  	int is_write = page_fault_is_write(error_code);
>  	vm_fault_t fault, major = 0;
> -	bool must_retry = false;
>  	bool kprobe_fault = kprobe_page_fault(regs, 11);
>  
>  	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
> @@ -569,30 +488,15 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
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
