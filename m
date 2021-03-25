Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F8349C05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 22:59:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5zXp5tFPz3byf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 08:59:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=E4VyPGq2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=E4VyPGq2; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5zXN0yWdz303J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:59:14 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id l76so3185202pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 14:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Zsnn8pso6szUQsAjCpqSbmAJBJ6ZCI4v7Sc/zsP40o8=;
 b=E4VyPGq2dPub4V6Jjd+TH0ugNkX3Bi4zeaRU2ExF6mC8hqbrhxm3/AsypxRCwWSu5F
 1gvFHxxjSCnfqOgRjxgf4j/S/rGU5WrJTLLPMMYl3dE7w1e9kX0bnmSksoBcnNnihdzq
 U2BpBHfLqQfIGdMPxk4zxTjwEJPk2Dw0JQROE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Zsnn8pso6szUQsAjCpqSbmAJBJ6ZCI4v7Sc/zsP40o8=;
 b=sKhyTNSw/nRuAVqQkXrslmYagxFCAgepQBm/ZnlUwUiO0K6SbAd6vAWRzyU0mPKJqg
 7wwAJct9bXcNKM9tYK41hlfRTS4vyD5Anvk+vUubZ3ObPBh/Z0DH1WajQ7EzdQUL9vip
 jUtGyTEPMIQaYxAK5qa+tmJQ4tSOD7KkEKfdbAYzL04xI4geVkbyCHMP2ijNqABY9MiQ
 dKdCXq2xPQhiPYKrdqeYJwYlKW9kzyhj0qAfU1UyLQcpDxvodrfwBl0j34/Ne8Oxlv8Y
 ba0/fMSLPs3IXcllBzfA4MMLQMhla63NKBUDgXI5eHYnulPAvJ+6n9rKbkQ+Hk1V1xAb
 5WAw==
X-Gm-Message-State: AOAM531T3FwZHmr/PiHSbgJT3rQK9oLnyu1XUCFtUezI8dbP9vIINrnL
 8kBsDqyJXt7It092wEg7bcCsNQ==
X-Google-Smtp-Source: ABdhPJyA2oEKhViwkPh1P5hbZjroAu9KTgv8yWP4Bw8pQhjyp6gxRlSpoKBALiVXJbhObfL1/Cx+pA==
X-Received: by 2002:a17:902:710b:b029:e6:ef44:5c85 with SMTP id
 a11-20020a170902710bb02900e6ef445c85mr11806732pll.34.1616709549479; 
 Thu, 25 Mar 2021 14:59:09 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-5199-f2bf-3cbb-22e6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5199:f2bf:3cbb:22e6])
 by smtp.gmail.com with ESMTPSA id u4sm6631014pfk.131.2021.03.25.14.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 14:59:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 05/15] powerpc/uaccess: Move get_user_instr helpers in
 asm/inst.h
In-Reply-To: <2c6e83581b4fa434aa7cf2fa7714c41e98f57007.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <2c6e83581b4fa434aa7cf2fa7714c41e98f57007.1615398265.git.christophe.leroy@csgroup.eu>
Date: Fri, 26 Mar 2021 08:59:05 +1100
Message-ID: <87a6qqki8m.fsf@dja-thinkpad.axtens.net>
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

> Those helpers use get_user helpers but they don't participate
> in their implementation, so they do not belong to asm/uaccess.h
>
> Move them in asm/inst.h

Hmm, is asm/inst.h the right place for this?

asm/inst.h seems to be entirely concerned with the ppc_inst type:
converting things to and from ppc_inst, print ppc_inst as a string,
dealing with prefixed instructs, etc., etc. The only things currently
that look at memory are the probe_user_read_inst and
probe_kernel_read_inst prototypes...

Having said that, I'm not sure quite where else to put it, and none of
the other places in arch/powerpc/include that currently reference
ppc_inst seem any better...

