Return-Path: <linuxppc-dev+bounces-465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0B595D3A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 18:40:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr5Qn1XH2z2ytN;
	Sat, 24 Aug 2024 02:40:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724431217;
	cv=none; b=BZwRjJx6C8mP3PsEhE6XA2Zuuoqc1C89tWWjdAM0b96K1OeTYEGEhq8xwjegTWktLJHYc5Ua5FIim4XrlFAYJ4Bdz+ENUpwphoo+hKnUPwNu6XUUVUZelCzn2H44/6guabbp0txdIAD+J2foY+HfOm0KopY9+QKKceyt1SJnt21XAK6q2sogxj8wBqclh04jM1El3a52/kVUy04urjV0hFH+JEFZWiDewxSda9Sldco1kZfRNBRcR5KVRTvzkwDDsAEpU/HNq7Z1+xDX0vHQ5jgmzM4kzdD7bHzpF6ev9YSLLZOS3rC6Ih4fbSgTDfu3YEqhdHB4eQHdfnSGWrow7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724431217; c=relaxed/relaxed;
	bh=APtGEuVNWnTznFyH2u6eLA/t5rgrFrzO6GjlIkwYWsY=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=MihdKChuPi0Qun5R7qBJDH3Q+zLNPU9Xk39QbBInWLKFo0UNA03tiSW6/jKZ/BqHE8lQyURY3UfQxznm1geU9+p9yrE7l+ReKgc9dlRYvUGcokxZdfa6G3R3TSF8jAw0jtzG/W4YRtefiblExDx+rtIYUF64DcIMPkkNJykiScVlDeIcHMQFIHMgdJZTsI3u3hQxMftexRqpuCf7w8/7yp2YcGAsLHLuN5tX62pv5SA4kDPuH3VF84VCvS+43X9iN6xfNJ1BFp2H1BqG9uzd54lvFt/xCpc88sUmlqRY7tghgfM48fNXVBIDVU+cU8RM6syYxyF75cekxIftoDPwog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr5Qm6H5kz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 02:40:15 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wr5Qh0Cvpz9sRs;
	Fri, 23 Aug 2024 18:40:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzTAKqyfju57; Fri, 23 Aug 2024 18:40:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wr5Qg6Pbnz9sRk;
	Fri, 23 Aug 2024 18:40:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CCDF68B781;
	Fri, 23 Aug 2024 18:40:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id flxQG13LERiY; Fri, 23 Aug 2024 18:40:11 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 39AA88B763;
	Fri, 23 Aug 2024 18:40:11 +0200 (CEST)
Message-ID: <89b1ee89-49d2-4afc-abf7-55b487312bbd@csgroup.eu>
Date: Fri, 23 Aug 2024 18:40:10 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/4] powerpc: Remove obsoleted declaration for
 _get_SP
To: cuigaosheng <cuigaosheng1@huawei.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "naveen@kernel.org" <naveen@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "david@redhat.com" <david@redhat.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bgray@linux.ibm.com" <bgray@linux.ibm.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "bhelgaas@google.com" <bhelgaas@google.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
 <20240822130609.786431-2-cuigaosheng1@huawei.com>
 <1c4f7f77-ad18-4956-b794-98b452d0780c@cs-soprasteria.com>
 <48668764-8a8f-98f8-909a-8406207499d7@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <48668764-8a8f-98f8-909a-8406207499d7@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 22/08/2024 à 17:25, cuigaosheng a écrit :
> [Vous ne recevez pas souvent de courriers de cuigaosheng1@huawei.com. 
> Découvrez pourquoi ceci est important à 
> https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 2024/8/22 22:16, LEROY Christophe wrote:
>>
>> Le 22/08/2024 à 15:06, Gaosheng Cui a écrit :
>>> [Vous ne recevez pas souvent de courriers de cuigaosheng1@huawei.com. 
>>> Découvrez pourquoi ceci est important à 
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> The _get_SP() have been removed since
>>> commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc"),
>>> and now it is useless, so remove it.
>> Not sure that commit is relevant since it relates to arch/ppc/ not
>> arch/powerpc/
>>
>> For arch/powerpc/ I think it is commit f4db196717c6 ("[POWERPC] Remove
>> _get_SP")
> 
> In commit 1da177e4c3f4, linux implemented the _get_SP function in misc.S
> and declared and use it in arch/ppc/kernel/process.c, the declaration
> of _get_SP in arch/powerpc/kernel/process.c was introduced in commit
> 14cf11af6cf608, but at this time arch/powerpc/kernel/misc_32.S has not
> been introduced yet，so I think the declaration belongs to _get_SP in the
> misc.S，it have been removed since commit 917f0af9e5a9.
> 
> In addition, commit f4db196717c6 is v2.6.22 but 917f0af9e5a9 is v2.6.27, 
> so I think
> it is commit 917f0af9e5a9.

Nevermind

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
> anything others？thanks very much.
> 
>>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>>> ---
>>>    arch/powerpc/kernel/process.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/process.c 
>>> b/arch/powerpc/kernel/process.c
>>> index 3b506d4c55f3..e7b70c2cc001 100644
>>> --- a/arch/powerpc/kernel/process.c
>>> +++ b/arch/powerpc/kernel/process.c
>>> @@ -72,8 +72,6 @@
>>>    #define TM_DEBUG(x...) do { } while(0)
>>>    #endif
>>>
>>> -extern unsigned long _get_SP(void);
>>> -
>>>    #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>>    /*
>>>     * Are we running in "Suspend disabled" mode? If so we have to 
>>> block any
>>> -- 
>>> 2.25.1
>>>

