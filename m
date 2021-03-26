Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369634A5D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 11:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Jg02NZRz3c1X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 21:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Jff3bFrz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 21:50:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6JfV2B62z9tyyw;
 Fri, 26 Mar 2021 11:50:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QCfjzG7DwU8E; Fri, 26 Mar 2021 11:50:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6JfV1Kscz9tyyv;
 Fri, 26 Mar 2021 11:50:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 472948B8B9;
 Fri, 26 Mar 2021 11:50:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xih2kutSjmfd; Fri, 26 Mar 2021 11:50:43 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9040E8B834;
 Fri, 26 Mar 2021 11:50:42 +0100 (CET)
Subject: Re: VDSO ELF header
To: Michael Ellerman <mpe@ellerman.id.au>,
 Laurent Dufour <ldufour@linux.ibm.com>, Dmitry Safonov <0x7f454c46@gmail.com>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
 <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
 <87blb6gpkj.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
Date: Fri, 26 Mar 2021 11:50:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87blb6gpkj.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/03/2021 à 11:46, Michael Ellerman a écrit :
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> Le 25/03/2021 à 17:56, Laurent Dufour a écrit :
>>> Le 25/03/2021 à 17:46, Christophe Leroy a écrit :
>>>> Le 25/03/2021 à 17:11, Laurent Dufour a écrit :
>>>>> Since v5.11 and the changes you made to the VDSO code, it no more exposing
>>>>> the ELF header at the beginning of the VDSO mapping in user space.
>>>>>
>>>>> This is confusing CRIU which is checking for this ELF header cookie
>>>>> (https://github.com/checkpoint-restore/criu/issues/1417).
>>>>
>>>> How does it do on other architectures ?
>>>
>>> Good question, I'll double check the CRIU code.
>>
>> On x86, there are 2 VDSO entries:
>> 7ffff7fcb000-7ffff7fce000 r--p 00000000 00:00 0                          [vvar]
>> 7ffff7fce000-7ffff7fcf000 r-xp 00000000 00:00 0                          [vdso]
>>
>> And the VDSO is starting with the ELF header.
>>
>>>>> I'm not an expert in loading and ELF part and reading the change you made, I
>>>>> can't identify how this could work now as I'm expecting the loader to need
>>>>> that ELF header to do the relocation.
>>>>
>>>> I think the loader is able to find it at the expected place.
>>>
>>> Actually, it seems the loader relies on the AUX vector AT_SYSINFO_EHDR. I guess
>>> CRIU should do the same.
>>>
>>>>>
>>>>>   From my investigation it seems that the first bytes of the VDSO area are now
>>>>> the vdso_arch_data.
>>>>>
>>>>> Is the ELF header put somewhere else?
>>>>> How could the loader process the VDSO without that ELF header?
>>>>>
>>>>
>>>> Like most other architectures, we now have the data section as first page and
>>>> the text section follows. So you will likely find the elf header on the second
>>>> page.
>>
>> I'm wondering if the data section you're refering to is the vvar section I can
>> see on x86.
> 
> Many of the other architectures have separate vm_special_mapping's for
> the data page and the vdso binary, where the former is called "vvar".
> 
> eg, s390:
> 
> static struct vm_special_mapping vvar_mapping = {
> 	.name = "[vvar]",
> 	.fault = vvar_fault,
> };
> 
> static struct vm_special_mapping vdso_mapping = {
> 	.name = "[vdso]",
> 	.mremap = vdso_mremap,
> };
> 
> 
> I guess we probably should be doing that too.
> 

Dmitry proposed the same, see 
https://github.com/0x7f454c46/linux/commit/783c7a2532d2219edbcf555cc540eab05f698d2a

Discussion at https://github.com/checkpoint-restore/criu/issues/1417

Christophe
