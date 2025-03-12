Return-Path: <linuxppc-dev+bounces-6936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB4A5E105
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 16:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCZpC0KgBz3bwd;
	Thu, 13 Mar 2025 02:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741794610;
	cv=none; b=h+tn3h4A2q/OZx/irrYnPsg2ogp/v56kMLlxjglKnnmlp1mCv7AymqlpRldQd8uU6kqsMRNpRiPL21b+8g6Es3Rj4PeXc2IEa/gW4HSGnzstJXiwQz58trYVDEuy14oH7fUpXaapKmIlpfs25BmGmZdAfCP7VKhEsK9U6AsfktIMN6H4TIFc9URrhG4NMA/wBg/RkTKSFv5tIQPFTBU8qvQmPHStKyYpNuPELX93WI/IFEtUSXnTMqHM/D4hIqOrWU3a3KsM4y1CVXLutKDG15nfIvV4pkmGUJL3Y2G+GLGYCiRAxMmVmPfvmSpmZqjxO/5iveEzsVDsxDzSGMaAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741794610; c=relaxed/relaxed;
	bh=f4rq2ClGBEQoyKnp1v8mkAwwWqUhVR0moZ4/B86R63k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X/pTG5fJG47tFk5s1zSAk9MnNJbLvRGwogNqXnojBuJPkWornbME8haauRkeQtxP+pxI9V8Jx3jYEY+eCwbsBv0VWjMFKVDI9Sy8tpE9PxVtNbhZzboSywjWKRP6krVYser3DuwroMOX8H59ipk1AxzxRx0M3PCHoyRtOy/l1Fieo+KsZTI50aCtaysjavxaN8luPzlLvg95JQRgL0+dJFD03CD56z/8zON1ot6uvwenn/kbxnvy0YwDJTGLsuaLt2lkrsvhYOKdk7Gh6UXD8ZzIlEgMi2cZ7MN2iJn+Ag1znSrgNm60j56ASc4HKK5Ivyh66HEiiUXBV+Ajg9x3nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCZp96yBqz30Wj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 02:50:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZCZ7F38Gqz9sVt;
	Wed, 12 Mar 2025 16:19:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOQ0iH8D4HeJ; Wed, 12 Mar 2025 16:19:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZCZ7F2LC3z9sVs;
	Wed, 12 Mar 2025 16:19:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A4828B768;
	Wed, 12 Mar 2025 16:19:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NSc88byWdIAx; Wed, 12 Mar 2025 16:19:53 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD1198B763;
	Wed, 12 Mar 2025 16:19:52 +0100 (CET)
Message-ID: <5c671410-cedd-4854-a3e7-2060607d5c4d@csgroup.eu>
Date: Wed, 12 Mar 2025 16:19:52 +0100
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <c0a716d0-6811-4b1b-b008-d4e97900cb0e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/03/2025 à 11:11, Venkat Rao Bagalkote a écrit :
> 
> On 12/03/25 4:20 am, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2025 à 13:38, Venkat Rao Bagalkote a écrit :
>>> Greetings!!,
>>>
>>> I see linux-next-20250307 fails to build on IBM Power9 and Power10 
>>> servers.
>>>
>>>
>>> Errors:
>>>
>>> In file included from ^[[01m^[[K<command-line>^[[m^[[K:
>>> ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K 
>>> ^[[01;31m^[[Kfatal error: ^[[m^[[Kuuid/uuid.h: No such file or directory
>>>     11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
>>>        |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
>>
>> This is unreadable. Please avoid fancy colors that add escapes to 
>> logs. You can unset LANG environment var before building in order to 
>> get pastable stuff.
>>

Allthought not really readable, it seems to mention that uuid/uuid.h is 
missing.

Can you confirm that you have installed libuuid package in your system ? 
Maybe you also need some libuuid-dev packet to get headers ?

Christophe

