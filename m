Return-Path: <linuxppc-dev+bounces-1366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F31978C86
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 04:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5DvY4W2hz2yDT;
	Sat, 14 Sep 2024 12:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726279337;
	cv=none; b=B2+fCtMYxmXPlmqczfZYRT3TgjDXSQPorEyv7npyP+dxL5adjpnUVTz3J/w/eOBJ0tYfsYNE6NEaDfM85PA7ennbd/8JyMsQhm+7ytT2oeoCqZ9soUqZJUNSUJZLpna65+ev9f8ATkOUg0mK1W7LFKHC7297jDshQ4+25Y0JOxem32ZOnzr14BNOHRJcJJUAFtDnvbttLGuBt+DAMUfdjlB9W2h0ycQl3SZnDzYVIxGyNB9gmr9DGgwQRAWREy4VYnLYd4nN4XDwueqWG+ClWGf3tHaZtU7++0E4+/yO6ZAp4ti0sjyAN7loIRlHZhueIYqhBjvtcysmNg8NeR7SAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726279337; c=relaxed/relaxed;
	bh=/wsM4f9mZobOe68S738M7h2FcsJwRNVl7jUmuHE5wmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WF96Z9TCowlBEAjmSNMUCGissZbMnBXMjDuGvXmZzFzR/SAU93gnr/Pv/vFtb8q8nyjl6y2/J74oas4VKCtbuLdS/PW5/dDlAm8UBThnayD/h0idAVye9WK7nMw0+Oynh0IcG7rbxB+kNEncpc6boXbdzqH/a1TvRDeBzol5S6q0QYsxceoqgMF7ZeHuUC2QblR00sBpzB0WdZfiPKlzUV4OhPj/PIbNXVSiWfowHO2nQiqcI5qpfzNv2/Zxfxi1WLT965Bu0UVUbOL3vRTw/27mGsXMO/C3OL1FWjBMtZ4fCInXiA8mPgkHPiyTrpyQINl+Gt4qCFJ8tsCWcHVLXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DH0dsbxR; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DH0dsbxR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5DvY1WyCz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 12:02:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726279332;
	bh=/wsM4f9mZobOe68S738M7h2FcsJwRNVl7jUmuHE5wmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DH0dsbxRzHaIGZKdW/VAzQa6uKPKiQwb8xCnbJaXLX9IAec2jz1b/fzg6cAhA8ErS
	 pB/HLkT+Chh7obMNzCGZjoOWTe/vD0JNDCM4Bk1nb264MmakqUKTgdIBJ2vYKocfIX
	 TQFU167XMfXx/BQsIbkQmum5VaXobPpVYwGgo1VhMa4CtzPmjmlEkxQ80fw3po0b0D
	 HtJ6eUTWVbxOb+AYQWVe+VAvYPaM3Togzjtar6Bx3JrukSCSxH/pAfJbln0hO7udza
	 MN7MYow2a+b425Pd8snDmc6s2XJ5BK0WWvGoVetzAKhaADtomefCQYQLBwDN6OI2zp
	 D2h9711DyUhjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X5DvR1TfQz4xD3;
	Sat, 14 Sep 2024 12:02:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux
 Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>
References: <20240913213351.3537411-1-almasrymina@google.com>
Date: Sat, 14 Sep 2024 12:02:09 +1000
Message-ID: <87jzffq9ge.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Mina Almasry <almasrymina@google.com> writes:
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
>
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
>
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

Sorry I'm late to this, the original report wasn't Cc'ed to linuxppc-dev :D

I think this is a bug in the arch/powerpc inline asm constraints.

Can you try the patch below, it fixes the build error for me.

I'll run it through some boot tests and turn it into a proper patch over
the weekend.

cheers


diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 5bf6a4d49268..0e41c1da82dd 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -23,6 +23,12 @@
 #define __atomic_release_fence()					\
 	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
 
+#ifdef CONFIG_CC_IS_CLANG
+#define DS_FORM_CONSTRAINT "Z<>"
+#else
+#define DS_FORM_CONSTRAINT "YZ<>"
+#endif
+
 static __inline__ int arch_atomic_read(const atomic_t *v)
 {
 	int t;
@@ -197,7 +203,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
 		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
 	else
-		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : DS_FORM_CONSTRAINT (v->counter));
 
 	return t;
 }
@@ -208,7 +214,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
 		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
 	else
-		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+		__asm__ __volatile__("std%U0%X0 %1,%0" : "=" DS_FORM_CONSTRAINT (v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\

