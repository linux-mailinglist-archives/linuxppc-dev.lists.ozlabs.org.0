Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2613C6C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 15:58:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yVnY6rjgzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:58:25 +1100 (AEDT)
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
 header.s=mail header.b=WBcizLfB; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yVkj72cCzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:55:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yVkd1L6Qz9tylV;
 Wed, 15 Jan 2020 15:55:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WBcizLfB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yej87JrYwKck; Wed, 15 Jan 2020 15:55:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yVkd0G7Zz9tylT;
 Wed, 15 Jan 2020 15:55:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579100153; bh=drzSvcOTpHXGDw4v5FPxHbIJiwf/PfYcxldvnk1kSwk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=WBcizLfBm8MCg5j0/7mTLx79/XdaaeLBVsccrdfLkd25w0FQKLPdjjv2cEs65IzaG
 n7kbUMCh+PZxCzwPJMNrVX+L9UuptNN6BSkmJe/H8+LBkp0v3k/wUYLdqKncLAGHca
 1HF86g2D7YcBKJ5kr3I0fUYximDPIOfMNE5i8k8k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82FF08B805;
 Wed, 15 Jan 2020 15:55:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4a6NedTi81Jj; Wed, 15 Jan 2020 15:55:54 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 60D828B774;
 Wed, 15 Jan 2020 15:55:54 +0100 (CET)
Subject: Re: [PATCH v2] Fix display of Maximum Memory
To: Michael Bringmann <mwb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Gustavo Walbon <gwalbon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
References: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9a3b1c39-8c4f-6376-ff00-2e06190d0c67@c-s.fr>
Date: Wed, 15 Jan 2020 15:55:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/01/2020 à 15:53, Michael Bringmann a écrit :
> Correct overflow problem in calculation+display of Maximum Memory
> value to syscfg where 32bits is insufficient.
> 
> Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/platforms/pseries/lparcfg.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index e33e8bc..f00411c 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -433,12 +433,12 @@ static void parse_em_data(struct seq_file *m)
>   
>   static void maxmem_data(struct seq_file *m)
>   {
> -	unsigned long maxmem = 0;
> +	u64 maxmem = 0;
>   
> -	maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
> -	maxmem += hugetlb_total_pages() * PAGE_SIZE;
> +	maxmem += (u64)drmem_info->n_lmbs * drmem_info->lmb_size;
> +	maxmem += (u64)hugetlb_total_pages() * PAGE_SIZE;
>   
> -	seq_printf(m, "MaxMem=%ld\n", maxmem);
> +	seq_printf(m, "MaxMem=%llu\n", maxmem);
>   }
>   
>   static int pseries_lparcfg_data(struct seq_file *m, void *v)
> 
