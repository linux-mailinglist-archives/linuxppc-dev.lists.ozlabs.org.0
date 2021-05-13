Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD0F37FBA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 18:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgy3R0rz6z30GR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 02:36:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MSQkYSHf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.20;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=MSQkYSHf; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgy2t3hKTz2yYN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 02:36:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620923733; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=G3o8KBEppA49EnDTmsagTZMSkkSDX6L39TGYEgxkbopmiRi6rH4coGEN6rb2N5NIqk
 KfX11ahRMfiD5uVWVmKKsp1ejRPe3iYh9Pmi6SzBzMUPHGMXuGeXNrU70KYWyA8gUO45
 t+9vCrgeI5QUirxvZL/ht2vzMNGlPwLNlXIYu0KL8DvpJ7aZRStne7u9gxYNdwzbyeMM
 8E8TjhNSURxB9LiK8rgnjC4m/Rc5mrV8OMSOtUjh2kNuNujaon+tJy/K4Dw04IpfM6u3
 A4QnCDnUvLOT7UgsWGvIPeFhWblyid+M4j8gKbvCIAhuZ8sWYSDQrAMlb1AXG+UtsbR5
 Wxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620923733;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=nYH+yUTqb8uufRQfnrlW6lRoRNsOdrppRZNMeU491rc=;
 b=W3Mn/nbzmADyBmELC4Cz/QnCkNzZOKBqzmVN/bf1DWgtoRjfK7q3eQW8fEMkzAa37+
 De2/m2NAb2NEwvI7hxb382KATW1Pfa8mbu9qyhxlodtg6PAa/w7Ows7Rb/i7Lsg6kbJb
 i/h58+O+ckztIcHIPuo/nshugM0dN3hKEqu5Hbhd2eDnZFLhiEbQTIKVX5F1rLT0yB6T
 iPVOUBCAWweE0JODlxN9NoSW7Y7KpkSDA5NoUFkpx2Znj8EfbNJLj8yPBCWY8KOx1IJ/
 F82KsOmio7wJtSRuqqRaPhYxDbnOFGKlG5vt7RU91S11rVI9MNDehLHYeB5W91yBq9PG
 JzCQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620923733;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=nYH+yUTqb8uufRQfnrlW6lRoRNsOdrppRZNMeU491rc=;
 b=MSQkYSHf/JIwD+jn3aQuIPyov3awShaWgADS/8UACrsrknegsLi0oNIc61DsJ7AQzL
 5ctEu6gGwcMVfFAw02EJS41VG1IOi3VBTKTfHPl0Mu8L48TGJAaHS7VW6tKbFLcQ1+hp
 QDwQg4Hc7mzXna1QX7iXcq0CN0+EQofqogzU3TEY8g+VchI1pKgRzSlCXnDevM1/tkap
 yNG/vAeQl/0k61mLcVIApqaBTyY97IspefG2yYa7+7M/ggI3E8k2SZ9W4ERsN4auxy0l
 I2FZT9eIe+J+Jtr8vUIhDaw7tZDDha9fgztz+3ijpSsHxzA/2PpCGUldSjKj8Ro16PE9
 2PpQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgCLz5q92XDIy4M1mOr4LR4+7m+VA=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:a903:7809:7981:9863]
 by smtp.strato.de (RZmta 47.25.7 AUTH)
 with ESMTPSA id j00466x4DGZV7Tf
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 18:35:31 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
 <65116250-6EEB-4419-8A7D-B0882379A68B@xenosoft.de>
 <c90ba856-1ef2-c010-17ac-a091c5252a5c@csgroup.eu>
 <781a426e-8561-108f-0e5c-9393bc653e86@xenosoft.de>
 <56899373-f821-62e2-26ab-b1a98b3fe2e2@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <4175f794-f8b8-d9fc-620d-408317e27eba@xenosoft.de>
Date: Thu, 13 May 2021 18:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56899373-f821-62e2-26ab-b1a98b3fe2e2@csgroup.eu>
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

On 13 May 2021 at 5:51pm, Christophe Leroy wrote:
>
>
> Le 13/05/2021 à 17:19, Christian Zigotzky a écrit :
>> On 13 May 2021 at 12:01 pm, Christophe Leroy wrote:
>>>
>>>
>>> Le 13/05/2021 à 08:47, Christian Zigotzky a écrit :
>>>> Hi Christophe,
>>>>
>>>>> On 9. May 2021, at 19:37, Christophe Leroy 
>>>>> <christophe.leroy@csgroup.eu> wrote:
>>>>>
>>>>> Did I do an error in my analysis ?
>>>>
>>>> No, you didn’t. On the contrary you have found the issue. ;-) The 
>>>> issue is somewhere in the new interrupt code.
>>>
>>> I'm not convinced, but let's give it a try.
>>>
>>>>
>>>>> ZZ | * | ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt 
>>>>> context tracking scheme
>>>>
>>>> Could you please create a patch for reverting the new interrupt 
>>>> code? I would like to confirm your result.
>>>
>>> Please fetch https://github.com/chleroy/linux.git and try the branch 
>>> for_christian.
>>>
>>> This is a revert of approx a dozen of commits around the changes to 
>>> 64e on top of v5.13-rc1.
>>>
>>> If the top of the branch works for you, it would be great if you can 
>>> find out which one of the reverts fixes the problem for real.
>>>
>>> Thanks
>>> Christophe
>> It's working! Great! I can use the RC1 on my FSL P5040. Thank you! 
>> The issue is definitely somewhere in the interrupt code. Please tell 
>> me the next steps.
>>
>
> Can you bisect between 5.13-rc1 and the top of the 'for_christian' 
> branch to find the first 'good' commit ?
>
> Take care it is an "up side down" bisect, a 'good' is one that does 
> _not_ work and a 'bad' is a commit that works.
>
> git bisect start
> git bisect bad 1c8f441f1485
> git bisect good 6efb943b8616
>
> Christophe
Hi Christophe,

Yes, I can. Shall I use the branch 'for_christian' or the default linux 
git for bisecting? I have tried it already with the branch 
'for_christian' but it doesn't compile.

git bisect start
git bisect bad 1c8f441f1485
git bisect good 6efb943b8616

Output: [d66b1d1aab0c1caad11eca417f515b86ec0bebe9] Revert 
"powerpc/64e/interrupt: Use new interrupt context tracking scheme"

Result:

arch/powerpc/kernel/interrupt.o: In function `.syscall_exit_prepare':
interrupt.c:(.text+0x278): undefined reference to `.schedule_user'
arch/powerpc/kernel/interrupt.o: In function `.interrupt_exit_user_prepare':
interrupt.c:(.text+0x340): undefined reference to `.schedule_user'
Makefile:1191: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

----

Thanks,
Christian
