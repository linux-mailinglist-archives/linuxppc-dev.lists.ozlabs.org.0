Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F93FC249
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 08:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzGmm3FxVz2yHD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 16:02:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=DUSY685M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=DUSY685M; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzGm33mQDz2xgx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 16:01:36 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so1180727pjr.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PVdJWAW4gV+l3crQVW3zm26y90XFf8SFud15h5boB9k=;
 b=DUSY685Mt6bD+78O+cuR0kSOvujYkzK0h6LdWW4l6nGhPWG+gnKZ9IdAmhm07pfq9l
 KmyQYhBx9Hed9oiHmzlk3uPA+qnoR/HSQD8nZFZNPmnUwv8UlrzJh2wRXHc3q9EGsgiS
 ovJMSv0vXjoDkHX3E43PSwfjU5Z+UGRoGP/4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PVdJWAW4gV+l3crQVW3zm26y90XFf8SFud15h5boB9k=;
 b=U72cBuiJPXOOPA+dnKmev/7/Uoz3ZS2GCz9BARZZQkUxLetFX3BO7y9xcorUotD+1A
 I6Btewk5AHzDQLBo6XQBPLsabglveT/TxRv6NFRG5DdtMU+SvEsMHNZXKNWcrQj6nhBH
 5hy+zLTeJDVlPJRZU/vH9HGPKjOtO949lIDoDUN7ckw5yvPNoNrt9fpZo9iKjHhkioht
 1tYcKidymn5H9yncvUnC/izAdhWo2v8erzqSv/xOy24b5L6KUwZaksaNHD2Dr36Qoder
 1lqjKSBlg1rk34607BbigUouhMt64x7UToYeAA7yTzUVq2qENuGiE8E+38a2rk//+m/Q
 RSHQ==
X-Gm-Message-State: AOAM532BoybDZxONlU0EGsc9izRpoteTapCgszGB3f1vL+AqxtK0/wg8
 GV2HaGFmTi79/J6N8TQr3HPhig==
X-Google-Smtp-Source: ABdhPJxaHoEhY6NhIKPUuvmwa4U6i7dWA5wABSMPHCCtui5n6whegr42jU1T5IiZawYrOWc5TX+b9g==
X-Received: by 2002:a17:90a:168f:: with SMTP id
 o15mr3495765pja.158.1630389693272; 
 Mon, 30 Aug 2021 23:01:33 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:a664:ffe7:ee94:4600])
 by smtp.gmail.com with ESMTPSA id r15sm12914731pfh.45.2021.08.30.23.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:01:32 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: CGEL <cgel.zte@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next] power:pkeys: fix bugon.cocci warnings
In-Reply-To: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
References: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
Date: Tue, 31 Aug 2021 16:01:29 +1000
Message-ID: <87lf4i6tl2.fsf@dja-thinkpad.axtens.net>
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
Cc: Zeal Robot <zealci@zte.com.cn>, Jing Yangyang <jing.yangyang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jing,

Thanks for your patch.

The patch looks good, but looking at the output of `make coccicheck
M=arch/powerpc MODE=report`, it looks like there might be a few other
things that we might want to fix. Would it be worth trying to make the
arch/powerpc directory free from coccinelle warnings in one big patch
series, and then we could add coccicheck to our automatic patch testing?
(see
e.g. https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210825064228.70487-1-deng.changcheng@zte.com.cn/ )

For this patch, I think we should try to fix all of arch/powerpc at the
same time. The check points out the following other possible uses of
BUG_ON:

arch/powerpc/include/asm/book3s/64/pgtable-64k.h:68:2-5: WARNING: Use BUG_ON instead of if condition followed by BUG.
Please make sure the condition has no side effects (see conditional BUG_ON definition in include/asm-generic/bug.h)
arch/powerpc/platforms/cell/spufs/sched.c:908:2-5: WARNING: Use BUG_ON instead of if condition followed by BUG.
Please make sure the condition has no side effects (see conditional BUG_ON definition in include/asm-generic/bug.h)
arch/powerpc/platforms/powernv/idle.c:968:3-6: WARNING: Use BUG_ON instead of if condition followed by BUG.
Please make sure the condition has no side effects (see conditional BUG_ON definition in include/asm-generic/bug.h)
arch/powerpc/platforms/powernv/idle.c:456:2-5: WARNING: Use BUG_ON instead of if condition followed by BUG.
Please make sure the condition has no side effects (see conditional BUG_ON definition in include/asm-generic/bug.h)

Kind regards,
Daniel


> Use BUG_ON instead of a if condition followed by BUG.
>
> ./arch/powerpc/include/asm/book3s/64/pkeys.h:21:2-5:WARNING
> Use BUG_ON instead of if condition followed by BUG.
> ./arch/powerpc/include/asm/book3s/64/pkeys.h:14:2-5:WARNING
> Use BUG_ON instead of if condition followed by BUG.
>
> Generated by: scripts/coccinelle/misc/bugon.cocci
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>  arch/powerpc/include/asm/book3s/64/pkeys.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
> index 5b17813..5f74f0c 100644
> --- a/arch/powerpc/include/asm/book3s/64/pkeys.h
> +++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
> @@ -10,15 +10,13 @@ static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
>  	if (!mmu_has_feature(MMU_FTR_PKEY))
>  		return 0x0UL;
>  
> -	if (radix_enabled())
> -		BUG();
> +	BUG_ON(radix_enabled());
>  	return hash__vmflag_to_pte_pkey_bits(vm_flags);
>  }
>  
>  static inline u16 pte_to_pkey_bits(u64 pteflags)
>  {
> -	if (radix_enabled())
> -		BUG();
> +	BUG_ON(radix_enabled());
>  	return hash__pte_to_pkey_bits(pteflags);
>  }
>  
> -- 
> 1.8.3.1
