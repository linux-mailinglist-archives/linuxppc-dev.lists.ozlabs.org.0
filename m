Return-Path: <linuxppc-dev+bounces-5337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66671A136F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 10:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYdQ719Vbz30VV;
	Thu, 16 Jan 2025 20:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737021007;
	cv=none; b=UPTf2XofFPuYeVDMGwq3YvMBKpO6FuxaP431qz4t0AXOfsgPUpRZj9qdUfS2m9/B2dhac5xfOyJSysVgDwkGlIfjMw9OObkj3lFbxpkAL4Hy9y/DGka/M/4fP+bMmA2LcXQcnWajhw8716SLZeMPlgcf+70J2qkCX24eQsEA5YApO5YHrj7+Fy060iKWGF8pLQwoS/BuFxKgxB8kScmnILtBgFeDD5hv4yflAlpS07p6ZIh/0a73FrGFqQZHQgDLxd8ToiVpfiDYbXXYtGcnhsnYRx4v1xU5MXQYctzUYhMZGm2oG2Yx5sMg8qugFjGIeSgpBqpApw7mLTpMC9UH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737021007; c=relaxed/relaxed;
	bh=N++8J+/BNEg8KNeo6FWcNQJ3JMXvJ7Y76KbvsY7n8B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGq7PutG4NlTcaTJgGI4b67uX0kT8xuQTVoBw20Xwytim9exWzXlaiRmWUq4D3Mta8wGRlsUKTaJOSIi6QvIe66dGSRx0s4Tv00zhOjJQXl4yBzsEA5jeJEwey3ibbc2zeLQ0eJUqgBv5o89Vae5SJHhVH9xbVyEDwB3D/s+3W0itgB+egRUEGzYl+E6patp5mX7NIa3LStP9UaHVn47lQDTe92Z5zgReTxwYmuKFkOw1aXyISvidLvBGZ4/uOlhoyJcdSRP9LaphGcXWsjxEG+iv973sxbD2fFBcv1uXs3qGHAEHbnVrlOoc0tRRnsE/pCSZfUSlPlObHaaZhE2+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYdQ53DPtz3020
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 20:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYd1205DMz9sYh;
	Thu, 16 Jan 2025 10:31:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7y-gc8VZ5x8; Thu, 16 Jan 2025 10:31:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYd0y4ZFDz9sTX;
	Thu, 16 Jan 2025 10:31:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BF458B77A;
	Thu, 16 Jan 2025 10:31:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id khfz3ZtWsvHe; Thu, 16 Jan 2025 10:31:46 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E732B8B774;
	Thu, 16 Jan 2025 10:31:45 +0100 (CET)
Message-ID: <b97011b1-9e9f-4de4-af42-41cd6bf7c53b@csgroup.eu>
Date: Thu, 16 Jan 2025 10:31:41 +0100
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
Subject: Re: [RESEND PATCH] powerpc/kprobes: don't save r13 register in kprobe
 context
To: pangliyuan <pangliyuan1@huawei.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, naveen@kernel.org, maddy@linux.ibm.com,
 anil.s.keshavamurthy@intel.com, davem@davemloft.net, mhiramat@kernel.org,
 rostedt@goodmis.org
Cc: wangfangpeng1@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20241209091039.72786-1-pangliyuan1@huawei.com>
 <20250116084539.58847-1-pangliyuan1@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250116084539.58847-1-pangliyuan1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 16/01/2025 à 09:45, pangliyuan a écrit :
