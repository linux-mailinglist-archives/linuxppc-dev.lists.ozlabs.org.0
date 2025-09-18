Return-Path: <linuxppc-dev+bounces-12384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8ABB861A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 18:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSM8K6c8Xz3cYH;
	Fri, 19 Sep 2025 02:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758214241;
	cv=none; b=R/dZgvip7M7Tgrj0BZs3cDxLuMnOhuBK86tWB/RVKJHmj/h5e+cN3D8ehEgpHlJQ9o9i8s8QNa+3y7SvJHDICBcm8nG/WYqPE1T8Wsic+Rjky2p0SDNWwPZMsRg8zOfQRU/8gozp0NHxs5ItzJ/pw0bpdVZl+z52OHit6LnpdShWKh1WpphmWBn5RKYI688OEQdwst1YYBmu3q2HJNJOailFGa0q0BmaDcVKSZfN6Cp12uK/tLlf5xXNFXkEGxjp3u7HHATqPXu64sFC5Nw5bzz0dbtY9yDGL7xcr4vP2MQ5n0bveHCG2OP4WVGroCd/tihd1SUm4l2e/KbfkaUFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758214241; c=relaxed/relaxed;
	bh=1hrkKIr90ran6knul6gyeMK0S/D2N6iHzxqgIpeMC48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mb7sKsxSrRHKxeU7Fgn9aMUJNSPInmRDPVsgp0otfY2ujtx3njQH3CkTY9UEz/4BiHHZ8J2KJPSRne/hotlzhA6hHFIN35w9YE8urv/jv8kFK7OkCycqqw3aXhFZXPpYrJp5Alu7rXO0wwl54t0bf1qH5+twQDjVf4lOzcyIKAxIuLMTR0no49/fFji6GmcUaqRdNuCG56OmrqFXJqckqVBjwFSwXYkbzhIB0w1IpAx7BUoSUxgnXC8iO036M7kyrF365hluU3vBGAk7YDhX8oM3hE20oaMWw7QyUR7jtmDYPC0Sbg0za0e/Ig2+3nxqXWddEWcurGS07OJFX7TruQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSM8K2SNVz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 02:50:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSK5K1F5gz9shQ;
	Thu, 18 Sep 2025 17:17:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqKmve-d9GL7; Thu, 18 Sep 2025 17:17:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSK5K0PKRz9shF;
	Thu, 18 Sep 2025 17:17:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EFA5D8B775;
	Thu, 18 Sep 2025 17:17:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yA9-sMw8lPFZ; Thu, 18 Sep 2025 17:17:56 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55C098B767;
	Thu, 18 Sep 2025 17:17:56 +0200 (CEST)
Message-ID: <7c0c53bc-1436-4a48-8afa-8bfff439ce67@csgroup.eu>
Date: Thu, 18 Sep 2025 17:17:55 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/smp: Add check for kcalloc() in
 parse_thread_groups()
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250918131513.3557422-1-lgs201920130244@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250918131513.3557422-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/09/2025 à 15:15, Guangshuo Li a écrit :
> [Vous ne recevez pas souvent de courriers de lgs201920130244@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> As kcalloc() may fail, check its return value to avoid a NULL pointer
> dereference when passing it to of_property_read_u32_array().
> 
> Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   arch/powerpc/kernel/smp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0..fa0cd3f7a93c 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -822,6 +822,10 @@ static int parse_thread_groups(struct device_node *dn,
> 
>          count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>          thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
> +       if (!thread_group_array) {
> +               ret = -ENOMEM;
> +               goto out_free;

out_free does nothing as thread_group_array is NULL, so don't goto 
out_free, instead return -ENOMEM immediately:

	if (!thread_group_array)
		return -ENOMEM;


> +       }
>          ret = of_property_read_u32_array(dn, "ibm,thread-groups",
>                                           thread_group_array, count);
>          if (ret)
> --
> 2.43.0
> 


