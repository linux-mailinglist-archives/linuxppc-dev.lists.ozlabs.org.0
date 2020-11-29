Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BC2C7860
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 08:39:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkKxz1MdJzDsPf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 18:39:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkKw40X8CzDrnp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 18:37:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CkKvh3SVwz9v3Nt;
 Sun, 29 Nov 2020 08:37:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id myzdOTBU2oM5; Sun, 29 Nov 2020 08:37:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CkKvh2ZY4z9v3Nq;
 Sun, 29 Nov 2020 08:37:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C4858B77A;
 Sun, 29 Nov 2020 08:37:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CH8egMvdsijP; Sun, 29 Nov 2020 08:37:39 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA2218B75B;
 Sun, 29 Nov 2020 08:37:38 +0100 (CET)
Subject: Re: Kernel 5.10-rc4 doesn't boot
To: Stan Johnson <userm57@yahoo.com>, debian-powerpc@lists.debian.org
References: <20201125114030.2s3lbfxd4yvfc3zx@aragorn.home.lxtec.de>
 <88e539d3-22ed-3672-53d1-b3a217a08cc0@physik.fu-berlin.de>
 <20201125125216.lmid2m2tcdkxpioq@toy.home.lxtec.de>
 <740918d5-8ea3-4078-3bf0-7a627cd9777d@yahoo.com>
 <228955cd-e014-b533-b3bb-4d4e04baa9de@yahoo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <79a8734e-da7f-6563-2730-b1014ccb35c7@csgroup.eu>
Date: Sun, 29 Nov 2020 08:37:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <228955cd-e014-b533-b3bb-4d4e04baa9de@yahoo.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/11/2020 à 02:33, Stan Johnson a écrit :
> 
>>
>>
>> On 11/25/20 5:52 AM, Elimar Riesebieter wrote:
>>>
>>> * John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>[2020-11-25
>>> 13:04 +0100]:
>>>>
>>>> On 11/25/20 12:40 PM, Elimar Riesebieter wrote:
>>>>>
>>>>> I tried to boot linux-image-5.10.0-rc4-powerpc on my PowerBook5,8.
>>>>> It seems the ramdisk isn't loaded as ist stocks at the white
>>>>> firmware boot. A custom build fails as well. I have no idea how to
>>>>> debug that. I am booting via yaboot.
>>>>
>>>> FWIW, if you think the initrd isn't being loaded, you may have run
>>>> into a limitation with Yaboot. You have to keep in mind that Yaboot
>>>> isn't being actively maintained anymore, at least not as it used to
>>>> be. So in case of an incompatible change on the kernel side, you may
>>>> run into such problems with the bootloader. You could try switching
>>>> to GRUB.
>>>
>>> What is the preferred way to switch to grub2? Elimar
>>
>>
>> HelloElimar,
>>
>> I can confirm that Linux 5.10.0-rc5 also does not work on a PowerBook
>> Lombard, hanging at the "found display ... opening ..." screen after
>> loading the initrd.img file.
>>
>> The 5.10.0-rc5 initrd.img can be used with an older 5.8.4 kernel;
>> however, the 5.8.4 initrd.img does not work with the 5.10.0-rc5
>> kernel, so the problem appears to be with the 5.10.0-rc5 kernel.
>>
>> ...
>>
>> -Stan Johnson
>>
> 
> The Wallstreet also won't boot any 5.10.0-rc* kernel (it hangs at the
> BootX screen).  The last v5.9 mainline kernel (v5.9.11) boots on both
> the Wallstreet and Lombard (so it's likely the same problem).
> 
> I saw during one of the boots that PPC 601 support has been removed; I
> thought that there was still an effort not to do that (but that's a
> separate issue).

PPC 601 has been broken for several kernels, and nobody noticed so we concluded it was unused with 
new kernels and finally removed it completely in order to kick out all 601 particularities that were 
a nightmare.

> 
> A git bisect going from v5.9 to v5.10.0-rc1 resulted in the following,
> after about 13 kernels:
> 
> -----
> 69a1593abdbcf03a76367320d929a8ae7a5e3d71 is the first bad commit
> -----
> 
> I'm cc'ing Christophe Leroy, since I don't know what to do next.

Try following commit: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01776f070ffcbf336be3bf1672bd3c589548d6c4

Christophe
