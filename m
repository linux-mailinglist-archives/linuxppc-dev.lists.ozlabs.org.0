Return-Path: <linuxppc-dev+bounces-4118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07B9F14A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 19:01:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8xx934Jbz3bSm;
	Sat, 14 Dec 2024 05:01:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734112909;
	cv=none; b=Qd3K5OFK1HVBd4x+qaQ4pn4nnl0xXAB956ZegdZNGL7J6QcWAQEVJkjqtWEbeeE1STme/Jw1VmSWa4OzEfz0mpnBsWGXpT+pX7jXl2ApD9moWJC5oXfMMISWo+Gioma++zZjiCng8HSrb4ZM6jXeTUcfd1zcM9DSyqb2pOqDDfQgt9X1HfGHL770l7A3oWtDjqnGP9O3ullOPp+mup44BZoKGZSWNo6jXUyXVGgynLhRj8SG20WfQScfrtJdMBj0deypdEwixQWX5amfGSUSoWjsP3IiUgXVfxkdhJWcEiI0u07jKEpEl8uG37ltBOFezdGHq8rFwyzl/GJYPlrBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734112909; c=relaxed/relaxed;
	bh=7BLV5EXoeFy1fZoj11K2CQc5EF+4eTmkMOGpcCQpZMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJWQ6HgaigiUqZQpqNNCbs9wDm6nPuGXrosZk87VtpLLmWhxp3kQD4BHJapXO2SzxwuWvnT6eyBaR7uypcZemVclhc6xd1jPRKYQ5h7mzP7q0RjJhbLPB+Evs+zLne0sUrKbKUHS0LJ4WZ6U2Wb1YU4hnLPQM1ZljuzAI6l7xmkW11LW23V6Ak6Pqcsm8AxZR2UjuD12NX3ideSzY8Iv+YEpWTzsPx2EbAVMqNU5oHZ9N5NozfXUe8SnBdeTIRUNl5ylcjhms9Bu10YLbOAg038BZ/OCe/1M6W/jgryDBjJ8i/YvEjSpTpbwUANkGEHolXgwMGBNMSH+BCTnOglA7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8xx75D27z3bSh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 05:01:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8xx30j08z9stM;
	Fri, 13 Dec 2024 19:01:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSSsHbs8N1EE; Fri, 13 Dec 2024 19:01:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8xx26twzz9sSN;
	Fri, 13 Dec 2024 19:01:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DB8938B773;
	Fri, 13 Dec 2024 19:01:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XbgtfbMthvBF; Fri, 13 Dec 2024 19:01:42 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EA9D8B763;
	Fri, 13 Dec 2024 19:01:42 +0100 (CET)
Message-ID: <95951cd6-f98f-4793-a35c-22f4e8d743af@csgroup.eu>
Date: Fri, 13 Dec 2024 19:01:42 +0100
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
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <514964ea-0795-41d6-91d3-f3d4f193fc6d@csgroup.eu>
 <Z1sOTf6UZbruptnl@smile.fi.intel.com>
 <991aee8b-fb10-4152-89fb-6ac542ee87c1@csgroup.eu>
 <Z1xp1xwLXAvkKgwD@smile.fi.intel.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z1xp1xwLXAvkKgwD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/12/2024 à 18:07, Andy Shevchenko a écrit :
> On Fri, Dec 13, 2024 at 07:28:45AM +0100, Christophe Leroy wrote:
>> Le 12/12/2024 à 17:24, Andy Shevchenko a écrit :
>>> On Mon, Nov 18, 2024 at 03:10:09PM +0100, Christophe Leroy wrote:
>>>> Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
>>>>> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
>>>>> file provides an OF API that's deprecated. There is no agnostic
>>>>> alternatives to it and we have to open code the logic which was
>>>>> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
>>>>> drivers are using their own labeling schemas and resource retrieval
>>>>> that only a few may gain of the code deduplication, so whenever
>>>>> alternative is appear we can move drivers again to use that one.
>>>>>
>>>>> As a side effect this change fixes a potential memory leak on
>>>>> an error path, if of_mm_gpiochip_add_data() fails.
>>>>>
>>>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>>
>>>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>
>>> Thanks, what's next?
>>
>> Next step is that Michael or Madhavan apply it I guess ?
> 
> Folks, do you have any comments? Can you apply this and we move forward towards
> removing the legacy API from the kernel?
> 

If you have some work which depends on this patch, you can also take it 
together with that work through another tree. Just let us know.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

