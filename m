Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D840D3BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 09:24:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H97rD6qcpz305j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 17:24:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H97qp04gWz2xjR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 17:24:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H97qh40qXz9sVF;
 Thu, 16 Sep 2021 09:24:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKKfxh6TCdGx; Thu, 16 Sep 2021 09:24:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H97qf313Xz9sVD;
 Thu, 16 Sep 2021 09:23:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 521AF8B763;
 Thu, 16 Sep 2021 09:23:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pa4JKxB2Kswe; Thu, 16 Sep 2021 09:23:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.5])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6F368B77E;
 Thu, 16 Sep 2021 09:23:57 +0200 (CEST)
Subject: Re: [PATCH] powerpc: warn on emulation of dcbz instruction
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <62b33ca839f3d1d7d4b64b6f56af0bbe4d2c9057.1631716292.git.christophe.leroy@csgroup.eu>
 <2c0fd775625c76c4dd09b3e923da4405a003f3bd.camel@kernel.crashing.org>
 <eb1a39368401bf46e805ca64256604cc649f771e.camel@kernel.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <43f736d4-8625-2848-786f-79b902d5c753@csgroup.eu>
Date: Thu, 16 Sep 2021 09:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb1a39368401bf46e805ca64256604cc649f771e.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: Finn Thain <fthain@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Stan Johnson <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/09/2021 à 09:16, Benjamin Herrenschmidt a écrit :
> On Thu, 2021-09-16 at 17:15 +1000, Benjamin Herrenschmidt wrote:
>> On Wed, 2021-09-15 at 16:31 +0200, Christophe Leroy wrote:
>>> dcbz instruction shouldn't be used on non-cached memory. Using
>>> it on non-cached memory can result in alignment exception and
>>> implies a heavy handling.
>>>
>>> Instead of silentely emulating the instruction and resulting in
>>> high
>>> performance degradation, warn whenever an alignment exception is
>>> taken due to dcbz, so that the user is made aware that dcbz
>>> instruction has been used unexpectedly.
>>>
>>> Reported-by: Stan Johnson <userm57@yahoo.com>
>>> Cc: Finn Thain <fthain@linux-m68k.org>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/kernel/align.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/kernel/align.c
>>> b/arch/powerpc/kernel/align.c
>>> index bbb4181621dd..adc3a4a9c6e4 100644
>>> --- a/arch/powerpc/kernel/align.c
>>> +++ b/arch/powerpc/kernel/align.c
>>> @@ -349,6 +349,7 @@ int fix_alignment(struct pt_regs *regs)
>>>   		if (op.type != CACHEOP + DCBZ)
>>>   			return -EINVAL;
>>>   		PPC_WARN_ALIGNMENT(dcbz, regs);
>>> +		WARN_ON_ONCE(1);
>>
>> This is heavy handed ... It will be treated as an oops by various
>> things uselessly spit out a kernel backtrace. Isn't
>> PPC_WARN_ALIGNMENT
>> enough ?


PPC_WARN_ALIGNMENT() only warns if explicitely activated, I want to 
catch uses on 'dcbz' on non-cached memory all the time as they are most 
often the result of using memset() instead of memset_io().

> 
> Ah I saw your other one about fbdev...  Ok what about you do that in a
> if (!user_mode(regs)) ?

Yes I can do WARN_ON_ONCE(!user_mode(regs)); instead.

> 
> Indeed the kernel should not do that.


Does userspace accesses non-cached memory directly ?

Christophe
