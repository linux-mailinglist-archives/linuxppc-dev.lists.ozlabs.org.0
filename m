Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC424368355
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:30:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR1ZZ6Ng6z30Gp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:30:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR1ZB4NL0z2yZM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 01:29:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FR1Z63sbxz9v4h8;
 Thu, 22 Apr 2021 17:29:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PXz2z_EasiGH; Thu, 22 Apr 2021 17:29:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FR1Z630KCz9v4gH;
 Thu, 22 Apr 2021 17:29:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 94CFF8B846;
 Thu, 22 Apr 2021 17:29:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XVqJnCmN8KZl; Thu, 22 Apr 2021 17:29:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01DF98B845;
 Thu, 22 Apr 2021 17:29:50 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc: Print esr register when hitting Program
 Interrupt
To: Xiongwei Song <sxwjean@me.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, aneesh.kumar@linux.ibm.com,
 0x7f454c46@gmail.com
References: <20210422151022.17868-1-sxwjean@me.com>
 <20210422151022.17868-2-sxwjean@me.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ac6cf0ae-7565-180e-03b2-5e72f89a823a@csgroup.eu>
Date: Thu, 22 Apr 2021 17:29:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210422151022.17868-2-sxwjean@me.com>
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/04/2021 à 17:10, Xiongwei Song a écrit :
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> The esr register has the details of Program Interrupt on BookE/4xx cpus,
> printing its value is helpful.
> 
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   arch/powerpc/kernel/process.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 5c3830837f3a..664aecf8ee2e 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1459,6 +1459,7 @@ static bool interrupt_detail_printable(int trap)
>   	case INTERRUPT_MACHINE_CHECK:
>   	case INTERRUPT_DATA_STORAGE:
>   	case INTERRUPT_ALIGNMENT:
> +	case INTERRUPT_PROGRAM:

With this, it will also print the DSISR on 8xx/6xx so it will print garbage.

8xx/6xx provide the information in SRR1. If you want to proceed, you have to do the same as in ISI: 
Copy the content of SRR1 into regs->dsisr in the assembly handler in head_book3s_32.S and in the 
instruction TLB error handler in head_8xx.S

>   		return true;
>   	default:
>   		return false;
> 
