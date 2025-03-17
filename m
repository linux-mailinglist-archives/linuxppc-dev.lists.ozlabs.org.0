Return-Path: <linuxppc-dev+bounces-7125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD4A6495A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 11:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGWF32R4Lz2yhb;
	Mon, 17 Mar 2025 21:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742206807;
	cv=none; b=Pj/YdRdOZtAc4HrE+5l93d9PxcohSVRds8E68Ibg3YrFAOYLEYNgwJIDDqClnfCLoheCe7r2YF9igjMdRv3cC0rbsyo6TrsbITGXhecHWVkx8ILtZNCh3MjBTIZ/+waYF7jiKZrKswZFq0aj/5Tl/4UQK5/QOKbgM0DMdQHNDHeM0yTAfbGMxX0TOpRn1ruTqKGckKnGqQV9BlZ/ZcbIVlczeLFQtxQZei2EcmbfarYC/uHuIsJGOEjQtunCdsJAoHoofqKWiQXkoj0v8pRRh7CrVM9HAfjjXG8oOM0DJ9tIEDVz2UaLmtAPRNRnGgf723uknrxavFk9R0zqIqc1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742206807; c=relaxed/relaxed;
	bh=QjGqku77ky/KOLhdQseQnbh6D/bht9nIYgkdqcAOfgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C9bqHOmZn6ypHwJi9BYKlp05/xMkWPQzmyIlZd9oAT/P07vh8TWM46R/1vuPa61x6XldQfsviH7c0kuiIVL1rppeR08eshiESwFRp+prwtB2EGd2FMD+qdXUhrUHI9J2jT2kjNzKpzAdRqTfE103z9cBHhcFV8NgldEXofo22OIo6d62Aqwvaat6UP0l088lOKs5Rk2cOcxExEbwEFKFKzeg7HKtL1AfFLDKWGhZD2sSu4XMUflyBkMp4D7RvJ25fr8pAY9iXuAhKz0ygcXMdBRzJ67uNJTbSgTDjuQUNwgLtuQpLtPDHnAcKxv7Ar6ehvYYY0dz9nHpHJEtGmil6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGWF224MBz2yhW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 21:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZGVx21Cfmz9sRy;
	Mon, 17 Mar 2025 11:06:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY3M6MKxajRN; Mon, 17 Mar 2025 11:06:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZGVx20QyPz9sRr;
	Mon, 17 Mar 2025 11:06:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EF3CF8B765;
	Mon, 17 Mar 2025 11:06:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Jcpq8BWRW1ng; Mon, 17 Mar 2025 11:06:13 +0100 (CET)
Received: from [10.25.207.144] (unknown [10.25.207.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CAF918B764;
	Mon, 17 Mar 2025 11:06:13 +0100 (CET)
Message-ID: <ebc5d8c6-3c5c-4e6a-a218-9dddcdb4f8bc@csgroup.eu>
Date: Mon, 17 Mar 2025 11:06:13 +0100
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
Subject: Re: [linux-next-20250307] Build Failure
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
 <5ab103b4-70f0-454e-bca6-0bfc66d143f5@csgroup.eu>
 <c0a716d0-6811-4b1b-b008-d4e97900cb0e@linux.ibm.com>
 <5c671410-cedd-4854-a3e7-2060607d5c4d@csgroup.eu>
 <25e5d468-6c40-40b7-a010-8c8018b6d228@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <25e5d468-6c40-40b7-a010-8c8018b6d228@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 17/03/2025 à 08:27, Venkat Rao Bagalkote a écrit :
> 
> On 12/03/25 8:49 pm, Christophe Leroy wrote:
>>
>>
>> Le 12/03/2025 à 11:11, Venkat Rao Bagalkote a écrit :
>>>
>>> On 12/03/25 4:20 am, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 09/03/2025 à 13:38, Venkat Rao Bagalkote a écrit :
>>>>> Greetings!!,
>>>>>
>>>>> I see linux-next-20250307 fails to build on IBM Power9 and Power10 
>>>>> servers.
>>>>>
>>>>>
>>>>> Errors:
>>>>>
>>>>> In file included from ^[[01m^[[K<command-line>^[[m^[[K:
>>>>> ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K 
>>>>> ^[[01;31m^[[Kfatal error: ^[[m^[[Kuuid/uuid.h: No such file or 
>>>>> directory
>>>>>     11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
>>>>>        |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
>>>>
>>>> This is unreadable. Please avoid fancy colors that add escapes to 
>>>> logs. You can unset LANG environment var before building in order to 
>>>> get pastable stuff.
>>>>
>>
>> Allthought not really readable, it seems to mention that uuid/uuid.h 
>> is missing.
>>
>> Can you confirm that you have installed libuuid package in your 
>> system ? Maybe you also need some libuuid-dev packet to get headers ?
> 
> 
> Yeah uuid package is installed on my system. I am seeing this failure 
> only with build next-20250307.
> 
> Builds with before and after are compiling successfully.

Ok, so I understand from this that the problem is fixed and there is not 
further investigation required.

Thanks
Christophe

