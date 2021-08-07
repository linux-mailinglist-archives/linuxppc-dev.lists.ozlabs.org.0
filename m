Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF73E3670
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 19:08:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ghphg4yhSz3cSJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Aug 2021 03:08:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhphJ4YW1z301m
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Aug 2021 03:08:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ghph91TyCz9sTq;
 Sat,  7 Aug 2021 19:08:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vI9fNzWWS76V; Sat,  7 Aug 2021 19:08:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ghph901gPz9sTp;
 Sat,  7 Aug 2021 19:08:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF9348B76F;
 Sat,  7 Aug 2021 19:08:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r1j2loIVtTYB; Sat,  7 Aug 2021 19:08:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5192A8B766;
 Sat,  7 Aug 2021 19:08:08 +0200 (CEST)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <b6fe0c8e-8af5-e0e9-629b-fce61750ec2e@yahoo.com>
 <4ac28304-4519-fb8a-a868-e8c79cb5f9e4@yahoo.com>
 <7532219a-4fd0-416-6365-304033fa6abd@linux-m68k.org>
 <9659419d-da9e-5aa6-ffbb-758748e2d6e9@linux-m68k.org>
 <2eb2b452-51d5-c495-3ffe-896c62a1633f@yahoo.com>
 <da9c16b4-70bc-6fe0-ad5c-8b226ca08b23@yahoo.com>
 <cc5a203f-9df5-a0b-a4d7-bcaddde777d5@linux-m68k.org>
 <6ea50cd7-84d3-5180-0430-1211aaf0e308@yahoo.com>
 <2619d78-e8f-334a-20c0-2a60c936a293@linux-m68k.org>
 <ca0ded24-9fa0-fae4-89cf-20fc1959f69d@csgroup.eu>
 <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
 <ee724da4-4a5b-65c3-9c1c-d78954fdc7b4@csgroup.eu>
 <73921a8e-6d76-7ae9-1ba2-811966df5179@linux-m68k.org>
 <06ddf5ab-b0c9-1c64-92ea-a9cfbfb9f3b0@yahoo.com>
 <f23ddb5b-90cb-2ba9-f043-66d475311b7@linux-m68k.org>
 <d8e4e491-acb3-4234-813f-e88d52c32bc6@yahoo.com>
 <8373276b-ba7a-440b-b353-fdb1be558628@csgroup.eu>
 <47e3180a-be1a-aec1-b5d9-b7d25547b1dc@yahoo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bb1a2a6e-5ffc-1319-4c12-371bbea344ed@csgroup.eu>
