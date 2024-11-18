Return-Path: <linuxppc-dev+bounces-3405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0889D0F23
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 12:03:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsPqX33Zmz2xdg;
	Mon, 18 Nov 2024 22:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731927784;
	cv=none; b=dScvg1j/5blxfy5YjwCK6dbtJp5Scx7Y/0N+1FHBZ5Ohb75Zx6IWrm0pbUSzRWe9prUadGSawKaUh8O/7hcZiWfVG/7+ygJUjy1daY2fV1noVly2uHdgF4RMRvXsZ6PoO8ARoA2UppJXaOG/awQEFv2AOG2SBw8OidExH3nsr2e+JutsV188XsSf2VBqqt933pn1g7LdAjp9eDX6vjdQH3R1cVmQ2kCNZi3Y8yyKvdaHDkNXRVZ7mFDO52cC4HNgo+YvqkwGEfTpeAJARbOpWH9ETheJm5BubKSNDBouowMN9Gx4tWxKXvfF8QqJIO7tr1kgAt7LSO4qpmRSBoRwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731927784; c=relaxed/relaxed;
	bh=dB7hpTmpMqYgEov0ujUMo3ydcYvLI5IkIgkcChU1Q7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSFe0yk8/FCkTXSse+FTaSwh+qOQ1/U+NE3fGEGPyjQe3pI0yCcy75dwFq+d6KPHcXsxiWB9gsQvh0IXEVHBc1lW81qup1sd1xpsRie3/wQUjDz3pKCeTNiowyTZTwGRJEVSJH2pyX7JakYftvGv6tclNHZYNwn93/dAOGNX8iivqgiXivMJPo7sXtTRQQB8nz5zIWGmjX+io88GpVOHRWsCDZ8JxN0ow88RGthFi3MOkEJWZc68S7Ytb6so1a7MeazfQC/ktJm1vkp5E4kzF5jRHUL4aCqRWBhnXF7YPQXOD8SKA2AkSSaRyz0tG1acDMI5BDMZL9xNyi3Io0ggXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsPqR307Dz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 22:02:58 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XsPqB6Lr7z9sSZ;
	Mon, 18 Nov 2024 12:02:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sd1BtRiIvj43; Mon, 18 Nov 2024 12:02:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XsPqB5XPxz9rvV;
	Mon, 18 Nov 2024 12:02:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A9BEA8B767;
	Mon, 18 Nov 2024 12:02:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4Amllp3f1lFq; Mon, 18 Nov 2024 12:02:46 +0100 (CET)
Received: from [192.168.232.23] (PO27094.IDSI0.si.c-s.fr [192.168.232.23])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 58B098B763;
	Mon, 18 Nov 2024 12:02:46 +0100 (CET)
Message-ID: <124ab5ab-3bfd-4ad7-a75d-981da9c03423@csgroup.eu>
Date: Mon, 18 Nov 2024 12:02:44 +0100
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
Subject: Re: [PATCH v1 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241115133802.3919003-1-andriy.shevchenko@linux.intel.com>
 <5b44abcc-f629-4250-9edf-7f173b78172c@csgroup.eu>
 <ZzsG9EjzV82Crl2W@smile.fi.intel.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZzsG9EjzV82Crl2W@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 18/11/2024 à 10:20, Andy Shevchenko a écrit :
> On Sat, Nov 16, 2024 at 11:44:35AM +0100, Christophe Leroy wrote:
>> Le 15/11/2024 à 14:38, Andy Shevchenko a écrit :
>>> Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
>>> and structs with appropriate alternatives.
>>
>> Looks like you don't really have an alternative to
>> of_mm_gpiochip_add_data(), you are replacing one single line by 11 new ones,
>> and that is done twice (once for cpm1_gpiochip_add16(), once for
>> cpm1_gpiochip_add32()).
> 
> True, but that's the issue that we have of_specific API. If someone propose
> the common API for the agnostic approach,  it would be nice, but I am not
> the one. And TBH I do not see the advantage of it right now as almost every
> GPIO driver is using its own labeling schema (*). Note, that this patch also
> fixes a memory leak as a side effect.

Can you explain that in the commit message instead of saying you use 
appropriate alternatives that do not exist ?

Don't hesitate to mention the memory leak it in the commit message as well.

> 
> *) the legacy API is mostly used by PPC code, do you want that of_mm_* thingy
> to be moved to PPC specific code instead of killing it? Would be done this
> way as well.

No no, your change is ok for me, just need an accurate commit message.

> 
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>    arch/powerpc/platforms/8xx/cpm1.c | 119 +++++++++++++++---------------
>>
>> Does not build:
> 
> Crap, I most likely built something else and not these files...
> I have carefully build-test this for v2.

Just use mpc885_ads_defconfig

> 
> Note to myself: Never ever send the patches on Friday evenings! :-)
> 

Christophe

