Return-Path: <linuxppc-dev+bounces-12264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C928B58C6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 05:37:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQndQ6w8zz301G;
	Tue, 16 Sep 2025 13:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757993818;
	cv=none; b=b20cYaWfC2i7cxkF/hnNBm+IykK427OOkv7rpRhLogfyphoS5BIBmJIJDaRZ9av1jaAx5BrKIfxSWBFB2yjnZvGajqmcF7hQ6N/M2MLdjvfkbsQHJRJe4Y4nyYoIaO1PPcsDhQtrLk5/xd5g/FyaT8p8143ANZmRPAqeghZfP+/bAK9Wnr/vU6wnOdaR9KH4756HU4n/PLCzvcGlUtcNjzPCeNzKGvYMOjdCScXwpU7dE+cF4mkFY2Z9KoiUh4jLoojtnW+BSjgQWZ6JeBf6Gpvl8vBNpGoUlw5kys/Q5YjJcJsAAK4Dd+nQDCSGSP2Alc966tp1Emo8q/whqxN+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757993818; c=relaxed/relaxed;
	bh=AoUtYaSqpxJxvLloy7nshr4G6vpZl850tw+AAmUwDdk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=R0H6msn2HMsYxMXRTJsqsNUo/TRelsizJC3K/jUGHve3lNw7bBtam9D5WUR6NIRrB3hPRfI5XlpobJBLWTLBc1TDM4H+5xF4mkniuPVz5y2LPDjUqKcA6IDSb8aYkF3nXjx7izxnI69b5x/MKThNQhpo4ggQUfTRdwZMbY/Z7rwSme0KTWXXrFegdnztqbrHIJ7AXtX8qA30trmWAB1WL266t/l6CCb7dSWZFfwfCAXwcDGMO3Gw/R8FrMW0Q+F8EgwzLBIvYYeR2+8EhStj32GyOJzKMGjFwaHLRgZwn+xflL5lDZGWQzfqo3aAZB1QJDbvZ/0T392Zw4uHXti81g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CNf7AHxN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CNf7AHxN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQndP4Vmtz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 13:36:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7F3040716;
	Tue, 16 Sep 2025 03:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04DAC4CEEB;
	Tue, 16 Sep 2025 03:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757993814;
	bh=CfVil0FdRSS0PaXQXnEL2MuMd3+XojlUadD8GRWQi7w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CNf7AHxNVzyFResUYW5usorS95/1cgWEfQBxIXzVgEh5LcEryf/UaE9d6FXnmevp/
	 hUOvt/SIiD7/Xfzhk6DVSSkzymHadep7a/+dLaY5Vb+n0WLbUQmf5rY9iYjBaJbYhP
	 EK//AR137efTrjN+qYgc2VP+Ya6Cv8E6hGsRI3+Y=
Date: Mon, 15 Sep 2025 20:36:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, ryabinin.a.a@gmail.com,
 christophe.leroy@csgroup.eu, bhe@redhat.com, hca@linux.ibm.com,
 zhangqing@loongson.cn, chenhuacai@loongson.cn, davidgow@google.com,
 glider@google.com, dvyukov@google.com, alexghiti@rivosinc.com,
 alex@ghiti.fr, agordeev@linux.ibm.com, vincenzo.frascino@arm.com,
 elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify
 static key across modes
Message-Id: <20250915203653.c17d501a5f4b68936a0e3ea9@linux-foundation.org>
In-Reply-To: <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
References: <20250810125746.1105476-1-snovitoll@gmail.com>
	<20250810125746.1105476-2-snovitoll@gmail.com>
	<CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
	<CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 15 Sep 2025 09:30:03 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.com> wrote:

> On Wed, Sep 3, 2025 at 6:01 PM Andrey Konovalov <andreyknvl@gmail.com> wrote:
>

[400+ lines removed - people, please have mercy]

>
> > > @@ -246,7 +255,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
> > >  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
> > >                                 unsigned long ip)
> > >  {
> > > -       if (!kasan_arch_is_ready() || is_kfence_address(object))
> > > +       if (is_kfence_address(object))
> > >                 return false;
> >
> > Why is the check removed here and in some other places below? This
> > need to be explained in the commit message.
> 
> kasan_arch_is_ready which was unified with kasan_enabled, was removed
> here because
> __kasan_slab_pre_free is called from include/linux/kasan.h [1] where
> there's already kasan_enabled() check.
> 
> [1] https://elixir.bootlin.com/linux/v6.16.7/source/include/linux/kasan.h#L198
> 
> Please let me know if v7 is required with the change in the git commit
> message only.

Neither works - please send along the appropriate paragraph and I'll
paste it in, can't get easier than that.

> >
>
> [another ~250 lines snipped]
>

