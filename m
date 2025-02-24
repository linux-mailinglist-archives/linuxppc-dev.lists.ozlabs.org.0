Return-Path: <linuxppc-dev+bounces-6431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF11A42B08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 19:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1ptf2ss6z2ygS;
	Tue, 25 Feb 2025 05:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740421210;
	cv=none; b=G6TEVmaoPZZL19/im4UfsXPOkxpQQXDYVhEGaJde2jgg0fTx6m2MSOl41YUKXg7ykftfUGdOzplTjNsBsxqrcfNsJPkh2bfyGJWV87JsoFOPkZ/yyMsOdQFxBqg5+NZJnEXQb3PyqPjCCNDC4kh7+kUIz10PwekojUw+mZj7KuDxUIMrqhIWSGIocWuKbuXT89izr4BhOTW5JucQdOdq1J3xvmIU9gIMRdv1YTFlZTXz0n3xEFUvlgT8+eLhfSO63Wi7Gpmo1t1Dx0SPAtmnUMWtC2QN5puWUjuYXIJvWnG7/L9nfr2rl5JvQ7j6+cN1PJXOv1KmemekXwklQWOv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740421210; c=relaxed/relaxed;
	bh=5DnUoNZOJ4QFKZvnAOY1DwAqPl6/CskqQTehwJMpBt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLW8XTrGsNiyGjZBAIt9pI1ppK7f1ZEF/hGu9LieYQjHgHfSPZKGacQ67ZQBLPOzmclIq+tKVyDclwIulEIgbTLkS/6hTOcBAipnizUWZi0SUrFzqubcNhkc5z9HkvhWrAFDpYnfkaW+mJUgOi2KTTprmWELWuvzB22mwcG9d3rRJ6xmwQ0Xco6mperIhGDn0f2QTKkq8O+rBxqf2HPILOvhHaSo/4WbrR6TMebvHiyWBhIdN8qAfM3DN/HWrQS/WCqoo0QEo/wQA3MKnqD/9c1eZ4UiPrVXUcbHiSdmn65FzNXqidQo7T5GH9BcPROQzL5ItuCyP0zteQE7crAb7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1ptZ3Pl6z2ygR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 05:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1pKK5Fkrz9sSH;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0MKA8qxQct2; Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1pKK4Vknz9sSC;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 887038B780;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xx2jkbRBAbLX; Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F34B8B77C;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Message-ID: <9435789c-cd05-4ec1-bcef-42d81fd87053@csgroup.eu>
Date: Mon, 24 Feb 2025 18:54:44 +0100
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
To: Peter Zijlstra <peterz@infradead.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, npiggin@gmail.com,
 maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <20250220195940.ely2l2fpsozd2tuv@jpoimboe>
 <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
 <20250224162542.GE11590@noisy.programming.kicks-ass.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250224162542.GE11590@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 24/02/2025 à 17:25, Peter Zijlstra a écrit :
> On Fri, Feb 21, 2025 at 02:20:41PM +0530, Sathvika Vasireddy wrote:
> 
>>>> @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct objtool_file *file)
>>>>    		reloc = insn_reloc(file, insn);
>>>>    		if (!reloc) {
>>>>    			dest_off = arch_jump_destination(insn);
>>>> +
>>>> +			next_insn = next_insn_same_func(file, insn);
>>>> +			if (next_insn && dest_off == next_insn->offset)
>>>> +				continue;
>>>> +
>>> This won't work on x86, where an intra-function call is converted to a
>>> stack-modifying JUMP.  So this should probably be checked in an
>>> arch-specific function.
>>
>> Thanks for letting me know, I'll introduce arch_skip_call_warning() to
>> handle architecture specific cases in the next patch I send.
> 
> Can't you detect this pattern in decode and simpy not emit the call
> instruction?
> 

Yes we can, simply do:

diff --git a/tools/objtool/arch/powerpc/decode.c 
b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..4f9b1715caf1 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -55,7 +55,7 @@ int arch_decode_instruction(struct objtool_file *file, 
const struct section *sec

  	switch (opcode) {
  	case 18: /* b[l][a] */
-		if ((ins & 3) == 1) /* bl */
+		if ((ins & 3) == 1 && ins != 0x48000005) /* bl but not bl .+4*/
  			typ = INSN_CALL;

  		imm = ins & 0x3fffffc;


