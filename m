Return-Path: <linuxppc-dev+bounces-3583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB829DA260
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 07:37:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyqWR6XKGz2xxr;
	Wed, 27 Nov 2024 17:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732689475;
	cv=none; b=hwBBaFKYRh0HnpX8Iz2tWV/bebfM84dAVQXgRsd1bnXWz9g4amThRH4hncAvUAnUzAJrxgtbCF2B8BajlPimgVGZaUqbY1HvUUoZyh1x/l/C9EU9gGYgJkZNT/jWZfy/3DSAvQ0oofzfkVrgswUrJJJU9/YCF2G7GOqzsKatFtdhW1Uz9XKNLQIS6SUlRndX2DpBi8PO+0+ceHwHQ2L3XRDA0PgxhpLTRkzn+AkFAzxR+NOapDkE/T5ncOyLVjFH3sOWdc+mPLE+gLPAaLYeigaAj9jQVijLgqWqAudbAW6q9RBlqYdrfidJpNFAxwdSDgFBMO6tApixxicmelR5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732689475; c=relaxed/relaxed;
	bh=jB7o6jd9oSEVm7DnW6ouYsVJqNjkTnyKCnQGDhydY7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDJ2p2EduBt6J8q5YDYK8VydHydr4mxv20bQTRLDl75QAR5M0PPyUJYX+t2lbC6rnWc0agt1TLpfbCPlwYXQd64hAgkouIbNtLE9/jvNLebwnjIs+EgTm9QCXGR1T/3pecsiBc1i17/M9TzAcJ1wrcJ5eu1tQI/yViKaaqSRvTBoIpDIL5Tzi7HcHXHxSCH4mXeRPimL9XZolNMd4JK6M/TMPbGza1TU09h6LIza7NbkRbk6W1PakOPSKDQdXa0RMYHFZNw+XY28uqgpv0qdMBTLf9YlsxIqzzOBYnfsv+wlPhAd4CmGISGomZ6ZjJXqEvH2viCcsEDNczz3aVw/bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyqWP29f0z2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 17:37:53 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XyqWK5rqhz9sPd;
	Wed, 27 Nov 2024 07:37:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nY_sZNC28FxT; Wed, 27 Nov 2024 07:37:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XyqWK4h7Bz9rvV;
	Wed, 27 Nov 2024 07:37:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 862598B780;
	Wed, 27 Nov 2024 07:37:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gECYhmM34_MR; Wed, 27 Nov 2024 07:37:49 +0100 (CET)
Received: from [192.168.233.25] (PO18304.IDSI0.si.c-s.fr [192.168.233.25])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EB4588B77C;
	Wed, 27 Nov 2024 07:37:48 +0100 (CET)
Message-ID: <b5c152a3-d459-4744-84ec-846153de1652@csgroup.eu>
Date: Wed, 27 Nov 2024 07:37:48 +0100
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

Instead of copying all the content of asm-generic version, can you just 
create a receptacle for your new macros, that will include 
asm-generic/preempt.h ?

Look at arch/powerpc/include/asm/percpu.h for exemple.

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

Should be __ASM_POWERPC_PREEMPT_H

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

