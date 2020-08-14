Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CBB244A63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 15:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSkmK0sjFzDqQG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 23:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSkjq21syzDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 23:26:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BSkjq09PNz8tQ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 23:26:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BSkjp6qj5z9sTX; Fri, 14 Aug 2020 23:26:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BSkjn3hfpz9sTH
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Aug 2020 23:26:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSkjc05l4z9vD3B;
 Fri, 14 Aug 2020 15:26:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id d6dKnB4fLuEc; Fri, 14 Aug 2020 15:26:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSkjb68Qsz9vD2x;
 Fri, 14 Aug 2020 15:26:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ADC68B797;
 Fri, 14 Aug 2020 15:26:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gZ2orR0_hfoa; Fri, 14 Aug 2020 15:26:29 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 173A88B767;
 Fri, 14 Aug 2020 15:26:29 +0200 (CEST)
Subject: Re: [PATCH 2/4] powerpc: Introduce asm-prototypes.h
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@ozlabs.org
References: <1463534212-4879-1-git-send-email-dja@axtens.net>
 <1463534212-4879-2-git-send-email-dja@axtens.net>
 <b50b9bdd-b731-44ed-435b-e3e4b179a89a@csgroup.eu>
 <87d03t9y66.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a94a5094-9f47-08ef-31b7-c9653ffbbdcc@csgroup.eu>
Date: Fri, 14 Aug 2020 13:26:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87d03t9y66.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/14/2020 01:04 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 18/05/2016 à 03:16, Daniel Axtens a écrit :
>>> Sparse picked up a number of functions that are implemented in C and
>>> then only referred to in asm code.
>>>
>>> This introduces asm-prototypes.h, which provides a place for
>>> prototypes of these functions.
>>
>> It looks like this is a mis-use of asm-prototypes.h
>>
>> On other architectures, asm-prototypes.h is there to allow MODVERSION to
>> sent versions for exported assembly functions (I checked history of that
>> file in x86 and arm64).
> 
> Look closer :)
> 
> 42f5b4cacd78 ("powerpc: Introduce asm-prototypes.h") (Jun 2016)
> 334bb7738764 ("x86/kbuild: enable modversions for symbols exported from asm") (Dec 2016)
> c3296a1391cb ("arm64: add <asm/asm-prototypes.h>") (Dec 2018)

Aren't you all sitting at the same place in the middle of Pacific Ocean, 
far far away from Paris ? :)

Looking closer I see: mdr: (Ok, that's Nov 2016 but ...)

commit 4efca4ed05cbdfd13ec3e8cb623fb77d6e4ab187
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Tue Nov 1 12:46:19 2016 +1100

     kbuild: modversions for EXPORT_SYMBOL() for asm

     Allow architectures to create asm/asm-prototypes.h file that
     provides C prototypes for exported asm functions, which enables
     proper CRC versions to be generated for them.

     Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
     Signed-off-by: Michal Marek <mmarek@suse.com>




> 
>> It looks like you have used it on the other way round, you have declared
>> in it C functions used by ASM functions, whereas it is supposed to be
>> dedicated to declaring exported ASM functions used by C functions.
> 
> But yes, it's since been co-opted for the modversions stuff.
> 
> I guess the contents should be split out into appropriate headers
> depending on what the prototypes are for.
> 


Christophe
