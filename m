Return-Path: <linuxppc-dev+bounces-10449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15598B15A66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 10:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsQBt0xQyz30Vq;
	Wed, 30 Jul 2025 18:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753863638;
	cv=none; b=eVCZm3TimnU/r1IGi2wq2+ATvEFtf94AWkpAj36Yfn9x890q4TzLVH9zUSX1s5Ui2KpA3hGLAXJaEx9cdFaMK0AFfVzaZmyeV+fFE5G3l53k9cyz5K3r5+VJ4l2u1v/dYo4sqRhoTBWKo8n/yvi251Muam+VfXiQLdMgY4EkyiyiaNaiImpnMY8rL5AroH5rk81kcBk/zCdD7ftWoCvbybiCK4Q/y3BkdnvRnKVpGJyWgLi5aiKPRuYIGpPz3h18J2GnYVIzImkY6OjPYlAz4/91PS2mV91hsW5+xTrID61c39GanX0WYJPzSDNssdUuFUeA6hUOj0mCSAGwB0v9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753863638; c=relaxed/relaxed;
	bh=wEh5R4JHim8dOzje2Cz6ScN8YVj6C+k6f02MUhMEijg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7ebNduM05yW+MbfSfALJDICnaXUfoj4LTrXerL9QJat/pB0blRvcEzDp+kGa9VbxZJ+JBzutWs2Gz9oxLiYhsprvSW/UQmKTFIJHp5kzgHnTZsCwiRu+3g7Nr+QM2abEDXBa1aOGQod1xWclgt0oCqkwLuFn0EMet5tIzKzGKYXvk3bKj7IWoR5ldbKsiqDUgANCY3dgyG9wQukTyx1vZOw0ylMInYsfP9yWAoubfkbHqRaGz8FkAZFHU5jz+WzMAght1FMQTygYlK0c5Vah1mjk9JtraYpF+JV56YQUz91bOvfgqkR3b4JlFajnmqdh0bBJKFKj7NjB0bwXqVaqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsQBs1cKjz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 18:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsN6x3ypFz9t9W;
	Wed, 30 Jul 2025 08:47:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUXy95aT7_bY; Wed, 30 Jul 2025 08:47:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsN6D4PRmz9tC6;
	Wed, 30 Jul 2025 08:46:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9260C8B76C;
	Wed, 30 Jul 2025 08:46:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7zrCXI7WVVQW; Wed, 30 Jul 2025 08:46:28 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 719588B763;
	Wed, 30 Jul 2025 08:46:28 +0200 (CEST)
Message-ID: <7bba99d8-b171-4ac1-a33c-4c086f3684fd@csgroup.eu>
Date: Wed, 30 Jul 2025 08:46:28 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/qspinlock: Add spinlock contention tracepoint
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250725081432.1254986-1-nysal@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250725081432.1254986-1-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 25/07/2025 à 10:14, Nysal Jan K.A. a écrit :
> Add a lock contention tracepoint in the queued spinlock slowpath.
> Also add the __lockfunc annotation so that in_lock_functions()
> works as expected.
> 
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
>   arch/powerpc/lib/qspinlock.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index bcc7e4dff8c3..622e7f45c2ce 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -9,6 +9,7 @@
>   #include <linux/sched/clock.h>
>   #include <asm/qspinlock.h>
>   #include <asm/paravirt.h>
> +#include <trace/events/lock.h>
>   
>   #define MAX_NODES	4
>   
> @@ -708,8 +709,9 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>   	qnodesp->count--;
>   }
>   
> -void queued_spin_lock_slowpath(struct qspinlock *lock)
> +void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock)
>   {
> +	trace_contention_begin(lock, LCB_F_SPIN);
>   	/*
>   	 * This looks funny, but it induces the compiler to inline both
>   	 * sides of the branch rather than share code as when the condition
> @@ -718,16 +720,17 @@ void queued_spin_lock_slowpath(struct qspinlock *lock)
>   	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
>   		if (try_to_steal_lock(lock, true)) {
>   			spec_barrier();
> -			return;
> +		} else {
> +			queued_spin_lock_mcs_queue(lock, true);

If I read correctly, now all this is single line so you have to drop the 
braces , see 
https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces

>   		}
> -		queued_spin_lock_mcs_queue(lock, true);
>   	} else {
>   		if (try_to_steal_lock(lock, false)) {
>   			spec_barrier();
> -			return;
> +		} else {
> +			queued_spin_lock_mcs_queue(lock, false);
>   		}

Same here.

> -		queued_spin_lock_mcs_queue(lock, false);
>   	}
> +	trace_contention_end(lock, 0);
>   }
>   EXPORT_SYMBOL(queued_spin_lock_slowpath);
>   


