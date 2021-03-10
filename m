Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBDB334BAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 23:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwn6X2fNNz3cmd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 09:38:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=fYiRkguL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=fYiRkguL; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwn671ckXz2yjc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 09:38:04 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id n17so5671733plc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 14:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vdgzodRSWfNhGM8VPFd/UsTlNz1345gfROvRb6Mdp88=;
 b=fYiRkguLYR9gI7K653568ljx9K5Kmt/31qXsve7RFwjKVMASrwnsP9NqLdSKS69WZt
 1jc10+ViM3PvDKUOnhAed7HOO2+7cKgneaZHetB2HahWj89T3/4OQSaiZS2puMJ9Hp0z
 yGOM0VwzTYf3sbTcb/mSe+f4O1v0W64jEuLJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vdgzodRSWfNhGM8VPFd/UsTlNz1345gfROvRb6Mdp88=;
 b=sPDgspnWNwRs5SPQnEi/O1yDZrubS0Xtfp1XV7ZsWYf+W1yJAMRyQy2BMMeXdSfKyA
 CdmWOksxiM5H5S8vZnKqfgUYMaadq43Wr7NYT4ozjr1cuhzK0GiTXFVGpATTLf3ASfFX
 nz/H0d7MJIuWulPdL0uiz1uFCFkVJdipIaFcRRdCed10szRNO+Uk1B8/kEWubPU/xOMq
 yTHQ3PdA6FMMydf/eqEN94KbtAc2nX71+2Lt1c8XKHOMd02Zn0w5a+1sLdflseD1UjH7
 Ri52sa91cvcSlqMI+yTXgz7Jp7y0pEYFfKXb+HsSpk0HcRU7BQTFiP40RkOnwUmvaGRa
 nXHA==
X-Gm-Message-State: AOAM532tUOjSFUQxavpFiLounfaWWogTjcfG540N6J7xlFQd7oEdKykj
 7FcqyT9km2Jf2j+4Gr4hrz331Q==
X-Google-Smtp-Source: ABdhPJyM2/5tmd6RlXWtl0FYclxXwR5Zp+Wy35WLnF72q0GDAKZcC3p4vAgqB8hmyvaiZ1t+rUPgVA==
X-Received: by 2002:a17:903:2304:b029:e6:24a8:3d00 with SMTP id
 d4-20020a1709032304b02900e624a83d00mr4797051plh.39.1615415881782; 
 Wed, 10 Mar 2021 14:38:01 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-0e28-c46d-f4e0-67e7.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:e28:c46d:f4e0:67e7])
 by smtp.gmail.com with ESMTPSA id a15sm335881pju.34.2021.03.10.14.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 14:38:01 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 04/15] powerpc/uaccess: Remove __get/put_user_inatomic()
In-Reply-To: <1e5c895669e8d54a7810b62dc61eb111f33c2c37.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <1e5c895669e8d54a7810b62dc61eb111f33c2c37.1615398265.git.christophe.leroy@csgroup.eu>
Date: Thu, 11 Mar 2021 09:37:58 +1100
Message-ID: <87zgzabpo9.fsf@dja-thinkpad.axtens.net>
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

Hi Christophe,

> Powerpc is the only architecture having _inatomic variants of
> __get_user() and __put_user() accessors. They were introduced
> by commit e68c825bb016 ("[POWERPC] Add inatomic versions of __get_user
> and __put_user").
>
> Those variants expand to the _nosleep macros instead of expanding
> to the _nocheck macros. The only difference between the _nocheck
> and the _nosleep macros is the call to might_fault().
>
> Since commit 662bbcb2747c ("mm, sched: Allow uaccess in atomic with
> pagefault_disable()"), __get/put_user() can be used in atomic parts
> of the code, therefore __get/put_user_inatomic() have become useless.
>
> Remove __get_user_inatomic() and __put_user_inatomic().
>

This makes much more sense, thank you!

Simplifying uaccess.h is always good to me :)

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/uaccess.h            | 37 -------------------
>  .../kernel/hw_breakpoint_constraints.c        |  2 +-
>  arch/powerpc/kernel/traps.c                   |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
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
