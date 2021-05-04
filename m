Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708B372B57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZLn63fHKz30DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 23:49:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UBZRAVm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.219;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=UBZRAVm5; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZLmZ6J02z2yYm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 23:49:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620136115; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=bJmR/qJC6EAS2IMg2Z8tpPdRby5qjWWPJI06cbu3xhxTuO2uAEIxtkYAZP5Tp5733u
 bIOXH1vwOyDaNH13yypD0Ho23nh+Eg6R6sW6/8IG9vlD/HVBJE1F0cQdHI5bUKUbCYNx
 1tz1/afJQ1lGFqWSHJtKhmwFGDmTR5yaVf53DDhPw7K+o3MRqZTi3eve/8B/JUlycACn
 ePrGUDCyOgmllFumjOHWQEYoG8Z2n+LegEZbNExxTF6ATMblYBxgCOqLRFxp/Vp6C8Ty
 bJ8w492Tl2Z7cZwxbmDCOfsNd2a+N0O7DBuxHYmqA8Oq68BXRBrTCGuw45acoNw8HB/+
 wafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136115;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=odTIoKCC8513wiCnzu1BtBgTLb8HkDNsWkM0IPDCGTE=;
 b=QvtqCkqCd92efhDqqida6QrWaumLw257H78Rnvz0er1KQvSHs6EIQWrAFY7p6nBhY9
 1vbV6/ogP0y/uU533AX6Ycypx91k0b+IhR+rsR8GQXWS8ZPs69HGcAua6NtloAo9IYBi
 1s8L2UCXeX0rzlSA5lsPzgNVL/wrlziaYzz/rHK9uy7lxpbpRYMpVNaspg6QrK1UmI//
 HFoflcgS9Ci1ZBV1+sJ5aRga0MG70cJ5Ri7r2Vpyo3ZehABrbsFU8Vb+J1Ykg5dTWXa9
 H5tPlMnPdDSG4Wdcpxzos2Dyp2fdgN8WYYMuWrXdO2V/N/tumY7jx5bFQ8NKGtCdP/+y
 OZaA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136115;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=odTIoKCC8513wiCnzu1BtBgTLb8HkDNsWkM0IPDCGTE=;
 b=UBZRAVm5aJXJsrMXfoTxetvBYvO+PrBJpNdXE2jFvOUGI8HDAFVidRtRxpx6RUflUz
 UW/qskjYTKjzfsxta5zHNdxAka149DT8F6JKXuRQcjL0JV+NheeUBSZRgdGbm8hJ/vW9
 ISnwamoKTJTYIrHxyPK0pvHsidGZwtMJSlVsVesOwnkNTPhZQdEaO6+63iMHtuJR6aO9
 cBYxCj7AmA/+arvksgPRln8kLjiCXZQKtbuUsL3NvJtoHurac69fT3xc4sq44okwnEwc
 wt4D/A85yCH25YhgGrLePLQjYDe8iZR07IdKJBWqCTNdGs4e5rl1XDkJZ0BQ2qNF4UGn
 6H3Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIwJp9hde4IG39Acg/ZIdVUvyTg=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id D075c0x44DmZ2TA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 15:48:35 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Message-ID: <070042db-0ac6-f4f6-1232-2f37c5e63d14@xenosoft.de>
Date: Tue, 4 May 2021 15:48:34 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6d3ae417-48de-3b61-f6fe-da951d74fef3@xenosoft.de>
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

Am 04.05.21 um 13:02 schrieb Christian Zigotzky:
> Am 04.05.21 um 12:07 schrieb Christian Zigotzky:
>> Am 04.05.21 um 11:49 schrieb Christophe Leroy:
>>>
>>>
>>> Le 04/05/2021 à 11:46, Christian Zigotzky a écrit :
>>>> Am 04.05.21 um 11:11 schrieb Christophe Leroy:
>>>>>
>>>>>
>>>>> Le 04/05/2021 à 11:09, Christian Zigotzky a écrit :
>>>>>> Am 04.05.21 um 10:58 schrieb Christophe Leroy:
>>>>>>>
>>>>>>>
>>>>>>> Le 04/05/2021 à 10:29, Christian Zigotzky a écrit :
>>>>>>>> On 04 May 2021 at 09:47am, Christophe Leroy wrote:
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>>>>>>>>>> Hi Christophe,
>>>>>>>>>>
>>>>>>>>>> Thanks for your answer but I think I don't know how it works 
>>>>>>>>>> with the cherry-pick.
>>>>>>>>>>
>>>>>>>>>> $ git bisect start
>>>>>>>>>
>>>>>>>>> As you suspect the problem to be specific to powerpc, I can do
>>>>>>>>>
>>>>>>>>> git bisect start -- arch/powerpc
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>>>>>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>>>
>>>>>>>>> You said that powerpc-5.13-1 is bad so you can narrow the 
>>>>>>>>> search I think:
>>>>>>>>>
>>>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>>>> git bisect good 887f3ceb51cd3~
>>>>>>>> I tried it but without any success.
>>>>>>>>
>>>>>>>> git bisect bad powerpc-5.13-1
>>>>>>>>
>>>>>>>> Output:
>>>>>>>> fatal: Needed a single revision
>>>>>>>> Bad rev input: powerpc-5.13-1
>>>>>>>
>>>>>>> I don't understand, on my side it works. Maybe a difference 
>>>>>>> between your version of git and mine.
>>>>>>>
>>>>>>> In that case, just use the SHA corresponding to the merge:
>>>>>>>
>>>>>>> git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>>
>>>>>>> Christophe
>>>>>> Do you use a BookE machine?
>>>>>
>>>>> No I don't unfortunately, and I have tried booting in QEMU a 
>>>>> kernel built with your config, but it freezes before any output.
>>>> You can use my kernels and distributions.
>>>>
>>>
>>> Ok, I'll see if I can do something with them.
>>>
>>> In the meantime, have you been able to bisect ?
>>>
>>> Thanks
>>> Christophe
>> I am bisecting currently.
>>
>> $ git bisect start -- arch/powerpc
>> $ git bisect good 887f3ceb51cd3~
>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
> OK, there is another issue after the second bisecting step. The boot 
> stops after loading the dtb and uImage file. I can't solve 2 issues 
> with bisecting at the same time.
Xorg restarts again and again.

Here are some interesting error messages:

May 04 15:24:53 dc1.a-eon.tld kernel: lxsession[7255]: segfault (11) at 
800000 nip ff6a770 lr ff6a760 code 1 in 
libglib-2.0.so.0.4800.2[feaf000+11f000]
May 04 15:24:53 dc1.a-eon.tld kernel: lxsession[7255]: code: 4bfc9401 
3920ffff 91210054 8061005c 2f830000 419c0014 38800000 4bfc93e5
May 04 15:24:53 dc1.a-eon.tld kernel: lxsession[7255]: code: 3920ffff 
9121005c 2f8f0000 419e0008 <93ef0000> 418e000c 81210040 913b0000

May 04 15:37:40 mintppc.a-eon.tld kernel: packagekitd[4290]: segfault 
(11) at 8 nip 92dbc8 lr 92dae8 code 1 in packagekitd[920000+51000]
May 04 15:37:40 mintppc.a-eon.tld kernel: packagekitd[4290]: code: 
38800080 3be001f4 4cc63182 4802c8ad 4bffff64 60000000 81210018 80be8048
May 04 15:37:40 mintppc.a-eon.tld kernel: packagekitd[4290]: code: 
7fa6eb78 38800010 807e801c 3be0ffff <80e90008> 4cc63182 4802c881 4bffff38
