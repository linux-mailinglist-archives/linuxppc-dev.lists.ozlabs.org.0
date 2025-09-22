Return-Path: <linuxppc-dev+bounces-12514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38320B9237E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpSZ5gz5z30RJ;
	Tue, 23 Sep 2025 02:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758558494;
	cv=none; b=lcTjqfzSCbQXvutWGHw3qk+7M+P3Q5vUSWxnYl6sTQfjNGwjQHRPDH55IZC5CioPzzYc3zA/8DMfrDZXnEe4dkZ/TkhncOXXP+XkPn6krKEGEvnnjZoMAwWhnqmNeKiM/+IhNkTFBS0+qQhUJiEdWS1HuALZcmMn7a1b9h4rmfYGS7kiVYgWnz9skBUIrZH8ZkwZ/xGSqQ9Bym19veX+7kIcLrJesTkIbxgZ/bYHnk2Lkwkh/tvTxTjon7dqeb3skDQW80cTOf+Jn8oq0UKNL+ctfv1pKjPTGCxF7fJzXzzNKtCVwqJwz7ZxXNraf5Hw8dbgGNZ/UiQ/ZkhZssu1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758558494; c=relaxed/relaxed;
	bh=BPCGKEaZqcaAW9eCNNuUTqO8gdvHoT6lFp43/zZE20E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ghv9bULYNYW6kY2QG4iTEC4gQtYfNRkNGjWZIVeD+kfEr7RItrRz/+NZ1X2lawAnCNae502E2ymPtzLMu+CMUKNbVWaVBlofdpKr28xHdkcbIvQgqOdtFOtzGhBHDgds5fUOjFU98zHwOAGAl6fc69fTWfvvbEZ1bNHWxJ0w1noW2cn0sBCREtljmlko1BEiRAxU6oZSKkVw7FFnC3JYENXZeuOvIoXfZDIbUu3EOYD8KXe6t+Co44XiX2PAouEfBIPzl4RxJfc+ZNBC51WzxC9iDfW300s1cHZapQP2KeZS/ZmaknZMA6aBN2m7Woyt5xnFj5i0iqGWao3WJxC6+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=EMrPzHIk; dkim-atps=neutral; spf=pass (client-ip=80.12.242.27; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=EMrPzHIk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.27; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVpSY5Tpyz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:28:12 +1000 (AEST)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 0jNavqzqDFsG90jNavMclW; Mon, 22 Sep 2025 18:27:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1758558428;
	bh=BPCGKEaZqcaAW9eCNNuUTqO8gdvHoT6lFp43/zZE20E=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=EMrPzHIko64lPi6DPgWlZ6Q8XSPYroCk3hYuuAOVVL+E+Sd5JWRnyy7ANDELgFLcU
	 zbnsCqAOhfoIF85U2d6kQdyUz6B6kEVrP+6Dr9ZuqdWuiKLEVRirzZkvyXJok6vsL6
	 XWck3kX4nDEo82ljCKFbHjHRUCIMEBJlQYgPyQydrIoHWzs4yvg1M3zUsHOha9baUx
	 h/Kj1MNf8yZ6zvi4iVJlCi9ZPMkvfkRbTxQMC6oEElVXefnoQ2t4cmj7ayHWGJIWyz
	 EhkGUo11bwt2KoctuzdL7VQDXUNV1oPw5FiVJpldnjr5qmtD8d3nVA/jeE75GM4Gj+
	 nc5Jomjzd/1sA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 22 Sep 2025 18:27:08 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <3aaa6c7d-647f-47e6-a5fe-0051cf58cd2b@wanadoo.fr>
Date: Mon, 22 Sep 2025 18:27:06 +0200
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Guangshuo Li <lgs201920130244@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250922151025.1821411-1-lgs201920130244@gmail.com>
 <a7453bdc-16f3-43e6-a06d-bd6144eeae72@wanadoo.fr>
 <496a8ed4-b416-47f9-be1f-cda5472d004d@csgroup.eu>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <496a8ed4-b416-47f9-be1f-cda5472d004d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Le 22/09/2025 à 18:07, Christophe Leroy a écrit :
> 
> 
> Le 22/09/2025 à 17:38, Christophe JAILLET a écrit :
>> Le 22/09/2025 à 17:10, Guangshuo Li a écrit :
>>> As kcalloc() may fail, check its return value to avoid a NULL pointer
>>> dereference when passing it to of_property_read_u32_array().
>>>
>>> Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with 
>>> multiple properties")
>>> Cc: stable@vger.kernel.org
>>
>> Signed-off-by that was part of v1, is missing in v2.
> 
> I see it below the ---
> 
>>
>>> ---
>>> changelog:
>>> v2:
>>> - Return -ENOMEM directly on allocation failure.
>>
>> Except for a newline that is removed, v2 is the same as v1, or I miss 
>> something?
> 
> v1 was:
> 
> +       if (!thread_group_array) {
> +               ret = -ENOMEM;
> +               goto out_free;
> +       }
> 
> Which was wrong.
> 
> Well maybe there was several v1, I'm talking about https:// 
> lore.kernel.org/all/20250918131513.3557422-1-lgs201920130244@gmail.com/

Mine, was 
https://lore.kernel.org/lkml/20250922150442.1820675-1-lgs201920130244@gmail.com/

and apparently, there as been 3 v1 : 
https://lore.kernel.org/lkml/?q=powerpc%2Fsmp%3A+Add+check+for+kcalloc%28%29+in+parse_thread_groups%28%29

:/

CJ

> 
>>
>> CJ
>>
>>>
>>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>>> ---
>>>   arch/powerpc/kernel/smp.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>>> index 5ac7084eebc0..cfccb9389760 100644
>>> --- a/arch/powerpc/kernel/smp.c
>>> +++ b/arch/powerpc/kernel/smp.c
>>> @@ -822,6 +822,8 @@ static int parse_thread_groups(struct device_node 
>>> *dn,
>>>       count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>>>       thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
>>> +    if (!thread_group_array)
>>> +        return -ENOMEM;
>>>       ret = of_property_read_u32_array(dn, "ibm,thread-groups",
>>>                        thread_group_array, count);
>>>       if (ret)
>>
> 
> 
> 


