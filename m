Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C55F3E2320
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 08:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggw7215Nnz3dDg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 16:09:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggw6h4NjCz2ysv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 16:09:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ggw6Y4TQMz9sVF;
 Fri,  6 Aug 2021 08:09:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcAl9uzo70pP; Fri,  6 Aug 2021 08:09:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ggw6Y35N7z9sV8;
 Fri,  6 Aug 2021 08:09:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49BD38B7FF;
 Fri,  6 Aug 2021 08:09:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vcKe3_rB0Kcr; Fri,  6 Aug 2021 08:09:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE6F58B7FD;
 Fri,  6 Aug 2021 08:09:24 +0200 (CEST)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Finn Thain <fthain@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
 <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
 <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
 <fbd08736-9738-35cf-3b47-b5c9c455c552@csgroup.eu>
 <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
 <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
 <c535cc2b-3f45-2415-1e81-32ea24b4ec@linux-m68k.org>
 <b8ae2ca4-56e8-e39a-27a0-f0ee2fea1511@csgroup.eu>
 <f6a3746e-80ef-a6b3-925a-69aed01ba98c@linux-m68k.org>
 <b6fe0c8e-8af5-e0e9-629b-fce61750ec2e@yahoo.com>
 <4ac28304-4519-fb8a-a868-e8c79cb5f9e4@yahoo.com>
 <7532219a-4fd0-416-6365-304033fa6abd@linux-m68k.org>
 <9659419d-da9e-5aa6-ffbb-758748e2d6e9@linux-m68k.org>
 <2eb2b452-51d5-c495-3ffe-896c62a1633f@yahoo.com>
 <da9c16b4-70bc-6fe0-ad5c-8b226ca08b23@yahoo.com>
 <cc5a203f-9df5-a0b-a4d7-bcaddde777d5@linux-m68k.org>
 <6ea50cd7-84d3-5180-0430-1211aaf0e308@yahoo.com>
 <2619d78-e8f-334a-20c0-2a60c936a293@linux-m68k.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ca0ded24-9fa0-fae4-89cf-20fc1959f69d@csgroup.eu>
Date: Fri, 6 Aug 2021 08:09:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2619d78-e8f-334a-20c0-2a60c936a293@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
 Stan Johnson <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+nicholas piggin for the C interrupt stuff

Le 06/08/2021 à 03:06, Finn Thain a écrit :
> (Christophe, you've seen some of this before, however there are new
> results added at the end. I've Cc'd the mailing lists this time.)
> 
> On Wed, 4 Aug 2021, Stan Johnson wrote:
> 
>> On 8/4/21 8:41 PM, Finn Thain wrote:
>>
>>>
>>> $ curl https://lore.kernel.org/lkml/9b64dde3-6ebd-b446-41d9-61e8cb0d8c39@csgroup.eu/raw
>>> ../message.mbox
>> ok
>>
>> $ sha1 ../message.mbox
>> SHA1 (../message.mbox) = 436ce0adf893c46c84c54607f73c838897caeeea
>>
>>>
>>> On Wed, 4 Aug 2021, Christophe Leroy wrote:
>>>
>>>> Can you check if they happen at commit c16728835
>>>>
>>
>> $ git checkout c16728835eec
>> Checking out files: 100% (20728/20728), done.
>> Note: checking out 'c16728835eec'.
>>
>> You are in 'detached HEAD' state. You can look around, make experimental
>> changes and commit them, and you can discard any commits you make in this
>> state without impacting any branches by performing another checkout.
>>
>> If you want to create a new branch to retain commits you create, you may
>> do so (now or later) by using -b with the checkout command again. Example:
>>
>>    git checkout -b <new-branch-name>
>>
>> HEAD is now at c16728835eec powerpc/32: Manage KUAP in C
>> $ git am ../message.mbox
>> warning: Patch sent with format=flowed; space at the end of lines might be lost.
>> Applying: powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
>> $ cp ../dot-config-powermac-5.13 .config
>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
>> $ strings vmlinux | fgrep 'Linux version'
>> Linux version 5.12.0-rc3-pmac-00078-geb51c431b81 (johnson@ThinkPad) (powerpc-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #1 SMP Wed Aug 4 21:50:47 MDT 2021
>>
>> 1) PB 3400c
>> Hangs at boot (Mac OS screen), no serial console output
>>
>> 2) Wallstreet
>> X fails, errors ("Kernel attempted to write user page", "BUG: Unable to
>> handle kernel instruction fetch"), see Wallstreet_console-1.txt.
>>
> 
> The log shows that the error "Kernel attempted to write user page
> (b3399774) - exploit attempt?" happens after commit c16728835eec
> ("powerpc/32: Manage KUAP in C").

I think I found a possible cause for this. After the above patch, locking KUAP on interrupt is done 
in interrupt_enter_prepare(). But in case of NMI interrupt, that function is not called. That means 
that when leaving interrupt through interrupt_exit_kernel_prepare(), the supposedly saved previous 
KUAP status is garbage.

An easy way to fix that is to add missing stuff in interrupt_nmi_enter_prepare(), I'll do that at 
least for testing, but at the end it is not so easy, because of booke32 and 40x.

The problem on booke32 and 40x is that the "critical interrupts" exit goes through interrupt_return 
when they happened in user mode and bypass interrupt_return when they happened in kernel mode. So it 
is not easy to manage.


> 
>>>>
>>>> Can you check if they DO NOT happen at preceding commit c16728835~
>>>>
>>
>> $ git checkout c16728835~
>> Previous HEAD position was c16728835eec powerpc/32: Manage KUAP in C
>> HEAD is now at 0b45359aa2df powerpc/8xx: Create C version of kuap save/restore/check helpers
>> $ git am ../message.mbox
>> warning: Patch sent with format=flowed; space at the end of lines might be lost.
>> Applying: powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
>> $ cp ../dot-config-powermac-5.13 .config
>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
>>
>> Linux version 5.12.0-rc3-pmac-00077-gc9f6e8dd045
>>
>> 3) PB 3400c
>> Hangs at boot (Mac OS screen)
>>
>> 4) Wallstreet
>> X fails, errors in console log (different than test 2), see
>> Wallstreet_console-2.txt.
>>
> 
> This log shows that the errors "xfce4-session[1775]: bus error (7)" and
> "kernel BUG at arch/powerpc/kernel/interrupt.c:49!" happen prior to commit
> c16728835eec ("powerpc/32: Manage KUAP in C").

