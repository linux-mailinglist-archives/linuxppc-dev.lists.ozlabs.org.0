Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A112658CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:32:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnksW4DwRzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:32:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnklK4tBGzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:26:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BnklB2Ch3z9tynT;
 Fri, 11 Sep 2020 07:26:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ywA6MJUnJq7u; Fri, 11 Sep 2020 07:26:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BnklB1FFzz9tynS;
 Fri, 11 Sep 2020 07:26:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E97F38B832;
 Fri, 11 Sep 2020 07:26:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HtYaMCTRXDCq; Fri, 11 Sep 2020 07:26:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E2668B75E;
 Fri, 11 Sep 2020 07:26:46 +0200 (CEST)
Subject: Re: [PATCH 1/7] powerpc/sysfs: Fix W=1 compile warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-2-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <622dc63b-d3ad-3d7e-b796-7b99db9746c4@csgroup.eu>
Date: Fri, 11 Sep 2020 07:26:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910210250.1962595-2-clg@kaod.org>
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
> arch/powerpc/kernel/sysfs.c: In function ‘sysfs_create_dscr_default’:
> arch/powerpc/kernel/sysfs.c:228:7: error: variable ‘err’ set but not used [-Werror=unused-but-set-variable]
>     int err = 0;
>         ^~~
> cc1: all warnings being treated as errors

A small sentence explaining how this is fixes would be welcome, so that 
you don't need to read the code the know what the commit does to fix the 
warning. Even the subject should be more explicite, rather than saying 
"Fix W=1 compile warning", I think it should say something like "remove 
unused err variable"


> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/kernel/sysfs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 46b4ebc33db7..821a3dc4c924 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -225,14 +225,13 @@ static DEVICE_ATTR(dscr_default, 0600,
>   static void sysfs_create_dscr_default(void)
>   {
>   	if (cpu_has_feature(CPU_FTR_DSCR)) {
> -		int err = 0;
>   		int cpu;
>   
>   		dscr_default = spr_default_dscr;
>   		for_each_possible_cpu(cpu)
>   			paca_ptrs[cpu]->dscr_default = dscr_default;
>   
> -		err = device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
> +		device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
>   	}
>   }
>   #endif /* CONFIG_PPC64 */
> 
