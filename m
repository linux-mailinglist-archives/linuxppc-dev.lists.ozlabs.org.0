Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A603DEA7E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 12:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf9ZC4dlDz3cHd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 20:08:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf9Yp3grJz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 20:08:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gf9Yg563mz9sV7;
 Tue,  3 Aug 2021 12:08:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeQBNTyMbv2f; Tue,  3 Aug 2021 12:08:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gf9Yg45PWz9sTp;
 Tue,  3 Aug 2021 12:08:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F42D8B778;
 Tue,  3 Aug 2021 12:08:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id clZfT2uCyg4G; Tue,  3 Aug 2021 12:08:23 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 075108B763;
 Tue,  3 Aug 2021 12:08:22 +0200 (CEST)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Stan Johnson <userm57@yahoo.com>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
 <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
 <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
 <fbd08736-9738-35cf-3b47-b5c9c455c552@csgroup.eu>
 <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
Date: Tue, 3 Aug 2021 12:08:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
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
Cc: Debian PowerPC <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/08/2021 à 19:32, Stan Johnson a écrit :
> On 8/2/21 8:41 AM, Christophe Leroy wrote:
>>
>>
>> Le 31/07/2021 à 20:24, Stan Johnson a écrit :
>>> Hi Christophe,
>>>
>>> On 7/31/21 9:58 AM, Christophe Leroy wrote:
>>>> Stan Johnson <userm57@yahoo.com> a écrit :
>>>>
>>>>> Hello,
>>>>>
>>>>> The current Debian SID kernel will not boot on a PowerBook 3400c
>>>>> running
>>>>> the latest version of Debian SID. If booted using the BootX extension,
>>>>> the kernel hangs immediately:
>>>>>
>>>>> "Welcome to Linux, kernel 5.10.0-8-powerpc"
>>>>>
>>>>> If booted from Mac OS, the Mac OS screen hangs.
>>>>>
>>>>> Booting also hangs if the "No video driver" option is selected in
>>>>> BootX,
>>>>> "No video driver" causes "video=ofonly" to be passed to the kernel.
>>>>>
>>>>> This is the current command line that I'm using in BootX:
>>>>> root=/dev/sda13 video=chips65550:vmode:14,cmode:16
>>>>>
>>>>> Kernel v5.9 works as expected.
>>>>>
>>>>> The config file I'm using is attached.
>>>>>
>>>>> Here are the results of a git bisect, marking v5.9 as "good" and the
>>>>> most current kernel as "bad":
>>>>>
>>>>> $ cd linux
>>>>> $ git remote update
>>>>> $ git bisect reset
>>>>> $ git bisect start
>>>>> $ git bisect bad
>>>>> $ git bisect good v5.9
>>>>>
>>>>> Note: "bad" -> hangs at boot; "good" -> boots to login prompt
>>>>>
>>>>>    1) 5.11.0-rc5-pmac-00034-g684da7628d9 (bad)
>>>>>    2) 5.10.0-rc3-pmac-00383-gbb9dd3ce617 (good)
>>>>>    3) 5.10.0-pmac-06637-g2911ed9f47b (good)
>>>>>       Note: I had to disable SMP to build this kernel.
>>>>>    4) 5.10.0-pmac-10584-g9805529ec54 (good)
>>>>>       Note: I had to disable SMP to build this kernel.
>>>>>    5) 5.10.0-pmac-12577-g8552d28e140 (bad)
>>>>>    6) 5.10.0-pmac-11576-g8a5be36b930 (bad)
>>>>>    7) 5.10.0-pmac-11044-gbe695ee29e8 (good)
>>>>>       Note: I had to disable SMP to build this kernel.
>>>>>    8) 5.10.0-rc2-pmac-00288-g59d512e4374 (bad)
>>>>>    9) 5.10.0-rc2-pmac-00155-gc3d35ddd1ec (good)
>>>>> 10) 5.10.0-rc2-pmac-00221-g7049b288ea8 (good)
>>>>> 11) 5.10.0-rc2-pmac-00254-g4b74a35fc7e (bad)
>>>>> 12) 5.10.0-rc2-pmac-00237-ged22bb8d39f (good)
>>>>> 13) 5.10.0-rc2-pmac-00245-g87b57ea7e10 (good)
>>>>> 14) 5.10.0-rc2-pmac-00249-gf10881a46f8 (bad)
>>>>> 15) 5.10.0-rc2-pmac-00247-gf8a4b277c3c (good)
>>>>> 16) 5.10.0-rc2-pmac-00248-gdb972a3787d (bad)
>>>>>
>>>>> db972a3787d12b1ce9ba7a31ec376d8a79e04c47 is the first bad commit
>>>>
>>>> Not sure this is really the root of the problem.
>>>>
>>>> Can you try again without CONFIG_VMAP_STACK ?
>>>>
>>>> Thanks
>>>> Christophe
>>>> ...
>>>
>>>
>>> With CONFIG_VMAP_STACK=y, 5.11.0-rc5-pmac-00034-g684da7628d9 hangs at
>>> boot on the PB 3400c.
>>>
>>> Without CONFIG_VMAP_STACK, 5.11.0-rc5-pmac-00034-g684da7628d9 boots as
>>> expected.
>>>
>>> I didn't re-build the Debian SID kernel, though I confirmed that the
>>> Debian config file for 5.10.0-8-powerpc includes CONFIG_VMAP_STACK=y.
>>> It's not clear whether removing CONFIG_VMAP_STACK would be appropriate
>>> for other powerpc systems.
>>>
>>> Please let me know why removing CONFIG_VMAP_STACK fixed the problem on
>>> the PB 3400c. Should CONFIG_HAVE_ARCH_VMAP_STACK also be removed?
>>>
>>
>> When CONFIG_HAVE_ARCH_VMAP_STACK is selected by the architecture,
>> CONFIG_VMAP_STACK  is selected by default.
>>
>> The point is that your config has CONFIG_ADB_PMU.
>>
>> A bug with VMAP stack was detected during 5.9 release cycle for
>> platforms selecting CONFIG_ADB_PMU. Because fixing the bug was an heavy
>> change, we prefered at that time to disable VMAP stack, so VMAP stack
>> was deselected for CONFIG_ADB_PMU by commit
>> 4a133eb351ccc275683ad49305d0b04dde903733.
>>
>> Then as a second step, the proper fix was implemented and then VMAP
>> stack was enabled again by the commit you bisected.
>>
>> Taking into account that the problem disappears for you when you
>> manually deselect VMAP stacks, it means the problem is not the fix
>> itself, but the fact that VMAP stacks are now enable by default.
>>
>> We need to understand why VMAP stack doesn't work on your platform, more
>> than that why it doesn't boot at all with VMAP stack.
>>
>> Could you send me the dmesg output of your system when it properly boots ?
>>
>> Did you check with kernel 5.13 ?
>>
>> Thanks
>> Christophe
>>
> 
> Christophe,
> 
> Thanks for your response. It looks like I never tested v5.13 (I was
> originally just reporting that the default Debian SID kernel,
> 5.10.0-8-powerpc, hangs at boot on the PB 3400c).
> 
> So I rebuilt the stock v5.13 from kernel.org using Finn's
> dot-config-powermac-5.13, which got changed slightly at compilation (see
> dot-config-v5.13-pmac, attached). It has CONFIG_VMAP_STACK and
> CONFIG_ADB_PMU set, and it booted, but there were multiple memory
> errors. So it looks like the hang-at-boot problem was fixed sometime
> after v5.11, but there are now memory errors (similar to Wallstreet).
> 
> With CONFIG_VMAP_STACK not set (CONFIG_ADB_PMU is still set), the
> .config file turns into the attached dot-config-v5.13-pmac_NO_VMAP. And
> there were still memory errors (dmesg output attached).
> 
> The memory errors may be a completely unrelated issue, since they occur
> regardless of the CONFIG_VMAP_STACK setting.
> 
> To help rule out a hardware issue, I confirmed that memory errors don't
> occur with v5.8.2 (dmesg output attached).
> 
> A useful git bisect might be possible if CONFIG_VMAP_STACK is disabled
> for each build. I would need to determine where the memory errors
> started (v5.9, v5.10, v5.11, or v5.12). There is the complication that
> (at least) several v5.10 kernels won't compile if SMP is set, so I might
> need to disable that everywhere as well, assuming the SMP fix didn't
> cause the memory errors.
> 

Thanks a lot for the information.

Looks like the memory errors are linked to KUAP (Kernel Userspace Access Protection). Based on the 
places the problems happen, I don't think there are any invalid access, so there must be something 
wrong in the KUAP logic, probably linked to some interrupts happenning in kernel mode while the KUAP 
window is opened. And because is not selected by default on book3s/32 until 5.14, probably nobody 
ever tested it in a real environment before you.

I think the issue may be linked to commit https://github.com/linuxppc/linux/commit/c16728835 which 
happened between 5.12 and 5.13. Would be nice if you could confirm that 5.12 doesn't have the 
problem (At the same time maybe you can see if 5.12 also boots OK with CONFIG_VMAP_STACK)

Note that the error detected in the other thread which is being discussed with Finn might also be an 
issue to be checked while we are here.

Thanks
Christophe
