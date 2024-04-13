Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2028A3C03
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 11:49:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gu1IwgvA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGpYM4Dk0z3vYr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 19:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gu1IwgvA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGpXg1lSgz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 19:48:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713001715;
	bh=7v8kT5dOPZhcERR4HJkMTlqm5oWDkH0LZ5ZYWzm8ulk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gu1IwgvANMRUmu7XA07iasvEwbeqKN2iz5Ajhk6sJi6wLxQAqDhjPYtEnwmuy7f2a
	 jskb+C4UHbIBfdBbVhzLSdvHSCz2Ug9LdwTD+Yfwgkd/x7qq/4i6zg/f4ODjZ5OlVK
	 K5dh2gFdhRcB4JiWg0XHZ7vEIjtDiUwjty34VjKNKDD/Pd46dPY5A6HsF8pqCxZ/PS
	 HYqvRWvDEpArYkUYj2OJe7J4eNjZhIvVIqIzMA2GxBdpqIiQxCgVREr6O3rhQg9Fzn
	 N2LgfuIFWKTBcjh+oMMtNN6mG6sdAwGunXAejcNozR1030w9uBakCcgdtWRKe3KkR9
	 l0ZmogfYPxJTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VGpXg0SkWz4wc7;
	Sat, 13 Apr 2024 19:48:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc: Optimise barriers for fully ordered atomics
In-Reply-To: <20240412172529.783268-1-npiggin@gmail.com>
References: <20240412172529.783268-1-npiggin@gmail.com>
Date: Sat, 13 Apr 2024 19:48:34 +1000
Message-ID: <878r1hd24t.fsf@mail.lhotse>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> "Fully ordered" atomics (RMW that return a value) are said to have a
> full barrier before and after the atomic operation. This is implemented
> as:
>
>   hwsync
>   larx
>   ...
>   stcx.
>   bne-
>   hwsync
>
> This is slow on POWER processors because hwsync and stcx. require a
> round-trip to the nest (~= L2 cache). The hwsyncs can be avoided with
> the sequence:
>
>   lwsync
>   larx
>   ...
>   stcx.
>   bne-
>   isync
>
> lwsync prevents all reorderings except store/load reordering, so the
> larx could be execued ahead of a prior store becoming visible. However
> the stcx. is a store, so it is ordered by the lwsync against all prior
> access and if the value in memory had been modified since the larx, it
> will fail. So the point at which the larx executes is not a concern
> because the stcx. always verifies the memory was unchanged.
>
> The isync prevents subsequent instructions being executed before the
> stcx. executes, and stcx. is necessarily visible to the system after
> it executes, so there is no opportunity for it (or prior stores, thanks
> to lwsync) to become visible after a subsequent load or store.

AFAICS commit b97021f85517 ("powerpc: Fix atomic_xxx_return barrier
semantics") disagrees.

That was 2011, so maybe it's wrong or outdated?

Either way it would be good to have some litmus tests to back this up.

cheers

ps. isn't there a rule against sending barrier patches after midnight? ;)
