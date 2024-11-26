Return-Path: <linuxppc-dev+bounces-3566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BE9D95D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 11:49:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyK8g6m9Fz2yhn;
	Tue, 26 Nov 2024 21:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732618195;
	cv=none; b=UUqWrxMg4vZMECkOKqFvmh5pZZbUo1vo5ypd5fSNKd1eyf4OJ6K6CKVrRZLREcSYBH3M5epMayyqQ0xsZuG3IuCHpzaeqNYongK/FRxLRlBiMnunabkQclowUws0HJAAE9rHu+sIYL9N88El7JZ1i1d9CxpF72ix9aqJYW0Id2zlfpVd1uas4PuPtlSQqJBCTiKnBtV/iuHKWiZk8Zx+OoTUcWsPnij6CViW16pkTHYFvd3bzNERuJ8iZD26YLcNKNg9QrPhZOjpwqH3eKKfKgME2VFSMLyWqiDYDWtWsc5OJnzlxnL4h4XXEq6g11sZtqnjk2OyoyN8TR2CYSQvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732618195; c=relaxed/relaxed;
	bh=6GPwsHhKNzij03aZtT85YVbnLVJABa78c08T28hT7N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwe4WcR1kZFc2O6q97tH5OMoo1mDs3NdqJjoUceyEnTrSgsfs6Gxz69eRRzzL0s0ZFv02PVlv1UDBBrEITK04xj9BxIad9vHAroU4DzheDJTq3xQo4ZLluGZ7VRuZaWu9QWLfNLkvj2kLaKVHzrOmWwrNV3EvHTyn8A1nAqtaDD6ZjctKVJhXsAjgHT8VJtOukdrNunzvrXb+4XneUXb5DyGDQNDYp+qV4OdV104Eun1QCDmDtPtcIliYLeRYpwyft7d9AHIZohZtDgFlAMGQ2Y/wCrReZXrlgVF+LIL1+16MtryYNQe3Q8LYyx82YxstSV+ekGTKuzME33jihoMKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyK8g0GCxz2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 21:49:54 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XyK8c19jCz9sRs;
	Tue, 26 Nov 2024 11:49:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gu8-tJzQN5bA; Tue, 26 Nov 2024 11:49:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XyK8c0CwJz9sRk;
	Tue, 26 Nov 2024 11:49:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E98F38B776;
	Tue, 26 Nov 2024 11:49:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fg-YBd2-eqnU; Tue, 26 Nov 2024 11:49:51 +0100 (CET)
Received: from [192.168.232.206] (unknown [192.168.232.206])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 77A838B763;
	Tue, 26 Nov 2024 11:49:50 +0100 (CET)
Message-ID: <a96062bc-8bcc-4ca0-b24e-ea64f9ee6329@csgroup.eu>
Date: Tue, 26 Nov 2024 11:49:49 +0100
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
Subject: Re: [PATCH 1/3] powerpc: copy preempt.h into arch/include/asm
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-2-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241125042212.1522315-2-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
> PowerPC uses asm-generic preempt definitions as of now.
> Copy that into arch/asm so that arch specific changes can be done.
> This would help the next patch for enabling dynamic preemption.

I can't see any valid use in following patches. The only modification 
you do to that file is in patch 2 and it is unused.

> 
> No functional changes intended.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/preempt.h | 100 +++++++++++++++++++++++++++++
>   1 file changed, 100 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/preempt.h
> 
> diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
> new file mode 100644
> index 000000000000..51f8f3881523
> --- /dev/null
> +++ b/arch/powerpc/include/asm/preempt.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_PREEMPT_H
> +#define __ASM_PREEMPT_H
> +
> +#include <linux/thread_info.h>
> +
> +#define PREEMPT_ENABLED	(0)
> +
> +static __always_inline int preempt_count(void)
> +{
> +	return READ_ONCE(current_thread_info()->preempt_count);
> +}
> +
> +static __always_inline volatile int *preempt_count_ptr(void)
> +{
> +	return &current_thread_info()->preempt_count;
> +}
> +
> +static __always_inline void preempt_count_set(int pc)
> +{
> +	*preempt_count_ptr() = pc;
> +}
> +
> +/*
> + * must be macros to avoid header recursion hell
> + */
> +#define init_task_preempt_count(p) do { \
> +	task_thread_info(p)->preempt_count = FORK_PREEMPT_COUNT; \
> +} while (0)
> +
> +#define init_idle_preempt_count(p, cpu) do { \
> +	task_thread_info(p)->preempt_count = PREEMPT_DISABLED; \
> +} while (0)
> +
> +static __always_inline void set_preempt_need_resched(void)
> +{
> +}
> +
> +static __always_inline void clear_preempt_need_resched(void)
> +{
> +}
> +
> +static __always_inline bool test_preempt_need_resched(void)
> +{
> +	return false;
> +}
> +
> +/*
> + * The various preempt_count add/sub methods
> + */
> +
> +static __always_inline void __preempt_count_add(int val)
> +{
> +	*preempt_count_ptr() += val;
> +}
> +
> +static __always_inline void __preempt_count_sub(int val)
> +{
> +	*preempt_count_ptr() -= val;
> +}
> +
> +static __always_inline bool __preempt_count_dec_and_test(void)
> +{
> +	/*
> +	 * Because of load-store architectures cannot do per-cpu atomic
> +	 * operations; we cannot use PREEMPT_NEED_RESCHED because it might get
> +	 * lost.
> +	 */
> +	return !--*preempt_count_ptr() && tif_need_resched();
> +}
> +
> +/*
> + * Returns true when we need to resched and can (barring IRQ state).
> + */
> +static __always_inline bool should_resched(int preempt_offset)
> +{
> +	return unlikely(preempt_count() == preempt_offset &&
> +			tif_need_resched());
> +}
> +
> +#ifdef CONFIG_PREEMPTION
> +extern asmlinkage void preempt_schedule(void);
> +extern asmlinkage void preempt_schedule_notrace(void);
> +
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +
> +void dynamic_preempt_schedule(void);
> +void dynamic_preempt_schedule_notrace(void);
> +#define __preempt_schedule()		dynamic_preempt_schedule()
> +#define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
> +
> +#else /* !CONFIG_PREEMPT_DYNAMIC || !CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
> +
> +#define __preempt_schedule() preempt_schedule()
> +#define __preempt_schedule_notrace() preempt_schedule_notrace()
> +
> +#endif /* CONFIG_PREEMPT_DYNAMIC && CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
> +#endif /* CONFIG_PREEMPTION */
> +
> +#endif /* __ASM_PREEMPT_H */

