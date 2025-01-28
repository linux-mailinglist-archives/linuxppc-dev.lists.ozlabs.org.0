Return-Path: <linuxppc-dev+bounces-5634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23AA20D9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8r3471zz305P;
	Wed, 29 Jan 2025 02:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738079411;
	cv=none; b=LTDRbdUJqZJwIiitXrF94+5lW7kMPXpd+6nrr9BT1jLd0uXuQD/Pw0gNQKrYBKiuv1x5AaCTsVnUhCpiizmhsd6Ajt+XsNOFzadJlgBqY9UmDsN6w1wUUQjN+G2Gs8VbtYcnqK5mm2w9LyxHHSNWHtnIqTHCg6UQztB75tM/JP/8HvlZFGe4lnr5JQrcOJZIfAFc5Xb1pi4S4uoWf3h4LKNKJv47c2B+QCrPRLBwSNFwXHXpUQIuV9uvZqHmiD5SIShO7aJkNsiHpO4nt2Dbd6sITdIOaARX05/DsfcprarrSre0/b+QLLU9RuMO3biSNreaIzbJ/fWgFB2SkVWQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738079411; c=relaxed/relaxed;
	bh=LhhA66jpS7dJPWx8LHdhKcQMyzgSb2ZbKzgpTAwGNwY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yoi31dK/0zyNo/O72vyVefC3CDJWhpSDpNcMGxEw5zYmnJRbDhvlFfhtilVRLmsZBTnZU3z2259MeRW9MmA/aTWCXmdHXP7kfmPilVQlny15OeVDmXMGS15gNw8qsiVoNSaNOjfSu/NACOwQVo/Kvs8Aw2t3F+kHucHdBwfQ3bsKBipxcyBrCDddj5353Zol8s1PybLbWueyPAnwl1S5qwD/bzFJuruJEgS/7eK6Kc+NKJdJJmdyzA5t7NH8Jq/TgtctN9vOFSwUq2I4TPIRTQUMRc8sMsGajiq23HyDBuiLxLc8m+iWE88s+yJpOK2IYiVW41WXRPxCJ0Nu0N7ICg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8r25hkZz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:50:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj8Tw0lR4z9sRr;
	Tue, 28 Jan 2025 16:34:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzicH7zXDy_J; Tue, 28 Jan 2025 16:34:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj8Tv74pxz9sPd;
	Tue, 28 Jan 2025 16:34:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E334E8B76C;
	Tue, 28 Jan 2025 16:34:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id h_r1tQnJyA_6; Tue, 28 Jan 2025 16:34:27 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F88D8B763;
	Tue, 28 Jan 2025 16:34:27 +0100 (CET)
Message-ID: <b8496571-6c44-40ff-b03b-799fb1764447@csgroup.eu>
Date: Tue, 28 Jan 2025 16:34:27 +0100
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
Subject: Re: [PATCH] powerpc: Remove eieio in _memcpy_fromio
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Julian Vetter <julian@outer-limits.org>, Arnd Bergmann <arnd@arndb.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250128135711.1625747-1-julian@outer-limits.org>
 <81ee3098-1e43-4b88-975a-d223bc2338e8@csgroup.eu>
 <b335d035-07a4-457d-99ea-8b7597782fd9@outer-limits.org>
 <e785c98f-4bf9-48ab-a102-dc531623b378@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <e785c98f-4bf9-48ab-a102-dc531623b378@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 28/01/2025 à 16:24, Christophe Leroy a écrit :
> 
> 
> Le 28/01/2025 à 16:07, Julian Vetter a écrit :
>> [Vous ne recevez pas souvent de courriers de julian@outer-limits.org. 
>> Découvrez pourquoi ceci est important à https://aka.ms/ 
>> LearnAboutSenderIdentification ]
>>
>> On 1/28/25 15:16, Christophe Leroy wrote:
>>>
>>>
>>> Le 28/01/2025 à 14:57, Julian Vetter a écrit :
>>>> Remove the eieio() calls in _memcpy_fromio, to bring its implementation
>>>> closer to the one from lib/iomem_copy.c. These eieio() calls don't seem
>>>> to be necessary, because the _memcpy_toio completely omits them. Also
>>>> the legacy code from ppc was not doing them.
>>>
>>> What do you mean exactly by "legacy code" ?
>>>
>>> As far as I can see they were already there before commit 68a64357d15a
>>> ("[POWERPC] Merge 32 and 64 bits asm-powerpc/io.h"):
>>>
>>
>> With 'ppc' I was refering to 'include/asm-ppc/io.h'. But you're right,
>> when going back a bit, in the 'include/asm-powerpc/io.h' there are two
>> cases, one (eeh_memcpy_fromio) which does the the 'eieio', and a second,
>> i.e., 'iSeries_memcpy_fromio' which does a byte-wise copy. But in the
>> ppc code ('include/asm-ppc/io.h') there is a simple memcpy. I was
>> referring to this one. But my description is not very clear. Sorry for 
>> that.
> 
> But then is your change still valid ? Isn't there some corner case that 
> still need it ? Is it a valid argument that because memcpy_toio() 
> doesn't need it memcpy_fromio() doesn't need it either ?

I see that _insb(), _insw_ns() and _insl_ns() also have eieio() while 
_outsb(), _outsw_ns() and _outsl_ns() don't. Why not change those as 
well if you think eieio() is not needed ?




