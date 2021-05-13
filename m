Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B137FEE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 22:22:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh33g4RTGz2yxm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 06:22:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=U9HbGT0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.161;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=U9HbGT0x; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh33203J3z2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 06:21:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620937245; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=sgJZE8/mLQG+VC8bzd+9ZL+bup0/nO3+qONiMF472uCHhme6c4VF1mVhdW2xcNX4Ac
 IELgT1qQeKLguKlvAP9NdbINY/MIJimn8y4KoxmrDrowlbtnT4MmIcypPhKZ2weEFake
 FvOSdStp9ZzIBeNagNDE2o5enJiOh9Yx8kNPzb6Dgx6WV64gEV0NHEWVRpAElfb/467w
 UTCyVRWRneZIojdmju0Slo2Snbzkao2Tdau5gaPYJNoZno/Mb26bmrefxH95liTEm+mu
 mCP0mBj42NdB8doLL/DWBZEXzk82aN0kiI/cpsN5s6SkxAOIrUQDGXkuaTEG9g+ucPwD
 NmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620937245;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=VKHbL6g38sygIOckSR88++q6THgRwcnwcfcmSKghsOo=;
 b=qnHHgnC/8x7vYxVBIG+QwFc8B0uJtkKuBViKm1PaFbZr949GkWtogWTJgaOdr68EyO
 7DIeeMsErus8wUqqG0IYhnWlm7O71pAp4yjT52CaKEU+FXwnDybnTIj3Qso1w6EhjQ0X
 Otij3EDlx/VlywxYvM3T8ntQtGCCMcdyDfhvyDOguRGYK6WIICXAYnlFNAxkuHrk7sXU
 hPyDlOdnhmFUQm7gws8uGyZKrjE+YrGoanELMjfH/lqWNCubILWvWqW6SZX9z2/i9Tix
 294BuAg/d+SmuX6/Rk05z1j8nX8eRRJu5Z2z8JBR6YFqzul9QkiSxDIS8sQoWlVNmPfk
 YJQg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620937245;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=VKHbL6g38sygIOckSR88++q6THgRwcnwcfcmSKghsOo=;
 b=U9HbGT0x+bfBVP4bZfZ9Pv8cc/rHu62/TnkD5v4za8E5JuUStHA1kiR5vve9iPK13h
 eTVV3QzMcNQwambrpcqVGcFD3/KCv+wOH8TFa9YV8NtwjLxQoSD5h36Obwnt1Y2doZHK
 21rKVPAMvq3iC5SlGUlNOA7yrGFBIV8NxCh2r4ZG+IFiehC/UGIwY0RYlYb2kvvproC9
 6zI0dy2VlCaV8686wnYkLv8lU+LqgRoodJleyf4comyOHJ/80scg2TMcpvyvowK9bPgO
 eIo2Tp7IXeI9hJbcay9IImAN7Gf/3U6SH9OQ4nulyhaNkbohioje8h4BMOkh0+1K6Y5w
 HOzw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgCLz5q92XDIy4M1mOr4LR4+7m+VA=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:a903:7809:7981:9863]
 by smtp.strato.de (RZmta 47.25.7 AUTH)
 with ESMTPSA id j00466x4DKKi7kx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 22:20:44 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
 <65116250-6EEB-4419-8A7D-B0882379A68B@xenosoft.de>
 <c90ba856-1ef2-c010-17ac-a091c5252a5c@csgroup.eu>
 <781a426e-8561-108f-0e5c-9393bc653e86@xenosoft.de>
 <56899373-f821-62e2-26ab-b1a98b3fe2e2@csgroup.eu>
 <4175f794-f8b8-d9fc-620d-408317e27eba@xenosoft.de>
 <ea99d32a-b544-e813-8e0f-1719f3600ba9@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <2f00463c-a87a-6dbc-037c-5a8996790d23@xenosoft.de>
Date: Thu, 13 May 2021 22:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea99d32a-b544-e813-8e0f-1719f3600ba9@csgroup.eu>
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

