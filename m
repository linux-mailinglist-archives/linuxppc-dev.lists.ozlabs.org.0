Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B4349C61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 23:38:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F60Pp478Wz3bdG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 09:38:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=pwSvIdTn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=pwSvIdTn; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F60PN3bxYz302v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 09:38:13 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id l123so3522153pfl.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Viesl3SOA9sAZGG5g0Ymx9V0nEVwiaBaiNca5kFC9o8=;
 b=pwSvIdTnB7b/1ewr28GnoTMJXrr/H5Wz4XefWScNSUkL5Q6L48PeXORJqnI248uDqL
 3QtwtPAXPAqEqb8f7aNgX4uRL0zQwhAxx1Bn1/l8FeiuLWT18kD118mrn+xOFa7DgOFv
 f9Ikp0x6WLkQXXEZaW/fkYrG4aZqAZm7H0sEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Viesl3SOA9sAZGG5g0Ymx9V0nEVwiaBaiNca5kFC9o8=;
 b=BQNvSkEZFMSupbxgdtDU4BovBZR3/SEIX3UhC6GEEp6jr4XHWW0Jz5RU5i03npJTn3
 JsZFeY0+ULBTOcRMb5TuYPvICZy2otvrHKyRd0Ep9a35RLTB2F8ISNARMtDkvGCJXWtz
 Q8LR9NhSq+eO6kHfK2xy/i/yYuuGlvfOHA1ct5JfziBzwxo/c3yPkoQRlFv8xkvQjncA
 pTWGpbivovup811iEaIPqm/2UvH8K2ai/PSvBN+8CO2exCrJkDZT/sjXsjs0j8KcQOGu
 wtpwCPg/JBmcLbN/UwH1Wbxjv/Ypmn6b08VzfmcVAvLTLB6WTzjmNDBpcbwBXU59pNNN
 scRg==
X-Gm-Message-State: AOAM533FIV/RWttMXYRE5lWW2NUoPrDEnitAVJdeo5t61CeYGrpb2RLg
 9ck3ZEt3D/1Q0K6uPXhELhbFQA==
X-Google-Smtp-Source: ABdhPJzRrJ1fg4o+4Go+a298DfimH7DXQEYRGCVuiqNmf/2spTGSN4+X4ZxN4tP+YBk/Il6g6gnTsw==
X-Received: by 2002:aa7:99c6:0:b029:1f5:c49d:dce7 with SMTP id
 v6-20020aa799c60000b02901f5c49ddce7mr9617426pfi.78.1616711890452; 
 Thu, 25 Mar 2021 15:38:10 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-5199-f2bf-3cbb-22e6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5199:f2bf:3cbb:22e6])
 by smtp.gmail.com with ESMTPSA id i10sm8143257pgo.75.2021.03.25.15.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 15:38:10 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 07/15] powerpc/uaccess: Call might_fault()
 inconditionaly
In-Reply-To: <e0a980a4dc7a2551183dd5cb30f46eafdbee390c.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <e0a980a4dc7a2551183dd5cb30f46eafdbee390c.1615398265.git.christophe.leroy@csgroup.eu>
Date: Fri, 26 Mar 2021 09:38:07 +1100
Message-ID: <874kgykgfk.fsf@dja-thinkpad.axtens.net>
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

> Commit 6bfd93c32a50 ("powerpc: Fix incorrect might_sleep in
> __get_user/__put_user on kernel addresses") added a check to not call
> might_sleep() on kernel addresses. This was to enable the use of
> __get_user() in the alignment exception handler for any address.
>
> Then commit 95156f0051cb ("lockdep, mm: fix might_fault() annotation")
> added a check of the address space in might_fault(), based on
> set_fs() logic. But this didn't solve the powerpc alignment exception
> case as it didn't call set_fs(KERNEL_DS).
>
> Nowadays, set_fs() is gone, previous patch fixed the alignment
> exception handler and __get_user/__put_user are not supposed to be
> used anymore to read kernel memory.
>
> Therefore the is_kernel_addr() check has become useless and can be
> removed.

While I agree that __get_user/__put_user should not be used on kernel
memory, I'm not sure that we have covered every case where they might be
used on kernel memory yet. I did a git grep for __get_user - there are
several callers in arch/powerpc and it looks like at least lib/sstep.c
might be using __get_user to read kernel memory while single-stepping.

I am not sure if might_sleep has got logic to cover the powerpc case -
it uses uaccess_kernel, but we don't supply a definition for that on
powerpc, so if we do end up calling __get_user on a kernel address, I
think we might now throw a warning. (Unless we are saved by
pagefault_disabled()?)

(But I haven't tested this yet, so it's possible I misunderstood
something.)

Do you expect any consequences if we've missed a case where
__(get|put)_user is called on a kernel address because it hasn't been
converted to use better helpers yet?

Kind regards,
Daniel

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/uaccess.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index eaa828a6a419..c4bbc64758a0 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -77,8 +77,7 @@ __pu_failed:							\
>  	__typeof__(*(ptr)) __pu_val = (x);			\
>  	__typeof__(size) __pu_size = (size);			\
>  								\
> -	if (!is_kernel_addr((unsigned long)__pu_addr))		\
> -		might_fault();					\
> +	might_fault();						\
>  	__chk_user_ptr(__pu_addr);				\
>  	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err);	\
>  								\
> @@ -238,12 +237,12 @@ do {								\
>  	__typeof__(size) __gu_size = (size);			\
>  								\
>  	__chk_user_ptr(__gu_addr);				\
> -	if (do_allow && !is_kernel_addr((unsigned long)__gu_addr)) \
> +	if (do_allow) {								\
>  		might_fault();					\
> -	if (do_allow)								\
>  		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
> -	else									\
> +	} else {									\
>  		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
> +	}									\
>  	(x) = (__typeof__(*(ptr)))__gu_val;			\
>  								\
>  	__gu_err;						\
> -- 
> 2.25.0
