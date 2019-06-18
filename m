Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93769498D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:23:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SdLk6zsnzDqJX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:23:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="TKNZzGvX"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SdK54bVjzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:22:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45SdK14Rfwz9vBJt;
 Tue, 18 Jun 2019 08:21:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TKNZzGvX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KSmGm5VL72on; Tue, 18 Jun 2019 08:21:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45SdK13G6fz9vBJp;
 Tue, 18 Jun 2019 08:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560838917; bh=FCB7CdEBbBFcFNkuD3v6ni+zfUzz8NqMtrHA12Q714w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TKNZzGvXPy40kaL9LaUOHSsIwHMuZxENX96THuEAeEJRimn1kuU1dGmvPR3FDaC2W
 7Jt9nzVF8LwISZuxamxBPn4InCA1/e/hEO+sHFsgDydB+M6A285DccUC2R40a5SeyN
 e9Ibc5LkeplbAUMVNVKaZfFvrL0Gl9nkNuo8TnHo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DA238B86C;
 Tue, 18 Jun 2019 08:21:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qbpbh5PAMYh3; Tue, 18 Jun 2019 08:21:57 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78A5A8B78B;
 Tue, 18 Jun 2019 08:21:56 +0200 (CEST)
Subject: Re: [PATCH 2/5] Powerpc/hw-breakpoint: Refactor
 hw_breakpoint_arch_parse()
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-3-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <66e70f57-befa-f241-9476-8e06519bac90@c-s.fr>
Date: Tue, 18 Jun 2019 08:21:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618042732.5582-3-ravi.bangoria@linux.ibm.com>
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
> Move feature availability check at the start of the function.
> Rearrange comment to it's associated code. Use hw->address and
> hw->len in the 512 bytes boundary check(to write if statement
> in a single line). Add spacing between code blocks.

Are those cosmetic changes in the boundary check worth it since they 
disappear in the final patch ?

Christophe

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/kernel/hw_breakpoint.c | 34 +++++++++++++++--------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 1908e4fcc132..36bcf705df65 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -133,10 +133,13 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>   			     const struct perf_event_attr *attr,
>   			     struct arch_hw_breakpoint *hw)
>   {
> -	int ret = -EINVAL, length_max;
> +	int length_max;
> +
> +	if (!ppc_breakpoint_available())
> +		return -ENODEV;
>   
>   	if (!bp)
> -		return ret;
> +		return -EINVAL;
>   
>   	hw->type = HW_BRK_TYPE_TRANSLATE;
>   	if (attr->bp_type & HW_BREAKPOINT_R)
> @@ -145,34 +148,33 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>   		hw->type |= HW_BRK_TYPE_WRITE;
>   	if (hw->type == HW_BRK_TYPE_TRANSLATE)
>   		/* must set alteast read or write */
> -		return ret;
> +		return -EINVAL;
> +
>   	if (!attr->exclude_user)
>   		hw->type |= HW_BRK_TYPE_USER;
>   	if (!attr->exclude_kernel)
>   		hw->type |= HW_BRK_TYPE_KERNEL;
>   	if (!attr->exclude_hv)
>   		hw->type |= HW_BRK_TYPE_HYP;
> +
>   	hw->address = attr->bp_addr;
>   	hw->len = attr->bp_len;
>   
> -	/*
> -	 * Since breakpoint length can be a maximum of HW_BREAKPOINT_LEN(8)
> -	 * and breakpoint addresses are aligned to nearest double-word
> -	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address, the
> -	 * 'symbolsize' should satisfy the check below.
> -	 */
> -	if (!ppc_breakpoint_available())
> -		return -ENODEV;
>   	length_max = 8; /* DABR */
>   	if (dawr_enabled()) {
>   		length_max = 512 ; /* 64 doublewords */
> -		/* DAWR region can't cross 512 boundary */
> -		if ((attr->bp_addr >> 9) !=
> -		    ((attr->bp_addr + attr->bp_len - 1) >> 9))
> +		/* DAWR region can't cross 512 bytes boundary */
> +		if ((hw->address >> 9) != ((hw->address + hw->len - 1) >> 9))
>   			return -EINVAL;
>   	}
> -	if (hw->len >
> -	    (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
> +
> +	/*
> +	 * Since breakpoint length can be a maximum of length_max and
> +	 * breakpoint addresses are aligned to nearest double-word
> +	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address,
> +	 * the 'symbolsize' should satisfy the check below.
> +	 */
> +	if (hw->len > (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
>   		return -EINVAL;
>   	return 0;
>   }
> 
