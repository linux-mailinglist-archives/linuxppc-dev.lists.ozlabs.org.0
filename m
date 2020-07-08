Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF95217E92
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 06:51:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1n2Q1JcfzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1n0P4lFvzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 14:49:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B1n0C4zc4z9v12f;
 Wed,  8 Jul 2020 06:49:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WuA_H24l4QZ1; Wed,  8 Jul 2020 06:49:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B1n0C42Y8z9v12h;
 Wed,  8 Jul 2020 06:49:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 788828B77C;
 Wed,  8 Jul 2020 06:49:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PdPoikqdbpGg; Wed,  8 Jul 2020 06:49:32 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 471658B76B;
 Wed,  8 Jul 2020 06:49:30 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
 segher@kernel.crashing.org
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
 <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
 <878sg6862r.fsf@mpe.ellerman.id.au> <875zb98i5a.fsf@mpe.ellerman.id.au>
 <8b751738-a9d1-8f55-8f9b-9264c8ac7ed8@csgroup.eu>
 <faa6759a-8188-104b-a9f9-a5ff3b060cfa@csgroup.eu>
Message-ID: <c827fd9b-984d-ca86-67e9-512ca10d118f@csgroup.eu>
Date: Wed, 8 Jul 2020 06:49:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <faa6759a-8188-104b-a9f9-a5ff3b060cfa@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/07/2020 à 21:02, Christophe Leroy a écrit :
> 
> 
> Le 07/07/2020 à 14:44, Christophe Leroy a écrit :
>>
>>
>> Le 30/06/2020 à 03:19, Michael Ellerman a écrit :
>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>> Hi Michael,
>>>>>
>>>>> I see this patch is marked as "defered" in patchwork, but I can't see
>>>>> any related discussion. Is it normal ?
>>>>
>>>> Because it uses the "m<>" constraint which didn't work on GCC 4.6.
>>>>
>>>> https://github.com/linuxppc/issues/issues/297
>>>>
>>>> So we should be able to pick it up for v5.9 hopefully.
>>>
>>> It seems to break the build with the kernel.org 4.9.4 compiler and
>>> corenet64_smp_defconfig:
>>
>> Most likely a GCC bug ?
>>
>> It seems the problem vanishes with patch 
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/173de3b659fa3a5f126a0eb170522cccd909950f.1594125164.git.christophe.leroy@csgroup.eu/ 
>>
> 
> Same kind of issue in signal_64.c now.
> 
> The following patch fixes it: 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/810bd8840ef990a200f58c9dea9abe767ca02a3a.1594146723.git.christophe.leroy@csgroup.eu/ 
> 
> 

This time I confirm, with the two above mentioned patches, it builds OK 
with 4.9, see 
http://kisskb.ellerman.id.au/kisskb/head/810bd8840ef990a200f58c9dea9abe767ca02a3a/

Christophe