> [Vous ne recevez pas souvent de courriers de pangliyuan1@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> When CONFIG_STACKPROTECTOR_STRONG is enabled and FTRACE is disabled on
> powerpc64, repeatedly triggering the kprobe process may cause stack check
> failures and panic.
> 
> Case:
> There is a kprobe(do nothing in handler) attached to the "shmem_get_inode",
> and a process A is creating file on tmpfs.
> 
>                             CPU0
> A |r13 = paca_ptrs[0], paca_ptrs[0]->canary=A->stack_canary
>    |touch a file on tmpfs
>    |shmem_mknod():
>    |    load A's canary through r13 and stored it in A's stack
>    |    shmem_get_inode():
>    |        enter kprobe first
>    |        optinsn_slot():
>    |            stored r13 (paca_ptrs[0]) in stack
> 
>    ......
> 
>    ==> schedule,  B run on CPU0, A run on CPU1
> 
>                             CPU0
> B |r13 = paca_ptrs[0], paca_ptrs[0]->canary=B->stack_canary
>    |do something...
>                             CPU1
> A |            r13 = paca_ptrs[1], paca_ptrs[1]->canary=A->stack_canary
>    |            about to leave 'optinsn_slot', restore r13 from A's stack
>    |            r13 = paca_ptrs[0], paca_ptrs[0]->canary=B->stack_canary
>    |            leave optinsn_slot, back to shmem_get_inode
>    |        leave shmem_get_inode, back to shmem_mknod
>    |    do canary check in shmem_mknod, but canary stored in A's stack (A's
>         canary) doesn't match the canary loaded through r13 (B's canary),
>         so panic
> 
> When A(on CPU0) entring optinsn_slot, it stored r13(paca_ptrs[0]) in stack,
> then A is scheduled to CPU1 and restore r13 from A's stack when leaving
> 'optinsn_slot'. Now A is running on CPU1 but r13 point to CPU0's
> paca_ptrs[0], at this time paca_ptrs[0]->__current points to another
> process B, which cause A use B's canary to do stack check and panic.
> 
> This can be simply fixed by not saving and restoring the r13 register,
> because on powerpc64, r13 is a special register that reserved to point
> to the current process, no need to restore the outdated r13 if scheduled
> had happened.

Does r13 really points to current process ? I thought it was pointing to 
PACA which is a structure attached to a given CPU not a given process.

By the way, don't we have the same problem on powerpc32 with register r2 ?

> 
> Fixes: 51c9c0843993 ("powerpc/kprobes: Implement Optprobes")
> Signed-off-by: pangliyuan <pangliyuan1@huawei.com>
> ---
>   arch/powerpc/kernel/optprobes_head.S | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
> index 35932f45fb4e..bf0d77e62ba8 100644
> --- a/arch/powerpc/kernel/optprobes_head.S
> +++ b/arch/powerpc/kernel/optprobes_head.S
> @@ -10,12 +10,12 @@
>   #include <asm/asm-offsets.h>
> 
>   #ifdef CONFIG_PPC64
> -#define SAVE_30GPRS(base) SAVE_GPRS(2, 31, base)
> -#define REST_30GPRS(base) REST_GPRS(2, 31, base)
> +#define SAVE_NEEDED_GPRS(base) SAVE_GPRS(2, 12, base); SAVE_GPRS(14, 31, base)
> +#define REST_NEEDED_GPRS(base) REST_GPRS(2, 12, base); REST_GPRS(14, 31, base)

This macro name seems a bit sketchy, as far as I understand r0 and r1 
also need to be saved/restored allthough they are not handled by this macro.


>   #define TEMPLATE_FOR_IMM_LOAD_INSNS    nop; nop; nop; nop; nop
>   #else
> -#define SAVE_30GPRS(base) stmw r2, GPR2(base)
> -#define REST_30GPRS(base) lmw  r2, GPR2(base)
> +#define SAVE_NEEDED_GPRS(base) stmw    r2, GPR2(base)
> +#define REST_NEEDED_GPRS(base) lmw     r2, GPR2(base)
>   #define TEMPLATE_FOR_IMM_LOAD_INSNS    nop; nop; nop
>   #endif
> 
> @@ -45,7 +45,7 @@ optprobe_template_entry:
>          /* Save the previous SP into stack */
>          addi    r0,r1,INT_FRAME_SIZE
>          PPC_STL r0,GPR1(r1)
> -       SAVE_30GPRS(r1)
> +       SAVE_NEEDED_GPRS(r1)
>          /* Save SPRS */
>          mfmsr   r5
>          PPC_STL r5,_MSR(r1)
> @@ -123,7 +123,7 @@ optprobe_template_call_emulate:
>          PPC_LL  r5,_CCR(r1)
>          mtcr    r5
>          REST_GPR(0,r1)
> -       REST_30GPRS(r1)
> +       REST_NEEDED_GPRS(r1)
>          /* Restore the previous SP */
>          addi    r1,r1,INT_FRAME_SIZE
> 
> --
> 2.37.7
> 


