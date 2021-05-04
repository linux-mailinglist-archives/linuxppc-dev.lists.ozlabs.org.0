Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E6372CA2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZNM03SQWz30D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 01:00:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Uu8IqySp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Uu8IqySp; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZNLP3HHfz2y88
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 01:00:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620140384; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=lKG6NPSwkMrdCPJUCIYkwtSWI2ZZ32L4vSqvtXnDVVtKJaUA0zUMpmFboFLTflr3Jl
 /MVgLtD6jI4j3L3+hFXxhNfMaw048tbjXy/QN2w4TXS0QQQ3S3eUmaYqGjtGIEOYaDIX
 YVcrKD+10UX23e6+z2L3xIJFhN+e9fnReV5xREFMu2yjDiVkKPdodnHuuJem1zL0oRev
 P6boPIl/FXQrHOVmImSO+0uqC/+u9lTSxRe9LtjDNLI9Ah3gHzH0jgO9CEW4XRrA/hJX
 z8+bNwDjeQZgvUhn6hMNAFmPkhHQM0Stz1jGNMiEAEeEjFoRXA5sd5xISjmhmmUq1G6B
 HyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620140384;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=n0dqwWc5vHp67q2JvCLp6oT/jRS697H8+iq5YnSeKYA=;
 b=jGHfSFcvZRVKul0LeA/UI+gpHiVysVL7d+AzmLheIGBTrxOJpzl9ZTiAv6UYebYxv0
 p32rzIVO4PfUB79Q1ntneyw9fynFkotr0afJHJXG8rRkexCUGpoBF4TNP2nmgVooc5vk
 7aVl1q9ql5EdZscGVZG4A1M0aZdEh1xdcyDPBo4Fc5hGnIOlbVIsDT99VDNLrW/rF5f0
 4SImrpRTrr3iwM/RUtDBslI7hGaJJ4neetOFKlN8XzwyUZZzlq1rTRIkFLsVRjFYMzyT
 dtpQgON2pVWiphO3igSGSobOxJt6ZV86iZOUdDdETrjLta27EwmSb1AlNfHUWEg6yWi8
 4z5A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620140384;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=n0dqwWc5vHp67q2JvCLp6oT/jRS697H8+iq5YnSeKYA=;
 b=Uu8IqySp2NIM1iixOG4l+GWu2BGk5Qv4ykFr6BTn3p0nTd7TZxwjx+zbtASG6dKRu/
 LA5LkzZn4XxYTpI5VwbSpMs0o4pI6jVA4zTZ7EByNyG17l0owqKxVXHN1rmb8yf9rkHX
 dpxKM3+CASecdMUMbcCDd2B1Vy4Jyqdv500DBAExLK47PjwDmLFPen8o5V74Tdkc09nW
 rvu8nbSsHUCHe0a0TD65g8B5qNBhd9dslfqlUuIb3fd7IMl0RAryNvpV09fYZ1fnfPay
 1pPUW2gxzmQqkbI5MP1e3v8ANw+mJ4qVQLx2MZBOb0yQCEnkXK9nSmeZd8IZgIKskzgd
 3xcQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIwJp9hde4IG39Acg/ZIdVUvyTg=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id D075c0x44Exh2rL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 16:59:43 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
 <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
 <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
 <daace050-6233-77ea-4517-0fd3c4b21057@xenosoft.de>
 <30f559f4-b50a-de63-94e1-761022468684@csgroup.eu>
 <c9a692b4-0ac0-d595-10fa-c3213b1518fc@xenosoft.de>
 <3b7daea5-7b2b-a089-0427-3becb986b6f5@csgroup.eu>
 <1502fb22-680c-7393-238c-f82570806717@xenosoft.de>
 <6a322f04-a81e-ae31-1425-19fda9307b23@csgroup.eu>
 <f253fc33-daa1-e668-31b3-593991531ffb@xenosoft.de>
 <6d3ae417-48de-3b61-f6fe-da951d74fef3@xenosoft.de>
 <07541597-f309-0d33-2c29-6da8fcd10aa1@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <c4914f77-f8c2-e869-d731-4d0882e12af0@xenosoft.de>
Date: Tue, 4 May 2021 16:59:43 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <07541597-f309-0d33-2c29-6da8fcd10aa1@csgroup.eu>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 04.05.21 um 16:41 schrieb Christophe Leroy:
>
>
> Le 04/05/2021 à 13:02, Christian Zigotzky a écrit :
>> Am 04.05.21 um 12:07 schrieb Christian Zigotzky:
>>> Am 04.05.21 um 11:49 schrieb Christophe Leroy:
>>>>
>>>>
>>>> Le 04/05/2021 à 11:46, Christian Zigotzky a écrit :
>>>>> Am 04.05.21 um 11:11 schrieb Christophe Leroy:
>>>>>>
>>>>>>
>>>>>> Le 04/05/2021 à 11:09, Christian Zigotzky a écrit :
>>>>>>> Am 04.05.21 um 10:58 schrieb Christophe Leroy:
>>>>>>>>
>>>>>>>>
>>>>>>>> Le 04/05/2021 à 10:29, Christian Zigotzky a écrit :
>>>>>>>>> On 04 May 2021 at 09:47am, Christophe Leroy wrote:
>>>>>>>>>> Hi
>>>>>>>>>>
>>>>>>>>>> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>>>>>>>>>>> Hi Christophe,
>>>>>>>>>>>
>>>>>>>>>>> Thanks for your answer but I think I don't know how it works 
>>>>>>>>>>> with the cherry-pick.
>>>>>>>>>>>
>>>>>>>>>>> $ git bisect start
>>>>>>>>>>
>>>>>>>>>> As you suspect the problem to be specific to powerpc, I can do
>>>>>>>>>>
>>>>>>>>>> git bisect start -- arch/powerpc
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>>>>>>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>>>>
>>>>>>>>>> You said that powerpc-5.13-1 is bad so you can narrow the 
>>>>>>>>>> search I think:
>>>>>>>>>>
>>>>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>>>>> git bisect good 887f3ceb51cd3~
>>>>>>>>> I tried it but without any success.
>>>>>>>>>
>>>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>>>>
>>>>>>>>> Output:
>>>>>>>>> fatal: Needed a single revision
>>>>>>>>> Bad rev input: powerpc-5.13-1
>>>>>>>>
>>>>>>>> I don't understand, on my side it works. Maybe a difference 
>>>>>>>> between your version of git and mine.
>>>>>>>>
>>>>>>>> In that case, just use the SHA corresponding to the merge:
>>>>>>>>
>>>>>>>> git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>>
>>>>>>>> Christophe
>>>>>>> Do you use a BookE machine?
>>>>>>
>>>>>> No I don't unfortunately, and I have tried booting in QEMU a 
>>>>>> kernel built with your config, but it freezes before any output.
>>>>> You can use my kernels and distributions.
>>>>>
>>>>
>>>> Ok, I'll see if I can do something with them.
>>>>
>>>> In the meantime, have you been able to bisect ?
>>>>
>>>> Thanks
>>>> Christophe
>>> I am bisecting currently.
>>>
>>> $ git bisect start -- arch/powerpc
>>> $ git bisect good 887f3ceb51cd3~
>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>> OK, there is another issue after the second bisecting step. The boot 
>> stops after loading the dtb and uImage file. I can't solve 2 issues 
>> with bisecting at the same time.
>
> In that case, you can use 'git bisect skip' to skip the one that is 
> not booting at all.
In my point of view 'git bisect skip' isn't a good idea because I will 
not find out if the skipped commit is good or bad and maybe the first 
bad commit.