If we do use asm/inst.h, I think maybe it makes sense to put the
code towards the end rather than at the start, as uses structs and calls
macros that are defined later on in the function.

Kind regards,
Daniel

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/inst.h    | 34 ++++++++++++++++++++++++++++++
>  arch/powerpc/include/asm/uaccess.h | 34 ------------------------------
>  2 files changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index cc73c1267572..19e18af2fac9 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -4,6 +4,40 @@
>  
>  #include <asm/ppc-opcode.h>
>  
> +#ifdef CONFIG_PPC64
> +
> +#define ___get_user_instr(gu_op, dest, ptr)				\
> +({									\
> +	long __gui_ret = 0;						\
> +	unsigned long __gui_ptr = (unsigned long)ptr;			\
> +	struct ppc_inst __gui_inst;					\
> +	unsigned int __prefix, __suffix;				\
> +	__gui_ret = gu_op(__prefix, (unsigned int __user *)__gui_ptr);	\
> +	if (__gui_ret == 0) {						\
> +		if ((__prefix >> 26) == OP_PREFIX) {			\
> +			__gui_ret = gu_op(__suffix,			\
> +				(unsigned int __user *)__gui_ptr + 1);	\
> +			__gui_inst = ppc_inst_prefix(__prefix,		\
> +						     __suffix);		\
> +		} else {						\
> +			__gui_inst = ppc_inst(__prefix);		\
> +		}							\
> +		if (__gui_ret == 0)					\
> +			(dest) = __gui_inst;				\
> +	}								\
> +	__gui_ret;							\
> +})
> +#else /* !CONFIG_PPC64 */
> +#define ___get_user_instr(gu_op, dest, ptr)				\
> +	gu_op((dest).val, (u32 __user *)(ptr))
> +#endif /* CONFIG_PPC64 */
> +
> +#define get_user_instr(x, ptr) \
> +	___get_user_instr(get_user, x, ptr)
> +
> +#define __get_user_instr(x, ptr) \
> +	___get_user_instr(__get_user, x, ptr)
> +
>  /*
>   * Instruction data type for POWER
>   */
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 01aea0df4dd0..eaa828a6a419 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -53,40 +53,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
>  #define __put_user(x, ptr) \
>  	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>  
> -#ifdef CONFIG_PPC64
> -
> -#define ___get_user_instr(gu_op, dest, ptr)				\
> -({									\
> -	long __gui_ret = 0;						\
> -	unsigned long __gui_ptr = (unsigned long)ptr;			\
> -	struct ppc_inst __gui_inst;					\
> -	unsigned int __prefix, __suffix;				\
> -	__gui_ret = gu_op(__prefix, (unsigned int __user *)__gui_ptr);	\
> -	if (__gui_ret == 0) {						\
> -		if ((__prefix >> 26) == OP_PREFIX) {			\
> -			__gui_ret = gu_op(__suffix,			\
> -				(unsigned int __user *)__gui_ptr + 1);	\
> -			__gui_inst = ppc_inst_prefix(__prefix,		\
> -						     __suffix);		\
> -		} else {						\
> -			__gui_inst = ppc_inst(__prefix);		\
> -		}							\
> -		if (__gui_ret == 0)					\
> -			(dest) = __gui_inst;				\
> -	}								\
> -	__gui_ret;							\
> -})
> -#else /* !CONFIG_PPC64 */
> -#define ___get_user_instr(gu_op, dest, ptr)				\
> -	gu_op((dest).val, (u32 __user *)(ptr))
> -#endif /* CONFIG_PPC64 */
> -
> -#define get_user_instr(x, ptr) \
> -	___get_user_instr(get_user, x, ptr)
> -
> -#define __get_user_instr(x, ptr) \
> -	___get_user_instr(__get_user, x, ptr)
> -
>  extern long __put_user_bad(void);
>  
>  #define __put_user_size(x, ptr, size, retval)			\
> -- 
> 2.25.0
