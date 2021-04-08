Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D3357BA3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 06:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG8Cr25c1z3bss
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 14:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG8CV4mRhz303s
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 14:57:55 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FG8CN0Vj9zB09ZH;
 Thu,  8 Apr 2021 06:57:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id so05TY0S2tCo; Thu,  8 Apr 2021 06:57:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FG8CM6cxdzB09ZG;
 Thu,  8 Apr 2021 06:57:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEC0D8B7C0;
 Thu,  8 Apr 2021 06:57:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FszZmx3-x-gr; Thu,  8 Apr 2021 06:57:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 212808B75F;
 Thu,  8 Apr 2021 06:57:52 +0200 (CEST)
Subject: Re: [PATCH-next] powerpc/interrupt: Remove duplicate header file
To: johnny.chenyi@huawei.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
References: <20210408035644.2417002-1-johnny.chenyi@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c42ebf38-c7ea-68bc-01ca-8352581bc33d@csgroup.eu>
Date: Thu, 8 Apr 2021 06:57:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408035644.2417002-1-johnny.chenyi@huawei.com>
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
Cc: yuehaibing@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/04/2021 à 05:56, johnny.chenyi@huawei.com a écrit :
> From: Chen Yi <johnny.chenyi@huawei.com>
> 
> Delete one of the header files <asm/interrupt.h> that are included
> twice.

Guys, we have been flooded with such tiny patches over the last weeks, some changes being sent 
several times by different people.

That one is included in 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210323062916.295346-1-wanjiabing@vivo.com/

And was already submitted a few hours earlier by someone else: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1616464656-59372-1-git-send-email-zhouchuangao@vivo.com/

Could you work all together and cook an overall patch including all duplicate removal from 
arch/powerpc/ files ?

Best way would be I think to file an issue at https://github.com/linuxppc/issues/issues , then you 
do a complete analysis and list in the issue all places to be modified, then once the analysis is 
complete you send a full single patch.

Thanks
Christophe

> 
> Signed-off-by: Chen Yi <johnny.chenyi@huawei.com>
> ---
>   arch/powerpc/kernel/interrupt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index c4dd4b8f9cfa..f64ace0208b7 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -7,7 +7,6 @@
>   #include <asm/asm-prototypes.h>
>   #include <asm/kup.h>
>   #include <asm/cputime.h>
> -#include <asm/interrupt.h>
>   #include <asm/hw_irq.h>
>   #include <asm/interrupt.h>
>   #include <asm/kprobes.h>
> 
