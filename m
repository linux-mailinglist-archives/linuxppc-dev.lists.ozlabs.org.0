Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70019A5AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 08:54:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48scQ26bSkzDr7l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:54:50 +1100 (AEDT)
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
 header.s=mail header.b=M2cJ07AQ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbvv4rgBzDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 17:32:11 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sbvn111rz9txbS;
 Wed,  1 Apr 2020 08:32:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=M2cJ07AQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id N82vlwFNG6uA; Wed,  1 Apr 2020 08:32:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sbvm6lDrz9txbR;
 Wed,  1 Apr 2020 08:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585722724; bh=fz42DDV9ApxpNWS9T44dvSssW81bIergY+V0OGliRCc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M2cJ07AQx+wEWbJgoO7fxKln758xBxks6FjTnnm5oYwoVzyuOkCV216Qwwh5oxJIK
 9oTk8dh//opPicmXTptz+XB74i+IwhiG7ij7iZo9c5nnu3Na44QIvaxca3P08EB5RA
 2+eZoW8s3LmzBjQlO4IA5//hYNUTkrWB6KqB4rV0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC48E8B7B3;
 Wed,  1 Apr 2020 08:32:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G8hXNfMZR6VY; Wed,  1 Apr 2020 08:32:05 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57F1E8B778;
 Wed,  1 Apr 2020 08:32:03 +0200 (CEST)
Subject: Re: [PATCH v2 07/16] powerpc/watchpoint: Get watchpoint count
 dynamically while disabling them
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-8-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3c2312bb-9689-830e-3bc8-c828eddf369c@c-s.fr>
Date: Wed, 1 Apr 2020 08:32:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401061309.92442-8-ravi.bangoria@linux.ibm.com>
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



Le 01/04/2020 à 08:13, Ravi Bangoria a écrit :
> Instead of disabling only one watchpoint, get num of available
> watchpoints dynamically and disable all of them.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/hw_breakpoint.h | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 4e4976c3248b..fae33c729ba9 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -78,14 +78,13 @@ extern void ptrace_triggered(struct perf_event *bp,
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

Those declaration should be in the block unsigned them below.

> +
> +	if (ppc_breakpoint_available()) {
> +		for (i = 0; i < nr_wp_slots(); i++)
> +			__set_breakpoint(&null_brk, i);
> +	}

I would have had a preference to the following, but that's detail I guess:

	int i;
	struct arch_hw_breakpoint null_brk = {0};

	if (!ppc_breakpoint_available())
		return;

	for (i = 0; i < nr_wp_slots(); i++)
		__set_breakpoint(&null_brk, i);

>   }
>   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
>   int hw_breakpoint_handler(struct die_args *args);
> 

Christophe
