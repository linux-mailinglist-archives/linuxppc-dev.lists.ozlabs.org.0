Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D8187E78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:37:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hV3M61CCzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:37:03 +1100 (AEDT)
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
 header.s=mail header.b=mkaK6jid; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hV1Y6Xq7zDqZB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:35:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hV1T3fyXz9tyNJ;
 Tue, 17 Mar 2020 11:35:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mkaK6jid; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0CaV5ugBkrom; Tue, 17 Mar 2020 11:35:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hV1T2YLTz9tyN5;
 Tue, 17 Mar 2020 11:35:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584441325; bh=A+PMivXF8uTOY5GbFU434SmPOEkpNOTireCO2xVWYl0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mkaK6jidkr43As4esiENyHFYX84ztCbm8h4X0bLyvndSpFGjyOqOyTihyQk5cxx16
 Psg76xPSO6QvcZA/j78sx4oZPGGnnKZRu8EvzM17zvgCRBIhVTNs9DRZi37lVR4XH8
 JeMdo4namM1z0N8G3A23mnKwcqC+CD5cu6qxPIe0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C6DB8B785;
 Tue, 17 Mar 2020 11:35:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FkbONcCnIi0G; Tue, 17 Mar 2020 11:35:26 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B67B8B787;
 Tue, 17 Mar 2020 11:35:24 +0100 (CET)
Subject: Re: [PATCH 08/15] powerpc/watchpoint: Disable all available
 watchpoints when !dawr_force_enable
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-9-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1381b9f9-4999-0e03-8344-af84a88fa074@c-s.fr>
Date: Tue, 17 Mar 2020 11:35:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309085806.155823-9-ravi.bangoria@linux.ibm.com>
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
> Instead of disabling only first watchpoint, disable all available
> watchpoints while clearing dawr_force_enable.
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

Can you explain a bit more what you do exactly ? Why do you change the 
name of the function and why the parameter becomes NULL ? And why it 
doens't take into account the parameter anymore ?

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
