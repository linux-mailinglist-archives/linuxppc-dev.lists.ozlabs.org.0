Return-Path: <linuxppc-dev+bounces-2905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD99BE2D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 10:39:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk0Y23h24z2ysD;
	Wed,  6 Nov 2024 20:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730885990;
	cv=none; b=j2/jr2RHe7PFzNyEn1jv7KaJqjEGOCAlBtXoFTzmr4mHpTZqsqyGhckXgbrXe7kYJgK/t1JcqVKnRhAxWDfnLN0N1PYmawHcmn5dco+7AqG3y1E6OEq6cqnhjNNLBvOztowtrQny7iLWv6zD2Z8NdwIDUrhJz8txvMi3C1cz2WnAr+7FK8hwI129FkTzbgYICWEVY80D15tT/vLwcSA+JPhi3ZOphkpjQNg0/ZlwaNIA+6gyjTgX82Xe3j6wtyOLAtLfyEvjgTB+Ht6eAy89Rh2BV2pRGCzCKg0ASxrsEAxWENJW2oMRYNleN+BUVtLyz3/hX92tjyNuFuIefoiOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730885990; c=relaxed/relaxed;
	bh=M1tJzKkoB9B2qT3BgQky1W/VyndbztB1eQQN3W+iits=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKRf4QIU3WaV7gSnbn0iMAMY8pKR8WTqJsc4M3LN9mZwiaqXgwFUYigJ9bXRyILBM47BaEHE8sBZ3kPhtIMCZFifyEXhDWBfvavXHhEpsi3o/Lue24PBuMk9Z9KwRgDzuDDBfRopa+pAef0mN7lSoyIYm2uRgieBxuVk1PG2WMVHEA52paP2aKvIYb2knMFpYmwph802hV+4pheRS++GJHF9viVXogBD85jNOjLQvcXcOQChbeujrEGFqNGtFGYvKT+QG/PPKxnC71XPyHNmIVkBuoQm4YBoF7JTHrx+Q8xBVleKQOxliRZE+IZ2F/HTDj4e1iaHMLhRP8dtuoelFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk0Xz1yHQz2y89
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 20:39:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xk0Xv5Scnz9sRr;
	Wed,  6 Nov 2024 10:39:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlDylVDbi0Jl; Wed,  6 Nov 2024 10:39:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xk0Xv48Vfz9sRk;
	Wed,  6 Nov 2024 10:39:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7965A8B77B;
	Wed,  6 Nov 2024 10:39:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FLvIR2VzFJTV; Wed,  6 Nov 2024 10:39:43 +0100 (CET)
Received: from [192.168.232.102] (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 436038B77A;
	Wed,  6 Nov 2024 10:39:43 +0100 (CET)
Message-ID: <8dcc739a-3fd4-434c-995c-1dce33cefe6f@csgroup.eu>
Date: Wed, 6 Nov 2024 10:39:43 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Add __must_check to set_memory_...()
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

Le 07/09/2024 à 17:40, Christophe Leroy a écrit :
> After the following powerpc commits, all calls to set_memory_...()
> functions check returned value.
> - Commit 8f17bd2f4196 ("powerpc: Handle error in mark_rodata_ro() and
> mark_initmem_nx()")
> - Commit f7f18e30b468 ("powerpc/kprobes: Handle error returned by
> set_memory_rox()")
> - Commit 009cf11d4aab ("powerpc: Don't ignore errors from
> set_memory_{n}p() in __kernel_map_pages()")
> - Commit 9cbacb834b4a ("powerpc: Don't ignore errors from
> set_memory_{n}p() in __kernel_map_pages()")
> - Commit 78cb0945f714 ("powerpc: Handle error in mark_rodata_ro() and
> mark_initmem_nx()")
> 
> All calls in core parts of the kernel also always check returned value,
> can be looked at with following query:
> 
>    $ git grep -w -e set_memory_ro -e set_memory_rw -e set_memory_x -e set_memory_nx -e set_memory_rox `find . -maxdepth 1 -type d | grep -v arch | grep /`
> 
> It is now possible to flag those functions with __must_check to make
> sure no new unchecked call it added.
> 
> Link: https://github.com/KSPP/linux/issues/7
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Do you plan to take this patch anytime soon ?

The generic part of the same was already applied in previous cycle, see 
https://github.com/torvalds/linux/commit/82ce8e2f31a1eb05b1527c3d807bea40031df913

Discussion at 
https://lore.kernel.org/all/b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu/T/ 
suggests that it would be beneficial to enforce return checking.

Christophe


> ---
>   arch/powerpc/include/asm/set_memory.h | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> index 9a025b776a4b..9c8d5747755d 100644
> --- a/arch/powerpc/include/asm/set_memory.h
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -12,37 +12,37 @@
>   
>   int change_memory_attr(unsigned long addr, int numpages, long action);
>   
> -static inline int set_memory_ro(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_ro(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
>   }
>   
> -static inline int set_memory_rw(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_rw(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
>   }
>   
> -static inline int set_memory_nx(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_nx(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
>   }
>   
> -static inline int set_memory_x(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_x(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_X);
>   }
>   
> -static inline int set_memory_np(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_np(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_NP);
>   }
>   
> -static inline int set_memory_p(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_p(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_P);
>   }
>   
> -static inline int set_memory_rox(unsigned long addr, int numpages)
> +static inline int __must_check set_memory_rox(unsigned long addr, int numpages)
>   {
>   	return change_memory_attr(addr, numpages, SET_MEMORY_ROX);
>   }

