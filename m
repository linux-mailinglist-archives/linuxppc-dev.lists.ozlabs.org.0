Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5292FB49D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 09:55:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKjD546LJzDr3X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 19:55:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKjBJ3yBwzDr1F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 19:53:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DKjB66gTVz9tyhW;
 Tue, 19 Jan 2021 09:53:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZS4zMvIw1KiY; Tue, 19 Jan 2021 09:53:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DKjB65jcHz9tyh3;
 Tue, 19 Jan 2021 09:53:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D22498B7AE;
 Tue, 19 Jan 2021 09:53:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1ZAV85L9P2Ej; Tue, 19 Jan 2021 09:53:51 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 568338B7B9;
 Tue, 19 Jan 2021 09:53:51 +0100 (CET)
Subject: Re: [PATCH v3 1/8] powerpc/uaccess: Add unsafe_copy_from_user
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <C8LLSM3UC598.L4E2VMGJOI06@geist>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5863d631-08a2-29ed-09b5-78d9009ca1df@csgroup.eu>
Date: Tue, 19 Jan 2021 08:29:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <C8LLSM3UC598.L4E2VMGJOI06@geist>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/01/2021 à 18:19, Christopher M. Riedl a écrit :
> On Mon Jan 11, 2021 at 7:22 AM CST, Christophe Leroy wrote:
>>
>>
>> Le 09/01/2021 à 04:25, Christopher M. Riedl a écrit :
>>> Implement raw_copy_from_user_allowed() which assumes that userspace read
>>> access is open. Use this new function to implement raw_copy_from_user().
>>> Finally, wrap the new function to follow the usual "unsafe_" convention
>>> of taking a label argument.
>>
>> I think there is no point implementing raw_copy_from_user_allowed(), see
>> https://github.com/linuxppc/linux/commit/4b842e4e25b1 and
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8c74fc9ce8131cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu/
>>
>> You should simply do:
>>
>> #define unsafe_copy_from_user(d, s, l, e) \
>> unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
>>
> 
> I gave this a try and the signal ops decreased by ~8K. Now, to be
> honest, I am not sure what an "acceptable" benchmark number here
> actually is - so maybe this is ok? Same loss with both radix and hash:

I don't think this is ok, but it probably means that you are using unsafe_copy_from_user() to copy 
small constant size data that should be copied with unsafe_get_user() instead.

> 
> 	|                                      | hash   | radix  |
> 	| ------------------------------------ | ------ | ------ |
> 	| linuxppc/next                        | 118693 | 133296 |
> 	| linuxppc/next w/o KUAP+KUEP          | 228911 | 228654 |
> 	| unsafe-signal64                      | 200480 | 234067 |
> 	| unsafe-signal64 (__copy_tofrom_user) | 192467 | 225119 |
> 
> To put this into perspective, prior to KUAP and uaccess flush, signal
> performance in this benchmark was ~290K on hash.
> 
>>
>> Christophe
>>
>>>
>>> The new raw_copy_from_user_allowed() calls non-inline __copy_tofrom_user()
>>> internally. This is still safe to call inside user access blocks formed
>>> with user_*_access_begin()/user_*_access_end() since asm functions are not
>>> instrumented for tracing.
>>>
>>> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
>>> ---
>>>    arch/powerpc/include/asm/uaccess.h | 28 +++++++++++++++++++---------
>>>    1 file changed, 19 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>>> index 501c9a79038c..698f3a6d6ae5 100644
>>> --- a/arch/powerpc/include/asm/uaccess.h
>>> +++ b/arch/powerpc/include/asm/uaccess.h
>>> @@ -403,38 +403,45 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
>>>    }
>>>    #endif /* __powerpc64__ */
>>>    
>>> -static inline unsigned long raw_copy_from_user(void *to,
>>> -		const void __user *from, unsigned long n)
>>> +static inline unsigned long
>>> +raw_copy_from_user_allowed(void *to, const void __user *from, unsigned long n)
>>>    {
>>> -	unsigned long ret;
>>>    	if (__builtin_constant_p(n) && (n <= 8)) {
>>> -		ret = 1;
>>> +		unsigned long ret = 1;
>>>    
>>>    		switch (n) {
>>>    		case 1:
>>>    			barrier_nospec();
>>> -			__get_user_size(*(u8 *)to, from, 1, ret);
>>> +			__get_user_size_allowed(*(u8 *)to, from, 1, ret);
>>>    			break;
>>>    		case 2:
>>>    			barrier_nospec();
>>> -			__get_user_size(*(u16 *)to, from, 2, ret);
>>> +			__get_user_size_allowed(*(u16 *)to, from, 2, ret);
>>>    			break;
>>>    		case 4:
>>>    			barrier_nospec();
>>> -			__get_user_size(*(u32 *)to, from, 4, ret);
>>> +			__get_user_size_allowed(*(u32 *)to, from, 4, ret);
>>>    			break;
>>>    		case 8:
>>>    			barrier_nospec();
>>> -			__get_user_size(*(u64 *)to, from, 8, ret);
>>> +			__get_user_size_allowed(*(u64 *)to, from, 8, ret);
>>>    			break;
>>>    		}
>>>    		if (ret == 0)
>>>    			return 0;
>>>    	}
>>>    
>>> +	return __copy_tofrom_user((__force void __user *)to, from, n);
>>> +}
>>> +
>>> +static inline unsigned long
>>> +raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>>> +{
>>> +	unsigned long ret;
>>> +
>>>    	barrier_nospec();
>>>    	allow_read_from_user(from, n);
>>> -	ret = __copy_tofrom_user((__force void __user *)to, from, n);
>>> +	ret = raw_copy_from_user_allowed(to, from, n);
>>>    	prevent_read_from_user(from, n);
>>>    	return ret;
>>>    }
>>> @@ -542,6 +549,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
>>>    #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
>>>    #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
>>>    
>>> +#define unsafe_copy_from_user(d, s, l, e) \
>>> +	unsafe_op_wrap(raw_copy_from_user_allowed(d, s, l), e)
>>> +
>>>    #define unsafe_copy_to_user(d, s, l, e) \
>>>    do {									\
>>>    	u8 __user *_dst = (u8 __user *)(d);				\
>>>
