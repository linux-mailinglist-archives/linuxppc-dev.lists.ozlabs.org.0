Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AD5B6AFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 11:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRdp85FS3z3c2R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 19:44:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRdng3c9kz2xvJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 19:43:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MRdnT2ShQz9t0C;
	Tue, 13 Sep 2022 11:43:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTNuIV4UJsKy; Tue, 13 Sep 2022 11:43:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MRdmZ39yDz9t0Y;
	Tue, 13 Sep 2022 11:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E0E08B77E;
	Tue, 13 Sep 2022 11:42:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9xEu-YDnXdMS; Tue, 13 Sep 2022 11:42:38 +0200 (CEST)
Received: from [192.168.232.91] (unknown [192.168.232.91])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED4EF8B763;
	Tue, 13 Sep 2022 11:42:37 +0200 (CEST)
Message-ID: <449eb912-f7c7-2f79-d8bb-9449bee01986@csgroup.eu>
Date: Tue, 13 Sep 2022 11:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: State of RFC PATCH Remove CONFIG_DCACHE_WORD_ACCESS
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>
References: <CAKXUXMzQDy-A5n8gvHaT9s21dn_ThuW0frCgm_tXMHPUhLY2zA@mail.gmail.com>
 <91e6cf8b-f66a-3ea1-daa0-2ea875b7e7e8@csgroup.eu>
In-Reply-To: <91e6cf8b-f66a-3ea1-daa0-2ea875b7e7e8@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/09/2022 à 17:22, Christophe Leroy a écrit :
> 
> 
> Le 12/09/2022 à 15:46, Lukas Bulwahn a écrit :
>> Hi Joe, hi Ben,
>>
>> While reviewing some kernel config, I came across
>> CONFIG_DCACHE_WORD_ACCESS and tried to understand its purpose.
>>
>> Then, I discovered this RFC patch from 2014 that seems never to have
>> been integrated:
>>
>> https://lore.kernel.org/all/1393964591.20435.58.camel@joe-AO722/
>> [RFC] Remove CONFIG_DCACHE_WORD_ACCESS
>>
>> The discussion seemed to just not continue and the patch was just not
>> integrated by anyone.
>>
>> In the meantime, the use of CONFIG_DCACHE_WORD_ACCESS has spread into
>> a few more files, but replacing it with
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS still seems feasible.
>>
>> Are you aware of reasons that this patch from 2014 should not be 
>> integrated?
>>
>> I would spend some time to move the integration of this patch further
>> if you consider that the patch is not completely wrong.
>>
> 
> As far as I can see, for the time being this is not equivalent on powerpc:
> 
> select HAVE_EFFICIENT_UNALIGNED_ACCESS  if !(CPU_LITTLE_ENDIAN && 
> POWER7_CPU)
> 
> select DCACHE_WORD_ACCESS               if PPC64 && CPU_LITTLE_ENDIAN
> 
> This will need to be investigated I guess.
> 
> In the meantime I'll try to see if it makes any difference for ppc32.
> 

Selecting DCACHE_WORD_ACCESS on powerpc32 provides an improvement of 
approx 9% on a powerpc 8xx and about 2% on a powerpc 832x, using the 
benchmark test in commit a75c380c7129 ("powerpc: Enable 
DCACHE_WORD_ACCESS on ppc64le")

Christophe
