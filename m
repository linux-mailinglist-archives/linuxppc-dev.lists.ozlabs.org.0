Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACB252950
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 10:39:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbzmZ2LJKzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 18:39:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbzkt2yN3zDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 18:37:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bbzkh37FWz9tyjT;
 Wed, 26 Aug 2020 10:37:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id F7HkzAmN4Nfz; Wed, 26 Aug 2020 10:37:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bbzkh2GV1z9tyjS;
 Wed, 26 Aug 2020 10:37:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 748488B82E;
 Wed, 26 Aug 2020 10:37:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zkDSwkkPY4fl; Wed, 26 Aug 2020 10:37:33 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B61B58B835;
 Wed, 26 Aug 2020 10:37:32 +0200 (CEST)
Subject: Re: [PATCH] Revert "powerpc/powernv/idle: Replace CPU feature check
 with PVR check"
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 mikey@neuling.org, ego@linux.vnet.ibm.com, svaidy@linux.ibm.com,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
References: <20200826082918.89306-1-psampat@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1fb7fcef-a39d-d36e-35d5-021a5c9ea82c@csgroup.eu>
Date: Wed, 26 Aug 2020 10:37:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826082918.89306-1-psampat@linux.ibm.com>
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



Le 26/08/2020 à 10:29, Pratik Rajesh Sampat a écrit :
> Cpuidle stop state implementation has minor optimizations for P10
> where hardware preserves more SPR registers compared to P9.
> The current P9 driver works for P10, although does few extra
> save-restores. P9 driver can provide the required power management
> features like SMT thread folding and core level power savings
> on a P10 platform.
> 
> Until the P10 stop driver is available, revert the commit which
> allows for only P9 systems to utilize cpuidle and blocks all
> idle stop states for P10.
> Cpu idle states are enabled and tested on the P10 platform
> with this fix.
> 
> This reverts commit 8747bf36f312356f8a295a0c39ff092d65ce75ae.
> 
> Fixes: 8747bf36f312 ("powerpc/powernv/idle: Replace CPU feature check with PVR check")
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>   @mpe: This revert would resolve a staging issue wherein the P10 stop
>   driver is not yet ready while cpuidle stop states need not be blocked
>   on 5.9 for Power10 systems which could cause SMT folding related
>   performance issues.
> 
>   The P10 stop driver is in the works here:
>   https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html
> 
>   arch/powerpc/platforms/powernv/idle.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 77513a80cef9..345ab062b21a 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1223,7 +1223,7 @@ static void __init pnv_probe_idle_states(void)
>   		return;
>   	}
>   
> -	if (pvr_version_is(PVR_POWER9))
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))

Why not something like:

	if (pvr_version_is(PVR_POWER9) || pvr_version_is(PVR_POWER10))
		pnv_power9_idle_init();


>   		pnv_power9_idle_init();
>   
>   	for (i = 0; i < nr_pnv_idle_states; i++)
> 

Christophe
