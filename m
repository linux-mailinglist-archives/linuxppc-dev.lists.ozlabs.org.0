Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E034859E808
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBwGv5QrMz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 02:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBwGW5WDYz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 02:50:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MBwGR6krQz9sZY;
	Tue, 23 Aug 2022 18:50:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SSRsUXke2io; Tue, 23 Aug 2022 18:50:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MBwGR6058z9sXB;
	Tue, 23 Aug 2022 18:50:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD5C48B77A;
	Tue, 23 Aug 2022 18:50:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gyojHjs122t5; Tue, 23 Aug 2022 18:50:55 +0200 (CEST)
Received: from [192.168.232.51] (po17370.idsi0.si.c-s.fr [192.168.232.51])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 48F258B763;
	Tue, 23 Aug 2022 18:50:55 +0200 (CEST)
Message-ID: <3756ad84-a5b0-b404-7962-86f77d6f38b3@csgroup.eu>
Date: Tue, 23 Aug 2022 18:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Zhouyi Zhou
 <zhouzhouyi@gmail.com>, npiggin@gmail.com, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 lance@osuosl.org, paulmck@kernel.org, rcu@vger.kernel.org
References: <20220821010030.97539-1-zhouzhouyi@gmail.com>
 <87edx7l5px.fsf@mpe.ellerman.id.au>
 <0d7b55bc-4dd2-7de1-8ca5-353b1a044caf@csgroup.eu>
In-Reply-To: <0d7b55bc-4dd2-7de1-8ca5-353b1a044caf@csgroup.eu>
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



Le 23/08/2022 à 10:47, Christophe Leroy a écrit :
> 
> 
> Le 23/08/2022 à 10:33, Michael Ellerman a écrit :
>> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
>>
>> My worry is that this will force irq_soft_mask_set() out of line, which
>> we would rather avoid. It's meant to be a fast path.
>>
>> In fact with this applied I see nearly 300 out-of-line copies of the
>> function when building a defconfig, and ~1700 calls to it.
>>
>> Normally it is inlined at every call site.
>>
>>
>> So I think I'm inclined to revert ef5b570d3700 ("powerpc/irq: Don't open
>> code irq_soft_mask helpers").
> 
> Could you revert it only partially ? In extenso, revert the 
> READ/WRITE_ONCE and bring back the inline asm in irq_soft_mask_return() 
>   and irq_soft_mask_set(), but keep other changes.

I sent a patch doing that.

Christophe
