Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376A3777DE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 19:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdWlK2qr6z309C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:44:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdWky0tCXz2yXg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 03:43:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FdWkt01FYz9scP;
 Sun,  9 May 2021 19:43:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrFucX_Bx5vz; Sun,  9 May 2021 19:43:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FdWks5pvHz9sW0;
 Sun,  9 May 2021 19:43:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A22648B776;
 Sun,  9 May 2021 19:43:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 59svqTMl3dRk; Sun,  9 May 2021 19:43:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 112F28B765;
 Sun,  9 May 2021 19:43:49 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
 <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
 <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
 <806945b0-d4e9-3064-8447-e8265642c048@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fa29dfac-012d-26c3-51b6-2c67af944ecc@csgroup.eu>
Date: Sun, 9 May 2021 19:43:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <806945b0-d4e9-3064-8447-e8265642c048@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/05/2021 à 14:27, Christian Zigotzky a écrit :
> On 08 May 2021 at 06:39pm, Christian Zigotzky wrote:
>> On 06 May 2021 at 03:58 pm, Christian Zigotzky wrote:
>>> I have started bisecting again.
>>>
>>> Link: https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106 
>>> <https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106>
>>>
>>>
>>>> On 6. May 2021, at 10:09, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>>
>>>> - Can you check that 887f3ceb51cd with cherry-picked 525642624783 has Xorg working ?
>> git checkout 887f3ceb51cd
>> git cherry-pick 525642624783
>>
>> Result: Xorg works.
>>>> - Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to identify first bad commit 
>>>> that stops after loading the dtb and uImage ?
>>>> - Once that first bad commit is identified, can you check whether the preceeding commit with 
>>>> cherry-picked 525642624783 has Xorg working or not ?
>>>>
>>>> Thanks
>>>> Christophe
>> git bisect start
>> git bisect good 887f3ceb51cd
>> git bisect bad 56bec2f9d4d0
>> git bisect good -- Xorg restarts again and again but we are looking for the first bad commit that 
>> stops the boot after loading the dtb and uImage.
>> git bisect good -- Xorg restarts again and again.
>> git bisect good -- Xorg restarts again and again.
>> git bisect good -- Xorg restarts again and again.
>>
>> Result:
>>
>> 56bec2f9d4d05675cada96772a8a93010f4d82bf is the first bad commit
>> commit 56bec2f9d4d05675cada96772a8a93010f4d82bf
>> Author: Michael Ellerman <mpe@ellerman.id.au>
>> Date:   Wed Mar 31 11:38:40 2021 +1100
>>
>>     powerpc/mm/64s: Add _PAGE_KERNEL_ROX
>>
>>     In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
>>     removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
>>     specific PAGE and PMD flags and definitions") and added definitions
>>     for each MMU family.
>>
>>     However we missed adding a definition for 64s, which was not really a
>>     bug because it's currently not used.
>>
>>     But we'd like to use PAGE_KERNEL_ROX in a future patch so add a
>>     definition now.
>>
>>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>     Link: https://lore.kernel.org/r/20210331003845.216246-1-mpe@ellerman.id.au
>>
>> :040000 040000 ff8171830c08e4f99852947a5c3b62e784220a26 85aff144e5219bce4eb6adb2ac32c6459cac22d0 
>> M    arch
>>
>> ---
>>
>> git cherry-pick 525642624783
>>
>> Output:
>>
>> powerpc/signal32: Fix erroneous SIGSEGV on RT signal return
>>  Author: Christophe Leroy <christophe.leroy@csgroup.eu>
>>  Date: Fri Apr 23 13:52:10 2021 +0000
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> ---
>>
>> Xorg works after compiling with the cherry-pick of 525642624783.
> Hi All,
> 
> I compiled and tested the latest git kernel with the new PowerPC updates 5.13-2 today. Unfortunately 
> the Xorg issue still exists.
> If I revert the PowerPC updates 5.13-1 and 5.13-2 then Xorg works without any problems.
> 
> Please check the BookE changes in the PowerPC updates 5.13-1 because my Book3S machines aren't 
> affected by this issue.
> 

On my side, book3e (corenet64_smp_defconfig) built with GCC 10.1 works well with QEMU 2.11.2

A kernel built with the configuration you provided doesn't boot on QEMU, no output at all, even with 
kernel v5.12.

What versions of GCC and QEMU are you using ?

Thanks
Christophe