Date: Sat, 7 Aug 2021 19:08:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <47e3180a-be1a-aec1-b5d9-b7d25547b1dc@yahoo.com>
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2021 à 18:26, Stan Johnson a écrit :
> On 8/7/21 8:35 AM, Christophe Leroy wrote:
>>
>>
>> Le 07/08/2021 à 15:09, Stan Johnson a écrit :
>>> On 8/6/21 10:08 PM, Finn Thain wrote:
>>>>
>>>> On Fri, 6 Aug 2021, Stan Johnson wrote:
>>>>
>>>>> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
>>>>> CONFIG_PPC_KUAP=y
>>>>> CONFIG_PPC_KUAP_DEBUG=y
>>>>> CONFIG_VMAP_STACK=y
>>>>> $ strings vmlinux | fgrep "Linux version"
>>>>> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
>>>>> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>>>>
>>>>> 1) PB 3400c
>>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>>>> Boots, no errors logging in at (text) fb console. Logging in via ssh
>>>>> and
>>>>> running "ls -Rail /usr/include" generated errors (and a hung ssh
>>>>> session). Once errors started, they repeated for almost every command.
>>>>> See pb3400c-63e3756d1bdf-1.txt.
>>>>>
>>>>> 2) Wallstreet
>>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>>>> X login failed, there were errors ("Oops: Kernel access of bad area",
>>>>> "Oops: Exception in kernel mode"). Logging in via SSH, there were no
>>>>> additional errors after running "ls -Rail /usr/include" -- the errors
>>>>> did not escalate as they did on the PB 3400.
>>>>> See Wallstreet-63e3756d1bdf-1.txt.
>>>>>
>>>> ...
>>>>> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
>>>>> CONFIG_PPC_KUAP=y
>>>>> CONFIG_PPC_KUAP_DEBUG=y
>>>>> # CONFIG_VMAP_STACK is not set
>>>>> $ strings vmlinux | fgrep "Linux version"
>>>>> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
>>>>> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>>>>
>>>>> 3) PB 3400c
>>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>>>> Filesystem was corrupt from the previous test (probably from all the
>>>>> errors during shutdown). After fixing the filesystem:
>>>>> Boots, no errors logging in at (text) fb console. Logging in via ssh
>>>>> and
>>>>> running "ls -Rail /usr/include" generated a few errors. There didn't
>>>>> seem to be as many errors as in the previous test, there were a few
>>>>> errors during shutdown but the shutdown was otherwise normal.
>>>>> See pb3400c-63e3756d1bdf-2.txt.
>>>>>
>>>>> 4) Wallstreet
>>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>>>> X login worked, and there were no errors. There were no errors during
>>>>> ssh access.
>>>>> See Wallstreet-63e3756d1bdf-2.txt.
>>>>>
>>>>
>>>> Thanks for collecting these results, Stan. Do you think that the
>>>> successful result from test 4) could have been just chance?
>>>
>>> No. I repeated Test 4 above two more times on the Wallstreet. After
>>> stomping on it as hard as I could, I didn't see any errors. I ran the
>>> following tests simultaneously, with no errors:
>>>
>>> a) Ping flood the Wallstreet
>>> 862132 packets transmitted, 862117 packets received, 0.0% packet loss
>>> round-trip min/avg/max/stddev = 0.316/0.418/12.163/0.143 ms
>>>
>>> b) "ls -Rail /usr" in an ssh window.
>>>
>>> c) "find /usr/include -type f -exec sha1sum {} \;" in a second ssh
>>> window.
>>>
>>> d) With a, b and c running, I logged in at the X console (slow but it
>>> worked). Load average was 7.0 as reported by uptime.
>>>
>>> So the success seems to be repeatable (or at least the errors are so
>>> unlikely to happen that I'm not seeing anything).
>>>
>>>>
>>>> It appears that the bug affecting the Powerbook 3400 is unaffected by
>>>> CONFIG_VMAP_STACK.
>>>>
>>>> Whereas the bug affecting the Powerbook G3 disappears when
>>>> CONFIG_VMAP_STACK is disabled (assuming the result from 4 is reliable).
>>>>
>>>> Either way, these results reiterate that "Oops: Kernel access of bad
>>>> area,
>>>> sig: 11" was not entirely resolved by "powerpc/32s: Fix napping
>>>> restore in
>>>> data storage interrupt (DSI)".
>>>>
>>>
>>> That sounds right. Thanks for investigating this.
>>>
>>
>>
>> Thanks a lot for your patience and for the tests.
>>
>> I'm still having hard time understanding what the problem is.
>>
>> Could you try the new change I pushed into the git repo ? It shouldn't
>> have any effect, but I prefer to eliminate all possibilities. The
>> documentation says that SRR1 upper bit are 0 on DSI and the code relies
>> on that. But if the doc is wrong then that can explain the problem. So
>> now I'm forcing it to 0 regardless.
>>
>> To get the change, you just have to do 'git pull -r' inside the
>> directory where you checked out the sources and build.
>>
>> Thanks again
>> Christophe
>>
> 
> Thanks, Christophe.
> 
> In the same directory as previous builds:
> 
> $ git checkout chleroy-linux/bugtest
> HEAD is now at 63e3756d1bdf powerpc/interrupts: Also perform KUAP/KUEP
> lock and usertime accounting on NMI
> $ git pull -r
> You are not currently on a branch.
> Please specify which branch you want to rebase against.
> ...
> $ git pull -r chleroy-linux
> remote: Enumerating objects: 6, done.
> remote: Counting objects: 100% (6/6), done.
> remote: Compressing objects: 100% (6/6), done.
> remote: Total 6 (delta 0), reused 6 (delta 0), pack-reused 0
> Unpacking objects: 100% (6/6), done.
>  From https://github.com/chleroy/linux
>     63e3756d1bdf..9023760b1361  bugtest    -> chleroy-linux/bugtest
> Updating 63e3756d1bdf..9023760b1361
> Fast-forward
>   arch/powerpc/kernel/head_book3s_32.S | 1 +
>   1 file changed, 1 insertion(+)
> HEAD is up to date.
> 
> Hopefully I did that right and ended up at the right spot.
> 
> For tests 5 and 6:
> 
> $ cp ../dot-config-powermac-5.13 .config
> $ scripts/config -e CONFIG_PPC_KUAP -e CONFIG_PPC_KUAP_DEBUG -e
> CONFIG_VMAP_STACK
> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
> olddefconfig vmlinux
> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
> CONFIG_PPC_KUAP=y
> CONFIG_PPC_KUAP_DEBUG=y
> CONFIG_VMAP_STACK=y
> $ strings vmlinux | grep "Linux version"
> Linux version 5.13.0-pmac-00005-g9023760b136 (johnson@ThinkPad)
> (powerpc-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for
> Debian) 2.31.1) #3 SMP Sat Aug 7 09:29:11 MDT 2021
> $ cp vmlinux ../vmlinux-5.13.0-pmac-00005-g9023760b136-1
> 
> 
> 5) PB 3400c
> vmlinux-5.13.0-pmac-00005-g9023760b136-1
> Boots, no errors logging in at (text) fb console. Logging in via ssh and
> running "ls -Rail /usr/include" generated errors. As before, once errors
> started, they seemed to escalate, including errors during "shutdown -r now".
> See pb3400c-g9023760b136-1.txt.
> 
> 6) Wallstreet
> vmlinux-5.13.0-pmac-00005-g9023760b136-1
> X login failed, and there were errors. Logging in via SSH, there were no
> additional errors after running "ls -Rail /usr/include" -- as before,
> the errors did not escalate as they did on the PB 3400.
> See Wallstreet-g9023760b136-1.txt.
> 
> For tests 7 and 8:
> 
> $ cp ../dot-config-powermac-5.13 .config
> $ scripts/config -e CONFIG_PPC_KUAP -e CONFIG_PPC_KUAP_DEBUG -d
> CONFIG_VMAP_STACK
> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
> olddefconfig vmlinux
> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
> CONFIG_PPC_KUAP=y
> CONFIG_PPC_KUAP_DEBUG=y
> # CONFIG_VMAP_STACK is not set
> $ strings vmlinux | grep "Linux version"
> Linux version 5.13.0-pmac-00005-g9023760b136 (johnson@ThinkPad)
> (powerpc-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for
> Debian) 2.31.1) #4 SMP Sat Aug 7 09:49:03 MDT 2021
> $ cp vmlinux ../vmlinux-5.13.0-pmac-00005-g9023760b136-2
> 
> 
> 7) PB 3400c
> vmlinux-5.13.0-pmac-00005-g9023760b136-2
> As before, the filesystem was corrupt from the previous test. After
> fixing that, this kernel boots, and there were no errors from logging in
> at the (text) fb console. Logging in via ssh and running "ls -Rail
> /usr/include" generated errors. There were a few errors logging in at
> the serial console and during shutdown, but the shutdown was otherwise
> normal.
> See pb3400c-g9023760b136-2.txt.
> 
> 8) Wallstreet
> vmlinux-5.13.0-pmac-00005-g9023760b136-2
> X login worked, and there were no errors. There were also no errors
> during ssh access.
> Simultaneous stress test, also no errors:
> a) Login at X console.
> b) Ping flood the Wallstreet
> 359695 packets transmitted, 359688 packets received, 0.0% packet loss
> round-trip min/avg/max/stddev = 0.322/0.428/16.857/0.165 ms
> c) "ls -Rail /usr" in an ssh window.
> d) "find /usr/include -type f -exec sha1sum {} \;" in a second ssh window.
> See Wallstreet-g9023760b136-2.txt.
> 
> As far as I could tell, there were no significant changes from the
> previous four tests.
> 

Ok, that was expected, but I wanted to be 100% sure to avoid looking into the wrong direction.

To be honnest, I'm running out of ideas.

We have two remaining independant problems as far as I understand:

PB3400C (603ev core = No hash table)
- A KUAP fault, regardless of CONFIG_VMAP_STACK, due to a clobber of r11 registers apparently.

Wallstreet (Hash table)
- Random faults, only with CONFIG_VMAP_STACK


One thing I am wondering, could there be a link with SMP ?

Would you mind trying with a kernel built without CONFIG_SMP ?

Thanks
Christophe
