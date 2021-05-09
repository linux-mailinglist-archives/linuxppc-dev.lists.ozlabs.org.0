Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DB377696
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 14:28:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdNlD39XJz3099
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 22:28:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hHza1ffh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.220;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=hHza1ffh; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdNkk1mqcz2yYB
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 22:28:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620563258; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=K+u0gpQwuUDm84GAEBHjgn8riGaE//5lhC32JNADSbYeumL9wG2RJ7YSzd2w9QLUDy
 WvRyuBDwHkZEz23DsdxRdKoUT7xh5mlF2FF9F20dcMuj5nzogjmkeauO3CkLZydA9EGf
 riPpnG1bUuxElw4961ph0IFLpqHp4TEHql9+fLgdbbp+kIqF3KN1xlSux68x1CjQpkaC
 UJ4d75gDZWikOu6f7r1CCmjpM3POB7VSStrd5w/PurlxC2G0xKNRtzDVAWkEczi79j/+
 JfZHiUXVJA01Oy1IpqgY5oSquLWj20xSvYC7vW+ihfEVZi2Fd4WDi+MzQJIyPtR5RkJS
 WacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620563258;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=gqHhGNEuQYDkEHrXUHZmd70aPfgOZpNgUsQEg8oAc/Y=;
 b=p7WeKiIyL64kiCalojOs+MenmWP9gDjVx6B5qipOyfI16Q93JW6HoEnI8E5tqLFTJZ
 QljFcMoWphTXg7qGMMKIPNZ+pT2UegvMR1v6pvAfsO8+j8piq+3FiJolXdNNDTWaEbeL
 tmBGyTAIf2/4bUNhg7WRRZBZbAm9ZO1jEQANzj3DYpxia/hu98sSuQFtzrt5aVSZMIQc
 7wM+Yjr2VFgVPFHfnPzFjaK9L5u7PyLXQasG8La2OejXNCS/KD4+1fJ3At1edggcpuNx
 eWJo27CRQdAhLyM2qIwmSfkFvY7g8m9jPEfIz38obQX9L2cU8vipcRnqV4VASeUzJjXa
 8h8A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620563258;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=gqHhGNEuQYDkEHrXUHZmd70aPfgOZpNgUsQEg8oAc/Y=;
 b=hHza1ffhnHbZQiOYbN3/SFwLR3097pqtpenrhdpR1+dSl2SF/gytkn5mgdPcykdEcT
 6COZ0lfgTuBtXh0CVONc7WZYNfdJWUixdcSNLYYJo8NOYeMAIkUiO3Vtq/L7II9nWEKc
 EltTDDRkheK41BSUsjeW/rcw+Zjg/P8cT7yqlk4jP+UK4ONXlmy9OJIeiwukLJBYOZk0
 lXO6OTccGAEfdM646KUUi0AWgOHIT3DQGPOYzz/AwW0BynKQwGMRDOSaO4tyzFS5uIuK
 gwGdVc19jGhAPUAd2PTRurEguu51WJzzE3mWbOOKvxQYqFXxZ75PfdZZHqaYzQNjUp2C
 3YJQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhaLu8bGCnE59+6vSDNusy7fXbofA=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id L0ba16x49CRa6hR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 9 May 2021 14:27:36 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
 <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
 <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
Message-ID: <806945b0-d4e9-3064-8447-e8265642c048@xenosoft.de>
Date: Sun, 9 May 2021 14:27:36 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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

On 08 May 2021 at 06:39pm, Christian Zigotzky wrote:
> On 06 May 2021 at 03:58 pm, Christian Zigotzky wrote:
>> I have started bisecting again.
>>
>> Link: 
>> https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106 
>> <https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106>
>>
>>
>>> On 6. May 2021, at 10:09, Christophe Leroy 
>>> <christophe.leroy@csgroup.eu> wrote:
>>>
>>>
>>> - Can you check that 887f3ceb51cd with cherry-picked 525642624783 
>>> has Xorg working ?
> git checkout 887f3ceb51cd
> git cherry-pick 525642624783
>
> Result: Xorg works.
>>> - Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to 
>>> identify first bad commit that stops after loading the dtb and uImage ?
>>> - Once that first bad commit is identified, can you check whether 
>>> the preceeding commit with cherry-picked 525642624783 has Xorg 
>>> working or not ?
>>>
>>> Thanks
>>> Christophe
> git bisect start
> git bisect good 887f3ceb51cd
> git bisect bad 56bec2f9d4d0
> git bisect good -- Xorg restarts again and again but we are looking 
> for the first bad commit that stops the boot after loading the dtb and 
> uImage.
> git bisect good -- Xorg restarts again and again.
> git bisect good -- Xorg restarts again and again.
> git bisect good -- Xorg restarts again and again.
>
> Result:
>
> 56bec2f9d4d05675cada96772a8a93010f4d82bf is the first bad commit
> commit 56bec2f9d4d05675cada96772a8a93010f4d82bf
> Author: Michael Ellerman <mpe@ellerman.id.au>
> Date:   Wed Mar 31 11:38:40 2021 +1100
>
>     powerpc/mm/64s: Add _PAGE_KERNEL_ROX
>
>     In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
>     removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
>     specific PAGE and PMD flags and definitions") and added definitions
>     for each MMU family.
>
>     However we missed adding a definition for 64s, which was not really a
>     bug because it's currently not used.
>
>     But we'd like to use PAGE_KERNEL_ROX in a future patch so add a
>     definition now.
>
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>     Link: 
> https://lore.kernel.org/r/20210331003845.216246-1-mpe@ellerman.id.au
>
> :040000 040000 ff8171830c08e4f99852947a5c3b62e784220a26 
> 85aff144e5219bce4eb6adb2ac32c6459cac22d0 M    arch
>
> ---
>
> git cherry-pick 525642624783
>
> Output:
>
> powerpc/signal32: Fix erroneous SIGSEGV on RT signal return
>  Author: Christophe Leroy <christophe.leroy@csgroup.eu>
>  Date: Fri Apr 23 13:52:10 2021 +0000
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> ---
>
> Xorg works after compiling with the cherry-pick of 525642624783.
Hi All,

I compiled and tested the latest git kernel with the new PowerPC updates 
5.13-2 today. Unfortunately the Xorg issue still exists.
If I revert the PowerPC updates 5.13-1 and 5.13-2 then Xorg works 
without any problems.

Please check the BookE changes in the PowerPC updates 5.13-1 because my 
Book3S machines aren't affected by this issue.

Thanks,
Christian
