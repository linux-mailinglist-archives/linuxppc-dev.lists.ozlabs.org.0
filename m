Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C61C6524
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 02:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GyN50ktlzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 10:37:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gkj32FBgzDqBr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 01:50:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49GkSk662Lz9v6ZJ;
 Tue,  5 May 2020 17:40:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lB47a1rBtIIP; Tue,  5 May 2020 17:40:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49GkSk5DfVz9v6ZG;
 Tue,  5 May 2020 17:40:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69F418B7B3;
 Tue,  5 May 2020 17:40:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZCQ8FQrSrO81; Tue,  5 May 2020 17:40:24 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E76B98B7A8;
 Tue,  5 May 2020 17:40:22 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
 segher@kernel.crashing.org
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
 <87sggecv81.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1c6379b2-7e0a-91fe-34f0-51f5adca7929@csgroup.eu>
Date: Tue, 5 May 2020 17:40:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87sggecv81.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 May 2020 10:35:07 +1000
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

Hi,

Le 05/05/2020 à 16:27, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> unsafe_put_user() is designed to take benefit of 'asm goto'.
>>
>> Instead of using the standard __put_user() approach and branch
>> based on the returned error, use 'asm goto' and make the
>> exception code branch directly to the error label. There is
>> no code anymore in the fixup section.
>>
>> This change significantly simplifies functions using
>> unsafe_put_user()
>>
> ...
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 61 +++++++++++++++++++++++++-----
>>   1 file changed, 52 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index 9cc9c106ae2a..9365b59495a2 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -196,6 +193,52 @@ do {								\
>>   })
>>   
>>   
>> +#define __put_user_asm_goto(x, addr, label, op)			\
>> +	asm volatile goto(					\
>> +		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
>> +		EX_TABLE(1b, %l2)				\
>> +		:						\
>> +		: "r" (x), "m<>" (*addr)				\
> 
> The "m<>" here is breaking GCC 4.6.3, which we allegedly still support.
> 
> Plain "m" works, how much does the "<>" affect code gen in practice?
> 
> A quick diff here shows no difference from removing "<>".

It was recommended by Segher, there has been some discussion about it on 
v1 of this patch, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr/

As far as I understood that's mandatory on recent gcc to get the 
pre-update form of the instruction. With older versions "m" was doing 
the same, but not anymore. Should we ifdef the "m<>" or "m" based on GCC 
version ?

Christophe
