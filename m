Return-Path: <linuxppc-dev+bounces-12513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05397B92339
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpHq2W3kz30Vl;
	Tue, 23 Sep 2025 02:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758558039;
	cv=none; b=TeDAky1k1boaAoMdqsXYGJjdjLGenyV6fkp+EMsLznnmHk4xgUGqKJlyXgHD4gjkBOaU/nDYuq1c5ZirM1hklkmuOn8kq8DgdhKmo6wlrTuS0/7ldK5fn3Yjfb7I2N4hXyLw2ONu7qB0MgA8s3m3v54JCmdFCEP8rF8M5g06P/VkGXo8+ibmasBw/yIXW2mbjTUi9Se1h/p5NQrwksBzZU0qJ+pMAWYNMLBth73MiVBs47/4HIGAQe3cg12MgRcCJmvj/SaGZgbvcI7qbiGvNo2nnUzkXxbWxQOS5FIPHvxLAh6VivIaKbn/Yk5FUeWCJyvMTyZbiA/hGj1OgLVgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758558039; c=relaxed/relaxed;
	bh=llQFvz97YchSHD+LIPSrj+a0JM4Xnwv4FP9izviTQZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbQKM99ip/CBIephhL/8hhVV0fE2JL74LauhilgLyI/ZcupnhlNyAcTQTw2pCtO6AsSAADCUKiNHyyhnJu4aMQwmHCGAnPv+cA440P9EAa6+XxsOUSpSkyO9WLZz+hTpqUJhP3PV7Ket/1SIjBxr4oRcvF2JDWDwam0WDycdQGdKS1hjC+wB4pW73w0nTAZMmy418+UNef7Ivhm+alWLjRxzv91TvcuODTTvIqSOZwHDba7WpZuKK3yKwZGT6EpldVRmYk2NbJK+nmh0wG2SefrVIFgYr+xNBTQEDihH7WJO/LlIJZKwckurSE5m6qKczrQoHnRGkKDKmCigikxXIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpHp2lMLz2xK1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVnyB1Lhlz9sSL;
	Mon, 22 Sep 2025 18:05:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQGetHUt7Al8; Mon, 22 Sep 2025 18:05:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVnyB0Zhlz9sSK;
	Mon, 22 Sep 2025 18:05:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F32C18B768;
	Mon, 22 Sep 2025 18:05:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1HyZsWwZsQmv; Mon, 22 Sep 2025 18:05:21 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 891948B763;
	Mon, 22 Sep 2025 18:05:20 +0200 (CEST)
Message-ID: <71cabf42-ce79-4030-a08e-475275c19f05@csgroup.eu>
Date: Mon, 22 Sep 2025 18:05:19 +0200
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
Subject: Re: [PATCH v2] powerpc/smp: Add check for kcalloc() failure in
 parse_thread_groups()
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250922151025.1821411-1-lgs201920130244@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250922151025.1821411-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/09/2025 à 17:10, Guangshuo Li a écrit :
> [Vous ne recevez pas souvent de courriers de lgs201920130244@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> As kcalloc() may fail, check its return value to avoid a NULL pointer
> dereference when passing it to of_property_read_u32_array().
> 
> Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
> Cc: stable@vger.kernel.org
> ---
> changelog:
> v2:
> - Return -ENOMEM directly on allocation failure.
> 
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

The Signed-off-by: must be above the ---, otherwise it will be lost when 
applying the commit.

With that fixed,

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> ---
>   arch/powerpc/kernel/smp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0..cfccb9389760 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -822,6 +822,8 @@ static int parse_thread_groups(struct device_node *dn,
> 
>          count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>          thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
> +       if (!thread_group_array)
> +               return -ENOMEM;
>          ret = of_property_read_u32_array(dn, "ibm,thread-groups",
>                                           thread_group_array, count);
>          if (ret)
> --
> 2.43.0
> 


