Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954313B926
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 06:42:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yGST1qQKzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 16:42:49 +1100 (AEDT)
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
 header.s=mail header.b=sfBhmYet; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yGQk4c1pzDqDp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 16:41:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yGQX1mqXz9vJ9w;
 Wed, 15 Jan 2020 06:41:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sfBhmYet; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Rdx1R27WK1OZ; Wed, 15 Jan 2020 06:41:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yGQX0hprz9vJ9v;
 Wed, 15 Jan 2020 06:41:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579066868; bh=bRfKh/Cnz206aPF3lzBprN9c8zs4SrTAq3h16N+7SHw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sfBhmYetSsi3Ss5SJ7e9KTZnHFjPXC9u/9eu80eR3zJl3thbTW15nJ05CUMBW0uVk
 pIRVniOt4PsZXoKE66DQwekei9xTv9g5nPtQzUZ/+rKGbFbOWZ5En6M3LW7E8ukZE1
 5Qf6V6TbteuqusiEM6OBNedAG9HkllYRJ9h6BETA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D655D8B77B;
 Wed, 15 Jan 2020 06:41:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ph2qjykawEAp; Wed, 15 Jan 2020 06:41:08 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9E618B774;
 Wed, 15 Jan 2020 06:41:08 +0100 (CET)
Subject: Re: [PATCH] Fix display of Maximum Memory
To: Michael Bringmann <mwb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <55f25626-20ca-0acb-3571-ff636ca4632c@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <41380afd-05f5-f36f-c857-041243c73ee3@c-s.fr>
Date: Wed, 15 Jan 2020 06:41:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <55f25626-20ca-0acb-3571-ff636ca4632c@linux.ibm.com>
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
Cc: Gustavo Walbon <gwalbon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/01/2020 à 22:07, Michael Bringmann a écrit :
> Correct overflow problem in calculation+display of Maximum Memory
> value to syscfg where 32bits is insufficient.
> 
> Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/lparcfg.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index 4ee2594..183aeb7 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -435,12 +435,12 @@ static void parse_em_data(struct seq_file *m)
> 
>   static void maxmem_data(struct seq_file *m)
>   {
> -       unsigned long maxmem = 0;
> +       unsigned long long maxmem = 0;

What about using u64 instead, for readability ?

> 
> -       maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
> -       maxmem += hugetlb_total_pages() * PAGE_SIZE;
> +       maxmem += (unsigned long long)drmem_info->n_lmbs * (unsigned long long)drmem_info->lmb_size;

This line is likely too long. You only need to cast one of the two 
operants to force a 64 bits multiply. And using u64 would shorten the line.

Can both multiplications overflow ?

Christophe

> +       maxmem += (unsigned long long)hugetlb_total_pages() * (unsigned long long)PAGE_SIZE;
> 
> -       seq_printf(m, "MaxMem=%ld\n", maxmem);
> +       seq_printf(m, "MaxMem=%llu\n", maxmem);
>   }
> 
>   static int pseries_lparcfg_data(struct seq_file *m, void *v)
> 
