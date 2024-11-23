Return-Path: <linuxppc-dev+bounces-3523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A99D6893
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 11:19:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwSd55lmMz2xk1;
	Sat, 23 Nov 2024 21:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732357177;
	cv=none; b=ABeB6d94wmPnFwEza+RC5WRh0Ml5+6G9maAMWHWBKBmVLC6NXFYL8rpVs7eV29uWVf4saDnXB2wGup3+89YKM4oIifBbnfJ72EehoWz+ncQxiMBGvYqvZVXU9BtVj08xsu31BSRIklu+GBZNVnYg82OT+Y+CbK/D910mhxGBGXt4/88aY3iGwk9LYiIu1FKYunaxv9rvkEv4UYMeazfsCAulxizOecsvXAkKG/gr570nMDloHzpnr7l9/Ymvi59Mjrs8vnqZDEQ9XtHJCIvdYOdjnkQ5Yn1EZDfsK+2xY33+Kz+IxOdQ6esgdTHOa4iKe/jbVkdD0Tdm+Kwdr/44/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732357177; c=relaxed/relaxed;
	bh=YQzDaMIiVsDcUJ/S6pcfTP42Y+bnYk0I9f/f7W0FODY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8oXxm1+XpolxQA0yDGbbmTdT37P2wP2BaaFdbicVUhxQ8Yho8Q4tJO2skGroRH5ZaqIo85uSEKnLxdgITQbaBEn+PLFNPa/x5Tms1oCWrVcRnf+NHFS4ZygOwq5kAgKq4B1rzhUiEyR1jqUliFY/zDCtzjEQ5eMqTaNIgt5LANHHfQ7YOPR74NRfdb4ASituCajTfSklR4jP2oa9f+HV02AkUgJSwvorfDYUa+HoVUR5UeAXMplUlTensWe/BZh4o8L4TgJYHhgKnUVODMQ8KL7+350cWV9lQyEGFvzvdVlYn5Ku9cHn43dZGlsyO4gQ6qub0hdnArbSzQz+5aA1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwSd44xNRz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 21:19:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XwScx5KxVz9sPd;
	Sat, 23 Nov 2024 11:19:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMnpy2PKmDHd; Sat, 23 Nov 2024 11:19:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XwScx49Y8z9rvV;
	Sat, 23 Nov 2024 11:19:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7416C8B765;
	Sat, 23 Nov 2024 11:19:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id F0Hvjc_3hwkh; Sat, 23 Nov 2024 11:19:29 +0100 (CET)
Received: from [192.168.232.139] (unknown [192.168.232.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15C368B764;
	Sat, 23 Nov 2024 11:19:29 +0100 (CET)
Message-ID: <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
Date: Sat, 23 Nov 2024 11:19:28 +0100
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
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
To: Michael Ellerman <mpe@ellerman.id.au>,
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87v7weodqn.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 23/11/2024 à 04:01, Michael Ellerman a écrit :
> Thorsten Blum <thorsten.blum@linux.dev> writes:
>> On 11. Nov 2024, at 02:11, Michael Ellerman wrote:
>>> Thorsten Blum <thorsten.blum@linux.dev> writes:
>>>> The name is Mimi Phuong-Thao Vo.
>>>
>>> Is that the correct spelling?
>>>
>>> The github commit below suggests it's Mimi Phûông-Thåo Võ.
>>>
>>> And presumably the author preferred that spelling, otherwise they would
>>> have just written it in ASCII in the first place.
>>>
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fbminor%2Fbinutils-gdb%2Fcommit%2F6603bf38d74409906b3814f6a26c0483a5d32e41&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce09e131ad44342b0be9a08dd0b6b1c9b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638679276875561424%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=5F8j2IkQc6sy8tnoBoNVlbxA2YyxptCfh92Gx9mi460%3D&reserved=0
>>
>> Hi Michael,
>>
>> Are you suggesting to keep "Mimi Ph\373\364ng-Th\345o V\365" and a FIXME
>> instead of changing it to "Mimi Phuong-Thao Vo" which is how she spells
>> her name on her LinkedIn profile and other websites?
> 
> No I'm not suggesting to leave it as-is.
> 
> But I also suspect they spell it that way on LinkedIn etc. because it's
> the path of least resistance, not because it's the correct spelling.
> 
> I was hoping someone who's more familiar with Vietnamese (I believe)
> spelling would chime in and tell us which is correct.
> 
>> I doubt anyone prefers their name to be spelled with octal escape
>> characters.
>   
> Sure, but it wouldn't have been octal escapes in the original character
> encoding, it would have appeared, I believe, as Mimi Phûông-Thåo Võ.
> 

Isn't our file just a copy of the one from binutils ? Shouldn't we 
adjust it based on commit 
https://github.com/bminor/binutils-gdb/commit/2ce18a16268a ?

Christophe

