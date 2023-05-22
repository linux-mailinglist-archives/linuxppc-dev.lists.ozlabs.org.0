Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE270BA52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 12:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPvMJ3szyz3fGd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 20:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPvLq3zZhz3bkk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 20:48:33 +1000 (AEST)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 7904B1BF204;
	Mon, 22 May 2023 10:48:20 +0000 (UTC)
Message-ID: <3022ab59-02f8-6f95-c7a1-b4c271729120@ghiti.fr>
Date: Mon, 22 May 2023 12:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, schwab@linux-m68k.org
References: <mhng-d3720bcf-5eda-46da-b640-0606ef3a60e2@palmer-ri-x1c9a>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-d3720bcf-5eda-46da-b640-0606ef3a60e2@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 19/05/2023 23:55, Palmer Dabbelt wrote:
> On Fri, 19 May 2023 14:48:59 PDT (-0700), schwab@linux-m68k.org wrote:
>> On Mai 19 2023, Alexandre Ghiti wrote:
>>
>>> I have tested the following patch successfully, can you give it a try
>>> while I make sure this is the only place I forgot to add the -fno-pie
>>> flag?
>>>
>>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>>> index fbdccc21418a..153864e4f399 100644
>>> --- a/arch/riscv/kernel/Makefile
>>> +++ b/arch/riscv/kernel/Makefile
>>> @@ -23,6 +23,10 @@ ifdef CONFIG_FTRACE
>>>  CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
>>>  CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
>>>  endif
>>> +ifdef CONFIG_RELOCATABLE
>>> +CFLAGS_alternative.o += -fno-pie
>>> +CFLAGS_cpufeature.o += -fno-pie
>>> +endif
>>>  ifdef CONFIG_KASAN
>>>  KASAN_SANITIZE_alternative.o := n
>>>  KASAN_SANITIZE_cpufeature.o := n
>>
>> I can confirm that this fixes the crash.
>
> Thanks.  Alex: can you send a patch?


I don't think this patch alone will work, all the code in early 
alternatives must be compiled with -fno-pie, but I'm a bit scared that's 
a "big" constraint. For now, I see 2 solutions:

- Document somewhere the fact that anything called from early 
alternatives must be compiled with -fno-pie
- Or relocate once with physical address, call early alternatives, and 
then do the final virtual relocation

Both options can be cumbersome in their own way, if anyone has an 
opinion, I'd be happy to discuss that :)


