Return-Path: <linuxppc-dev+bounces-11235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC96B336C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 08:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Lz31RvKz3cYN;
	Mon, 25 Aug 2025 16:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756104639;
	cv=none; b=UEsF6xII3AKSUQWA4TJlhaj4hXldknmDA9C3NAnqGtyNtjrPE26Mgakt896ORx5/tPYM0a3FPd29OhXrGgONXXF0Mi526od2j0CKIFazdD6lvhfU+ENADR0ns0QOC98eV3vtZUqCgK3sAi9AtZCb10/MPLkQAZXIGSEBwW7sUriNJL3959Ke6E5PQB3DRk1JNNFQTCXLGPy6e8u94uA1WpUkUyz1p4n1AriwcsK0zUi0Og7Kj+lxYNOWv8DM4sguGOi4j3TQdTO1y6teCLFhXdWK9/Kz6fNK2cnVDISF0lkl52llEUirDEbvSLpxwaVH8J57tZA3jV0iC8LKvFQ9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756104639; c=relaxed/relaxed;
	bh=/d0w7P9Jwx/WQW0XNyiX4RWPK6SpUp6K4ExZQGTl/Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcyMKt8fWS1K8UTNQPh0gh3JabMW9xvilHInYw5rbOPsP3ZEaST4ddQJMoBBhtPMB4imB0PNsn3sbFauWUvfRcCTfnxWPEstZtuYhgHQjkbkMbPjP3/Zwm1egBdc1pjb7LC7zM9l5/vp8Y1aZ0UyGP/6AkD3PPLPCtX9Bs6auHUXZOX53OpmDfRSx2QyyF8teWN9sB5NKkCVNKXC7xkodoyX6zxGum243C8913Ueme3yt07ehPThwKSanFeLhjOaJobqVvXyAaio+I4rNll9a4729TcNq//V4EFQs3R+dCvWF4fS6bx4FbveFUaJe4rTpOomTtVQeniC/A2/DEbpDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Lz11fVJz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 16:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9LKK5zQYz9sSL;
	Mon, 25 Aug 2025 08:21:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5uVW3356aDM; Mon, 25 Aug 2025 08:21:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9LKK5Cjjz9sSH;
	Mon, 25 Aug 2025 08:21:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B8958B765;
	Mon, 25 Aug 2025 08:21:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WYi6JqpQl8Lp; Mon, 25 Aug 2025 08:21:25 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7318E8B764;
	Mon, 25 Aug 2025 08:21:25 +0200 (CEST)
Message-ID: <1eec11c9-d2f2-45fb-ad7b-6b33bd62cf04@csgroup.eu>
Date: Mon, 25 Aug 2025 08:21:24 +0200
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
Subject: Re: [PATCH] bus: fsl-mc: Check return value of
 platform_get_resource()
To: Markus Elfring <Markus.Elfring@web.de>,
 Salah Triki <salah.triki@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <aIH4t9Ekj8hn7EEk@pc>
 <b107c2a6-bb56-4b15-bf0f-d9eca8163aa1@web.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <b107c2a6-bb56-4b15-bf0f-d9eca8163aa1@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/07/2025 à 18:24, Markus Elfring a écrit :
>> platform_get_resource() returns NULL in case of failure, so check its
>> return value and propagate the error in order to prevent NULL pointer
>> dereference.
> 
> How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16-rc7#n145
> 

Fixes: 6305166c8771 ("bus: fsl-mc: Add ACPI support for fsl-mc")

> 
> …
>> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
>> @@ -1105,6 +1105,10 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
>>   	 * Get physical address of MC portal for the root DPRC:
>>   	 */
>>   	plat_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
>> +	if (!plat_res)
>> +		return -ENODEV;

Before the blame commit, of_address_to_resource() was used and 
of_address_to_resource() returns -EINVAL in case no resource is found. 
Should we keep the same return instead of ENODEV ?

> …
> 
> I suggest to omit a blank line before the if statement.
> 
> Regards,
> Markus
> 
> 


