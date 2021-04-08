Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F1E357BAA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 07:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG8JZ4XtXz30hl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 15:02:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG8JF5b9Vz2y81
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 15:02:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FG8J94JYGzB09ZJ;
 Thu,  8 Apr 2021 07:02:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wo15aJ24badP; Thu,  8 Apr 2021 07:02:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FG8J90khkzB09ZH;
 Thu,  8 Apr 2021 07:02:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1F158B7C3;
 Thu,  8 Apr 2021 07:02:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YoTzwfEJdziZ; Thu,  8 Apr 2021 07:02:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 231688B75F;
 Thu,  8 Apr 2021 07:02:01 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc: remove set but not used variable
 'force_printk_to_btext'
To: Yu Kuai <yukuai3@huawei.com>, mpe@ellerman.id.au
References: <20210408011801.557004-1-yukuai3@huawei.com>
 <20210408011801.557004-2-yukuai3@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b7636590-42ef-e588-59e1-b0591243d619@csgroup.eu>
Date: Thu, 8 Apr 2021 07:01:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408011801.557004-2-yukuai3@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/04/2021 à 03:18, Yu Kuai a écrit :
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> arch/powerpc/kernel/btext.c:49:12: error: 'force_printk_to_btext'
> defined but not used.

You don't get this error as it is now.
You will get this error only if you make it 'static', which is what you did in your first patch 
based on the 'sparse' report.

When removing a non static variable, you should explain that you can remove it after you have 
verifier that it is nowhere used, neither in that file nor in any other one.

> 
> It is never used, and so can be removed.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   arch/powerpc/kernel/btext.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
> index 803c2a45b22a..359d0f4ca532 100644
> --- a/arch/powerpc/kernel/btext.c
> +++ b/arch/powerpc/kernel/btext.c
> @@ -46,7 +46,6 @@ unsigned long disp_BAT[2] __initdata = {0, 0};
>   static unsigned char vga_font[cmapsz];
>   
>   int boot_text_mapped __force_data = 0;
> -int force_printk_to_btext = 0;
>   
>   extern void rmci_on(void);
>   extern void rmci_off(void);
> 
