Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E43498EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:33:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SdZX3vvzzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:33:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="OmzqKc6+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SdXf4xjGzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:32:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45SdXb0twlz9v2g3;
 Tue, 18 Jun 2019 08:31:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OmzqKc6+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TZILph5M7jCf; Tue, 18 Jun 2019 08:31:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45SdXZ6xSBz9v2g2;
 Tue, 18 Jun 2019 08:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560839519; bh=TE8cI41mSPy/enSR8a1lyKFDOW5JBtL6McA/5Yz5l78=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OmzqKc6+Wv8ufXUWHDj3EK2h8DFvl0fTvJkxdDH/p+wfrsBPHVeDOAUuz09Qmw1zM
 jkEKEfpMfJSyknKwQCKuinjfVNKG80s91tSt1HMdJFzi/zLgPWdWWrzoYr9nTWNrdt
 LTFus4bhtqcPNOnFcigRiHvkB//GqIGnXyumsLkY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 006408B884;
 Tue, 18 Jun 2019 08:31:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qAwZ7WmJ_x5P; Tue, 18 Jun 2019 08:31:58 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19A068B78B;
 Tue, 18 Jun 2019 08:31:58 +0200 (CEST)
Subject: Re: [PATCH 4/5] Powerpc/hw-breakpoint: Optimize disable path
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-5-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6e7c6054-b152-40db-c7d3-89901949460f@c-s.fr>
Date: Tue, 18 Jun 2019 08:31:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618042732.5582-5-ravi.bangoria@linux.ibm.com>
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
Cc: mikey@neuling.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/06/2019 à 06:27, Ravi Bangoria a écrit :
> Directly setting dawr and dawrx with 0 should be enough to
> disable watchpoint. No need to reset individual bits in
> variable and then set in hw.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/hw_breakpoint.h |  3 ++-
>   arch/powerpc/kernel/process.c            | 12 ++++++++++++
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 78202d5fb13a..8acbbdd4a2d5 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -19,6 +19,7 @@ struct arch_hw_breakpoint {
>   /* Note: Don't change the the first 6 bits below as they are in the same order
>    * as the dabr and dabrx.
>    */
> +#define HW_BRK_TYPE_DISABLE		0x00

I'd rather call it HW_BRK_TYPE_NONE

>   #define HW_BRK_TYPE_READ		0x01
>   #define HW_BRK_TYPE_WRITE		0x02
>   #define HW_BRK_TYPE_TRANSLATE		0x04
> @@ -68,7 +69,7 @@ static inline void hw_breakpoint_disable(void)
>   	struct arch_hw_breakpoint brk;
>   
>   	brk.address = 0;
> -	brk.type = 0;
> +	brk.type = HW_BRK_TYPE_DISABLE;
>   	brk.len = 0;
>   	if (ppc_breakpoint_available())
>   		__set_breakpoint(&brk);
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index f002d2ffff86..265fac9fb3a4 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -793,10 +793,22 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
>   	return __set_dabr(dabr, dabrx);
>   }
>   
> +static int disable_dawr(void)
> +{
> +	if (ppc_md.set_dawr)
> +		return ppc_md.set_dawr(0, 0);
> +
> +	mtspr(SPRN_DAWRX, 0);

And SPRN_DAWR ?

The above code looks pretty similar to the one at the end of set_dawr(). 
You should factorise it, for instance

static int __set_dawr(int dawr, int dawrx)
{
	if (ppc_md.set_dawr)
		return ppc_md.set_dawr(dawr, dawrx);
	mtspr(SPRN_DAWR, dawr);
	mtspr(SPRN_DAWRX, dawrx);
	return 0;
}

> +	return 0;
> +}
> +
>   int set_dawr(struct arch_hw_breakpoint *brk)
>   {
>   	unsigned long dawr, dawrx, mrd;
>   
> +	if (brk->type == HW_BRK_TYPE_DISABLE)
> +		return disable_dawr();

Then replace by __set_dawr(0, 0);

> +
>   	dawr = brk->address;
>   
>   	dawrx  = (brk->type & HW_BRK_TYPE_RDWR) << (63 - 58);
> 

And use the new helper at the end of the function too.

Christophe