On 13 May 2021 at 07:00pm, Christophe Leroy wrote:
>
>
> Le 13/05/2021 à 18:35, Christian Zigotzky a écrit :
>> On 13 May 2021 at 5:51pm, Christophe Leroy wrote:
>>>
>>>
>>> Le 13/05/2021 à 17:19, Christian Zigotzky a écrit :
>>>> On 13 May 2021 at 12:01 pm, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 13/05/2021 à 08:47, Christian Zigotzky a écrit :
>>>>>> Hi Christophe,
>>>>>>
>>>>>>> On 9. May 2021, at 19:37, Christophe Leroy 
>>>>>>> <christophe.leroy@csgroup.eu> wrote:
>>>>>>>
>>>>>>> Did I do an error in my analysis ?
>>>>>>
>>>>>> No, you didn’t. On the contrary you have found the issue. ;-) The 
>>>>>> issue is somewhere in the new interrupt code.
>>>>>
>>>>> I'm not convinced, but let's give it a try.
>>>>>
>>>>>>
>>>>>>> ZZ | * | ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt 
>>>>>>> context tracking scheme
>>>>>>
>>>>>> Could you please create a patch for reverting the new interrupt 
>>>>>> code? I would like to confirm your result.
>>>>>
>>>>> Please fetch https://github.com/chleroy/linux.git and try the 
>>>>> branch for_christian.
>>>>>
>>>>> This is a revert of approx a dozen of commits around the changes 
>>>>> to 64e on top of v5.13-rc1.
>>>>>
>>>>> If the top of the branch works for you, it would be great if you 
>>>>> can find out which one of the reverts fixes the problem for real.
>>>>>
>>>>> Thanks
>>>>> Christophe
>>>> It's working! Great! I can use the RC1 on my FSL P5040. Thank you! 
>>>> The issue is definitely somewhere in the interrupt code. Please 
>>>> tell me the next steps.
>>>>
>>>
>>> Can you bisect between 5.13-rc1 and the top of the 'for_christian' 
>>> branch to find the first 'good' commit ?
>>>
>>> Take care it is an "up side down" bisect, a 'good' is one that does 
>>> _not_ work and a 'bad' is a commit that works.
>>>
>>> git bisect start
>>> git bisect bad 1c8f441f1485
>>> git bisect good 6efb943b8616
>>>
>>> Christophe
>> Hi Christophe,
>>
>> Yes, I can. Shall I use the branch 'for_christian' or the default 
>> linux git for bisecting? I have tried it already with the branch 
>> 'for_christian' but it doesn't compile.
>>
>> git bisect start
>> git bisect bad 1c8f441f1485
>> git bisect good 6efb943b8616
>>
>> Output: [d66b1d1aab0c1caad11eca417f515b86ec0bebe9] Revert 
>> "powerpc/64e/interrupt: Use new interrupt context tracking scheme"
>>
>> Result:
>>
>> arch/powerpc/kernel/interrupt.o: In function `.syscall_exit_prepare':
>> interrupt.c:(.text+0x278): undefined reference to `.schedule_user'
>> arch/powerpc/kernel/interrupt.o: In function 
>> `.interrupt_exit_user_prepare':
>> interrupt.c:(.text+0x340): undefined reference to `.schedule_user'
>> Makefile:1191: recipe for target 'vmlinux' failed
>> make: *** [vmlinux] Error 1
>>
>
> Ah yes, I remember this problem.
>
> Can you select CONFIG_VIRT_CPU_ACCOUNTING_GEN in your configuration ?
>
> Otherwise, I can try to fix the branch.
>
> Christophe
I selected this. After that it compiles.

1. git bisect good - Xorg restarts again and again
     Output: [f9aa0ac1e9e82b60401ad567bdabc30598325bc1] Revert 
"powerpc/64e/interrupt: use new interrupt return"
2. git bisect good - Xorg restarts again and again
     Output: [cd6d259a14704741bf0cd1dcadb84c0de22d7f77] Revert 
"powerpc/64e/interrupt: always save nvgprs on interrupt"
3. git bisect bad - Xorg works
     Output: [9bfa20ef2ae54d3b9088dfbcde4ef97062cf5ef2] Revert 
"powerpc/interrupt: update common interrupt code for"
4. git bisect good - Xorg restarts again and again
     Output:

cd6d259a14704741bf0cd1dcadb84c0de22d7f77 is the first bad commit
commit cd6d259a14704741bf0cd1dcadb84c0de22d7f77
Author: Christophe Leroy <christophe.leroy@csgroup.eu>
Date:   Thu May 13 09:52:06 2021 +0000

     Revert "powerpc/64e/interrupt: always save nvgprs on interrupt"

     This reverts commit 4228b2c3d20e9f80b847f809c38e6cf82864fa50.

:040000 040000 156542c857ad72776b69bb67b2f244afeeb7abd3 
92ea86ed097fce16238b0c2f2b343473894e4e8e M    arch

- Christian
