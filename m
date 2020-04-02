Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C619BD4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:07:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFzJ1zn3zDrJ1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=MkQiLMX9; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFr327p0zDqDT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 19:01:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tFqx4zWqz9tyQ2;
 Thu,  2 Apr 2020 10:01:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MkQiLMX9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2CaVvBPeukaV; Thu,  2 Apr 2020 10:01:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tFqx3jqYz9tyQ1;
 Thu,  2 Apr 2020 10:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585814461; bh=DBRr4a/YotdE3HAHpPGxsgA6Pc/14KHKGaSYgbQil3g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MkQiLMX9a4Y0UYIR5VMPjSKQa/H/XdtfRDVvU59elCFe/+G5t9ZWFGRkdanq3nGkp
 +WTGjvWrISFnKe7CCNatvGvesPO1bZLQXWPFP8I5/eLMwUfx2LBSi2Psl4bkh/eusJ
 1gQw+6sCfL8oyQChcpSNuqCFWzksNm7OyWq5z01E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 076758B76E;
 Thu,  2 Apr 2020 10:01:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sFQHXTLLR5mH; Thu,  2 Apr 2020 10:01:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 28AF68B75E;
 Thu,  2 Apr 2020 10:00:58 +0200 (CEST)
Subject: Re: [PATCH RESEND 2/4] uaccess: Selectively open read or write user
 access
To: Kees Cook <keescook@chromium.org>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <25040ad2d2a2cef45a2442b0e934141987e11b71.1585811416.git.christophe.leroy@c-s.fr>
 <202004020047.401CEBED2@keescook>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1f8ec312-80f4-03e5-8683-57f97528888c@c-s.fr>
Date: Thu, 2 Apr 2020 10:00:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <202004020047.401CEBED2@keescook>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, airlied@linux.ie,
 hpa@zytor.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/04/2020 à 09:51, Kees Cook a écrit :
> On Thu, Apr 02, 2020 at 07:34:17AM +0000, Christophe Leroy wrote:
>> [...]
>> diff --git a/kernel/compat.c b/kernel/compat.c
>> index 843dd17e6078..705ca7e418c6 100644
>> --- a/kernel/compat.c
>> +++ b/kernel/compat.c
>> @@ -199,7 +199,7 @@ long compat_get_bitmap(unsigned long *mask, const compat_ulong_t __user *umask,
>>   	bitmap_size = ALIGN(bitmap_size, BITS_PER_COMPAT_LONG);
>>   	nr_compat_longs = BITS_TO_COMPAT_LONGS(bitmap_size);
>>   
>> -	if (!user_access_begin(umask, bitmap_size / 8))
>> +	if (!user_write_access_begin(umask, bitmap_size / 8))
> 
> This looks mismatched: should be user_read_access_begin()?

Oops, looks like a copy/paste/modify where I modified the original 
instead of the copy.


> 
>>   		return -EFAULT;
>>   
>>   	while (nr_compat_longs > 1) {
>> @@ -211,11 +211,11 @@ long compat_get_bitmap(unsigned long *mask, const compat_ulong_t __user *umask,
>>   	}
>>   	if (nr_compat_longs)
>>   		unsafe_get_user(*mask, umask++, Efault);
>> -	user_access_end();
>> +	user_read_access_end();
>>   	return 0;
>>   
>>   Efault:
>> -	user_access_end();
>> +	user_read_access_end();
>>   	return -EFAULT;
>>   }
> 
> (These correctly end read access.)
> 
>>   
>> @@ -228,7 +228,7 @@ long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
>>   	bitmap_size = ALIGN(bitmap_size, BITS_PER_COMPAT_LONG);
>>   	nr_compat_longs = BITS_TO_COMPAT_LONGS(bitmap_size);
>>   
>> -	if (!user_access_begin(umask, bitmap_size / 8))
>> +	if (!user_read_access_begin(umask, bitmap_size / 8))
> 
> And ..._write_... here?
> 
>>   		return -EFAULT;
>>   
>>   	while (nr_compat_longs > 1) {
>> @@ -239,10 +239,10 @@ long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
>>   	}
>>   	if (nr_compat_longs)
>>   		unsafe_put_user((compat_ulong_t)*mask, umask++, Efault);
>> -	user_access_end();
>> +	user_write_access_end();
>>   	return 0;
>>   Efault:
>> -	user_access_end();
>> +	user_write_access_end();
>>   	return -EFAULT;
>>   }
> 
> (These correctly end write access.)
> 
> 
> All the others look correct. With the above fixed:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

Thanks
Christophe
