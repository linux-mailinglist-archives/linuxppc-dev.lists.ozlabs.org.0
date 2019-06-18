Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0707498DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:26:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SdQM38ZKzDqRZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cFsBO9Zs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SdNV4NrtzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:24:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45SdNQ5LxPz9v2hq;
 Tue, 18 Jun 2019 08:24:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cFsBO9Zs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rONjPKrv_eoG; Tue, 18 Jun 2019 08:24:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45SdNQ4J7Tz9v2hp;
 Tue, 18 Jun 2019 08:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560839094; bh=t8EkGCrHzuXsMOhfuoBqjBOp4EePACQOfRiTKQzo240=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cFsBO9ZsKYA6Rxu22NwSnfmVa4rWolVMT4MyHRVXUn1cxkA0aVhlqdmv9QVHxiu32
 Caam8qSl7zZ8sBIpLx3p3zs2JpEUNXUqhlWXVikc39OUEbtrjhcZJeijlHHaOUylYk
 ELYEzQ0F3erX2aXD4mYoICx28x5KH+hM2pjhnoCM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95EFD8B86D;
 Tue, 18 Jun 2019 08:24:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LCs9YYj1ow45; Tue, 18 Jun 2019 08:24:54 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC5E08B78B;
 Tue, 18 Jun 2019 08:24:53 +0200 (CEST)
Subject: Re: [PATCH 3/5] Powerpc/hw-breakpoint: Refactor set_dawr()
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-4-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <36044d6d-d46f-8c7b-c597-0e5d156fd9db@c-s.fr>
Date: Tue, 18 Jun 2019 08:24:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618042732.5582-4-ravi.bangoria@linux.ibm.com>
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
> Remove unnecessary comments. Code itself is self explanatory.
> And, ISA already talks about MRD field. I Don't think we need
> to re-describe it.

In an RFC patch you may "don't think".
But in the final patch you need to make a decision and write it as such.

Ie, you should write: "We don't need to re-describe it."


> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/kernel/process.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index f0fbbf6a6a1f..f002d2ffff86 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -799,18 +799,11 @@ int set_dawr(struct arch_hw_breakpoint *brk)
>   
>   	dawr = brk->address;
>   
> -	dawrx  = (brk->type & (HW_BRK_TYPE_READ | HW_BRK_TYPE_WRITE)) \
> -		                   << (63 - 58); //* read/write bits */
> -	dawrx |= ((brk->type & (HW_BRK_TYPE_TRANSLATE)) >> 2) \
> -		                   << (63 - 59); //* translate */
> -	dawrx |= (brk->type & (HW_BRK_TYPE_PRIV_ALL)) \
> -		                   >> 3; //* PRIM bits */
> -	/* dawr length is stored in field MDR bits 48:53.  Matches range in
> -	   doublewords (64 bits) baised by -1 eg. 0b000000=1DW and
> -	   0b111111=64DW.
> -	   brk->len is in bytes.
> -	   This aligns up to double word size, shifts and does the bias.
> -	*/
> +	dawrx  = (brk->type & HW_BRK_TYPE_RDWR) << (63 - 58);
> +	dawrx |= ((brk->type & HW_BRK_TYPE_TRANSLATE) >> 2) << (63 - 59);
> +	dawrx |= (brk->type & HW_BRK_TYPE_PRIV_ALL) >> 3;
> +
> +	/* brk->len is in bytes. */
>   	mrd = ((brk->len + 7) >> 3) - 1;
>   	dawrx |= (mrd & 0x3f) << (63 - 53);
>   
> 
