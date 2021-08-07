Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808093E33D8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 08:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhY8s0g5cz3cXk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 16:58:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhY8R1bTZz3d7d
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 16:58:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GhY8N1YBGz9sTw;
 Sat,  7 Aug 2021 08:58:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Z6jmJK6Y51D; Sat,  7 Aug 2021 08:58:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GhY8N0SD9z9sTt;
 Sat,  7 Aug 2021 08:58:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE60E8B76D;
 Sat,  7 Aug 2021 08:58:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CG8oAOvJePyH; Sat,  7 Aug 2021 08:58:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 894808B766;
 Sat,  7 Aug 2021 08:58:10 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] powerpc: Optimize register usage for dear register
To: sxwjean@me.com, linuxppc-dev@lists.ozlabs.org
References: <20210807010239.416055-1-sxwjean@me.com>
 <20210807010239.416055-4-sxwjean@me.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <dfd24c4a-c43f-912c-5876-f1cac704f336@csgroup.eu>
Date: Sat, 7 Aug 2021 08:57:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210807010239.416055-4-sxwjean@me.com>
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 efremov@linux.com, paulus@samba.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2021 à 03:02, sxwjean@me.com a écrit :
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> Create an anonymous union for dar and dear regsiters, we can reference
> dear to get the effective address when CONFIG_4xx=y or CONFIG_BOOKE=y.
> Otherwise, reference dar. This makes code more clear.
> 
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   arch/powerpc/include/asm/ptrace.h   | 5 ++++-
>   arch/powerpc/kernel/process.c       | 2 +-
>   arch/powerpc/kernel/ptrace/ptrace.c | 2 ++
>   3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index c252d04b1206..fa725e3238c2 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -43,7 +43,10 @@ struct pt_regs
>   			unsigned long mq;
>   #endif
>   			unsigned long trap;
> -			unsigned long dar;
> +			union {
> +				unsigned long dar;
> +				unsigned long dear;
> +			};
>   			union {
>   				unsigned long dsisr;
>   				unsigned long esr;
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index f74af8f9133c..50436b52c213 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
>   	    trap == INTERRUPT_DATA_STORAGE ||
>   	    trap == INTERRUPT_ALIGNMENT) {
>   		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> -			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->esr);
> +			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dear, regs->esr);
>   		else
>   			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>   	}
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index a222fd4d6334..7c7093c17c45 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -373,6 +373,8 @@ void __init pt_regs_check(void)
>   		     offsetof(struct user_pt_regs, trap));
>   	BUILD_BUG_ON(offsetof(struct pt_regs, dar) !=
>   		     offsetof(struct user_pt_regs, dar));
> +	BUILD_BUG_ON(offsetof(struct pt_regs, dear) !=
> +		     offsetof(struct user_pt_regs, dar));

dar and dear are the same, so checking the same thing a second time is pointless.

>   	BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=
>   		     offsetof(struct user_pt_regs, dsisr));
>   	BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=
> 
