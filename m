Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC42DF9E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:26:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzsxL5hnbzDr0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:25:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzsVp3Qt8zDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:06:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CzsVY1QRHzB09ZW;
 Mon, 21 Dec 2020 09:06:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r_YL2RLCqZ4O; Mon, 21 Dec 2020 09:06:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CzsVY0bGvzB09ZV;
 Mon, 21 Dec 2020 09:06:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D9D268B7C3;
 Mon, 21 Dec 2020 09:06:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5H4unMvpequD; Mon, 21 Dec 2020 09:06:17 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 87D3B8B7BE;
 Mon, 21 Dec 2020 09:06:17 +0100 (CET)
Subject: Re: [PATCH 02/23] powerpc/pseries/ras: Remove unused variable 'status'
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-3-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f2c63593-1db6-4bce-3fee-d57ddaa34cda@csgroup.eu>
Date: Mon, 21 Dec 2020 09:06:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221074222.403894-3-clg@kaod.org>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
> The last use of 'status' was removed in 2012. Remove the variable to
> fix this W=1 compile error.
> 
> ../arch/powerpc/platforms/pseries/ras.c: In function ‘ras_epow_interrupt’:
> ../arch/powerpc/platforms/pseries/ras.c:318:6: error: variable ‘status’ set but not used [-Werror=unused-but-set-variable]
>    318 |  int status;
>        |      ^~~~~~
> 
> Fixes: 55fc0c561742 ("powerpc/pseries: Parse and handle EPOW interrupts")
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/platforms/pseries/ras.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 149cec2212e6..e27310fc1481 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -315,11 +315,10 @@ static irqreturn_t ras_hotplug_interrupt(int irq, void *dev_id)
>   /* Handle environmental and power warning (EPOW) interrupts. */
>   static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>   {
> -	int status;
>   	int state;
>   	int critical;
>   
> -	status = rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
> +	rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
>   				      &state);

Should fit on a single line now.

>   
>   	if (state > 3)
> @@ -329,7 +328,7 @@ static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>   
>   	spin_lock(&ras_log_buf_lock);
>   
> -	status = rtas_call(ras_check_exception_token, 6, 1, NULL,
> +	rtas_call(ras_check_exception_token, 6, 1, NULL,
>   			   RTAS_VECTOR_EXTERNAL_INTERRUPT,
>   			   virq_to_hw(irq),
>   			   RTAS_EPOW_WARNING,
> 

Take the opportunity to reduce the number of lines taken by the instruction (should fit on two 
lines) and get arguments of the second line properly aligned to the open parenthesis.
