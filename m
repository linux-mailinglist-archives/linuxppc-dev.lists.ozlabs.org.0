Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C362B1ADCE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 14:07:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Zbr5PWczDrC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 22:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493ZVH3whTzDr8t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 22:03:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=h61SD9Qq; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 493ZVH17Qsz8swC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 22:03:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 493ZVH0841z9sSY; Fri, 17 Apr 2020 22:03:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=h61SD9Qq; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 493ZVG1Yfnz9sSM
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Apr 2020 22:03:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 493ZVB0nHSz9txyH;
 Fri, 17 Apr 2020 14:02:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=h61SD9Qq; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id o_j4WXxCi36U; Fri, 17 Apr 2020 14:02:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 493ZV95W30z9txyG;
 Fri, 17 Apr 2020 14:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587124977; bh=0XQkBdtMcQp12MDcWeSkFw2mHm9P3tCcOAX6KhN8Wbo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=h61SD9QqGDBZ9X/sHt/OoTKwrOUKrzTxQltD/gAIWh/aUsWZPjJ90ayvX/7UHIk+Y
 O+Uz2AtzKIHbTyjG/rrvdjUOruE6I8Nwl0Wi4YQrgj4Lvxyj3qGxH1nAZe+D00bPT5
 fnZ05er5eNMMdsavHT0p/J5TwNAz/BNblw9Iknt4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 329C28BB4C;
 Fri, 17 Apr 2020 14:02:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0x0a_0C905Sf; Fri, 17 Apr 2020 14:02:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01DF58B75E;
 Fri, 17 Apr 2020 14:02:57 +0200 (CEST)
Subject: Re: [PATCH v6 09/10] powerpc/64s: Implement KUAP for Radix MMU
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Russell Currey <ruscur@russell.cc>
References: <20190418065125.2687-1-mpe@ellerman.id.au>
 <20190418065125.2687-9-mpe@ellerman.id.au>
 <41c548be-e5f1-c8cb-4cdc-27bf360d3f70@c-s.fr>
 <1587119526.51khzi2lop.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <69987eaa-a32d-4c83-d798-ae6e54ffd0a6@c-s.fr>
Date: Fri, 17 Apr 2020 14:02:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587119526.51khzi2lop.astroid@bobo.none>
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



Le 17/04/2020 à 12:39, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of April 17, 2020 8:10 pm:
>>
>>
>> Le 18/04/2019 à 08:51, Michael Ellerman a écrit :
>>> Kernel Userspace Access Prevention utilises a feature of the Radix MMU
>>> which disallows read and write access to userspace addresses. By
>>> utilising this, the kernel is prevented from accessing user data from
>>> outside of trusted paths that perform proper safety checks, such as
>>> copy_{to/from}_user() and friends.
>>>
>>> Userspace access is disabled from early boot and is only enabled when
>>> performing an operation like copy_{to/from}_user(). The register that
>>> controls this (AMR) does not prevent userspace from accessing itself,
>>> so there is no need to save and restore when entering and exiting
>>> userspace.
>>>
>>> When entering the kernel from the kernel we save AMR and if it is not
>>> blocking user access (because eg. we faulted doing a user access) we
>>> reblock user access for the duration of the exception (ie. the page
>>> fault) and then restore the AMR when returning back to the kernel.
>>>
>>> This feature can be tested by using the lkdtm driver (CONFIG_LKDTM=y)
>>> and performing the following:
>>>
>>>     # (echo ACCESS_USERSPACE) > [debugfs]/provoke-crash/DIRECT
>>>
>>> If enabled, this should send SIGSEGV to the thread.
>>>
>>> We also add paranoid checking of AMR in switch and syscall return
>>> under CONFIG_PPC_KUAP_DEBUG.
>>>
>>> Co-authored-by: Michael Ellerman <mpe@ellerman.id.au>
>>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>
>> [...]
>>
>>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
>>> index 15c67d2c0534..7cc25389c6bd 100644
>>> --- a/arch/powerpc/kernel/entry_64.S
>>> +++ b/arch/powerpc/kernel/entry_64.S
>>
>> [...]
>>
>>> @@ -594,6 +606,8 @@ _GLOBAL(_switch)
>>>    	std	r23,_CCR(r1)
>>>    	std	r1,KSP(r3)	/* Set old stack pointer */
>>>    
>>> +	kuap_check_amr r9, r10
>>> +
>>>    	FLUSH_COUNT_CACHE
>>>    
>>>    	/*
>>
>> I'm having a problem with this check. As you know I implemented the
>> exact same check in _switch() in entry_32.S. After adding some printk
>> inside an user_access_begin()/user_access_end() section, I started to
>> get valid user accesses blocked by KUAP. Then I activated
>> CONFIG_PPC_KUAP_DEBUG which led me to WARNINGs on this check.
>>
>> This is due to schedule() being called by printk() inside the section
>> where user access is unlocked. How is this supposed to work ? When
> 
> Unlocked user access sections are supposed to be very constrained,
> I think x86's objtool has a checker to verify nothing much gets
> called. Printk shouldn't be.
> 
> I was hitting the same assertion and it was because the uaccess
> macros were pulling lots of things into the user access region.
> 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200407041245.600651-1-npiggin@gmail.com/
> 
> If that doesn't solve your problem... then now is printk being
> called with user access enabled?

Yes indeed, the printk was called with user access enabled, as I wanted 
to print all calls to unsafe_copy_to_user()

Thanks
Christophe
