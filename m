Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B829D372874
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:08:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZFsP5fvzz3001
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 20:08:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SGHUYHPc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=SGHUYHPc; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZFrt13c8z2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 20:07:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620122828; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=kT40niqsnGntUP2AzEwK/9KCoYvl0yLPDdEXVyn+30se4XYGgoctp7GuWfIhazAwpf
 mP/hilePWTA8QoKL1UuSaUuzVeQwvK2fjaTjbLhuuhvlKHMgwHdbaDJsApaDkW6cLLOc
 816TSQfl+msyUnNxQn+5EBroELRZKrdb6S8bsvEBMoiL7w2rqIW0t1jFif5VqbyVmAGv
 oemozGVoufVBtYTua3jOng0Pdahd3yejnn0biBCQ+Gpr3UFtDwth8m7CmhnQXnDHrdnD
 k/yz9VAlb5I3PMYx8ykYLeOKqBpCuXiTOuktmj8/65H7mgpJq/rWAcaqDie6ujH5DCjn
 WPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620122828;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=ftNwKecT/lbbzSRvvxruyi+GhNbJ2Go83E59q1ttgWc=;
 b=f4pdSMhx21tY4EUB7sXlkXBoJjd+zHfubwgDxO71paOXhiGICiksZlWI6Ujm1n3ZM6
 PgJ3/oXpWbjT6FFq29dLmcYQJrBuf3bkg1PcXcJ/RGjre96Awygzd8zBhjiNzDGfkSlq
 clTDfnPs0+blvF9tRqMpU5lqJKHL20dUdX4+4yKTc/6rtfU5aRYsQvutbhhU7miVEn7T
 fN6sRrFSZ7YrM2gXzTJYVxEip7NxdQawN8vyZU/9hFG8y+vLpaSAav8haj5ZVVAL85NA
 IoDivSbAPnqhXQDMY7At4p40l90brCcDHhduOyW/KAIM/sADMvcKZShlPTZOyN7Xc37+
 ILoA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620122828;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=ftNwKecT/lbbzSRvvxruyi+GhNbJ2Go83E59q1ttgWc=;
 b=SGHUYHPcsR0tiz3xEHHz4CnthsfV+g9H6zPu0ltApDtBmX/WHfIl7G4ZWmujJjOlFB
 rtMDHVR6Zd1VacuwIrcvjJ6laemppyeiMnYdyA6FfsfgIsDfxD6Xbrpl+Nz73140L1nK
 Oxu6/E431McitYm6rqBBIsfJNrWflk9COJxFwDsgI3PDabpcrhfQES6rkciTRB/dOQy0
 RHH4PMEQQS0Ruwq+KNm0DKonFptW8IRO7uiPoGLYtcNMNnz47Y+1wkjqoLNeCrpj+OZH
 V7w4hOFaFRHuDFdoNMYh/BpXYExxyTbwuEtkK8ZXNGgvv3JmsNUeB9h/iKK0A5JLmL5g
 6AZA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIhsJhhV/a8MrHM5J4CoqSoOzBQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:14dd:6e8f:db34:91bd]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id D075c0x44A771B2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 12:07:07 +0200 (CEST)
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
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <f253fc33-daa1-e668-31b3-593991531ffb@xenosoft.de>
Date: Tue, 4 May 2021 12:07:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6a322f04-a81e-ae31-1425-19fda9307b23@csgroup.eu>
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

Am 04.05.21 um 11:49 schrieb Christophe Leroy:
>
>
> Le 04/05/2021 à 11:46, Christian Zigotzky a écrit :
>> Am 04.05.21 um 11:11 schrieb Christophe Leroy:
>>>
>>>
>>> Le 04/05/2021 à 11:09, Christian Zigotzky a écrit :
>>>> Am 04.05.21 um 10:58 schrieb Christophe Leroy:
>>>>>
>>>>>
>>>>> Le 04/05/2021 à 10:29, Christian Zigotzky a écrit :
>>>>>> On 04 May 2021 at 09:47am, Christophe Leroy wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>>>>>>>> Hi Christophe,
>>>>>>>>
>>>>>>>> Thanks for your answer but I think I don't know how it works 
>>>>>>>> with the cherry-pick.
>>>>>>>>
>>>>>>>> $ git bisect start
>>>>>>>
>>>>>>> As you suspect the problem to be specific to powerpc, I can do
>>>>>>>
>>>>>>> git bisect start -- arch/powerpc
>>>>>>>
>>>>>>>
>>>>>>>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>>>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>
>>>>>>> You said that powerpc-5.13-1 is bad so you can narrow the search 
>>>>>>> I think:
>>>>>>>
>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>> git bisect good 887f3ceb51cd3~
>>>>>> I tried it but without any success.
>>>>>>
>>>>>> git bisect bad powerpc-5.13-1
>>>>>>
>>>>>> Output:
>>>>>> fatal: Needed a single revision
>>>>>> Bad rev input: powerpc-5.13-1
>>>>>
>>>>> I don't understand, on my side it works. Maybe a difference 
>>>>> between your version of git and mine.
>>>>>
>>>>> In that case, just use the SHA corresponding to the merge:
>>>>>
>>>>> git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>
>>>>> Christophe
>>>> Do you use a BookE machine?
>>>
>>> No I don't unfortunately, and I have tried booting in QEMU a kernel 
>>> built with your config, but it freezes before any output.
>> You can use my kernels and distributions.
>>
>
> Ok, I'll see if I can do something with them.
>
> In the meantime, have you been able to bisect ?
>
> Thanks
> Christophe
I am bisecting currently.

$ git bisect start -- arch/powerpc
$ git bisect good 887f3ceb51cd3~
$ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
