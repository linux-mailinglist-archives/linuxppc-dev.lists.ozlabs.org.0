Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DDA700CA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 18:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHtzn6Ghnz3fYN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 02:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vHsBiI9/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vHsBiI9/;
	dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHtyt3N35z3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 02:10:29 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-331430faba8so20660975ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683907824; x=1686499824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0UJ2m9D/uUbhV+yi63iViM82oPaAy45wfjsXlqa/O0=;
        b=vHsBiI9/IqcbmwFQjaWNUAoZRwlts69uO8i1/axiFNPYLeEQpPhF5hEHtQbg4sQvEY
         7qt1MtouudMrJex4/Ijk3J4jtr7RR0EAMH1tbLXfA1kY/fQCPPPGHzZT/f/aOgVAGbdW
         S6crtmROnC9UYps+GgukUGf+zMAD+1VBg+Pu20OAmzGT8ZoGwvOLBX1utJa6KdZjv70N
         m0SZ6pZ7COnOyfFAkO1+LL6PFV+oxsHhScH737o5G8qH5JWS65ZmEHE8P2dwlDC92JJP
         Inrne5nzX7SeN7vXjyU/8mOd7HH3yWT4ritb3r2BADhAP17nvfRNAgDimknPx4bW3/56
         KkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683907824; x=1686499824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0UJ2m9D/uUbhV+yi63iViM82oPaAy45wfjsXlqa/O0=;
        b=h8dcRnC7nk6HUEDjyBz33Qhe6eUl6DVrnSOO76jGAD91xZJ4Gwlm0C1pa3hXHO2GXa
         lo2IcnV6rj0m0wDNLz9UKGEyAsnfhA9H2gE8SWZgBUtPIydmlAaBL6xLETdURQchG/Jz
         RObCgkxhWZXtMvgBVPeY4Hp6xkJK/K7leRcRqvU9ZFhIo31PS3f9CFuf1hRCC9Dlt6GG
         2xZFy4kzux5Ts2FNts4qAimu3EKs9wSy5HVZfMdmBfqz7elsMw7zG2hpy0sd+udyWP+i
         DOC0qBbD/ZiDVpVCvB0HW6pXD5R51Qf75ba1I0ru/ocx7KW8/nQwCFgGY+UULxC3RdBE
         7TEQ==
X-Gm-Message-State: AC+VfDxN/FriX5144uf8B+SJ7STZGvy0qIdRftINqBLoQdbSA3kT7wsi
	A8Z34aSQZhULnOS2EJeQGlKKr6HS3IM63ar4lbf6uA==
X-Google-Smtp-Source: ACHHUZ7QKBeeac4l/20TcS5HYna4kOM+9T9PlZ8eWil5AEWmxwRWKpbI3ijvn/OeVcqw+sAM4/D2Orm5qTp0T0y/Pbg=
X-Received: by 2002:a92:3210:0:b0:32b:2884:667d with SMTP id
 z16-20020a923210000000b0032b2884667dmr19850155ile.7.1683907824530; Fri, 12
 May 2023 09:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683892665.git.christophe.leroy@csgroup.eu> <d9c6afc28d0855240171a4e0ad9ffcdb9d07fceb.1683892665.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d9c6afc28d0855240171a4e0ad9ffcdb9d07fceb.1683892665.git.christophe.leroy@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Fri, 12 May 2023 18:09:46 +0200
Message-ID: <CANpmjNMm-2Tdhp6rDzA7CYvotmmGmLUnZnA_35yLUvxHB=7s0g@mail.gmail.com>
Subject: Re: [PATCH 1/3] kcsan: Don't expect 64 bits atomic builtins from 32
 bits architectures
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chris Zankel <chris@zankel.net>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 May 2023 at 17:31, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Activating KCSAN on a 32 bits architecture leads to the following
> link-time failure:
>
>     LD      .tmp_vmlinux.kallsyms1
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_load':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_load_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_store':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_store_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_exchange':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_exchange_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_add':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_fetch_add_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_sub':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_fetch_sub_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_and':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_fetch_and_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_or':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_fetch_or_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_xor':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_fetch_xor_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_nand':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_fetch_nand_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_compare_exchange_strong':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_compare_exchange_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_compare_exchange_weak':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_compare_exchange_8'
>   powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_compare_exchange_val':
>   kernel/kcsan/core.c:1273: undefined reference to `__atomic_compare_exchange_8'
>
> 32 bits architectures don't have 64 bits atomic builtins. Only
> include DEFINE_TSAN_ATOMIC_OPS(64) on 64 bits architectures.
>
> Fixes: 0f8ad5f2e934 ("kcsan: Add support for atomic builtins")
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Marco Elver <elver@google.com>

Do you have your own tree to take this through with the other patches?

> ---
>  kernel/kcsan/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 5a60cc52adc0..8a7baf4e332e 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -1270,7 +1270,9 @@ static __always_inline void kcsan_atomic_builtin_memorder(int memorder)
>  DEFINE_TSAN_ATOMIC_OPS(8);
>  DEFINE_TSAN_ATOMIC_OPS(16);
>  DEFINE_TSAN_ATOMIC_OPS(32);
> +#ifdef CONFIG_64BIT
>  DEFINE_TSAN_ATOMIC_OPS(64);
> +#endif
>
>  void __tsan_atomic_thread_fence(int memorder);
>  void __tsan_atomic_thread_fence(int memorder)
> --
> 2.40.1
>
