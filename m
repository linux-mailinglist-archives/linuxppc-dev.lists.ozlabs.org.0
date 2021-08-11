Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CB73E9B22
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 01:10:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlQWz0pDHz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 09:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlQWT4WQfz30F3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 09:09:38 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeb94.dynamic.kabel-deutschland.de
 [95.90.235.148])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id DE19661E5FE33;
 Thu, 12 Aug 2021 01:09:30 +0200 (CEST)
Subject: Re: clang/ld.lld build fails with `can't create dynamic relocation
 R_PPC64_ADDR64 against local symbol in readonly segment`
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <b647b710-7ae0-3c7e-6996-92ac974b3b2a@molgen.mpg.de>
 <77a69755-5291-285c-45be-c1e42423fddc@molgen.mpg.de>
 <886ac4a5-ad30-b27f-0b80-ec233c571e81@csgroup.eu>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <a11ac72e-e46c-5867-1a2e-2bc538232e6f@molgen.mpg.de>
Date: Thu, 12 Aug 2021 01:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <886ac4a5-ad30-b27f-0b80-ec233c571e81@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Derek Parker <parkerderek86@gmail.com>, Dmitrii Okunev <xaionaro@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Christophe,


Am 11.08.21 um 16:10 schrieb Christophe Leroy:

> Le 10/08/2021 à 20:38, Paul Menzel a écrit :

>> Am 29.07.21 um 10:23 schrieb Paul Menzel:
>>
>>> I just wanted to make you aware that building Linux for ppc64le with 
>>> clang/lld.ld fails with [1]:
>>>
>>>      ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 
>>> against symbol: empty_zero_page in readonly segment; recompile object 
>>> files with -fPIC or pass '-Wl,-z,notext' to allow text relocations in 
>>> the output
>>>      >>> defined in arch/powerpc/kernel/head_64.o
>>>      >>> referenced by 
>>> arch/powerpc/kernel/head_64.o:(___ksymtab+empty_zero_page+0x0)
>>>
>>> The patch below from one of the comments [2] fixes it.
>>>
>>> --- i/arch/powerpc/Makefile
>>> +++ w/arch/powerpc/Makefile
>>> @@ -122,7 +122,7 @@ cflags-$(CONFIG_STACKPROTECTOR)     += 
>>> -mstack-protector-guard-reg=r2
>>>   endif
>>>
>>>   LDFLAGS_vmlinux-y := -Bstatic
>>> -LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
>>> +LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie -z notext
>>>   LDFLAGS_vmlinux        := $(LDFLAGS_vmlinux-y)
>>>   LDFLAGS_vmlinux += $(call ld-option,--orphan-handling=warn)
>>
>> Any comments, if this is the right fix? Current Linux master branch 
>> still fails to build with `LLVM=1` on Ubuntu 21.04 without this change.
> 
> Which kernel version are you building ?
> 
> Since 
> https://github.com/linuxppc/linux/commit/45b30fafe528601f1a4449c9d68d8ebe7bbc39ad 
> , empty_zero_page[] is in arch/powerpc/mm/mem.c not in 
> arch/powerpc/kernel/head_64.o
> 
> Do you still have the issue with kernel 5.14 ?

Yes, before sending the message, I reproduced it with

     $ git describe
     v5.14-rc5-2-g9a73fa375d58

containing the commit you mentioned.


Kind regards,

Paul
