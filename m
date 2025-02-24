Return-Path: <linuxppc-dev+bounces-6404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B1A41BA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 11:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1cvV3Y6Qz301x;
	Mon, 24 Feb 2025 21:50:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740394214;
	cv=none; b=gAixrpI65jYep6dTAqj7LVvv+aaP7mrcqLYrIu+a5iYniAmdoqGW+fnYQtNeVO7pzhA0qeYtZC5jowP+zqhB8TRPmkkcUW+5nyomhuTVe6FKVG9yyVRmDjGWCVuD0g6cEzpIh3Fi4owixAGbu/MC0Cc0OWsEQL1WVh56oMXKNhmZDzAlUNK3/Q1Yfr4u+lqIw0q5hKqDtmnYGc/dfsxZFzGqQHtDxn/yyhfPfz7syZRJwYBzJiOsmytFk2mfk/70QjU6Tl6pvFSb8xcmg4l/XsuXsXjYOisTdLXGfCwCn0NbJyBFZdPffgphqF5fQbZj6O9dICLv+ySDjAbwguPbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740394214; c=relaxed/relaxed;
	bh=iFH4x8hjk1P3JOT4Q/yJgNSJfC1j3jl0pUPUY84OFO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbHVeBeoRgWaIhNH1koFHuLhNdkNxlXpJ5pQcfwh8mG8rh3/zzDZHOE0nVJwcdUcvSyqvbpP/IFXqNpnn3ljgK8gRYoLwnoYqTeIsmUHyl9I6XsXW6ceXqwnQbnx+yrN3KH//PJvjjX4uqQ0Hi2d6eN1Cx1OMadNz94e9ZwChMzSnsCKYmDh96U4nT2ffaT8MXmEUE/Jj5+qs96Wimkpdv6ohmOcJDmny6ge54U5i8gQVQP2U0Lb1v6jXVsqDMoEI2DQ6N6sWvvOLebhp6i5oeQ3deIGsJ00KvA/rZ9Bz8l9TdA1uu3JLNuI6/2ZgeJ/EfOXW6N+HmPuyXNCxpuN0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1cvT5TwJz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 21:50:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1cbK3Xnhz9sVQ;
	Mon, 24 Feb 2025 11:36:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAyZKr75BxfC; Mon, 24 Feb 2025 11:36:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1cbK2FxHz9sVN;
	Mon, 24 Feb 2025 11:36:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 39B398B765;
	Mon, 24 Feb 2025 11:36:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sYvQOoZx4V4Q; Mon, 24 Feb 2025 11:36:13 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A1BF8B763;
	Mon, 24 Feb 2025 11:36:13 +0100 (CET)
Message-ID: <055e567d-771c-4031-952c-1bcdbf921c90@csgroup.eu>
Date: Mon, 24 Feb 2025 11:36:12 +0100
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
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call warning
 for bl+mflr pattern
To: Sathvika Vasireddy <sv@linux.ibm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, npiggin@gmail.com, maddy@linux.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <20250220195940.ely2l2fpsozd2tuv@jpoimboe>
 <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 21/02/2025 à 09:50, Sathvika Vasireddy a écrit :
> [Vous ne recevez pas souvent de courriers de sv@linux.ibm.com. Découvrez 
> pourquoi ceci est important à https://aka.ms/ 
> LearnAboutSenderIdentification ]
> 
> Hi Josh, Thanks for the review.
> 
> On 2/21/25 1:29 AM, Josh Poimboeuf wrote:
>> On Wed, Feb 19, 2025 at 09:50:14PM +0530, Sathvika Vasireddy wrote:
>>> Architectures like PowerPC use a pattern where the compiler generates a
>>> branch-and-link (bl) instruction that targets the very next instruction,
>>> followed by loading the link register (mflr) later. This pattern appears
>>> in the code like:
>>>
>>>   bl .+4
>>>   li r5,0
>>>   mflr r30
>> If I understand correctly, this is basically a fake call which is used
>> to get the value of the program counter?
> 
> Yes, that's correct.
> 
> Also, just out of curiosity, how does x86 do it? Does it not use a
> branch to next instruction approach?
> 
>>> Objtool currently warns about this as an "unannotated intra-function
>>> call" because find_call_destination() fails to find any symbol at the
>>> target offset. Add a check to skip the warning when a branch targets
>>> the immediate next instruction in the same function.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild- 
>>> all%2F202502180818.XnFdv8I8- 
>>> lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cdce2affdaed147a6058008dd5254d85e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638757246560427230%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=dhUS9PNZKUpz%2Bc1hePG1tuTIWbiKqS46uoAJOvU76sU%3D&reserved=0
>>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> This should have a Fixes tag as well.
> Thanks for catching that. I'll add the Fixes tag.
>>
>>>   static int add_call_destinations(struct objtool_file *file)
>>>   {
>>> +    struct instruction *next_insn;
>>>      struct instruction *insn;
>>>      unsigned long dest_off;
>>>      struct symbol *dest;
>>> @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct 
>>> objtool_file *file)
>>>              reloc = insn_reloc(file, insn);
>>>              if (!reloc) {
>>>                      dest_off = arch_jump_destination(insn);
>>> +
>>> +                    next_insn = next_insn_same_func(file, insn);
>>> +                    if (next_insn && dest_off == next_insn->offset)
>>> +                            continue;
>>> +
>> This won't work on x86, where an intra-function call is converted to a
>> stack-modifying JUMP.  So this should probably be checked in an
>> arch-specific function.
> 
> Thanks for letting me know, I'll introduce arch_skip_call_warning() to
> handle architecture specific cases in the next patch I send.

Not sure what you want to do here.

See my other response, I think it should just be handled as an 
INSN_OTHER by arch_decode_instruction()

Christophe

