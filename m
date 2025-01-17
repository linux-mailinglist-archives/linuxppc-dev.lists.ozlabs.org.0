Return-Path: <linuxppc-dev+bounces-5361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B55A1505F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 14:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZL203cChz2yTy;
	Sat, 18 Jan 2025 00:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737120008;
	cv=none; b=km/OlL+Ae0joHfZhOMLpyhIHZpWhUPHRrp94RMBM/i5de2JYXXCT9A1sSnG+l5EtcpNeCKKocpjUZXme+77pvw2Qp3OooCciwSh7/crqdOjjg0aG2ZxczbUq8CtlJqR5y5Mb/sW7Hk5p2WNYKbJdZO++QVv+S8vSANheUoPXbjARlu/yyHcuZ5JBFkl895ItjVuqg6ZPu7qyuml/bg++9Xx7qjCBS4J9HivpNL6mgFf0vdHNJbwptjSYuvI/wGL9chrxXHlJGIN3TSxqV47zZEmZkjQ5fpebA3iYDp7dZ6CZpFZnuCmwswf43xG07zjdXDCd0Fu4xeVp3n2CEIHKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737120008; c=relaxed/relaxed;
	bh=XImbEUCMZlvKXJs4X3s3+LfLhcpnhOR2ztjefUUBIMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVEM5uoLB4TAPgHstEzmmdov+C5C1mdOWPjK0qh1iePCQ7U3ZJQOpZoydcpOC3k0zj0MwqPxYjTTce1J96BgwjunAqwYm9/JlFMpJkznA0zrrEZlzS8uXa53VLPGN4sFC8DTBWkaVAdmHdhkG7J8lNRHNEZDwkyX7k7DAIizk1ihLqwgS/sk+YN37KyV/b3qWgVghs4OCwINdhQXyZ7cvgMIPnyCjhsnGNmFjq1Vr8z8b7y/RjOPB0U0bicNILrOzBGLnaXEMzWE9igA9p88iTkHIdWWA2Fd+1K/yGj7NpiFCNoovw/aJ6iDTMWQz+Px6m5AF3r5GP6AtKK8bDIybg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZL1y0W1Wz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 00:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YZKGl2LJcz9sRy;
	Fri, 17 Jan 2025 13:46:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syZKn15JcSqc; Fri, 17 Jan 2025 13:46:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YZKGl1Mp1z9sRs;
	Fri, 17 Jan 2025 13:46:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B5818B77A;
	Fri, 17 Jan 2025 13:46:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8t2gnAbLVjX7; Fri, 17 Jan 2025 13:46:07 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B24258B774;
	Fri, 17 Jan 2025 13:46:06 +0100 (CET)
Message-ID: <bf9f867b-f9d6-47fc-80d8-6d1fde59a416@csgroup.eu>
Date: Fri, 17 Jan 2025 13:46:06 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
 <e5e51680-0e66-49ce-a523-1eb9d570e43a@csgroup.eu>
 <6429f8de-91ba-442b-a39e-f12d666062f7@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <6429f8de-91ba-442b-a39e-f12d666062f7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 17/01/2025 à 13:32, Sourabh Jain a écrit :
> Hello Christophe,
> 
> On 17/01/25 17:43, Christophe Leroy wrote:
>>
>>
>> Le 13/11/2024 à 08:06, Sourabh Jain a écrit :
>>> From: Hari Bathini <hbathini@linux.ibm.com>
>>>
>>> Memory for passing additional parameters to fadump capture kernel
>>> is allocated during subsys_initcall level, using memblock. But
>>> as slab is already available by this time, allocation happens via
>>> the buddy allocator. This may work for radix MMU but is likely to
>>> fail in most cases for hash MMU as hash MMU needs this memory in
>>> the first memory block for it to be accessible in real mode in the
>>> capture kernel (second boot). So, allocate memory for additional
>>> parameters area as soon as MMU mode is obvious.
>>>
>>> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for 
>>> dump capture kernel")
>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>>> Closes: https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Flore.kernel.org%2Flkml%2Fa70e4064- 
>>> a040-447b-8556-1fd02f19383d%40linux.vnet.ibm.com%2FT%2F%23u&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9df078759a2c42b044cf08dd36f3183b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638727139896068824%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iZfkQKw4wJAvwAj%2BbGOS5kcrVtAg8xg%2FFl6ojEYZ6ls%3D&reserved=0
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>
>> Version v2 of this series was applied.
>>
>> If needed, can you rebase this patch ?
>>
> Sorry, I didn't get that. Rebase on top of which tree/branch?

I meant on top of any tree including the applied version.

> 
> FYI, there was no functional change from v2 to v3. Only a
> "Reviewed-by" tag was added.

Then I guess there is nothing to do.

Christophe


