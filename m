Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095C14959
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 14:08:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yM3162N3zDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 22:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EapVkJMi"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yM1F5Y7LzDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 22:07:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44yM135dX5z9v0xC;
 Mon,  6 May 2019 14:07:03 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EapVkJMi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tt5LO6VE_nb8; Mon,  6 May 2019 14:07:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44yM134cxBz9v0xB;
 Mon,  6 May 2019 14:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557144423; bh=c5ZokJ1lKbdtrgi8/wN8Olv5ggLeW/AbtTGVRyPqEog=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EapVkJMiWtezwnyD8SKxF5ZjmhSSNAq24hkBgW0WQTutQto3MDlKzHiiMKAqMC6VN
 8tAkjadgV7wgPCpdTTrVoi9xFhKulhJ5RBZuHBm6kQQ0JYok2mgmVrmtraoMR9ISUy
 nI3lvQUxkei3X6G6a8YPr+IwLxYYH5IdEYgx7TuY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 89DEB8B8B8;
 Mon,  6 May 2019 14:07:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3pBBJdip4pNz; Mon,  6 May 2019 14:07:08 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6848D8B8B7;
 Mon,  6 May 2019 14:07:08 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: Fix hugetlb page initialization
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190506120328.4079.85660.sendpatchset@Sachins-MacBook-Pro.local>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <440f59af-08b0-8788-c95a-c37fc4c8913c@c-s.fr>
Date: Mon, 6 May 2019 14:07:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506120328.4079.85660.sendpatchset@Sachins-MacBook-Pro.local>
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
Cc: Michael Ellerman <michael@ellerman.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2019 à 14:03, Sachin Sant a écrit :
> This patch fixes a regression by using correct kernel config variable
> for HUGETLB_PAGE_SIZE_VARIABLE.
> 
> Without this huge pages are disabled during kernel boot.
> [0.309496] hugetlbfs: disabling because there are no supported hugepage sizes
> 
> Fixes: c5710cd20735 ("powerpc/mm: cleanup HPAGE_SHIFT setup")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> 
> ---
> diff -Narup a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> --- a/arch/powerpc/mm/hugetlbpage.c	2019-05-06 07:30:11.711092744 -0400
> +++ b/arch/powerpc/mm/hugetlbpage.c	2019-05-06 07:29:32.963433258 -0400
> @@ -640,7 +640,7 @@ static int __init hugetlbpage_init(void)
>   			pgtable_cache_add(PTE_T_ORDER);
>   	}
>   
> -	if (IS_ENABLED(HUGETLB_PAGE_SIZE_VARIABLE))
> +	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
>   		hugetlbpage_init_default();
>   
>   	return 0;
> 
