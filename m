Return-Path: <linuxppc-dev+bounces-12512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA28B9233A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpHq2PSLz30T9;
	Tue, 23 Sep 2025 02:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758558039;
	cv=none; b=KEdMAPa227tltvr6IUdxuAekrTtu2R480EWdKndxVF9I9XbnVO/k3KCBB93cpC8u8svTnMd13qsVK/Vba4yJVecuytvCt9GBLhgHAJyTmk3QIr916yHMJNDSTc4rlZK6OnuciDo1jOyo6CnMnimppx5Vb2ooqRlEm+CUHnUvt0ymv8JhHJ3yxwpLlo6Xfm9k8+Sf6u9m8qgOhvagxrGZtDbAv5zSyoR+0B198O5O8B7+kfT4xUhW5dBqMn18AWALy0boNlmCayNrHKbaG2YnxzFptrXwVC95MkrCR7HmUdRWyMMHgxKZ36XMpJBVDKBdeFRyK9f99UEc01dfUADSog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758558039; c=relaxed/relaxed;
	bh=ezxsK7Is2GpCcIfIU7iQCYD/Zssw7/pnUSjoT2Sp2xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gd1MA0vlwxelSFvAIhD+0fEkossudReOQh7WpEYFgFkuOUv70yH7ulAOB5kH3prxGyj6Qedfla9pSr2lsXpB/nvxB1ao0y2ifnqBX1DJg9rBue0E5MAif6VSj6eEs4FJHfApW+nti3lU/fC+XakRwVDqcoJoTKndwfzQNCIozdSl4hDwodAyVjwZYqeDc6vfbj9WdREk/PufL19vNnqluLKsUv2yl5h+IF03gptNdAwAbIiPXectYD4I3Zj2Fld5QU8XezAky7rc7jJs1yG8YZrVrHCOn1xEcZo4qnBKCub2OjbkL62uoJ68awRG+PvKhPKfR20Dx2sI4CFFMdQULg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpHp2wQ7z30HB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:20:37 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVp180JGjz9sSR;
	Mon, 22 Sep 2025 18:07:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ld71iZbvQBsJ; Mon, 22 Sep 2025 18:07:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVp176jLFz9sSN;
	Mon, 22 Sep 2025 18:07:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D70678B768;
	Mon, 22 Sep 2025 18:07:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uyoeSwRWo3u9; Mon, 22 Sep 2025 18:07:55 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E8198B763;
	Mon, 22 Sep 2025 18:07:54 +0200 (CEST)
Message-ID: <496a8ed4-b416-47f9-be1f-cda5472d004d@csgroup.eu>
Date: Mon, 22 Sep 2025 18:07:53 +0200
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <a7453bdc-16f3-43e6-a06d-bd6144eeae72@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/09/2025 à 17:38, Christophe JAILLET a écrit :
> Le 22/09/2025 à 17:10, Guangshuo Li a écrit :
>> As kcalloc() may fail, check its return value to avoid a NULL pointer
>> dereference when passing it to of_property_read_u32_array().
>>
>> Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with 
>> multiple properties")
>> Cc: stable@vger.kernel.org
> 
> Signed-off-by that was part of v1, is missing in v2.

I see it below the ---

> 
>> ---
>> changelog:
>> v2:
>> - Return -ENOMEM directly on allocation failure.
> 
> Except for a newline that is removed, v2 is the same as v1, or I miss 
> something?

v1 was:

+       if (!thread_group_array) {
+               ret = -ENOMEM;
+               goto out_free;
+       }

Which was wrong.

Well maybe there was several v1, I'm talking about 
https://lore.kernel.org/all/20250918131513.3557422-1-lgs201920130244@gmail.com/

> 
> CJ
> 
>>
>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>> ---
>>   arch/powerpc/kernel/smp.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index 5ac7084eebc0..cfccb9389760 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -822,6 +822,8 @@ static int parse_thread_groups(struct device_node 
>> *dn,
>>       count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>>       thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
>> +    if (!thread_group_array)
>> +        return -ENOMEM;
>>       ret = of_property_read_u32_array(dn, "ibm,thread-groups",
>>                        thread_group_array, count);
>>       if (ret)
> 


