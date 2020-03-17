Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7B187E67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:34:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hV041K7mzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:34:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Y+uImdpO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hTyB1b9NzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:32:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hTy568mKz9tyN5;
 Tue, 17 Mar 2020 11:32:29 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Y+uImdpO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id G4YSIjMRBAsW; Tue, 17 Mar 2020 11:32:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hTy54mPkz9tyMf;
 Tue, 17 Mar 2020 11:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584441149; bh=LALR/zxUOMpA80nMDV+tOAog68wf9TQeChna0DpVIP8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y+uImdpOvm80NjoOw1hEYQrZcmt+o0TWNpcdCxyqdIAy1AL3LIaurar0P8a7WyDTq
 YDoaSdJ7NeRE5po/9Dr1T+x00Z7KyaYpRFrbxRdTtAphwtzMCMm6o12qVSYW2SSyU7
 gObKIQhEuY7D2bej98VXXok6IRKA687LdQKsaovw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E71E8B786;
 Tue, 17 Mar 2020 11:32:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iCLhs1qlnk3o; Tue, 17 Mar 2020 11:32:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DB818B785;
 Tue, 17 Mar 2020 11:32:28 +0100 (CET)
Subject: Re: [PATCH 07/15] powerpc/watchpoint: Get watchpoint count
 dynamically while disabling them
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-8-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c73b77fd-b983-2c5c-75bb-4b2f47a94d92@c-s.fr>
Date: Tue, 17 Mar 2020 11:32:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309085806.155823-8-ravi.bangoria@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2020 à 09:57, Ravi Bangoria a écrit :
> Instead of disabling only one watchpooint, get num of available
> watchpoints dynamically and disable all of them.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/hw_breakpoint.h | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 980ac7d9f267..ec61e2b7195c 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -75,14 +75,13 @@ extern void ptrace_triggered(struct perf_event *bp,
>   			struct perf_sample_data *data, struct pt_regs *regs);
>   static inline void hw_breakpoint_disable(void)
>   {
> -	struct arch_hw_breakpoint brk;
> -
> -	brk.address = 0;
> -	brk.type = 0;
> -	brk.len = 0;
> -	brk.hw_len = 0;
> -	if (ppc_breakpoint_available())
> -		__set_breakpoint(&brk, 0);
> +	int i;
> +	struct arch_hw_breakpoint null_brk = {0};
> +
> +	if (ppc_breakpoint_available()) {

I think this test should go into nr_wp_slots() which should return zero 
when no breakpoint is available. This would simplify at least here and 
patch 4

Christophe

> +		for (i = 0; i < nr_wp_slots(); i++)
> +			__set_breakpoint(&null_brk, i);
> +	}
>   }
>   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
>   int hw_breakpoint_handler(struct die_args *args);
> 
