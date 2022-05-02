Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72452517347
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 17:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsSHv2ZHvz3bYw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 01:51:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PVghwS8Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=PVghwS8Z; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsSHD1wrhz3bWf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 01:50:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=SVJRdTF0zsXnRC8YzaAIhtLCF3RAFm8uUAKjndXqYGs=; b=PVghwS8Z4fAreqaIoFChXIT2Av
 4EKpl2pCzJGdKQfnJTiYb5Fi6mypTZohu9EUpkp/XZmEct63m2spRu0/lVPvw+xDAMDh3kPvSbEiW
 F0Sg1jpKhhmwhfdCeMsbDE1uJ+pDdFo+dm2yyCMj4AxU1ojFw3I0or4kuqTeDhhjMIG9YdoTspoQo
 fCr8Uk4UCHv6QvKUuDrdYikzkZfsUYolJtQJLZwEk5nKAZaEcG+PWZ6y0LUgr6/8vtckOjvxmgr9A
 nij/h+USS9giTG7KxZni0szAld4XFWQ0np7PzhQSUWW0iDwjsvIoIQZcKEyvPD1NdAMPTEeCce5BR
 HyZf+r2g==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYJm-00Evht-Sv; Mon, 02 May 2022 15:50:35 +0000
Message-ID: <a3cb014d-96e0-c681-7347-a5c1d185d9fc@infradead.org>
Date: Mon, 2 May 2022 08:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] POWERPC: idle: fix return value of __setup handler
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20220313065848.2150-1-rdunlap@infradead.org>
 <87r15c8439.fsf@mpe.ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87r15c8439.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Paul Mackerras <paulus@samba.org>, patches@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/2/22 06:19, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>> __setup() handlers should return 1 to obsolete_checksetup() in
>> init/main.c to indicate that the boot option has been handled.
>> A return of 0 causes the boot option/value to be listed as an Unknown
>> kernel parameter and added to init's (limited) argument or environment
>> strings. Also, error return codes don't mean anything to
>> obsolete_checksetup() -- only non-zero (usually 1) or zero.
>> So return 1 from powersave_off().
>>
>> Fixes: 302eca184fb8 ("[POWERPC] cell: use ppc_md->power_save instead of cbe_idle_loop")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> From: Igor Zhbanov <i.zhbanov@omprussia.ru>
> 
> What happened here? Is the patch actually from Igor? If so he should be
> the author, and it should include his SoB shouldn't it?

I don't know what happened. I did the patches.
I'll resend them.

Thanks.

> Same comment for "[PATCH] powerpc/4xx: cpm: fix return value of __setup handler".
> 
> cheers
> 
>> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> ---
>>  arch/powerpc/kernel/idle.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20220310.orig/arch/powerpc/kernel/idle.c
>> +++ linux-next-20220310/arch/powerpc/kernel/idle.c
>> @@ -37,7 +37,7 @@ static int __init powersave_off(char *ar
>>  {
>>  	ppc_md.power_save = NULL;
>>  	cpuidle_disable = IDLE_POWERSAVE_OFF;
>> -	return 0;
>> +	return 1;
>>  }
>>  __setup("powersave=off", powersave_off);
>>  

-- 
~Randy
