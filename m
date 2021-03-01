Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04383294F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 23:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqFfD5dh5z3cy4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:43:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=brUBn8I+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=brUBn8I+; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqFdn2ZXCz2xxy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 09:42:50 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id g20so10847327plo.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Mar 2021 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=eE+wCAbXzOx+xliJRDgITRoOiejbPuH1lpWx1d+n1NY=;
 b=brUBn8I+68ODAQC8lx6Is9c63sYftvC5y0bh9EXjpzfI3qhxHMDodUgbLgV2F15MIC
 KWhMvu/Mif83OOkvSfYZWC19yQvB5chwZFW+rovHLkCCZOWXjo52se4GtMPgr+dDSRdu
 kXyThvEaji1xdUSQv00yfGQphIc8cIr/0SFZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eE+wCAbXzOx+xliJRDgITRoOiejbPuH1lpWx1d+n1NY=;
 b=K1Hf0oJQFTKe7m7zwpNtCgVHyN6GS/0oc4isRia2ytZ+/jfrTxLO8zNme5xVJtcPss
 YDw51vVfCLxloRJHsuutJaRPhF2wqJ0p1TBuZB8iBEnrLj8YEXKbkegjoBZQAt51k5/m
 AyazVgop/jRRFFSLPZknq2nRTOOhVNtH59zxfTSjEQn0rXL6ggIT505WIjUultQpzMlZ
 ZhCB8wzX6SuQtVmDJWzF5wjn4ZFHFGhuG+Mghwe63GDKx6qESNljLNhssjeyejnW7I/T
 br6/WiBjkcTn0JPkQzsKM4AMwMzUwm/XOcubkGC1sru3zy65owc6bQYdeci5azujRu2S
 yieQ==
X-Gm-Message-State: AOAM533jeZi/zhNwSit/cOLieepejewNh1BmztphHyAiJhasjsD8ocUh
 I99pO+v2Q/gIFLcjeT8DuP18GA==
X-Google-Smtp-Source: ABdhPJz8LFXwIKs1W4H053Y5SQ5igvDhUTQUrlfpgjg2cnBDqR7E6oznRP9QHBuryEtXHgxnPGMa+Q==
X-Received: by 2002:a17:902:7404:b029:e4:503b:f83d with SMTP id
 g4-20020a1709027404b02900e4503bf83dmr763396pll.35.1614638567557; 
 Mon, 01 Mar 2021 14:42:47 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-b18e-89be-e1b2-4959.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b18e:89be:e1b2:4959])
 by smtp.gmail.com with ESMTPSA id o65sm17286437pfg.44.2021.03.01.14.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 14:42:47 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 03/15] powerpc/uaccess: Remove __get/put_user_inatomic()
In-Reply-To: <8732e0c78400c99ec418323ab6b0853b91752be4.1614275314.git.christophe.leroy@csgroup.eu>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
 <8732e0c78400c99ec418323ab6b0853b91752be4.1614275314.git.christophe.leroy@csgroup.eu>
