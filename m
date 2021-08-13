Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAE03EB35D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 11:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmJLY2zDlz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 19:35:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmJL65Lsvz30HV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 19:34:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GmJL14nljz9sWw;
 Fri, 13 Aug 2021 11:34:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xARgZC9h4Ox; Fri, 13 Aug 2021 11:34:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GmJL13qZcz9sWs;
 Fri, 13 Aug 2021 11:34:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4863A8B82E;
 Fri, 13 Aug 2021 11:34:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eEpE6J1ORMKe; Fri, 13 Aug 2021 11:34:33 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D9AEB8B826;
 Fri, 13 Aug 2021 11:34:32 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Return regs->nip as instruction
 pointer value when SIAR is 0
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <20210813082450.429320-2-kjain@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
Date: Fri, 13 Aug 2021 11:34:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210813082450.429320-2-kjain@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/08/2021 à 10:24, Kajol Jain a écrit :
> Incase of random sampling, there can be scenarios where SIAR is not
> latching sample address and results in 0 value. Since current code
> directly returning the siar value, we could see multiple instruction
> pointer values as 0 in perf report.
> Patch resolves this issue by adding a ternary condition to return
> regs->nip incase SIAR is 0.

Your description seems rather similar to 
https://github.com/linuxppc/linux/commit/2ca13a4cc56c920a6c9fc8ee45d02bccacd7f46c

Does it mean that the problem occurs on more than the power10 DD1 ?

In that case, can the solution be common instead of doing something for power10 DD1 and something 
for others ?

> 
> Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
> into perf_read_regs")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   arch/powerpc/perf/core-book3s.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 1b464aad29c4..aeecaaf6810f 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2260,7 +2260,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   		else
>   			return regs->nip;
>   	} else if (use_siar && siar_valid(regs))
> -		return siar + perf_ip_adjust(regs);
> +		return siar ? siar + perf_ip_adjust(regs) : regs->nip;
>   	else if (use_siar)
>   		return 0;		// no valid instruction pointer
>   	else
> 
