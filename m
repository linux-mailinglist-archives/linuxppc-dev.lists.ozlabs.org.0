Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0F333716
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 09:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwPy06J69z3d3X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 19:14:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwPxg1YxBz3cJ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 19:14:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DwPxX24hjz9tyNS;
 Wed, 10 Mar 2021 09:14:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tNNusIgIeCpa; Wed, 10 Mar 2021 09:14:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DwPxX17kXz9tyNR;
 Wed, 10 Mar 2021 09:14:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 249A98B783;
 Wed, 10 Mar 2021 09:14:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aH2RPuDK2FLr; Wed, 10 Mar 2021 09:14:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CA0F8B77E;
 Wed, 10 Mar 2021 09:14:24 +0100 (CET)
Subject: Re: [PATCH v1 01/15] powerpc/uaccess: Remove __get_user_allowed() and
 unsafe_op_wrap()
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
 <e0538c71167bd90224a8727fea9ed5b75612e2d7.1614275314.git.christophe.leroy@csgroup.eu>
 <87im6ao7ld.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e57ae14b-806e-854d-d43b-e6278b89ae04@csgroup.eu>
Date: Wed, 10 Mar 2021 09:14:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87im6ao7ld.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/03/2021 à 23:02, Daniel Axtens a écrit :
> 
> 
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Those two macros have only one user which is unsafe_get_user().
>>
>> Put everything in one place and remove them.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index 78e2a3990eab..8cbf3e3874f1 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -53,9 +53,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
>>   #define __put_user(x, ptr) \
>>   	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>>   
>> -#define __get_user_allowed(x, ptr) \
>> -	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), false)
>> -
>>   #define __get_user_inatomic(x, ptr) \
>>   	__get_user_nosleep((x), (ptr), sizeof(*(ptr)))
>>   #define __put_user_inatomic(x, ptr) \
>> @@ -482,8 +479,11 @@ user_write_access_begin(const void __user *ptr, size_t len)
>>   #define user_write_access_begin	user_write_access_begin
>>   #define user_write_access_end		prevent_current_write_to_user
>>   
>> -#define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
>> -#define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
>> +#define unsafe_get_user(x, p, e) do {					\
>> +	if (unlikely(__get_user_nocheck((x), (p), sizeof(*(p)), false)))\
>> +		goto e;							\
>> +} while (0)
>> +
> 
> This seems correct to me.
> 
> Checkpatch does have one check that is relevant:
> 
> CHECK: Macro argument reuse 'p' - possible side-effects?
> #36: FILE: arch/powerpc/include/asm/uaccess.h:482:
> +#define unsafe_get_user(x, p, e) do {					\
> +	if (unlikely(__get_user_nocheck((x), (p), sizeof(*(p)), false)))\
> +		goto e;							\
> +} while (0)
> 
> Given that we are already creating a new block, should we do something
> like this (completely untested):
> 
> #define unsafe_get_user(x, p, e) do {					\
>          __typeof__(p) __p = (p);
> 	if (unlikely(__get_user_nocheck((x), (__p), sizeof(*(__p)), false)))\
> 		goto e;							\
> } while (0)
> 

As mentioned by Segher, this is not needed, sizeof(p) doesn't evaluate (p) so (p) is only evaluated 
once in the macro, so no risk of side-effects with that.

Christophe