As mentionned by Nic, this is due to r11 being cloberred. For the time being the only r11 clobber 
identified is the one I have provided a fix for. I'm wondering whether it was applied for all 
further tests or not.

> 
>>
>> $ git checkout 0b45359aa2df
>> ...
>> HEAD is now at 0b45359aa2df powerpc/8xx: Create C version of kuap save/restore/check helpers
>> $ git am ../message.mbox
>> warning: Patch sent with format=flowed; space at the end of lines might be lost.
>> Applying: powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
>> $ cp ../dot-config-powermac-5.13 .config
>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
>>
>> Linux version 5.12.0-rc3-pmac-00077-ge06b29ce146
>>
>> 5) PB 3400c
>> Hangs at boot (Mac OS screen)
>>
>> 6) Wallstreet
>> X failed (X login succeeded, but setting up desktop failed), errors in
>> console log, see Wallstreet_console-3.txt.
>>
> 
> (No need for those two tests: it's exactly the same code and almost the
> same failure modes: "kernel BUG at arch/powerpc/kernel/interrupt.c:50".)
> 
> On Thu, 5 Aug 2021, Stan Johnson wrote:
> 
>> On 8/5/21 12:47 AM, Finn Thain wrote:
>>
>>> On Wed, 4 Aug 2021, Christophe Leroy wrote:
>>>
>>>> Could you test without CONFIG_PPC_KUAP
>> ...
>>
>> $ git checkout c16728835eec
>> ...
>> HEAD is now at c16728835eec powerpc/32: Manage KUAP in C
>> $ git am ../message.mbox
>> warning: Patch sent with format=flowed; space at the end of lines might be lost.
>> Applying: powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
>> $ cp ../dot-config-powermac-5.13 .config
>> $ scripts/config -d CONFIG_PPC_KUAP
>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
>> $ grep CONFIG_PPC_KUAP .config
>> # CONFIG_PPC_KUAP is not set
>>
>> Linux version 5.12.0-rc3-pmac-00078-g5cac2bc3752
>>
>> 7) PB 3400c
>> Hangs at boot (Mac OS screen)
>>
>> 8) Wallstreet
>> Everything works, no errors (see Wallstreet_console-4.txt).
>>
> 
> That would seem to implicate CONFIG_PPC_KUAP itself. (Note that all builds
> up until this one have CONFIG_PPC_KUAP=y.)

Yes I believe so, see at the begining of this mail.


> 
>>
>>>
>>>> Could you test with CONFIG_PPC_KUAP and CONFIG_PPC_KUAP_DEBUG
>> ...
>>
>> $scripts/config -e CONFIG_PPC_KUAP
>> $ scripts/config -e CONFIG_PPC_KUAP_DEBUG
>> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
>> $ grep CONFIG_PPC_KUAP .config
>> CONFIG_PPC_KUAP=y
>> CONFIG_PPC_KUAP_DEBUG=y
>>
>> Linux version 5.12.0-rc3-pmac-00078-g5cac2bc3752
>>
>> 9) PB 3400c
>> Hangs at boot (Mac OS screen)
>>
>> 10) Wallstreet
>> X failed at first login, worked at second login, one error in console
>> log ("BUG: Unable to handle kernel instruction fetch"), see
>> Wallstreet_console-5.txt.
>>
> 
> One might expect to see "Kernel attempted to write user page (b3399774) -
> exploit attempt?" again here (see c16728835eec build above) but instead
> this log says "Oops: Kernel access of bad area, sig: 11".

Maybe the test should be done a second time. As r11 is garbage it may or may not be a user address. 
If it is a user address the we get "Kernel attempted to write user page". If it is a random kernel 
address, we likely get "Kernel access of bad area" instead.


> 
> BTW, this procedure could be made simpler and easier if I pushed git
> branches to a public repo for Stan to build, which included Christophe's
> fix plus hard-wired Kconfig changes. That way, the .config file could be
> held constant and the commit hash in the serial console log would be more
> meaningful.
> 

I like the idea, I think I'm going to provide testing fixes through a git repo, that will for sure 
make things easier.

Thanks
Christophe
