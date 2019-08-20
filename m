Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB4958BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 09:46:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CNBw2nbNzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 17:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EriAgZRa"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CN962J47zDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 17:44:25 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CN8w2hKBz9tx55;
 Tue, 20 Aug 2019 09:44:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EriAgZRa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id B1MJP5BJ_xHf; Tue, 20 Aug 2019 09:44:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CN8w1gp0z9tx4x;
 Tue, 20 Aug 2019 09:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566287056; bh=9KYo3i3bL0bvuvLyAvnj6SMXIwdtqNJqJgVTHhCJEqc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=EriAgZRaDlEVCvOxrNMh28VMHqYMMCwyCAg5sol3p4k2K5gm19IsceytPfSWjyuKc
 PLRueXZqbsrap7enN2ZcOfuV+6vKykrsq0C6Nccb/f3xusWMTuAiPqI7mYfcnNSosK
 C5lHRGh6H1jteYI6vf0iRGnHukZ4FGJFpMaIInw8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E4F08B7B9;
 Tue, 20 Aug 2019 09:44:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9IzkUWP6NNcX; Tue, 20 Aug 2019 09:44:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE2778B785;
 Tue, 20 Aug 2019 09:44:17 +0200 (CEST)
Subject: Re: [PATCH 1/3] powerpc/64: __ioremap_at clean up in the error case
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c11ab8b7-86ef-c5c6-1392-b5c20fc8e185@c-s.fr>
Date: Tue, 20 Aug 2019 09:44:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190610030818.17965-1-npiggin@gmail.com>
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

Hi Nick,

Le 10/06/2019 à 05:08, Nicholas Piggin a écrit :
> __ioremap_at error handling is wonky, it requires caller to clean up
> after it. Implement a helper that does the map and error cleanup and
> remove the requirement from the caller.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> This series is a different approach to the problem, using the generic
> ioremap_page_range directly which reduces added code, and moves
> the radix specific code into radix files. Thanks to Christophe for
> pointing out various problems with the previous patch.
> 
>   arch/powerpc/mm/pgtable_64.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index d2d976ff8a0e..6bd3660388aa 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c

[...]

> @@ -182,8 +197,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
>   
>   		area->phys_addr = paligned;
>   		ret = __ioremap_at(paligned, area->addr, size, prot);
> -		if (!ret)
> -			vunmap(area->addr);

AFAICS, ioremap_range() calls unmap_kernel_range() in the error case,
but I can't see that that function does the vunmap(), does it ?. If not, 
who frees the area allocated by __get_vm_area_caller() ?

Christophe
