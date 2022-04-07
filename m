Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DD4F8718
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ91G1dnVz3bqN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 04:30:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ90n58zsz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 04:30:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KZ90d2yhcz9sRn;
 Thu,  7 Apr 2022 20:30:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiRAN_PMiJwo; Thu,  7 Apr 2022 20:30:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KZ90d23v1z9sRk;
 Thu,  7 Apr 2022 20:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 384238B765;
 Thu,  7 Apr 2022 20:30:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CznV1Ldv3Bfe; Thu,  7 Apr 2022 20:30:09 +0200 (CEST)
Received: from [192.168.202.234] (unknown [192.168.202.234])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C8908B792;
 Thu,  7 Apr 2022 20:30:07 +0200 (CEST)
Message-ID: <5666917d-81b3-e010-776a-2c2ddccd400e@csgroup.eu>
Date: Thu, 7 Apr 2022 20:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
 <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
 <877d91m7wd.fsf@mpe.ellerman.id.au>
 <20220310204917.3d42e6cf3088f7cf1c7fe7a6@linux-foundation.org>
 <e61f1ab5-075a-8d68-0315-4d7069be1650@csgroup.eu>
In-Reply-To: <e61f1ab5-075a-8d68-0315-4d7069be1650@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, "will@kernel.org" <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Le 04/04/2022 à 07:22, Christophe Leroy a écrit :
> Hi Andrew,
> 
> Le 11/03/2022 à 05:49, Andrew Morton a écrit :
>> On Fri, 11 Mar 2022 15:26:42 +1100 Michael Ellerman 
>> <mpe@ellerman.id.au> wrote:
>>
>>>> What will be the merge strategy ? I guess it's a bit late to get it
>>>> through powerpc tree, so I was just wondering whether we could get
>>>> patches 2 to 5 in mm this cycle, and the powerpc ones next cycle ?
>>>
>>> Yeah I didn't pick it up because the mm changes don't have many acks and
>>> I'm always nervous about carrying generic mm changes.
>>>
>>> It would be my preference if Andrew could take 2-5 through mm for v5.18,
>>> but it is quite late, so I'm not sure how he will feel about that.
>>
>> 5.18 isn't a problem.  Perhaps you meant 5.17, which would be real tough.
>>
>> Can we take a look after 5.18-rc1?
> 
> 5.18-rc1 was released last night.
> 
> Can you take patchs 2-5 as they are, or do you prefer I resend them to 
> yourself as a standalone series ?
> 

Are you expecting anything from me ? Do you need a resend of those 4 
patches as a standalone series ?

Thanks
Christiphe
