Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE6421BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:56:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P2Ml3l6szDr4L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 19:56:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hisilicon.com
 (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=zhangshaokun@hisilicon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=hisilicon.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P2K73RNMzDqmR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 19:54:32 +1000 (AEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 98B5286654BF69C187E6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 17:54:26 +0800 (CST)
Received: from [127.0.0.1] (10.74.221.148) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 12 Jun 2019
 17:54:22 +0800
Subject: Re: [PATCH] powerpc/64s: Fix misleading SPR and timebase information
To: <linuxppc-dev@lists.ozlabs.org>
References: <1559121711-24114-1-git-send-email-zhangshaokun@hisilicon.com>
From: Zhangshaokun <zhangshaokun@hisilicon.com>
Message-ID: <6d2f5e3d-23a6-ccf1-61c4-7dd5c7e228ac@hisilicon.com>
Date: Wed, 12 Jun 2019 17:54:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1559121711-24114-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.221.148]
X-CFilter-Loop: Reflected
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

A gentle ping.

On 2019/5/29 17:21, Shaokun Zhang wrote:
> pr_info shows SPR and timebase as a decimal value with a '0x'
> prefix, which is somewhat misleading.
> 
> Fix it to print hexadecimal, as was intended.
> 
> Fixes: 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index c9133f7908ca..77f2e0a4ee37 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1159,10 +1159,10 @@ static void __init pnv_power9_idle_init(void)
>  			pnv_deepest_stop_psscr_mask);
>  	}
>  
> -	pr_info("cpuidle-powernv: First stop level that may lose SPRs = 0x%lld\n",
> +	pr_info("cpuidle-powernv: First stop level that may lose SPRs = 0x%llx\n",
>  		pnv_first_spr_loss_level);
>  
> -	pr_info("cpuidle-powernv: First stop level that may lose timebase = 0x%lld\n",
> +	pr_info("cpuidle-powernv: First stop level that may lose timebase = 0x%llx\n",
>  		pnv_first_tb_loss_level);
>  }
>  
> 

