Return-Path: <linuxppc-dev+bounces-1370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D7C978E83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 08:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5MJX1zNXz2yD5;
	Sat, 14 Sep 2024 16:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726296652;
	cv=none; b=eUj7L/w4W3tdJSCMLDU2DM87c2HkbmWFnWVxkEryMa3v2AM0B3upJTALleaIRQXw1oydjOUkhwkrfZp0DhmvLjv3Yym74D5TcdmcxfVOXB4yFJmhpIVrG9Sm1A1jghUGpD5n9XB5V6aOqelSDWN2HKBjFHaOZ3ISzinc0xaYWt8STxW/8UGnjO1qZzkn1jEyA0YYV60Q39Oqyly+8G8wAcsxDBAr2UsqpeddhjW4bHGAr3dtrsqymgiU6KYcU/sdqPH00xfX2+rwgfABpRTDII5fTFMPO0iDrswSQqYXdYLIHmzviq6WLx5+HeIe9iUUi/2XX9mqNTh0GNy21FtU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726296652; c=relaxed/relaxed;
	bh=Hr+cg1HlLMaWaDOi66UdpcGtp4utIPQFwEh5dXaLDL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSp3xNl73tZN0nlb2OwM4DQhB53+b4+K2H2C0H2gLqDhLVbGHUZzF5nSIPp0oHZB1iCnAqUuLmups1WH5+ybnXDSKpZi9Nwg/f5lMCWKLWi0Uwpo6AYgK1ZF1l1dMQ91w6LhRZ9uuJDnPxA3TiqOMnougHWtlhmDdrjZmg+6eowF6VQC/v/A54sbtghahD7lNydiwf7CQYibDXpcIH8KM75hqd3+zuENdnES893Zf7TtcAmTGgcZxv5PxoGRauYJ58S55h08xY7H05UbshHDLQfrpWWpCI6iPFv0b1PqFjpT87lEdkLnbnGEJjVKiOJOBxDDYDz5MrdL62QnsW0EWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5MJW6cVnz2y8h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 16:50:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X5MJR3rhBz9sxD;
	Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dq3uoKnkcrG6; Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X5MJR2xwPz9sxC;
	Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E0A58B764;
	Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4kDiXHNHMIzl; Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
Received: from [192.168.233.150] (unknown [192.168.233.150])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AF0CE8B763;
	Sat, 14 Sep 2024 08:50:46 +0200 (CEST)
Message-ID: <30e8dee7-e98e-42cb-aab3-6b75f1a6316d@csgroup.eu>
Date: Sat, 14 Sep 2024 08:50:46 +0200
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
Subject: Re: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
To: Matthew Wilcox <willy@infradead.org>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Simon Horman <horms@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20240913192036.3289003-1-almasrymina@google.com>
 <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 13/09/2024 à 21:22, Matthew Wilcox a écrit :
> On Fri, Sep 13, 2024 at 07:20:36PM +0000, Mina Almasry wrote:
>> +++ b/include/linux/page-flags.h
>> @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
>>   {
>>   	unsigned long head = READ_ONCE(page->compound_head);
>>   
>> -	if (unlikely(head & 1))
>> -		return head - 1;
>> +	if (unlikely(head & 1UL))
>> +		return head & ~1UL;
>>   	return (unsigned long)page_fixed_fake_head(page);
> 
> NAK, that pessimises compound_head().
> 

Can you please give more details on what the difference is ?

I can't see what it pessimises. In both cases, you test if the value is 
odd, when it is odd you make it even.

Christophe

