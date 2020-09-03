Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D84625C788
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 18:55:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj6Q41Tv5zDrBy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 02:55:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj5MQ5JFWzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 02:08:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bj5MH5XfvzB09ZM;
 Thu,  3 Sep 2020 18:08:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AhUkCQsrRXgc; Thu,  3 Sep 2020 18:08:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bj5MH4CVtzB09ZK;
 Thu,  3 Sep 2020 18:08:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 73D218B806;
 Thu,  3 Sep 2020 18:08:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5YzyNRM3vKXH; Thu,  3 Sep 2020 18:08:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB968B803;
 Thu,  3 Sep 2020 18:08:20 +0200 (CEST)
Subject: Re: [PATCH 14/14] powerpc: remove address space overrides using
 set_fs()
To: Christoph Hellwig <hch@lst.de>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-15-hch@lst.de>
 <e7d2d231-5658-a4d3-0495-2af62f34aa34@csgroup.eu>
 <20200903154909.GA23023@lst.de> <20200903155644.GA23521@lst.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7b895389-3da8-f634-4a13-82e533398ec5@csgroup.eu>
Date: Thu, 3 Sep 2020 18:03:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903155644.GA23521@lst.de>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/09/2020 à 17:56, Christoph Hellwig a écrit :
> On Thu, Sep 03, 2020 at 05:49:09PM +0200, Christoph Hellwig wrote:
>> On Thu, Sep 03, 2020 at 05:43:25PM +0200, Christophe Leroy wrote:
>>>
>>>
>>> Le 03/09/2020 à 16:22, Christoph Hellwig a écrit :
>>>> Stop providing the possibility to override the address space using
>>>> set_fs() now that there is no need for that any more.
>>>>
>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>> ---
>>>
>>>
>>>>    -static inline int __access_ok(unsigned long addr, unsigned long size,
>>>> -			mm_segment_t seg)
>>>> +static inline bool __access_ok(unsigned long addr, unsigned long size)
>>>>    {
>>>> -	if (addr > seg.seg)
>>>> -		return 0;
>>>> -	return (size == 0 || size - 1 <= seg.seg - addr);
>>>> +	if (addr >= TASK_SIZE_MAX)
>>>> +		return false;
>>>> +	return size == 0 || size <= TASK_SIZE_MAX - addr;
>>>>    }
>>>
>>> You don't need to test size == 0 anymore. It used to be necessary because
>>> of the 'size - 1', as size is unsigned.
>>>
>>> Now you can directly do
>>>
>>> 	return size <= TASK_SIZE_MAX - addr;
>>>
>>> If size is 0, this will always be true (because you already know that addr
>>> is not >= TASK_SIZE_MAX
>>
>> True.  What do you think of Linus' comment about always using the
>> ppc32 version on ppc64 as well with this?

I have nothing against it. That's only adding a substract, all args are 
already in registers so that will be in the noise for a modern CPU.

> 
> i.e. something like this folded in:
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 5363f7fc6dd06c..be070254e50943 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -11,26 +11,14 @@
>   #ifdef __powerpc64__
>   /* We use TASK_SIZE_USER64 as TASK_SIZE is not constant */
>   #define TASK_SIZE_MAX		TASK_SIZE_USER64
> -
> -/*
> - * This check is sufficient because there is a large enough gap between user
> - * addresses and the kernel addresses.
> - */
> -static inline bool __access_ok(unsigned long addr, unsigned long size)
> -{
> -	return addr < TASK_SIZE_MAX && size < TASK_SIZE_MAX;
> -}
> -
>   #else
>   #define TASK_SIZE_MAX		TASK_SIZE
> +#endif
>   
>   static inline bool __access_ok(unsigned long addr, unsigned long size)
>   {
> -	if (addr >= TASK_SIZE_MAX)
> -		return false;
> -	return size == 0 || size <= TASK_SIZE_MAX - addr;
> +	return addr < TASK_SIZE_MAX && size <= TASK_SIZE_MAX - addr;
>   }
> -#endif /* __powerpc64__ */
>   
>   #define access_ok(addr, size)		\
>   	(__chk_user_ptr(addr),		\
> 


Christophe
