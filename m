Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF07318C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 16:24:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tyKH2Df4zDqP5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 00:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tyGT3t7BzDqCM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 00:22:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="S/RZMMQT"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45tyGT2CNBz8sxB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 00:22:09 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45tyGT1jNFz9sBZ; Thu, 25 Jul 2019 00:22:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="S/RZMMQT"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45tyGS6s1Bz9s8m
 for <linuxppc-dev@ozlabs.org>; Thu, 25 Jul 2019 00:22:07 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id w24so22080384plp.2
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Jul 2019 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TsvF6gMlarlMCvq4Ol72LgeUXJwNy8VMRhpgIz3/Ho4=;
 b=S/RZMMQT5J2NfDBmL2ZKpf3BuXyaqu+M2mejR2KVj/LTbDmS7sWyJ/KFkSJN0GOJvM
 Jo51eYbaQY89ZT6RsuTh7KI/HqJ+uZmqs3BGwdJgUuhUclW1yeHgWPoo09tHiGRC4E7a
 otxkE+hPKTXOhAL66F+SIrvvVMsTO6T6m3crSPO3mU9kGku+Z8nwifvMRs0XCEBEGNut
 IsHmo+PnPS6ugFLexahQAyNXhN2LPHvH2r0LkpY2xe8EDCI6QO1rXLwVaj2pw9S/Iw0h
 thx8BCsm+4ub65qs9MK+rIYCqg3w3CjxX+lhirCYQQVOow8lWQlTWRr+ynovMUd6VF1Q
 1bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TsvF6gMlarlMCvq4Ol72LgeUXJwNy8VMRhpgIz3/Ho4=;
 b=UMRV8uMFnmj0b9Mf/2H5/o/jlHlXgK4Dtp8+MvMkqAE1XZDWPtT5C0oP5s0gDNkkZX
 hmY98213sPvdBOlY9Su6IGtJERLMrB+BwrsdueTQCsioRh1MgGhwY5Iokqn/DD+9qjQp
 5HYnlb5ETfHnIBPsQ/i7nv5GVP1J+O0bk7B69t+1BFZbDj3yFed2sNgy9/oJEh4csenK
 oC3pg1Rl2mkTGS8CKfPQRzL2Ryt5UfGy/vasdI3WJamAunh4XdzF8VLOF3LM01XcOpsL
 9051bIM96H964LjHSRZc1Et1cm2xb5dnO9r0lCHpFrPT6/1SGcPCV9l3NlNyOPnTtxoY
 /bDQ==
X-Gm-Message-State: APjAAAUvWk58cm4qBRC30evl6E94XF+//vrk8wPxdTV39UPwBJdAECsE
 SDhc4v4PI+Jpd9Y5YFrBXUI=
X-Google-Smtp-Source: APXvYqyzpTeFD6mUN5tbsvb9OTguocp51aldoBULkkclWfbGIM2of9+cJaQMVN/OBorYzdl5LvXyqw==
X-Received: by 2002:a17:902:9a42:: with SMTP id
 x2mr87031475plv.106.1563978124596; 
 Wed, 24 Jul 2019 07:22:04 -0700 (PDT)
Received: from brauner.io ([172.58.27.54])
 by smtp.gmail.com with ESMTPSA id f6sm48434494pga.50.2019.07.24.07.22.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 07:22:03 -0700 (PDT)
Date: Wed, 24 Jul 2019 16:21:57 +0200
From: Christian Brauner <christian@brauner.io>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Wire up clone3 syscall
Message-ID: <20190724142155.ybrchvuhybvr64hx@brauner.io>
References: <20190724140259.23554-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190724140259.23554-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@ozlabs.org, asolokha@kb.kras.ru, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 12:02:59AM +1000, Michael Ellerman wrote:
> Wire up the new clone3 syscall added in commit 7f192e3cd316 ("fork:
> add clone3").
> 
> This requires a ppc_clone3 wrapper, in order to save the non-volatile
> GPRs before calling into the generic syscall code. Otherwise we hit
> the BUG_ON in CHECK_FULL_REGS in copy_thread().
> 
> Lightly tested using Christian's test code on a Power8 LE VM.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Christian Brauner <christian@brauner.io>

> ---
>  arch/powerpc/include/asm/unistd.h        | 1 +
>  arch/powerpc/kernel/entry_32.S           | 8 ++++++++
>  arch/powerpc/kernel/entry_64.S           | 5 +++++
>  arch/powerpc/kernel/syscalls/syscall.tbl | 1 +
>  4 files changed, 15 insertions(+)
> 
> v2: Add the wrapper for 32-bit as well, don't allow SPU programs to call
>     clone3 (switch ABI to nospu).
> 
> v1: https://lore.kernel.org/r/20190722132231.10169-1-mpe@ellerman.id.au
> 
> diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
> index 68473c3c471c..b0720c7c3fcf 100644
> --- a/arch/powerpc/include/asm/unistd.h
> +++ b/arch/powerpc/include/asm/unistd.h
> @@ -49,6 +49,7 @@
>  #define __ARCH_WANT_SYS_FORK
>  #define __ARCH_WANT_SYS_VFORK
>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_SYS_CLONE3
>  
>  #endif		/* __ASSEMBLY__ */
>  #endif /* _ASM_POWERPC_UNISTD_H_ */
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 85fdb6d879f1..54fab22c9a43 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -597,6 +597,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
>  	stw	r0,_TRAP(r1)		/* register set saved */
>  	b	sys_clone
>  
> +	.globl	ppc_clone3
> +ppc_clone3:
> +	SAVE_NVGPRS(r1)
> +	lwz	r0,_TRAP(r1)
> +	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
> +	stw	r0,_TRAP(r1)		/* register set saved */
> +	b	sys_clone3
> +
>  	.globl	ppc_swapcontext
>  ppc_swapcontext:
>  	SAVE_NVGPRS(r1)
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index d9105fcf4021..0a0b5310f54a 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -487,6 +487,11 @@ _GLOBAL(ppc_clone)
>  	bl	sys_clone
>  	b	.Lsyscall_exit
>  
> +_GLOBAL(ppc_clone3)
> +       bl      save_nvgprs
> +       bl      sys_clone3
> +       b       .Lsyscall_exit
> +
>  _GLOBAL(ppc32_swapcontext)
>  	bl	save_nvgprs
>  	bl	compat_sys_swapcontext
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
> index f2c3bda2d39f..43f736ed47f2 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -516,3 +516,4 @@
>  432	common	fsmount				sys_fsmount
>  433	common	fspick				sys_fspick
>  434	common	pidfd_open			sys_pidfd_open
> +435	nospu	clone3				ppc_clone3
> -- 
> 2.20.1
> 
