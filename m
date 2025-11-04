Return-Path: <linuxppc-dev+bounces-13753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B1C326EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 18:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GFB1FWyz3bfN;
	Wed,  5 Nov 2025 04:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762278606;
	cv=none; b=TOp2mmoSipl6nSDh1wUcpHMWFmQeuYQbNrtzzF97odaO/gKmq6/8EE9Nvp766huM3T0WuQetNPe+fSePJGGwhCRsTPEIj6hLZTE8S2fKoKVXRgyfnwYvkii6RkIoiRq61Z68dLj7U74vwWQvceUDbKbpJBu0VQGb4Cd++9rDguz8ZVYH7CGbLdP2peuvBizeJ4oCxOozkbmMH2u+FtW9CLKHVDjolO13/Gm3GsN+oFKQp/LvXJjXqkkit6wr4MO1kxXz4NQwY2uLz7zWY9+qobJs2TaqA01Dw4vNX5wXiTPrmmvjxUGNplzyKTspPw1e0j5n4IKQ6ae60n238TKpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762278606; c=relaxed/relaxed;
	bh=xAadiR6ntL7ayTwA4JxHMnkqmPDh9B854RBpL7w6q3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgWHbqKMgBgKSdJL4W+2X27N394ljXovbJ0G+zUoQYuXQxCHVCS218yVTY0pVSgOkjoJtZoDIvnMcnw9SVz+527COfjVic531frAkhspDdwTYd1gnxoa1wz/2qWu0tlEgKSu1C5sY70YAcDMXNeaZVPmYy7QMpPlFJB08REdwrQZ0YC+66NNaCozMbr73/JAh+qiKjkkRiA62z6e6woqCRvCGTTsJ9Fa6HaXUx0DbSdeW2QBUbXsGIBKXHOaKKCJqlBQZraE4Srb9G6TJuKa+3suop9Aw2o6UKKaCa3od9EcpZaLU6ZvH9QZstpDkDsx87Hjt2ENGs2IJ+T2ObnVKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GF93L6Yz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 04:50:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d1FkL5Pf0z9sS7;
	Tue,  4 Nov 2025 18:26:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFw0wj0g-XqU; Tue,  4 Nov 2025 18:26:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d1FkL4gnPz9sRy;
	Tue,  4 Nov 2025 18:26:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 90CF78B76E;
	Tue,  4 Nov 2025 18:26:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sWXRh3sG0pVU; Tue,  4 Nov 2025 18:26:50 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 84DFE8B76D;
	Tue,  4 Nov 2025 18:26:49 +0100 (CET)
Message-ID: <a0921920-d381-4a67-8b4d-d91e5319a354@csgroup.eu>
Date: Tue, 4 Nov 2025 18:26:48 +0100
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
Subject: Re: [PATCH] powerpc/flipper-pic: Fix device node reference leak in
 flipper_pic_init
To: Miaoqian Lin <linmq006@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Albert Herranz <albert_herranz@yahoo.es>,
 Grant Likely <grant.likely@secretlab.ca>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251027150914.59811-1-linmq006@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027150914.59811-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 16:09, Miaoqian Lin a écrit :
> The flipper_pic_init() function calls of_get_parent() which increases
> the device node reference count, but fails to call of_node_put() to
> balance the reference count.
> 
> Add calls to of_node_put() in all paths to fix the leak.
> 
> Found via static analysis.
> 
> Fixes: 028ee972f032 ("powerpc: gamecube/wii: flipper interrupt controller support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   arch/powerpc/platforms/embedded6xx/flipper-pic.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> index 91a8f0a7086e..cf6f795c8d76 100644
> --- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> @@ -135,13 +135,13 @@ static struct irq_domain * __init flipper_pic_init(struct device_node *np)
>   	}
>   	if (!of_device_is_compatible(pi, "nintendo,flipper-pi")) {
>   		pr_err("unexpected parent compatible\n");
> -		goto out;
> +		goto out_put_node;
>   	}
>   
>   	retval = of_address_to_resource(pi, 0, &res);
>   	if (retval) {
>   		pr_err("no io memory range found\n");
> -		goto out;
> +		goto out_put_node;
>   	}
>   	io_base = ioremap(res.start, resource_size(&res));
>   
> @@ -154,9 +154,12 @@ static struct irq_domain * __init flipper_pic_init(struct device_node *np)
>   					      &flipper_irq_domain_ops, io_base);
>   	if (!irq_domain) {
>   		pr_err("failed to allocate irq_domain\n");
> +		of_node_put(pi);

irq_domain is NULL here so instead of adding this of_node_put() you 
could just remove below 'return NULL' (and the {} of the if) and 
fallthrough.

>   		return NULL;
>   	}
>   
> +out_put_node:
> +	of_node_put(pi);
>   out:
>   	return irq_domain;
>   }


