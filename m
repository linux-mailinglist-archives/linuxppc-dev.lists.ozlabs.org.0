Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 414CC2B9928
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 18:21:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcRKd3cdpzDqng
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 04:21:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcRH01HrjzDqml
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 04:18:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CcRGs1mzCzB09Zm;
 Thu, 19 Nov 2020 18:18:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AMfvyq5zNv_N; Thu, 19 Nov 2020 18:18:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CcRGs0lyxzB09Zl;
 Thu, 19 Nov 2020 18:18:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3D128B78A;
 Thu, 19 Nov 2020 18:18:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bf7Xb12tnYPC; Thu, 19 Nov 2020 18:18:45 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FFB08B80C;
 Thu, 19 Nov 2020 18:18:31 +0100 (CET)
Subject: Re: [PATCH v3 2/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
To: Oleg Nesterov <oleg@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <20201119160154.GA5183@redhat.com>
 <20201119160247.GB5188@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4e132957-c53c-4b06-9546-26d1de0a672f@csgroup.eu>
Date: Thu, 19 Nov 2020 18:18:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201119160247.GB5188@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/11/2020 à 17:02, Oleg Nesterov a écrit :
> The commit a8a4b03ab95f ("powerpc: Hard wire PT_SOFTE value to 1 in
> ptrace & signals") changed ptrace_get_reg(PT_SOFTE) to report 0x1,
> but PTRACE_GETREGS still copies pt_regs->softe as is.
> 
> This is not consistent and this breaks the user-regs-peekpoke test
> from https://sourceware.org/systemtap/wiki/utrace/tests/
> 
> Reported-by: Jan Kratochvil <jan.kratochvil@redhat.com>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>   arch/powerpc/kernel/ptrace/ptrace-tm.c   | 8 +++++++-
>   arch/powerpc/kernel/ptrace/ptrace-view.c | 8 +++++++-
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
> index f8fcbd85d4cb..d0d339f86e61 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
> @@ -87,6 +87,10 @@ int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
>   		struct membuf to)
>   {
>   	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
> +#ifdef CONFIG_PPC64
> +	struct membuf to_softe = membuf_at(&to,
> +					offsetof(struct pt_regs, softe));

Should fit on a single line I think.

> +#endif
>   
>   	if (!cpu_has_feature(CPU_FTR_TM))
>   		return -ENODEV;
> @@ -102,7 +106,9 @@ int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
>   				sizeof(struct user_pt_regs));
>   
>   	membuf_store(&to_msr, get_user_ckpt_msr(target));
> -
> +#ifdef CONFIG_PPC64
> +	membuf_store(&to_softe, 0x1ul);
> +#endif
>   	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
>   				sizeof(struct user_pt_regs));
>   }
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
> index 39686ede40b3..f554ccfcbfae 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
> @@ -218,6 +218,10 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
>   		   struct membuf to)
>   {
>   	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
> +#ifdef CONFIG_PPC64
> +	struct membuf to_softe = membuf_at(&to,
> +					offsetof(struct pt_regs, softe));

Should fit on a single line I think.

> +#endif
>   	int i;
>   
>   	if (target->thread.regs == NULL)
> @@ -233,7 +237,9 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
>   				sizeof(struct user_pt_regs));
>   
>   	membuf_store(&to_msr, get_user_msr(target));
> -
> +#ifdef CONFIG_PPC64
> +	membuf_store(&to_softe, 0x1ul);
> +#endif
>   	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
>   				sizeof(struct user_pt_regs));
>   }
> 

Christophe
