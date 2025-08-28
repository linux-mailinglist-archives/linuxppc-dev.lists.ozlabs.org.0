Return-Path: <linuxppc-dev+bounces-11404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3CB392D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 07:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC8qn6Cllz3bby;
	Thu, 28 Aug 2025 15:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756358437;
	cv=none; b=mHGhntPmtwluMekTQ7kcyxfKVqLLVOGh7xI+BS4ideHRae3XwCwflwCGMnjRy5zdTiGH3y7fR1lzmg//d4j7nlJLL4+pCzGWusdmLv3hM0/1DjjPX2I4Uq6VToG5ZoGWfNtjNd8NLnDTZRVWAdmClsYRDFzwzY9pCaNK+1w2HnCsftwh9YluvU5vzhUXesFdBMxOB+pu9TAaiTKE61RmyBwyTkAWXHCVNti4WfRWJHKgJFghRW9PIz4vfDdpJuraAmJswGI8UfIIjX4GI3whmZWFjsgvpqLABZ8AXggHSeAffG8U45dIs71na0bOY2aOPmXvHSxqrbtZ6K16VdijpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756358437; c=relaxed/relaxed;
	bh=8Q0mKrh6FzOQvwel4sPKkj0EVKJMnJqvGiWOvqA2Ad0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6jZXMfeMN9euusEvplpKEYmxFm1/62Q0KTfAI9KIqRRvWFTSVK5/DLBMRyZp3hZ1k4kJLDuBKtPz3mGmmh7ccFOFH/maWyh9u+1XmUTb9YENvckQGuFNExzzkrGM5kOajjpHQUauEl2GmuXBt3YsCMhULcaxXUTh57zHABWDAjRaLfNT8zu3G14mB/Zqkb0l7wQwZ/c+Ak6C3H2H1PTNQ18Ia+t49uEhPNfq8wrvXWGy5yJRp9FbVRL4YgOBQKSHlq7o0KjLoBCfM6KGS+9vVo/mZBx6P0yCIU2mgeD6K/fueBL3vTNXrna1wzA8jsxKsFJgCeqcLwCQs2susO+Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC8qn0Dgrz2xK2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 15:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cC89c3Sp9z9sS7;
	Thu, 28 Aug 2025 06:51:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ma-oCaIkKbZ1; Thu, 28 Aug 2025 06:51:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cC89c2dhnz9sRy;
	Thu, 28 Aug 2025 06:51:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EDDA8B764;
	Thu, 28 Aug 2025 06:51:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QunPaQfOtMZw; Thu, 28 Aug 2025 06:51:00 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F266E8B763;
	Thu, 28 Aug 2025 06:50:59 +0200 (CEST)
Message-ID: <4c7e5a00-87dd-4836-a57e-45282ddf4c0b@csgroup.eu>
Date: Thu, 28 Aug 2025 06:50:59 +0200
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
Subject: Re: [PATCH] powerpc/powernv: Rename pe_level_printk to pe_printk and
 embed KERN_LEVEL in format
To: Joe Perches <joe@perches.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
References: <df3a7ca31d2002ca447ab062f5b5e32ced9bec85.camel@perches.com>
 <732ae03a-f0a7-450c-8896-e8a4975a5254@csgroup.eu>
 <5b914354f29e58097e373dde76ee26b246a64ce6.camel@perches.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <5b914354f29e58097e373dde76ee26b246a64ce6.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 28/08/2025 à 02:04, Joe Perches a écrit :
> [Vous ne recevez pas souvent de courriers de joe@perches.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Wed, 2025-08-27 at 18:42 +0200, Christophe Leroy wrote:
>> Hi Joe
>>
>> Le 21/06/2019 à 07:36, Joe Perches a écrit :
>>> Remove the separate KERN_<LEVEL> from each pe_level_printk and
>>> instead add the KERN_<LEVEL> to the format.
> 
> Hello Christophe.
> 
> It's over 6 years since I wrote that.
> Is that the typical review time? ;)

:)

I'm trying to clean patchwork and drop stale patches that are still 
there. At the moment we have 240 'new' patches. 88 of them are older 
than one year, with a few older ones being almost 10 years old.

> 
> I would expect it doesn't apply anyway
> though it should make the object size
> a tiny bit smaller.

It still applies when doing a 3-way merge indeed.

Christophe