Date: Tue, 02 Mar 2021 09:42:44 +1100
Message-ID: <87czwio5qz.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Since commit 662bbcb2747c ("mm, sched: Allow uaccess in atomic with
> pagefault_disable()"), __get/put_user() can be used in atomic parts
> of the code, therefore the __get/put_user_inatomic() introduced
> by commit e68c825bb016 ("[POWERPC] Add inatomic versions of __get_user
> and __put_user") have become useless.

I spent some time chasing these macro definitions.

Let me see if I understand you.

__get_user(x, ptr) becomes __get_user_nocheck(..., true)
__get_user_inatomic() become __get_user_nosleep()

The difference between how __get_user_nosleep() and
__get_user_nocheck(..., true) operate is that __get_user_nocheck calls
might_fault() and __get_user_nosleep() does not.

If I understand the commit you reference and mm/memory.c, you're saying
that we can indeed call might_fault() when page faults are disabled,
because __might_fault() checks if page faults are disabled and does not
fire a warning if it is called with page faults disabled.

Therefore, it is safe to remove our _inatomic version that does not call
might_fault and just to call might_fault unconditionally.

Is that right?

I haven't checked changes you made to the various .c files in fine
detail but they appear to be entirely mechanical.

> powerpc is the only one having such functions. There is a real
> intention not to have to provide such _inatomic() helpers, see the
> comment in might_fault() in mm/memory.c introduced by
> commit 3ee1afa308f2 ("x86: some lock annotations for user
> copy paths, v2"):
>
> 	/*
> 	 * it would be nicer only to annotate paths which are not under
> 	 * pagefault_disable, however that requires a larger audit and
> 	 * providing helpers like get_user_atomic.
> 	 */
>

I'm not fully sure I understand what you're saying in this part of the
commit message.

Kind regards,
Daniel

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/uaccess.h            | 37 -------------------
>  arch/powerpc/kernel/align.c                   | 32 ++++++++--------
>  .../kernel/hw_breakpoint_constraints.c        |  2 +-
>  arch/powerpc/kernel/traps.c                   |  2 +-
>  4 files changed, 18 insertions(+), 55 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index a08c482b1315..01aea0df4dd0 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -53,11 +53,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
>  #define __put_user(x, ptr) \
>  	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>  
> -#define __get_user_inatomic(x, ptr) \
> -	__get_user_nosleep((x), (ptr), sizeof(*(ptr)))
> -#define __put_user_inatomic(x, ptr) \
> -	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> -
>  #ifdef CONFIG_PPC64
>  
>  #define ___get_user_instr(gu_op, dest, ptr)				\
> @@ -92,9 +87,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
>  #define __get_user_instr(x, ptr) \
>  	___get_user_instr(__get_user, x, ptr)
>  
> -#define __get_user_instr_inatomic(x, ptr) \
> -	___get_user_instr(__get_user_inatomic, x, ptr)
> -
>  extern long __put_user_bad(void);
>  
>  #define __put_user_size(x, ptr, size, retval)			\
> @@ -141,20 +133,6 @@ __pu_failed:							\
>  	__pu_err;							\
>  })
>  
> -#define __put_user_nosleep(x, ptr, size)			\
> -({								\
> -	long __pu_err;						\
> -	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
> -	__typeof__(*(ptr)) __pu_val = (x);			\
> -	__typeof__(size) __pu_size = (size);			\
> -								\
> -	__chk_user_ptr(__pu_addr);				\
> -	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
> -								\
> -	__pu_err;						\
> -})
> -
> -
>  /*
>   * We don't tell gcc that we are accessing memory, but this is OK
>   * because we do not write to any memory gcc knows about, so there
> @@ -320,21 +298,6 @@ do {								\
>  	__gu_err;							\
>  })
>  
> -#define __get_user_nosleep(x, ptr, size)			\
> -({								\
> -	long __gu_err;						\
> -	__long_type(*(ptr)) __gu_val;				\
> -	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
> -	__typeof__(size) __gu_size = (size);			\
> -								\
> -	__chk_user_ptr(__gu_addr);				\
> -	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
> -	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> -								\
> -	__gu_err;						\
> -})
> -
> -
>  /* more complex routines */
>  
>  extern unsigned long __copy_tofrom_user(void __user *to,
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index c7797eb958c7..83b199026a1e 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -174,18 +174,18 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
>  
>  		switch (nb) {
>  		case 8:
> -			ret |= __get_user_inatomic(temp.v[0], p++);
> -			ret |= __get_user_inatomic(temp.v[1], p++);
> -			ret |= __get_user_inatomic(temp.v[2], p++);
> -			ret |= __get_user_inatomic(temp.v[3], p++);
> +			ret |= __get_user(temp.v[0], p++);
> +			ret |= __get_user(temp.v[1], p++);
> +			ret |= __get_user(temp.v[2], p++);
> +			ret |= __get_user(temp.v[3], p++);
>  			fallthrough;
>  		case 4:
> -			ret |= __get_user_inatomic(temp.v[4], p++);
> -			ret |= __get_user_inatomic(temp.v[5], p++);
> +			ret |= __get_user(temp.v[4], p++);
> +			ret |= __get_user(temp.v[5], p++);
>  			fallthrough;
>  		case 2:
> -			ret |= __get_user_inatomic(temp.v[6], p++);
> -			ret |= __get_user_inatomic(temp.v[7], p++);
> +			ret |= __get_user(temp.v[6], p++);
> +			ret |= __get_user(temp.v[7], p++);
>  			if (unlikely(ret))
>  				return -EFAULT;
>  		}
> @@ -259,18 +259,18 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
>  		p = addr;
>  		switch (nb) {
>  		case 8:
> -			ret |= __put_user_inatomic(data.v[0], p++);
> -			ret |= __put_user_inatomic(data.v[1], p++);
> -			ret |= __put_user_inatomic(data.v[2], p++);
> -			ret |= __put_user_inatomic(data.v[3], p++);
> +			ret |= __put_user(data.v[0], p++);
> +			ret |= __put_user(data.v[1], p++);
> +			ret |= __put_user(data.v[2], p++);
> +			ret |= __put_user(data.v[3], p++);
>  			fallthrough;
>  		case 4:
> -			ret |= __put_user_inatomic(data.v[4], p++);
> -			ret |= __put_user_inatomic(data.v[5], p++);
> +			ret |= __put_user(data.v[4], p++);
> +			ret |= __put_user(data.v[5], p++);
>  			fallthrough;
>  		case 2:
> -			ret |= __put_user_inatomic(data.v[6], p++);
> -			ret |= __put_user_inatomic(data.v[7], p++);
> +			ret |= __put_user(data.v[6], p++);
> +			ret |= __put_user(data.v[7], p++);
>  		}
>  		if (unlikely(ret))
>  			return -EFAULT;
> diff --git a/arch/powerpc/kernel/hw_breakpoint_constraints.c b/arch/powerpc/kernel/hw_breakpoint_constraints.c
> index 867ee4aa026a..675d1f66ab72 100644
> --- a/arch/powerpc/kernel/hw_breakpoint_constraints.c
> +++ b/arch/powerpc/kernel/hw_breakpoint_constraints.c
> @@ -141,7 +141,7 @@ void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
>  {
>  	struct instruction_op op;
>  
> -	if (__get_user_instr_inatomic(*instr, (void __user *)regs->nip))
> +	if (__get_user_instr(*instr, (void __user *)regs->nip))
>  		return;
>  
>  	analyse_instr(&op, regs, *instr);
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 1583fd1c6010..1fa36bd08efe 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -864,7 +864,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
>  	unsigned long ea, msr, msr_mask;
>  	bool swap;
>  
> -	if (__get_user_inatomic(instr, (unsigned int __user *)regs->nip))
> +	if (__get_user(instr, (unsigned int __user *)regs->nip))
>  		return;
>  
>  	/*
> -- 
> 2.25.0
