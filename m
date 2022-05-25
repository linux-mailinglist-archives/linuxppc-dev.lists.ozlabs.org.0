Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8886C53389B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 10:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7PYq3N0zz3c9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:36:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7PYQ40GDz30Bl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 18:36:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L7PYG5X7Yz9t1C;
 Wed, 25 May 2022 10:36:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLClP_ssGMpv; Wed, 25 May 2022 10:36:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L7PYG4pBbz9t11;
 Wed, 25 May 2022 10:36:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 945918B766;
 Wed, 25 May 2022 10:36:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0V_gZVw8nZwf; Wed, 25 May 2022 10:36:18 +0200 (CEST)
Received: from [192.168.203.180] (unknown [192.168.203.180])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E47E98B763;
 Wed, 25 May 2022 10:36:17 +0200 (CEST)
Message-ID: <9d8b9b3c-1f95-7d12-b6c8-e0c47eb10098@csgroup.eu>
Date: Wed, 25 May 2022 10:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/64: Use tick accounting by default
Content-Language: fr-FR
To: Anton Blanchard <anton@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nick Piggin <npiggin@gmail.com>
References: <20170519144112.15649-1-anton@ozlabs.org>
 <87shjxsf0i.fsf@concordia.ellerman.id.au> <20170522151313.3f60aca2@kryten>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20170522151313.3f60aca2@kryten>
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
Cc: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org, paulus@samba.org,
 cyrilbur@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/05/2017 à 07:13, Anton Blanchard a écrit :
> Hi Michael,
> 
>>> ppc64 is the only architecture that turns on
>>> VIRT_CPU_ACCOUNTING_NATIVE by default. The overhead of this option
>>> is extremely high - a context switch microbenchmark using
>>> sched_yield() is almost 20% slower.
>>
>> Running on what? It should all be nop'ed out unless you're on a
>> platform that needs it (SPLPAR).
> 
> POWERNV native. We don't nop out all the vtime_account_* gunk do we? It
> is all those functions that are a large part of the problem.
> 
>>> To get finer grained user/hardirq/softirq statitics, the
>>> IRQ_TIME_ACCOUNTING option can be used instead, which has much lower
>>> overhead.
>>
>> Can it? We don't select HAVE_IRQ_TIME_ACCOUNTING, so AFAICS it can't
>> be enabled.
> 
> I have a separate patch to enable it.
> 
>> Doesn't dropping this mean we never count stolen time?
> 
> Perhaps. Do we have any applications left that care?
> 

This patch has been superseded by Nick's patch 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220525081346.871535-1-npiggin@gmail.com/

Christophe
