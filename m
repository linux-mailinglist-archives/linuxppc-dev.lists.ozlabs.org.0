Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7619A5B2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 08:56:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48scSH3RG4zDqtt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:56:47 +1100 (AEDT)
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
 header.s=mail header.b=Cb5oyV75; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbxk6PGDzDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 17:33:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sbxY6r4Xz9txbT;
 Wed,  1 Apr 2020 08:33:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Cb5oyV75; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zYu6vhpDCY0H; Wed,  1 Apr 2020 08:33:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sbxY5JsVz9txbR;
 Wed,  1 Apr 2020 08:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585722817; bh=Wu7Hf+9jIPkGojr6+lEuEJG5F/BNn5V9Djrlob/oB1k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cb5oyV75n6MwS+iynLK6NifEgmf7iS8oiMbsGzDJYP6M+CimG8gcDwmrXaVQnkBR5
 0NkTyWqUYmOsih9w2j8opcqOzvtsvYWWAleV2te74sxesizpoeUi0wDuLkvBc0LC+5
 xAF9u4BTnHvt7mSwR3hZdmDXf2UB/vKuTo0XJulI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 878D78B7B3;
 Wed,  1 Apr 2020 08:33:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9DYyir0Z_bBL; Wed,  1 Apr 2020 08:33:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1AEAA8B778;
 Wed,  1 Apr 2020 08:33:36 +0200 (CEST)
Subject: Re: [PATCH v2 08/16] powerpc/watchpoint: Disable all available
 watchpoints when !dawr_force_enable
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-9-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1bef7056-b862-3b20-c3b8-8b161511c60a@c-s.fr>
Date: Wed, 1 Apr 2020 08:33:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401061309.92442-9-ravi.bangoria@linux.ibm.com>
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
> Instead of disabling only first watchpoint, disable all available
> watchpoints while clearing dawr_force_enable.

Can you also explain why you change the function name ?

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/kernel/dawr.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
> index 311e51ee09f4..5c882f07ac7d 100644
> --- a/arch/powerpc/kernel/dawr.c
> +++ b/arch/powerpc/kernel/dawr.c
> @@ -50,9 +50,13 @@ int set_dawr(struct arch_hw_breakpoint *brk, int nr)
>   	return 0;
>   }
>   
> -static void set_dawr_cb(void *info)
> +static void disable_dawrs(void *info)

Wouldn't it be better to keep _cb at the end of the function ?

>   {
> -	set_dawr(info, 0);
> +	struct arch_hw_breakpoint null_brk = {0};
> +	int i;
> +
> +	for (i = 0; i < nr_wp_slots(); i++)
> +		set_dawr(&null_brk, i);
>   }
>   
>   static ssize_t dawr_write_file_bool(struct file *file,
> @@ -74,7 +78,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
>   
>   	/* If we are clearing, make sure all CPUs have the DAWR cleared */
>   	if (!dawr_force_enable)
> -		smp_call_function(set_dawr_cb, &null_brk, 0);
> +		smp_call_function(disable_dawrs, NULL, 0);
>   
>   	return rc;
>   }
> 

Christophe
